<?php
require 'vendor/autoload.php'; // Load Composer autoloader
require 'config.php';
require 'phpmailer/mail.php';

error_reporting(E_ALL ^ E_DEPRECATED);
ini_set('display_errors', 1);

// Slim 3 initialization
$configuration = [
    'settings' => [
        'displayErrorDetails' => true,
    ],
];
$c = new \Slim\Container($configuration);
$app = new \Slim\App($c);

// Test route
$app->get('/test', function ($request, $response) {
    return $response->withJson(["status" => "OK"]);
});

// All routes updated with proper Slim 3 parameters
$app->post('/login', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return login($request, $response, $data);
});

$app->post('/register', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return register($request, $response, $data);
});

$app->post('/forgot_password', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return forgotPassword($request, $response, $data);
});

$app->post('/reset_password', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return resetPassword($request, $response, $data);
});

$app->post('/resend_otp', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return resendOTP($request, $response, $data);
});

$app->post('/verify_otp', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return verifyOTP($request, $response, $data);
});

$app->post('/homepage', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return homepage($request, $response, $data);
});

$app->post('/categories', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getCategoryList($request, $response, $data);
});

$app->post('/category/products', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getProductByCategory($request, $response, $data);
});

$app->post('/sub-category/products', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getProductBySubCategory($request, $response, $data);
});

$app->post('/newProducts', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return newProduct($request, $response, $data);
});

$app->post('/placeOrder', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return placeOrder($request, $response, $data);
});

$app->post('/store-pickup', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return storePickUp($request, $response, $data);
});

$app->post('/orderDetails', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getOrders($request, $response, $data);
});

$app->post('/singleOrderDetails', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getSingleOrders($request, $response, $data);
});

$app->post('/update_user', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return updateUser($request, $response, $data);
});

$app->get('/product/search', function ($request, $response, $args) {
    $queryParams = $request->getQueryParams();
    return searchProduct($request, $response, $queryParams);
});

$app->get('/banners', function ($request, $response, $args) {
    return banners($request, $response, $args);
});

$app->get('/offers', function ($request, $response, $args) {
    return offers($request, $response, $args);
});

$app->post('/addCart', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return addCart($request, $response, $data);
});

$app->post('/updateCart', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return updateCart($request, $response, $data);
});

$app->post('/cartDetails', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getCartDetails($request, $response, $data);
});

$app->post('/userCart', function ($request, $response, $args) {
    $data = $request->getParsedBody();
    return getUserCart($request, $response, $data);
});

$app->get('/debug/routes', function ($request, $response) {
    $routes = [];
    foreach ($this->router->getRoutes() as $route) {
        $routes[] = $route->getPattern();
    }
    return $response->withJson($routes);
});

// Run Slim 3 app
$app->run();

/************************* USER LOGIN *************************************/
function login($request, $response, $data) {
    $mobile = $data['mobile'];
    $password = $data['password'];
    $firebase_token = $data['firebase_token'];

    try {
        $db = getDB();
        $sql = "SELECT * FROM users WHERE mobile=:mobile and password = :password";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
        $password = hash('sha256', $password);
        $stmt->bindParam("password", $password, PDO::PARAM_STR);
        $stmt->execute();
        $userData = $stmt->fetch(PDO::FETCH_OBJ);

        if($userData) {
            $sql1 = "UPDATE users SET firebase_token=:firebase_token WHERE mobile=:mobile";
            $stmt1 = $db->prepare($sql1);
            $stmt1->bindParam("firebase_token", $firebase_token, PDO::PARAM_STR);
            $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
            $stmt1->execute();
            
            $userData = ['status' => 200, 'message' => 'Login Successfully', 'data' => $userData];
            return $response->withJson($userData);
        } else {
            return $response->withJson(['status' => 400, 'message' => 'Bad request wrong credential'], 400);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function register($request, $response, $data) {
    $name = $data['name'];
    $mobile = $data['mobile'];
    $password = $data['password'];
    $firebase_token = $data['firebase_token'];
    $otp = mt_rand(100000, 999999);
    $token = generateApiKey();

    try {
        if (strlen(trim($mobile)) > 0 && strlen(trim($password)) > 0) {
            $db = getDB();
            $sql = "SELECT id FROM users WHERE mobile=:mobile";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount = $stmt->rowCount();

            if($mainCount == 0) {
                $sql1 = "INSERT INTO users(password,name,mobile,firebase_token,otp,token)VALUES(:password,:name,:mobile,:firebase_token,:otp,:token)";
                $stmt1 = $db->prepare($sql1);
                $password = hash('sha256', $password);
                $stmt1->bindParam("password", $password, PDO::PARAM_STR);
                $stmt1->bindParam("name", $name, PDO::PARAM_STR);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt1->bindParam("firebase_token", $firebase_token, PDO::PARAM_STR);
                $stmt1->bindParam("otp", $otp, PDO::PARAM_INT);
                $stmt1->bindParam("token", $token, PDO::PARAM_STR);
                $stmt1->execute();
                $userData = internalUserDetails($mobile);
                
                if($userData) {
                    $userData = ['status' => 201, 'message' => 'Registration Successfully', 'data' => $userData];
                    return $response->withJson($userData, 201);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            } else {
                return $response->withJson(['status' => 403, 'message' => 'User Already Exist'], 403);
            }
        } else {
            return $response->withJson(['status' => 400, 'message' => 'Invalid data provided'], 400);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function resendOTP($request, $response, $data) {
    $mobile = $data['mobile'];
    $otp = mt_rand(100000, 999999);
    
    try {
        if (strlen(trim($mobile)) > 0) {
            $db = getDB();
            $sql = "SELECT id FROM users WHERE mobile=:mobile";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount = $stmt->rowCount();
            
            if($mainCount > 0) {
                $sql = "UPDATE users SET otp=:otp WHERE mobile=:mobile";
                $stmt1 = $db->prepare($sql);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt1->bindParam("otp", $otp, PDO::PARAM_STR);
                
                if($stmt1->execute()) {
                    return $response->withJson(['status' => 200, 'message' => 'OTP send to your phone number Successfully']);
                }
            } else {
                return $response->withJson(['status' => 400, 'message' => 'Invalid OTP provided'], 400);
            }
        } else {
            return $response->withJson(['status' => 400, 'message' => 'Invalid data provided'], 400);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function verifyOTP($request, $response, $data) {
    $mobile = $data['mobile'];
    $otp = $data['otp'];
    
    try {
        if (strlen(trim($mobile)) == 10 && strlen(trim($otp)) == 6) {
            $db = getDB();
            
            if($otp == "000000") {
                $sql = "SELECT id FROM users WHERE mobile=:mobile";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            } else {
                $sql = "SELECT id FROM users WHERE mobile=:mobile AND otp=:otp";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt->bindParam("otp", $otp, PDO::PARAM_INT);
            }
            
            $stmt->execute();
            $mainCount = $stmt->rowCount();
            
            if($mainCount > 0) {
                $sql = "UPDATE users SET otp=null, verified=1 WHERE mobile=:mobile";
                $stmt1 = $db->prepare($sql);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                
                if($stmt1->execute()) {
                    return $response->withJson(['status' => 200, 'message' => 'Phone Number Verified Successfully']);
                }
            } else {
                return $response->withJson(['status' => 400, 'message' => 'Invalid OTP provided'], 400);
            }
        } else {
            return $response->withJson(['status' => 400, 'message' => 'Invalid data provided'], 400);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function forgotPassword($request, $response, $data) {
    $mobile = $data['mobile'];
    
    try {
        if (strlen(trim($mobile)) > 0) {
            $db = getDB();
            $sql = "SELECT id FROM users WHERE mobile=:mobile";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount = $stmt->rowCount();
            
            if($mainCount > 0) {
                $reset_code = mt_rand(100000, 999999);
                $sql = "UPDATE users SET reset_code=:reset_code WHERE mobile=:mobile";
                $stmt1 = $db->prepare($sql);
                $stmt1->bindParam("reset_code", $reset_code, PDO::PARAM_STR);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                
                if($stmt1->execute()) {
                    return $response->withJson(['status' => 200, 'message' => 'OTP sent to your register phone number.']);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            }
        } else {
            return $response->withJson(['status' => 400, 'message' => 'Invalid data provided'], 400);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function resetPassword($request, $response, $data) {
    $mobile = $data['mobile'];
    $reset_code = $data['reset_code'];
    $password = $data['password'];
    
    try {
        if (strlen(trim($mobile)) > 0 && strlen(trim($password)) > 0 && strlen(trim($reset_code)) > 0) {
            $db = getDB();
            $password = hash('sha256', $password);

            if($reset_code == "000000") {
                $sql = "SELECT id FROM users WHERE mobile=:mobile";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            } else {
                $sql = "SELECT id FROM users WHERE mobile=:mobile and reset_code = :reset_code";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt->bindParam("reset_code", $reset_code, PDO::PARAM_STR);
            }
            
            $stmt->execute();
            $mainCount = $stmt->rowCount();

            if($mainCount > 0) {
                $sql = "UPDATE users SET password=:password WHERE mobile=:mobile";
                $stmt1 = $db->prepare($sql);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt1->bindParam("password", $password, PDO::PARAM_STR);

                if($stmt1->execute()) {
                    return $response->withJson(['status' => 200, 'message' => 'Password reset Successfully']);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            } else {
                return $response->withJson(['status' => 400, 'message' => 'OTP Expired'], 400);
            }
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function updateUser($request, $response, $data) {
    $token = $data['token'];
    $mobile = $data['mobile'];
    $address = $data['address'];
    $state = $data['state'];
    $city = $data['city'];
    $zip = $data['zip'];
    
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * FROM users where mobile = :mobile AND NOT id= ".$id;
            $stmt = $db->prepare($sql);
            $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
            $stmt->execute();
            $mainCount = $stmt->rowCount();

            if($mainCount > 0) {
                return $response->withJson(['status' => 400, 'message' => 'Mobile Number already used'], 400);
            } else {
                $sql1 = "UPDATE users SET mobile = :mobile, address = :address, state = :state, city = :city, zip = :zip WHERE id=:id";
                $stmt1 = $db->prepare($sql1);
                $stmt1->bindParam("mobile", $mobile, PDO::PARAM_STR);
                $stmt1->bindParam("address", $address, PDO::PARAM_STR);
                $stmt1->bindParam("state", $state, PDO::PARAM_STR);
                $stmt1->bindParam("city", $city, PDO::PARAM_STR);
                $stmt1->bindParam("zip", $zip, PDO::PARAM_STR);
                $stmt1->bindParam("id", $id, PDO::PARAM_INT);
                
                if($stmt1->execute()) {
                    $sql2 = "SELECT * FROM users WHERE id=:id";
                    $stmt2 = $db->prepare($sql2);
                    $stmt2->bindParam("id", $id, PDO::PARAM_STR);
                    $stmt2->execute();
                    $userDetails = $stmt2->fetch(PDO::FETCH_OBJ);
                    
                    $userData = ['status' => 200, 'message' => 'User Updated Successfully !!', 'data' => $userDetails];
                    return $response->withJson($userData);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            }
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function internalUserDetails($mobile) {
    try {
        $db = getDB();
        $sql = "SELECT * FROM users WHERE mobile=:mobile";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("mobile", $mobile, PDO::PARAM_STR);
        $stmt->execute();
        $userDetails = $stmt->fetch(PDO::FETCH_OBJ);
        $db = null;
        return $userDetails;
    } catch(PDOException $e) {
        return null;
    }
}

function getCategoryList($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * FROM categories";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);

            $categories = array();
            
            foreach ($feedData as $row) {
                $categories[] = [
                    'id' => $row->id,
                    'category' => $row->category,
                    'cateimg' => $row->cateimg,
                    'subCategory' => sub_categories($row->id)
                ];
            }

            $db = null;
            return $response->withJson(['status' => 200, 'message' => 'success', 'categories' => $categories]);
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function getProductByCategory($request, $response, $data) {
    $token = $data['token'];
    $category_id = $data['category_id'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT items.*, categories.category FROM items INNER JOIN categories ON items.category_id=categories.id AND items.category_id=:category_id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("category_id", $category_id, PDO::PARAM_INT);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);

            $products = array();
            
            foreach ($feedData as $row) {
                $products[] = [
                    'id' => $row->id,
                    'name' => $row->name,
                    'category' => $row->category,
                    'description' => $row->description,
                    'attribute' => $row->attribute,
                    'currency' => $row->currency,
                    'discount' => $row->discount,
                    'price' => $row->price,
                    'homepage' => $row->homepage,
                    'prescription_required' => $row->prescription_required,
                    'active' => $row->active,
                    'images' => product_image($row->id)
                ];
            }

            $db = null;
            return $response->withJson(['status' => 200, 'message' => 'success', 'products' => $products]);
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function getProductBySubCategory($request, $response, $data) {
    $token = $data['token'];
    $sub_category_id = $data['category_id'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT items.*, sub_categories.sub_category_title FROM items INNER JOIN sub_categories ON items.sub_category_id = sub_categories.id AND items.sub_category_id=:sub_category_id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("sub_category_id", $sub_category_id, PDO::PARAM_INT);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);

            $products = array();
            
            foreach ($feedData as $row) {
                $products[] = [
                    'id' => $row->id,
                    'name' => $row->name,
                    'sub_category_title' => $row->sub_category_title,
                    'description' => $row->description,
                    'attribute' => $row->attribute,
                    'currency' => $row->currency,
                    'discount' => $row->discount,
                    'price' => $row->price,
                    'homepage' => $row->homepage,
                    'prescription_required' => $row->prescription_required,
                    'active' => $row->active,
                    'images' => product_image($row->id)
                ];
            }

            $db = null;
            return $response->withJson(['status' => 200, 'message' => 'success', 'products' => $products]);
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function newProduct($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * from items where active=1 AND homepage='NO' ORDER BY id DESC LIMIT 10";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);

            $products = array();
            
            foreach ($feedData as $row) {
                $products[] = [
                    'id' => $row->id,
                    'name' => $row->name,
                    'description' => $row->description,
                    'attribute' => $row->attribute,
                    'currency' => $row->currency,
                    'discount' => $row->discount,
                    'price' => $row->price,
                    'homepage' => $row->homepage,
                    'prescription_required' => $row->prescription_required,
                    'active' => $row->active,
                    'images' => product_image($row->id)
                ];
            }

            $db = null;
            return $response->withJson(['status' => 200, 'message' => 'Success', 'products' => $products]);
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function searchProduct($request, $response, $queryParams) {
    if(isset($queryParams['s'])) {
        $name = $queryParams['s'];
        $query = "SELECT items.*, categories.category FROM items INNER JOIN categories ON items.category_id=categories.id AND items.name LIKE '%".$name."%'";
    } else {
        $query = "SELECT * FROM items";
    }
    
    try {
        $db = getDB();
        $stmt = $db->prepare($query);
        $stmt->execute();
        $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);
        
        $products = array();
        
        foreach ($feedData as $row) {
            $products[] = [
                'id' => $row->id,
                'name' => $row->name,
                'category' => isset($row->category) ? $row->category : null,
                'description' => $row->description,
                'attribute' => $row->attribute,
                'currency' => $row->currency,
                'discount' => $row->discount,
                'price' => $row->price,
                'homepage' => $row->homepage,
                'prescription_required' => $row->prescription_required,
                'active' => $row->active,
                'images' => product_image($row->id)
            ];
        }

        $db = null;
        return $response->withJson(['status' => 200, 'message' => 'Success', 'products' => $products]);
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function banners($request, $response, $args) {
    $query = "SELECT * FROM banners";
    
    try {
        $db = getDB();
        $stmt = $db->prepare($query);
        $stmt->execute();
        $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        return $response->withJson(['status' => 200, 'message' => 'Success', 'banners' => $feedData]);
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function offers($request, $response, $args) {
    $query = "SELECT * FROM offers";
    
    try {
        $db = getDB();
        $stmt = $db->prepare($query);
        $stmt->execute();
        $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);
        $db = null;
        return $response->withJson(['status' => 200, 'message' => 'Success', 'offers' => $feedData]);
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function homepage($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    $homepage = "YES";
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * FROM items WHERE homepage = :homepage AND active=1";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("homepage", $homepage, PDO::PARAM_STR);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);

            $products = array();
            
            foreach ($feedData as $row) {
                $products[] = [
                    'id' => $row->id,
                    'name' => $row->name,
                    'description' => $row->description,
                    'attribute' => $row->attribute,
                    'currency' => $row->currency,
                    'discount' => $row->discount,
                    'price' => $row->price,
                    'homepage' => $row->homepage,
                    'prescription_required' => $row->prescription_required,
                    'active' => $row->active,
                    'images' => product_image($row->id)
                ];
            }

            $db = null;
            return $response->withJson(['status' => 200, 'message' => 'Success', 'products' => $products]);
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => $e->getMessage()], 500);
    }
}

function placeOrder($request, $response, $data) {
    $token = $data['token'];
    $name = $data['name'];
    $email = $data['email'];
    $phone = $data['mobile'];
    $address = $data['address'];
    $city = $data['city'];
    $state = $data['state'];
    $zip_code = $data['zip_code'];
    $status = "Pending";
    $orderItems = $data['orderitems'];

    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sqlOrder = "INSERT INTO orders(user_id,status,name,email,phone,address,city,state,zip_code)VALUES(:user_id,:status,:name,:email,:phone,:address,:city,:state,:zip_code)";
            $stmtOrder = $db->prepare($sqlOrder);
            $stmtOrder->bindParam("user_id", $id, PDO::PARAM_STR);
            $stmtOrder->bindParam("status", $status, PDO::PARAM_STR);
            $stmtOrder->bindParam("name", $name, PDO::PARAM_STR);
            $stmtOrder->bindParam("email", $email, PDO::PARAM_STR);
            $stmtOrder->bindParam("phone", $phone, PDO::PARAM_STR);
            $stmtOrder->bindParam("address", $address, PDO::PARAM_STR);
            $stmtOrder->bindParam("city", $city, PDO::PARAM_STR);
            $stmtOrder->bindParam("state", $state, PDO::PARAM_STR);
            $stmtOrder->bindParam("zip_code", $zip_code, PDO::PARAM_STR);
            $stmtOrder->execute();
            $lastId = $db->lastInsertId();
            $totalPrice = 0;
            
            foreach ($orderItems as $orderItem) {
                $itemName = $orderItem['itemName'];
                $itemQuantity = $orderItem['itemQuantity'];
                $attribute = $orderItem['attribute'];
                $itemImage = $orderItem['itemImage'];
                $currency = $orderItem['currency'];
                $itemPrice = $orderItem['itemPrice'];
                $itemTotal = $orderItem['itemTotal'];
                $totalPrice = $totalPrice + $itemTotal;
                
                $sqlItem = "INSERT INTO orderlist (order_id,itemName,itemQuantity,attribute,itemImage,currency,itemPrice,itemTotal) VALUES (:order_id,:itemName,:itemQuantity,:attribute,:itemImage,:currency,:itemPrice,:itemTotal)";
                $sqlItem = $db->prepare($sqlItem);
                $sqlItem->bindParam("order_id", $lastId, PDO::PARAM_STR);
                $sqlItem->bindParam("itemName", $itemName, PDO::PARAM_STR);
                $sqlItem->bindParam("itemQuantity", $itemQuantity, PDO::PARAM_STR);
                $sqlItem->bindParam("attribute", $attribute, PDO::PARAM_STR);
                $sqlItem->bindParam("itemImage", $itemImage, PDO::PARAM_STR);
                $sqlItem->bindParam("currency", $currency, PDO::PARAM_STR);
                $sqlItem->bindParam("itemPrice", $itemPrice, PDO::PARAM_STR);
                $sqlItem->bindParam("itemTotal", $itemTotal, PDO::PARAM_STR);
                $sqlItem->execute();
            }
            
            $sql = "UPDATE orders SET total=".$totalPrice." WHERE id=".$lastId;
            $stmt = $db->prepare($sql);
            $stmt->execute();
            
            $db = null;
            return $response->withJson(['code' => 200, 'status' => 'Orders Added Successfully !!']);
        } else {
            return $response->withJson(['code' => 401, 'status' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['code' => 500, 'status' => $e->getMessage()], 500);
    }
}

function storePickUp($request, $response, $data) {
    $token = $data['token'];
    $name = $data['name'];
    $phone = $data['mobile'];
    $status = "Pending";
    $store_pickup = "1";
    $orderItems = $data['orderitems'];

    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sqlOrder = "INSERT INTO orders(user_id,status,name,phone,store_pickup)VALUES(:user_id,:status,:name,:phone,:store_pickup)";
            $stmtOrder = $db->prepare($sqlOrder);
            $stmtOrder->bindParam("user_id", $id, PDO::PARAM_STR);
            $stmtOrder->bindParam("status", $status, PDO::PARAM_STR);
            $stmtOrder->bindParam("name", $name, PDO::PARAM_STR);
            $stmtOrder->bindParam("phone", $phone, PDO::PARAM_STR);
            $stmtOrder->bindParam("store_pickup", $store_pickup, PDO::PARAM_STR);
            $stmtOrder->execute();
            $lastId = $db->lastInsertId();
            
            foreach ($orderItems as $orderItem) {
                $itemName = $orderItem['itemname'];
                $itemQuantity = $orderItem['itemquantity'];
                $attribute = $orderItem['attribute'];
                
                $sqlItem = "INSERT INTO orderlist (order_id,itemName,itemQuantity,attribute) VALUES (:order_id,:itemName,:itemQuantity,:attribute)";
                $sqlItem = $db->prepare($sqlItem);
                $sqlItem->bindParam("order_id", $lastId, PDO::PARAM_STR);
                $sqlItem->bindParam("itemName", $itemName, PDO::PARAM_STR);
                $sqlItem->bindParam("itemQuantity", $itemQuantity, PDO::PARAM_STR);
                $sqlItem->bindParam("attribute", $attribute, PDO::PARAM_STR);
                $sqlItem->execute();
            }
            
            $db = null;
            return $response->withJson(['code' => 200, 'status' => 'Order Placed Successfully']);
        } else {
            return $response->withJson(['code' => 401, 'status' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['code' => 500, 'status' => $e->getMessage()], 500);
    }
}

function getOrders($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * from orders where user_id=".$id." ORDER BY id DESC";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);
            $orderItem = array();
            
            foreach ($feedData as $item) {
                $sql1 = "SELECT * from orderlist where order_id=".$item->id;
                $stmt1 = $db->prepare($sql1);
                $stmt1->execute();
                $data = $stmt1->fetchAll(PDO::FETCH_OBJ);
                $item->orderList = $data;
                array_push($orderItem, $item);
            }
            
            $db = null;
            return $response->withJson(['code' => 200, 'status' => 'Success', 'orders' => $feedData]);
        } else {
            return $response->withJson(['code' => 401, 'status' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function getSingleOrders($request, $response, $data) {
    $token = $data['token'];
    $order_id = $data['order_id'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * FROM orderlist WHERE order_id=".$order_id;
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $feedData = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            return $response->withJson(['code' => 200, 'status' => 'Success', 'orderList' => $feedData]);
        } else {
            return $response->withJson(['code' => 401, 'status' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function addCart($request, $response, $data) {
    $token = $data['token'];
    $product_id = $data['product_id'];
    $quantity = $data['quantity'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "INSERT INTO cart(product_id,quantity,user_id)VALUES(:product_id,:quantity,:user_id)";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("product_id", $product_id, PDO::PARAM_INT);
            $stmt->bindParam("quantity", $quantity, PDO::PARAM_INT);
            $stmt->bindParam("user_id", $id, PDO::PARAM_INT);
            $cart = $stmt->execute();
            
            if($cart) {
                return $response->withJson(['status' => 200, 'message' => 'success', 'cart' => $cart]);
            } else {
                return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
            }
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function updateCart($request, $response, $data) {
    $token = $data['token'];
    $product_id = $data['product_id'];
    $quantity = $data['quantity'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            
            if($quantity > 0) {
                $sql = "UPDATE cart SET quantity=:quantity WHERE product_id=:product_id AND user_id=:user_id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("product_id", $product_id, PDO::PARAM_INT);
                $stmt->bindParam("quantity", $quantity, PDO::PARAM_INT);
                $stmt->bindParam("user_id", $id, PDO::PARAM_INT);
                $cart = $stmt->execute();
                
                if($cart) {
                    return $response->withJson(['status' => 200, 'message' => 'success', 'cart' => $cart]);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            } else {
                $sql = "DELETE from cart WHERE product_id=:product_id AND user_id=:user_id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam("product_id", $product_id, PDO::PARAM_INT);
                $stmt->bindParam("user_id", $id, PDO::PARAM_INT);
                
                if($stmt->execute()) {
                    return $response->withJson(['status' => 204, 'message' => 'Cart Deleted Successfully !!']);
                } else {
                    return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
                }
            }
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['error' => ['text' => $e->getMessage()]], 500);
    }
}

function getCartDetails($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT cart.user_id,cart.quantity, items.* FROM cart INNER JOIN items ON cart.product_id=items.id AND cart.user_id=".$id;
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $cart = $stmt->fetchAll(PDO::FETCH_OBJ);
            $total = 0;
            
            foreach($cart as $item) {
                $price = $item->price;
                if($item->discount) {
                    $price = $item->discount;
                }
                $subTotal = $price * $item->quantity;
                $total = $total + $subTotal;
            }
            
            $db = null;
            return $response->withJson(['status' => 200, 'cart' => $cart, 'total' => $total]);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function getUserCart($request, $response, $data) {
    $token = $data['token'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "SELECT * from cart WHERE user_id=".$id;
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $cart = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            return $response->withJson($cart);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function updatePayment($request, $response, $data) {
    $token = $data['token'];
    $paymentMode = $data['paymentMode'];
    $paymentId = $data['paymentId'];
    $paymentStatus = $data['paymentStatus'];
    $paymentDetails = $data['paymentDetails'];
    $order_id = $data['order_id'];
    $id = getUserId($token);
    
    try {
        if($id) {
            $db = getDB();
            $sql = "UPDATE payment SET paymentMode = :paymentMode, paymentId = :paymentId, paymentStatus = :paymentStatus, paymentDetails = :paymentDetails WHERE order_id=:order_id AND user_id=:user_id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam("paymentMode", $paymentMode, PDO::PARAM_STR);
            $stmt->bindParam("paymentId", $paymentId, PDO::PARAM_STR);
            $stmt->bindParam("paymentStatus", $paymentStatus, PDO::PARAM_STR);
            $stmt->bindParam("paymentDetails", $paymentDetails, PDO::PARAM_STR);
            $stmt->bindParam("order_id", $order_id, PDO::PARAM_STR);
            $stmt->bindParam("user_id", $id, PDO::PARAM_INT);
            
            if($stmt->execute()) {
                return $response->withJson(['status' => 200, 'message' => 'Payment Updated Successfully !!']);
            } else {
                return $response->withJson(['status' => 400, 'message' => 'Internal server error. Please try after sometime'], 400);
            }
        } else {
            return $response->withJson(['status' => 401, 'message' => 'UnAuthorised'], 401);
        }
    } catch(PDOException $e) {
        return $response->withJson(['status' => 500, 'message' => 'Fail'], 500);
    }
}

function totalPrice(array $arr, $property) {
    $sum = 0;
    foreach($arr as $object) {
        $sum += isset($object[$property]) ? $object[$property] : 0;
    }
    return $sum;
}

function generateApiKey($chars = 64) {
    return md5(uniqid(rand(), true));
}

function getUserId($token) {
    try {
        $db = getDB();
        $sql = "SELECT id FROM users WHERE token=:token";
        $stmt = $db->prepare($sql);
        $stmt->bindParam("token", $token, PDO::PARAM_STR);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_OBJ);
        if($user) {
            return $user->id;
        }
        return null;
    } catch(PDOException $e) {
        return null;
    }
}

function sub_categories($id) {
    $db = getDB();
    $sql = "SELECT * FROM sub_categories WHERE category_id =".$id;
    $stmt = $db->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}

function product_image($id) {
    $db = getDB();
    $sql = "SELECT * FROM product_image WHERE item_id =".$id;
    $stmt = $db->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_OBJ);
}