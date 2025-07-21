-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 09:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocerystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(3, 'Admin', 'be05977add575832dc52655d4ad5c42e', '2025-04-12 06:48:18'),
(7, 'Yahya', '25d55ad283aa400af464c76d713c07ad', '2025-04-18 09:46:32');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `name`, `image`, `created_date`) VALUES
(22, 'Banner 1', 'assets/images/BannerImage/20240528070525000000.png', '2022-04-14 17:23:46'),
(23, 'banner2', 'assets/images/BannerImage/20221207021253000000.png', '2022-04-14 17:23:46'),
(24, 'Banner3', 'assets/images/BannerImage/20240528070557000000.png', '2022-04-14 17:23:46'),
(25, 'Banner4', 'assets/images/BannerImage/20240528070517000000.png', '2022-04-14 17:23:46'),
(32, 'offer for the reselller', 'assets/images/BannerImage/20240302060314000000.png', '2024-03-02 06:26:14'),
(35, 'organic products', 'assets/images/BannerImage/20240305090312000000.png', '2024-03-05 09:00:12'),
(36, 'offer', 'assets/images/BannerImage/20240528090533000000.png', '2024-05-28 09:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cateimg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `cateimg`, `created_date`) VALUES
(368, 'SEASONAL FRUITS', 'assets/images/ProductImage/category/20221207111211000000.png', '2022-12-07 16:16:11'),
(369, 'GRAINS & PASTA', 'assets/images/ProductImage/category/20221207111233000000.png', '2022-12-07 16:17:33'),
(370, 'VEGETABLES', 'assets/images/ProductImage/category/20230708020701000000.png', '2022-12-07 16:18:17'),
(371, 'DAIRY PRODUCTS', 'assets/images/ProductImage/category/20221207111245000000.png', '2022-12-07 16:18:45'),
(372, 'FROZEN FOODS', 'assets/images/ProductImage/category/20240229090226000000.png', '2022-12-07 16:19:17'),
(383, 'SNACKS & SWEETS', 'assets/images/ProductImage/category/20240229060212000000.png', '2024-02-29 18:38:12'),
(384, 'BREAD & BAKERY', 'assets/images/ProductImage/category/20240302080349000000.png', '2024-03-02 06:40:22'),
(388, ' BEVERAGES', 'assets/images/ProductImage/category/20250408070422000000.png', '2025-04-08 20:57:22');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category_id` int(10) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `attribute` varchar(100) DEFAULT NULL,
  `currency` varchar(100) NOT NULL DEFAULT 'TZS.',
  `discount` varchar(100) DEFAULT NULL,
  `price` varchar(50) NOT NULL,
  `homepage` varchar(10) DEFAULT NULL,
  `prescription_required` tinyint(1) DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category_id`, `sub_category_id`, `description`, `attribute`, `currency`, `discount`, `price`, `homepage`, `prescription_required`, `active`, `created_date`) VALUES
(1111, 'Lotte Choco Pie 28 g (12 pcs)', 370, 387, '', '1Pack', 'Tzs', '99', '150', 'YES', 0, 1, '2022-12-07 16:58:55'),
(1112, 'Maggi 2-Minute Masala Instant Noodles', 370, 387, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">India’s favorite Masala Noodles, MAGGI 2-minute Noodles, now come with the goodness of Iron.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Each portion (70g) of MAGGI Masala Noodles provides you with 15% of your daily Iron requirement.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Usage Instructions: Prepare a delicious MAGGI in just 2 minutes – Boil 1½ cup of water and add the TASTEMAKER along with the noodle cake broken into 4. Cook for 2 minutes in open pan, while you stir occasionally. Do not drain the remaining water.</span>', '560g', 'Tzs', '102', '112', 'NO', 0, 1, '2022-12-07 17:00:31'),
(1113, 'Brooke Bond Red Label Strong Blend Tea 1 kg', 370, 388, '', '1KG', 'Tzs', '410', '570', 'YES', 0, 1, '2022-12-07 17:01:39'),
(1114, 'Tata Agni Tea 1 kg', 370, 388, '', '1KG', 'Tzs', '180', '200', 'NO', 0, 1, '2022-12-07 17:02:52'),
(1115, 'Tnw The Natural Wash Amla Shampoo for Hair Growth & Controlling Hair Fall 200 ml', 371, 392, '', '200ML', 'Tzs', '398', '480', 'YES', 0, 1, '2022-12-07 17:04:36'),
(1116, 'Babila Cushioned hair brush -HB-V 155 1\'s', 371, 392, '', '1Piece', 'Tzs', '304', '320', 'YES', 0, 1, '2022-12-07 17:05:51'),
(1124, 'Scott Brite', 372, 395, '', '12', 'Tzs', '35', '70', 'NO', 0, 1, '2023-07-08 14:24:43'),
(1125, 'Bru', 370, 389, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Bru Instant, 100% Coffee, offers you a coffee experience like no other.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Bru Instant is made with a perfect blend of premium coffee beans which are sourced from the finest plantations of South India.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">&nbsp;It is also easy to use as it mixes effortlessly with water and milk. For the best Bru Instant experience, use toned milk.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Since 1968, BRU has been a pioneer in bringing the authentic taste of South Indian coffee to Indian consumers.</span>', '100g', 'Tzs', '333', '370', 'NO', 0, 1, '2023-07-08 14:27:04'),
(1126, 'NESCAFE Coffee Powder', 370, 389, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Introducing the new Nescafé Special Offer Pack to delight the coffee lover in you. This coffee pack comes with a 200g Jar of Nescafé Classic Coffee,</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">1 signature Red Mug and a scoop spoon to make coffee drinking fun and easy for you.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">The NESCAFÉ Plan has benefitted over 1,700 farmers through technical assistance in 2013.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">&nbsp;</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Storage Recommendation: Do store the product in a cool, dry and hygienic place. To ensure lasting freshness, close the lid tightly after every use</span></p>', '200g', 'Tzs', '633', '640', 'NO', 0, 1, '2023-07-08 14:31:41'),
(1127, 'Horlicks', 370, 390, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Horlicks is a Health Drink that has nutrients to support immunity. Horlicks is clinically proven to improve 5 signs of growth and is clinically proven to make kids taller, stronger and sharper.</span>', '90g', 'Tzs', '210', '225', 'NO', 0, 1, '2023-07-08 14:39:55'),
(1128, 'Bounvita', 370, 390, '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Cadbury Bournvita Chocolate Health Drink is a scientifically designed formula, crafted by nutritionists with a bundle of nutrients that are known to support Physical strength.</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">(Calcium, Vitamin D and Magnesium are known to maintain Bone and Muscle health); Mental Strength (Iron, Iodine and Zinc which help in normal cognitive functions); Immune strength (Vitamin C, Vitamin D, Zinc and Iron to support the immune functions). Thus, supporting strength. 2 serves of Bournvita provides 50% RDA of Vitamin D (Recommended Dietary Allowance requirement for children (7-9 years), ICMR -NIN, 2020). Bournvita to be consumed as a part of daily balance diet and healthy lifestyle.</span>', '1Kg', 'Tzs', '400', '420', 'NO', 0, 1, '2023-07-08 15:01:45'),
(1129, 'Vim', 372, 395, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Vim is the No.1 dishwashing brand in India. Vim’s Dishwash Liquid Gel is a concentrated gel containing the power of 100 lemons(power refers to the cleaning benefits of lemons). It cleans the utensils deeply and unlike dishwash bars, it does not leave any powdery white layer of residue behind on them. It provides great value for money as only one spoon of Vim Liquid Dishwash Gel is enough to clean one sink-full of dirty utensils(as per the independent lab test conducted). Vim Liquid Dishwash Gel also helps you to remove stubborn malodours from your tiffin boxes. It provides a pleasant cleaning experience and gives a refreshing lemon fragrance during dishwashing. Its pH-neutral formula is soft on hands compared to other bars. It can safely be used to clean delicate utensils and all kinds of expensive crockery including non-stick cookware. It does not leave any scratches on the surfaces and keeps the utensils looking new. It is extremely convenient to use. Just take a spoonful of Vim Dishwash Liquid Gel, mix it in a bowl of water, and use the mixture to wash an entire sink-full load of dishes. Vim Dishwash Liquid Gel is available in different sizes and packaging formats in the market which include bottles and pouch packs.</span><br></p>', '750ml', 'Tzs', '185', '199', 'NO', 0, 1, '2023-07-08 15:06:26'),
(1130, 'Tide', 372, 402, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">New Tide Plus Double Power detergent powder has Stain Magnets, which can remove the toughest of stains to give you STAINLESS WHITES. Tide Plus\' improved formulation and enzyme system has been specially designed to beat tough kitchen stains and give you outstanding whiteness. We often get food stains while cooking, when kids eat, while spending time with family. Tide Plus Double Power has easy dissolution in water and great foaming properties which removes stains easily. It is available in a range of amazing iconic fragrances - Jasmine&amp;Rose and Lemon&amp;Mint. The product works on both white and coloured clothes. Tide\'s Double Power refers to the superior formulation vs. Tide Naturals. Tide, a unit of Procter and Gamble, is the World’s Oldest and Most Trusted Detergent brand and is the Market Leader in 23 Countries around the world.</span><br></p>', '6kg+2kg Free', 'Tzs', '880', '895', 'NO', 0, 1, '2023-07-08 15:11:02'),
(1131, 'Ariel', 372, 402, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">New &amp; Improved Ariel Complete gives you tough stain removal for a bright clean in just 1 wash. Ariel Complete is uniquely designed to deliver outstanding results when used in a semi automatic machines as well as when used as a handwash detergent. The new Brightguard technology keeps your clothes bright wash after wash. Ariel Complete washing powder also provides deep down cleaning and long-lasting freshness. In just 1 scoop for normal loads, and 1.5 scoops for heavy loads, providing brilliant stain removal along with value. Ariel Complete\'s cutting edge technology provides impeccable cleaning for all your clothes, and removes tough stains like juice, chocolate, tomato and butter/ghee and maintains the brightness of the clothes. So now, goodbye stains and dullness!</span><br></p>', '4Kg', 'Tzs', '750', '1320', 'NO', 0, 1, '2023-07-08 15:13:03'),
(1132, 'Pril', 372, 395, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Pril Lime has Active Power Molecules that helps to remove tough grease with great ease. This helps the user to finish tough dishwash chore in no time and spend more time with family instead. The goodness of lime helps to deliver freshness to utensils.</span><br></p>', '1.5L', 'Tzs', '270', '360', 'NO', 0, 1, '2023-07-08 15:14:32'),
(1133, 'Godrej aer Power Pocket Bathroom Freshener ', 372, 396, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Godrej aer power pocket is a range of toilet fresheners that are available in 5 beautiful fragrances. This bathroom freshener for toilet has a unique power gel technology that keeps the bathroom fragrant for up to 30 days. The toilet freshener for bathroom is odour neutralizer and it ensures a refreshing fragrance every time you step into the bathroom. This toilet freshener is easy to use and can be hung in the bathroom with the hook provided.</span><br></p>', 'Pack of 5 (50g)', 'Tzs', '279', '300', 'NO', 0, 1, '2023-07-08 15:16:29'),
(1136, 'Genteel Liquid Detergent ', 372, 402, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">Genteel detergent liquid for washing machine is an all-purpose laundry detergent from the house of Godrej. It is the best solution for your everyday clothes. The special strong formula of Genteel washing machine liquid delivers absolute cleansing for whites as well as your coloured clothes. Genteel has an added fabric conditioner that softens the fabric and leaves your clothes with a lingering fragrance. This liquid detergent for front load washing machine has a functionally superior design that is easy to handle. This liquid detergent for top load washing machine also has a measuring cap which makes it easier not just to measure the right amount of liquid detergent but to pour as well. The pH-neutral no-soda formula prevents your clothes from shrinking and fading.</span><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\"><br style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\"><span style=\"color: rgb(51, 51, 51); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: small;\">This top load washing machine liquid is ideal for all those clothes that need a little extra care because it\'s safe and gentle on your expensive lingerie, shawls, silks, woolens and even babywear</span><br></p>', '1kg bottle + 1kg Refill Pouch', 'Tzs', '332', '350', 'YES', 0, 1, '2023-07-08 18:24:48'),
(1140, 'Parachute Coconut Oil ', 371, 403, '<h4 style=\"font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; line-height: 24px; color: rgb(15, 17, 17); margin: 0px; padding: 0px 0px 4px; text-rendering: optimizelegibility;\"><span style=\"font-weight: 700;\">Ingredients:</span>&nbsp;Coconut Oil</h4><p style=\"margin-bottom: 0px; font-size: 14px; padding: 0px 0px 4px; text-rendering: optimizelegibility; line-height: 24px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><span style=\"font-size: medium; font-weight: 700;\">Product Description</span><br></p><div id=\"productDescription\" class=\"a-section a-spacing-small\" style=\"margin: 0.5em 0px 0em 25px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-size: small; line-height: initial; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><p style=\"margin-top: 0em; margin-bottom: 1em; margin-left: 1em; padding: 0px;\">Parachute Coconut Oil- India’s No.1 coconut oil contains only the goodness of 100% pure coconut oil. It is made from naturally sun-dried coconuts sourced from the finest farms of our country. The oil is extracted from the nuts through a meticulous hands-free process. It goes through a 5 stage purification process and as many as 27 quality tests are performed on the oil so that each bottle that reaches you is 100% pure- EVERY SINGLE TIME. A tamper-proof seal ensures that the rich aroma of raw coconuts is preserved for a long time. It contains no added chemicals, scent, additives or preservatives and lasts fresh &amp; safe for up to 18 months. It is licensed by FSSAI as an edible-grade coconut oil. All this ensures that every bottle of coconut oil adheres to the Parachute promise of being 100% safe and 100% pure. Parachute coconut oil is now available in convenient sizes of 1 Litre and 600ml packs. Parachute Coconut Oil comes from the house of Marico. Marico sells more than 1 billion packs of coconut oil every year.</p></div>', '300ml', 'Tzs', '', '111', 'YES', 0, 1, '2023-07-08 18:45:44'),
(1141, 'Bajaj Almond Drops Almond + Argan Hair Oil', 371, 403, '<h4 style=\"padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-weight: 700; line-height: 24px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Ingredients:</h4><p style=\"padding: 0px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></p><p style=\"padding: 0px; margin-top: -4px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">Ingredient List: Vegetable Oils including Prunus Amygdalus Dulcis (Almond) Oil and Argania Spinosa Kernel (Argan) Oil (66.5%), Light Liquid Paraffin (32%), Fragrance, Vitamin E Acetate, Benzophenone-3, TBHQ, CI 47000, CI 26100, CI 61565 Almond oil is rich in Vitamin E and is known to soften and moisturize dry hair. It also helps in making hair strong. Argan oil is known for its nourishing and moisturizing properties for Hair. It is rich in essential fatty acids and vitamin E and is known to help promote soft, silky, and shiny hair.</p><h2 class=\"default\" style=\"padding: 0px 0px 4px; margin: 0px 0px 0.25em; text-rendering: optimizelegibility; font-weight: 700; font-size: medium; line-height: 32px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Product description</h2><div id=\"productDescription\" class=\"a-section a-spacing-small\" style=\"margin: 0.5em 0px 0em 25px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-size: small; line-height: initial; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><p style=\"padding: 0px; margin-top: 0em; margin-bottom: 1em; margin-left: 1em;\">Bajaj Almond Drops nonsticky hair oil with almond and argan oil provides 3-way damage protection against chemical treatments, heat styling and pollution. It comes with a nourishing formula which makes the hair soft and shiny</p></div>', '100ml', 'Tzs', '152', '179', 'NO', 0, 1, '2023-07-08 18:47:27'),
(1142, 'L\'Oreal Paris Shampoo', 371, 392, '<h4 style=\"padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-weight: 700; line-height: 24px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Ingredients:</h4><p style=\"padding: 0px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></p><p style=\"padding: 0px; margin-top: -4px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\">This ingredients list is subject to change, consumers should refer to the product packaging for the most relevant ingredients list. In case of problem, please contact the consumer care center.</p><p style=\"padding: 0px; margin-top: -4px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-size: medium; font-weight: 700;\">Product Description</span><br></p><div id=\"productDescription\" class=\"a-section a-spacing-small\" style=\"margin: 0.5em 0px 0em 25px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-size: small; line-height: initial; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><p style=\"padding: 0px; margin-top: 0em; margin-bottom: 1em; margin-left: 1em;\">Revive your damaged hair today! L\'Oréal Paris Total Repair 5 shampoo helps fight against the five visible signs of damaged hair: hair fall, dryness, roughness, dullness, and split ends. The Pro-Keratin conditioning formula reinforces each hair fiber to give strength and resilience to wear and tear; whilst the Ceramide acts as a replica to the hair’s natural cement, restoring smoothness and leaving it soft and healthy looking once again. Give new life to your locks with the Total Repair 5 range: Shampoo, for a deep clean; Conditioner, to restore moisture; and Serum, to nourish and protect! All you need for damage-free, beautiful hair!</p></div>', '1L', 'Tzs', '528', '1099', 'NO', 0, 1, '2023-07-08 18:51:51'),
(1143, 'TRESemme Keratin Smooth Conditioner', 371, 392, 'for shine and smooddh hair&nbsp;', '200ml', 'Tzs', '200', '220', 'NO', 0, 1, '2023-07-08 18:53:39'),
(1144, 'Ghee', 369, 384, '<h4 style=\"padding: 0px 0px 4px; margin: 0px; text-rendering: optimizelegibility; font-weight: 700; line-height: 24px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Legal Disclaimer:</span></h4><p style=\"padding: 0px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"></p><p style=\"padding: 0px; margin-top: -4px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Actual product packaging and materials may contain more and different information than what is shown on our app or website. We recommend that you do not rely solely on the information presented here and that you always read labels, warnings, and directions before using or consuming a product.</span></p><p style=\"padding: 0px; margin-top: -4px; margin-bottom: 14px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px;\"><span style=\"font-size: medium; font-weight: 700; font-family: &quot;Times New Roman&quot;;\">Product description</span><br></p><div id=\"productDescription\" class=\"a-section a-spacing-small\" style=\"margin: 0.5em 0px 0em 25px; color: rgb(51, 51, 51); overflow-wrap: break-word; font-size: small; line-height: initial; font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><p style=\"padding: 0px; margin-top: 0em; margin-bottom: 1em; margin-left: 1em;\"><span style=\"font-family: &quot;Times New Roman&quot;;\">Mother Dairy Pure Healthy Ghee</span></p></div>', '1L', 'Tzs', '661', '675', 'YES', 0, 1, '2023-07-08 18:56:54'),
(1148, 'Aashirvaad Whole Wheat Atta ', 369, 385, '<div class=\"jm-heading-xs jm-mb-base\" style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; font-family: JioType, helvetica, arial, sans-serif; color: rgb(20, 20, 20); margin-bottom: 16px !important; font-weight: 900 !important; font-size: 24px !important; letter-spacing: -0.72px !important; line-height: 1 !important;\">Features &amp; Details</div><div class=\"product-key-features-list-wrapper jm-body-s jm-mb-base\" style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; outline: 0px; font-family: JioType, helvetica, arial, sans-serif; font-size: 16px; letter-spacing: -0.08px; color: rgb(20, 20, 20); margin-bottom: 16px !important; line-height: 1.5 !important;\"><ul class=\"product-key-features-list\" style=\"padding-left: 16px; outline: 0px; list-style-type: disc; color: rgba(0, 0, 0, 0.65);\"><li class=\"product-key-features-list-item\" style=\"margin-bottom: 4px; outline: 0px;\">It contains natural dietary fibres and nutrients</li><li class=\"product-key-features-list-item\" style=\"margin-bottom: 4px; outline: 0px;\">The 4-step advantage process of sourcing, cleaning, grinding and nutrition lockage</li><li class=\"product-key-features-list-item\" style=\"margin-bottom: 4px; outline: 0px;\">The chakki-grinding process ensures, it contains sampoorna atta</li><li class=\"product-key-features-list-item\" style=\"margin-bottom: 4px; outline: 0px;\">It is easy digestion and supporting immunity</li></ul></div>', '10Kg', 'Tzs', '413', '484', 'YES', 0, 1, '2023-07-08 19:08:43'),
(1152, 'strawberry', 368, 401, 'Fresh And Juicy Red flavoured Strawberrys', '1kg', 'Tzs', '250', '300', 'YES', 0, 1, '2024-02-29 09:56:23'),
(1153, 'Amul Ghee', 369, 384, '<p>desii ghee</p>', '1kg', 'Tzs', '750', '800', 'NO', 0, 1, '2024-02-29 18:26:08'),
(1154, 'Organic Green Moong Dal Whole – 500g', 383, 407, '<h1 class=\"product_title entry-title\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; font-size: 25px; font-family: Lato; font-weight: 600; letter-spacing: -0.02em; line-height: normal; -webkit-font-smoothing: antialiased; clear: both; color: rgb(104, 104, 104); hyphens: none; word-break: break-word; overflow-wrap: break-word; max-width: none;\">Organic Green Moong Dal Whole – 500g</h1>', '500gm', 'Tzs', '125', '125', 'NO', 0, 1, '2024-02-29 19:09:27'),
(1155, 'Foxtail Millet Premium, 1kg', 383, 407, '<p>organic food</p>', '1kg', 'Tzs', '250', '250', 'YES', 0, 1, '2024-02-29 19:24:26'),
(1156, 'DiSano Pure Honey 500 g (pack of 1)', 369, 384, '<div id=\"text-veg\" class=\"a-section vnv-text\" style=\"margin-bottom: 0px; display: inline-block; padding-left: 10px; height: 22.68px; padding-top: 2px; position: absolute; margin-top: 2px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\">Pure and Healthy Honey</div>', '1pack', 'Tzs', '250', '260', 'NO', 0, 1, '2024-02-29 19:28:27'),
(1157, 'Harpic 150 gm - Marine, Flushmatic In-Cistern Toilet Cleaner Blocks | Toilet Flush Cleaner Balls', 372, 395, '<div id=\"featurebullets_feature_div\" class=\"celwidget\" data-feature-name=\"featurebullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"featurebullets\" data-csa-c-slot-id=\"featurebullets_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"19s8ni-3gwfs-y8iebi-wohmub\" data-cel-widget=\"featurebullets_feature_div\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><div id=\"feature-bullets\" class=\"a-section a-spacing-medium a-spacing-top-small\" style=\"margin-bottom: 0px; margin-top: 8px !important;\"><h1 class=\"a-size-base-plus a-text-bold\" style=\"padding: 0px 0px 4px; margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; font-weight: 700 !important; font-size: 16px !important; line-height: 24px !important;\">About this item</h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-left: 18px;\"><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">In Cistern toilet cleaning block</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Clear blue water on every flush</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Maintains hygiene of toilet on every flush</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Gives continuous cleaning and foaming</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Each block lasts upto 240 flushes</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Available in Marine, Citrus and Lavender variant and in various sizes: 50g, 100g, 150g</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">*Reckitt Benckiser calculation based on data reported by NielsenIQ through its Retail Index Service for the Cleaners - Toilet Category, value for the 12-month ending June 30, 2021, for the India (U+R) market. (Copyright 2021, NielsenIQ)</span></li></ul></div></div><p><div id=\"newerVersion_feature_div\" class=\"celwidget\" data-feature-name=\"newerVersion\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"newerVersion\" data-csa-c-slot-id=\"newerVersion_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"eeey2u-vy4hm5-brdtf0-6d5gte\" data-cel-widget=\"newerVersion_feature_div\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"></div><div id=\"valuePick_feature_div\" class=\"celwidget\" data-feature-name=\"valuePick\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"valuePick\" data-csa-c-slot-id=\"valuePick_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"q8tvwl-25icv5-ag0qnt-z27scn\" data-cel-widget=\"valuePick_feature_div\" style=\"color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><div id=\"valuePick_container\" class=\"celwidget pf_rd_p-dff07a69-7e30-40e0-81b5-8f3645ae7fd7 pf_rd_r-R3VH81AK040J5K69CYYV pd_rd_wg-TTeN1 pd_rd_i-B0797HNZDW pd_rd_w-K8p4N content-id-amzn1.sym.dff07a69-7e30-40e0-81b5-8f3645ae7fd7 pd_rd_r-0a62c9aa-f0a4-4310-99fc-71e5573f5a55 \" cel_widget_id=\"valuePick_desktop_container\" data-csa-c-id=\"o24lju-yt05v0-gm7y01-rrww90\" data-cel-widget=\"valuePick_desktop_container\"><div id=\"value-pick-ac\" class=\"a-section a-spacing-small\" style=\"margin-bottom: 0px;\"></div></div></div></p><div id=\"olp_feature_div\" class=\"celwidget\" data-feature-name=\"olp\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"olp\" data-csa-c-slot-id=\"olp_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"g1uz29-wp87ew-sdsuhi-odc321\" data-cel-widget=\"olp_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"><div id=\"all-offers-display\" class=\"a-section\" style=\"box-sizing: border-box; margin: 0px; position: fixed; right: -620px; width: 602px; bottom: 0px; z-index: 290; background-color: rgb(249, 251, 251); border-width: 0px; top: 0px; box-shadow: rgba(0, 0, 0, 0.25) -4px 0px 5px; text-align: initial; font-size: 13px; color: rgb(17, 17, 17); overflow: visible !important;\"></div><span class=\"a-declarative\" data-action=\"close-all-offers-display\" data-csa-c-type=\"widget\" data-csa-c-func-deps=\"aui-da-close-all-offers-display\" data-close-all-offers-display=\"{}\" data-csa-c-id=\"mj5h0i-jj18yd-g7af6i-ivj53l\" style=\"box-sizing: border-box;\"></span></div><div id=\"andonCord_feature_div\" class=\"celwidget\" data-feature-name=\"andonCord\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"andonCord\" data-csa-c-slot-id=\"andonCord_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"8uo0pb-xhqeop-dnzuzv-2bvd6k\" data-cel-widget=\"andonCord_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"giftcard-holiday-availability-messaging_feature_div\" class=\"celwidget\" data-feature-name=\"giftCardHolidayAvailabilityMessaging\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"giftCardHolidayAvailabilityMessaging\" data-csa-c-slot-id=\"giftcard-holiday-availability-messaging_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"p9za5c-tusf9l-mtie2v-wc19b9\" data-cel-widget=\"giftcard-holiday-availability-messaging_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"addOnItem_feature_div\" class=\"celwidget\" data-feature-name=\"addOnItem\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"addOnItem\" data-csa-c-slot-id=\"addOnItem_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"6j1g5-tad3al-8xfamr-5nvyrf\" data-cel-widget=\"addOnItem_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"globalStoreInfoBullets_feature_div\" class=\"celwidget\" data-feature-name=\"globalStoreInfoBullets\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"globalStoreInfoBullets\" data-csa-c-slot-id=\"globalStoreInfoBullets_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"dmwumv-hjrl0d-tc7l5a-quyquk\" data-cel-widget=\"globalStoreInfoBullets_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div><div id=\"provenanceCertifications_feature_div\" class=\"celwidget\" data-feature-name=\"provenanceCertifications\" data-csa-c-type=\"widget\" data-csa-c-content-id=\"provenanceCertifications\" data-csa-c-slot-id=\"provenanceCertifications_feature_div\" data-csa-c-asin=\"B07QJXFWYX\" data-csa-c-is-in-initial-active-row=\"false\" data-csa-c-id=\"9js0py-ynvuzu-iwpkgc-a0tbn\" data-cel-widget=\"provenanceCertifications_feature_div\" style=\"box-sizing: border-box; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\"></div>', '1pack', 'Tzs', '209', '236', 'NO', 0, 1, '2024-02-29 19:31:31'),
(1158, 'Presto! Spin Mop with Steel Wringer, Plastic Bucket Set, Blue', 372, 395, '<h1 class=\"a-size-base-plus a-text-bold\" style=\"padding: 0px 0px 4px; margin-top: 0px; margin-bottom: 0px; text-rendering: optimizelegibility; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif; font-weight: 700 !important; font-size: 16px !important; line-height: 24px !important;\">About this item</h1><ul class=\"a-unordered-list a-vertical a-spacing-mini\" style=\"margin-left: 18px; color: rgb(15, 17, 17); font-family: &quot;Amazon Ember&quot;, Arial, sans-serif;\"><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Unique string function to chop vegetables and fruits with ease</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Made from unbreakable ABS plastic for long-lasting use. Power Requirement : No</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Sturdy 3-blade design made from Stainless Steel</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Eco-friendly design</span></li><li class=\"a-spacing-mini\" style=\"list-style-type: disc; overflow-wrap: break-word;\"><span class=\"a-list-item\">Sleek &amp; Compact Look</span></li></ul>', '1pack', 'Tzs', '999', '1798', 'NO', 0, 1, '2024-02-29 19:36:05'),
(1159, 'onion', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '35', '53', 'NO', 0, 1, '2024-02-29 19:43:49'),
(1160, 'Brocoli', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '95', '130', 'NO', 0, 1, '2024-02-29 19:45:05'),
(1161, 'Carrot', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '50', '60', 'YES', 0, 1, '2024-02-29 19:45:56'),
(1162, 'totato', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '40', '40', 'NO', 0, 1, '2024-02-29 19:46:53'),
(1163, 'potato', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '40', '40', 'NO', 0, 1, '2024-02-29 19:49:27'),
(1164, 'cucumber', 368, 404, '<p>freshh</p>', '1kg', 'Tzs', '50', '55', 'NO', 0, 1, '2024-02-29 19:51:53'),
(1165, 'snack', 384, 408, 'kismi beffer&nbsp;', '1 pack', 'Tzs', '4', '5', 'NO', 0, 1, '2024-03-02 06:43:59'),
(1166, 'Dragon Fruit', 368, 401, 'Seasonal Fresh&nbsp;', '2 pack', 'Tzs', '35', '45', 'YES', 0, 1, '2024-03-02 06:49:02'),
(1167, 'boomer', 384, 408, '<p>boomer&nbsp;</p>', '1pack', 'Tzs', '240', '250', 'NO', 0, 1, '2024-03-02 06:55:58'),
(1168, 'Green Tomato', 368, 404, '<p><br></p>', '1kg', 'Tzs', '50', '63', 'NO', 0, 1, '2024-03-02 14:44:15'),
(1169, 'Baby Spinach', 368, 410, '<p>fresh</p>', '100gm', 'Tzs', '190', '300', 'NO', 0, 1, '2024-03-02 15:01:19'),
(1170, 'Spinach (Palak) 200 gm ', 368, 410, '<p>fresh</p>', '200gm', 'Tzs', '18', '24', 'NO', 0, 1, '2024-03-02 15:02:36'),
(1171, 'Spring Onion (Kandyachi Paat) ', 368, 410, '<p>fresh</p>', '200gm', 'Tzs', '40', '53', 'NO', 0, 1, '2024-03-02 15:03:59'),
(1172, 'Coriander Bunch (Kothimbir)100 g ', 368, 410, '<p>fresh</p>', '200gm', 'Tzs', '18', '21', 'NO', 0, 1, '2024-03-02 15:04:54'),
(1173, 'Iceberg Lettuce', 368, 410, '<p>fresh</p>', '200gm', 'Tzs', '35', '36', 'NO', 0, 1, '2024-03-02 15:08:52'),
(1174, 'Mint Leaves 100 g', 368, 410, '<p>fresh</p>', '100gm', 'Tzs', '10', '13', 'NO', 0, 1, '2024-03-02 15:10:02'),
(1175, 'Holy Tulsi  25gm ', 368, 410, '<p>fresh</p>', '25gm', 'Tzs', '18', '20', 'NO', 0, 1, '2024-03-02 15:12:07'),
(1176, 'Sindhura Mango (Lalbagh)4 pieces', 368, 401, '<p>fresh</p>', '500gm', 'Tzs', '145', '150', 'NO', 0, 1, '2024-03-02 15:18:36'),
(1177, 'Banana 3 piece', 368, 401, '<p>frsh</p>', '3 peice', 'Tzs', '25', '30', 'NO', 0, 1, '2024-03-02 15:20:23'),
(1178, 'Tender Coconut (1 piece', 368, 401, '<p>fresh</p>', '1 peice', 'Tzs', '59', '60', 'NO', 0, 1, '2024-03-02 15:22:08'),
(1179, 'Black Grapes', 368, 401, '<p>fresh</p>', '500gm', 'Tzs', '70', '70', 'NO', 0, 1, '2024-03-02 15:24:00'),
(1180, 'Sapota (Chikoo) 400gm', 368, 401, '<p>fresh</p>', '500gm', 'Tzs', '70', '80', 'NO', 0, 1, '2024-03-02 15:25:34'),
(1181, 'Assorted Fruits (Panch Phal) ', 368, 401, '<p>&nbsp;Combo of 5&nbsp;<br></p>', '1pack', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-02 15:26:56'),
(1182, 'Fortune Chakki Fresh', 369, 385, '', '5kg', 'Tzs', '', '250', 'NO', 0, 1, '2024-03-02 15:35:44'),
(1183, 'Whole Farm Chakki Atta', 369, 385, '', '5kg', 'Tzs', '', '400', 'NO', 0, 1, '2024-03-02 15:37:13'),
(1184, 'Daawat Rozana Super Basmati Rice', 369, 411, '', '5kg', 'Tzs', '', '370', 'NO', 0, 1, '2024-03-02 15:41:22'),
(1185, 'Daawat Pulav Basmati Rice ', 369, 411, '', '1kg', 'Tzs', '', '171', 'NO', 0, 1, '2024-03-02 15:42:33'),
(1186, 'Fortune Rozana Dubar Basmati Rice', 369, 411, '', '1kg', 'Tzs', '', '200', 'NO', 0, 1, '2024-03-02 15:44:02'),
(1187, 'Whole Farm Premium Parmal Rice', 369, 411, '', '1kg', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-02 15:46:42'),
(1188, 'Fortune Sunlite Refined Sunflower Oi', 369, 384, '', '1 liter', 'Tzs', '', '118', 'NO', 0, 1, '2024-03-02 15:52:49'),
(1189, 'Sunrich Refined Sunflower Oil', 369, 384, '', '1 litre', 'Tzs', '', '110', 'NO', 0, 1, '2024-03-02 15:54:07'),
(1190, 'Patanjali Mustard Oil', 369, 384, '', '1l', 'Tzs', '', '129', 'NO', 0, 1, '2024-03-02 15:57:58'),
(1191, 'Lay\'s India\'s Magic Masala Potato Chips ', 370, 387, '<p>masala potato chips</p>', '40gm', 'Tzs', '25', '40', 'NO', 0, 1, '2024-03-02 19:04:26'),
(1192, 'ay\'s American Style Cream & Onion Potato Chips', 370, 387, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;Cream &amp; Onion Potato Chip</span><br></p>', '40gm', 'Tzs', '', '20', 'NO', 0, 1, '2024-03-02 19:05:57'),
(1193, 'Kurkure Solid Masti Masala ', 370, 387, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Masala Twisteez Crisps</span><br></p>', '61gm', 'Tzs', '', '20', 'NO', 0, 1, '2024-03-02 19:09:48'),
(1194, 'Chheda\'s Yellow Banana Chips', 370, 387, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Yellow Banana Chips (Salted)</span><br></p>', '170gm', 'Tzs', '61', '100', 'NO', 0, 1, '2024-03-02 19:12:36'),
(1195, 'Chheda\'s Golden Aloo Chips (Lightly Salted)', 370, 387, '<p>&nbsp;Aloo Chips (Lightly Salted)<br></p>', '170gm', 'Tzs', '68', '85', 'NO', 0, 1, '2024-03-02 19:24:21'),
(1196, 'Balaji Crunchem Chaat Chaska Potato Wafers', 370, 387, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Chaat Chaska Potato Wafers</span><br></p>', '150gm', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 19:26:19'),
(1197, 'Balaji Crunchex Chilli Tadka Potato Wafers', 370, 387, '<p>&nbsp;Chilli Tadka Potato Wafers<br></p>', '150gm', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 19:28:51'),
(1198, 'Act II Microwave Cheese Delite Popcorn', 370, 412, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Cheese Delite Popcorn</span><br></p>', '106gm', 'Tzs', '59', '75', 'NO', 0, 1, '2024-03-02 19:32:23'),
(1199, 'Act II Butter Popcorn', 370, 412, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Butter Popcorn</span><br></p>', '50gm', 'Tzs', '', '25', 'NO', 0, 1, '2024-03-02 19:34:27'),
(1200, 'Act II Natural Microwave Popcorn', 370, 412, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Microwave Popcorn</span><br></p>', '33gm', 'Tzs', '', '27', 'NO', 0, 1, '2024-03-02 19:36:56'),
(1201, 'Act II Ready To Eat Caramel Bliss Popcorn', 370, 412, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;</span><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\"><b>Ready To Eat Caramel Bliss Popcorn</b></span><br></p>', '2x65 g, 70 g', 'Tzs', '', '65', 'NO', 0, 1, '2024-03-02 19:41:11'),
(1202, '4700BC Nutty Tuxedo Chocolate Popcorn', 370, 412, '<p>Chocolate Popcorn<br></p>', '375gm', 'Tzs', '475', '499', 'NO', 0, 1, '2024-03-02 19:43:02'),
(1203, 'American Garden Butter Microwave Popcorn', 370, 412, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Butter Microwave Popcorn</span><br></p>', '273gm', 'Tzs', '', '299', 'NO', 0, 1, '2024-03-02 19:44:37'),
(1204, 'Pepsi Black Zero Calories Soft Drink - Buy 5 Get 1', 370, 413, '<ol><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(37 111 239 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; border-width: 0px; border-style: solid; border-color: currentcolor; display: flex; flex: 1 1 0%; flex-direction: column; gap: 0.5rem; align-self: center; color: rgb(102, 102, 102); font-family: Okra, Helvetica; font-size: 12px;\"><ol><li style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgb(37 111 239 / .5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; border-width: 0px; border-style: solid; border-color: currentcolor; font-size: 19px; color: var(--colors-black-700);\">Pepsi Black Zero Calories Soft Drink - Buy 5 Get 1</li></ol></li></ol>', '6 x 250 ml', 'Tzs', '', '175', 'NO', 0, 1, '2024-03-02 19:58:40'),
(1205, 'Thums Up Soft Drink (750 ml) - Pack of 2', 370, 413, '<p>&nbsp; Pack of 2<br></p>', '(750 ml) ', 'Tzs', '75', '80', 'NO', 0, 1, '2024-03-02 20:04:17'),
(1206, 'Sprite Lime Flavored Soft Drink', 370, 413, '<span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Lime Flavored Soft Drink</span>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:06:36'),
(1207, 'Pepsi Soft Drink', 370, 413, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Soft Drink</span><br></p>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:07:43'),
(1208, 'Bisleri Limonata Limey Minty Cooler Soft Drink', 370, 413, '<p>Limey Minty Cooler Soft Drink<br></p>', '600 ml', 'Tzs', '32', '40', 'NO', 0, 1, '2024-03-02 20:09:10'),
(1209, 'Bisleri Pop Orange Flavour Soft Drink', 370, 413, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Orange Flavour Soft Drink</span><br></p>', '600 ml', 'Tzs', '32', '40', 'NO', 0, 1, '2024-03-02 20:11:15'),
(1210, 'Mountain Dew Grip Soft Drink', 370, 413, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Energy Soft Drink</span><br></p>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:13:01'),
(1211, 'Mirinda Soft Drink', 370, 413, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Orange Flavour Soft Drink</span><br></p>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:14:11'),
(1212, '7UP Soft Drink', 370, 413, '<p>Lemonade&nbsp; Refreshing Soft Drink</p>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:16:51'),
(1213, 'Coca-Cola Soft Drink (750 ml)', 370, 413, '<font color=\"#1f1f1f\" face=\"Okra, Helvetica\"><span style=\"font-size: 19px;\">Original And Refreshing Cold Drink</span></font>', '750ml', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-02 20:19:14'),
(1214, 'Nescafe Chilled Latte Cold Coffee (Ready to Drink) - Pack of 3', 370, 389, '<p>Cold Coffee (Ready to Drink) - Pack of 3<br></p>', '3 x 180 ml ', 'Tzs', '101', '135', 'YES', 0, 1, '2024-03-02 20:30:20'),
(1215, 'Regen Classic Cold Coffee', 370, 389, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;</span><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Classic Cold Coffee</span><br></p>', '200 ml', 'Tzs', '', '50', 'NO', 0, 1, '2024-03-02 20:32:31'),
(1216, 'Sleepy Owl Hazelnut Cold Coffee - 200 ml - Pack of 3', 370, 389, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;</span><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Hazelnut Cold Coffee&nbsp;</span><br></p>', '200', 'Tzs', '338', '375', 'NO', 0, 1, '2024-03-02 20:34:46'),
(1217, 'Sleepy Owl Hazelnut Cold Coffee Can', 370, 389, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Hazelnut Cold Coffee Can</span><br></p>', '200 ml', 'Tzs', '115', '125', 'NO', 0, 1, '2024-03-02 20:37:48'),
(1218, 'Regen Hazelnut Cold Coffee', 370, 389, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Hazelnut Cold Coffee</span><br></p>', '200 ml', 'Tzs', '', '50', 'NO', 0, 1, '2024-03-02 20:38:46'),
(1219, 'Blue Tokai Classic Iced Latte Cold Coffee', 370, 389, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;Classic Iced Latte Cold Coffee</span><br></p>', '240 ml', 'Tzs', '157', '170', 'NO', 0, 1, '2024-03-02 20:40:18'),
(1220, 'Head & Shoulders Anti Hairfall, Anti Dandruff Shampoo ', 371, 392, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Anti Hairfall, Anti Dandruff Shampoo&nbsp;</span><br></p>', '340 ml', 'Tzs', '328', '410', 'NO', 0, 1, '2024-03-03 06:02:19'),
(1221, 'Plum Coconut Milk & Peptides Shampoo', 371, 392, '<p>cocounut Milk for smoodh and shine hair&nbsp;&nbsp;</p>', '250 ml', 'Tzs', '262', '349', 'NO', 0, 1, '2024-03-03 06:08:21'),
(1222, 'Wow Skin Science Rosemary & Biotin Hair Growth Shampoo', 371, 392, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Rosemary &amp; Biotin Hair Growth Shampoo</span><br></p>', '250 ml', 'Tzs', '274', '374', 'NO', 0, 1, '2024-03-03 06:10:29'),
(1223, 'Clinic Plus Strength & Shine Egg with Protein Shampoo', 371, 392, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Strength &amp; Shine Egg with Protein Shampoo</span><br></p>', '355 ml', 'Tzs', '241', '260', 'NO', 0, 1, '2024-03-03 06:13:31'),
(1224, 'Dettol Original Soap', 371, 420, '<p>Germ Defence&nbsp;</p>', '5 x 150 g', 'Tzs', '239', '265', 'NO', 0, 1, '2024-03-03 06:18:18'),
(1225, 'Dettol Icy Cool Soap', 371, 420, '<p>Icy Cool</p>', '5*150 gm', 'Tzs', '247', '265', 'NO', 0, 1, '2024-03-03 06:20:13'),
(1226, 'Cinthol Lime Bath Soap', 371, 420, '<p>Lime Bath Soap&nbsp;</p>', '4*150gm', 'Tzs', '188', '235', 'NO', 0, 1, '2024-03-03 06:22:02'),
(1227, 'Himalaya Neem & Turmeric Soap', 371, 420, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Neem &amp; Turmeric Soap</span><br></p>', '125 gm', 'Tzs', '46', '64', 'NO', 0, 1, '2024-03-03 06:27:11'),
(1228, 'ux Creamy Perfection Soap', 371, 420, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Creamy Perfection Soap</span><br></p>', '75 gm', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-03 06:27:59');
INSERT INTO `items` (`id`, `name`, `category_id`, `sub_category_id`, `description`, `attribute`, `currency`, `discount`, `price`, `homepage`, `prescription_required`, `active`, `created_date`) VALUES
(1229, 'Parachute 100% Pure Coconut Hair Oil', 371, 403, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Pure Coconut Hair Oil</span><br></p>', '300 ml', 'Tzs', '103', '114', 'NO', 0, 1, '2024-03-03 06:30:47'),
(1230, 'Navratna Cool Hair Oil ', 371, 403, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Cool Hair Oil&nbsp;</span><br></p>', '200 ml', 'Tzs', '157', '170', 'NO', 0, 1, '2024-03-03 06:32:12'),
(1231, 'Parachute Advansed Jasmine Coconut Hair Oil ', 371, 403, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Coconut Hair Oil&nbsp;</span><br></p>', '300 ml', 'Tzs', '92', '137', 'NO', 0, 1, '2024-03-03 06:34:16'),
(1232, 'Himalaya Baby Lotion', 371, 421, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Baby Lotion</span><br></p>', '400 ml ', 'Tzs', '277', '325', 'NO', 0, 1, '2024-03-03 06:50:24'),
(1233, 'Himalaya Baby Powder', 371, 421, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Baby Powder</span><br></p>', '400 gm', 'Tzs', '232', '290', 'NO', 0, 1, '2024-03-03 06:56:02'),
(1234, 'Cetaphil Daily Baby Lotion with Organic Calendula', 371, 421, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;Daily Baby Lotion with Organic Calendula</span><br></p>', '400 ml', 'Tzs', '1284', '1474', 'NO', 0, 1, '2024-03-03 06:59:27'),
(1235, 'Mamaearth Moisturizing Daily Baby Lotion', 371, 421, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">Moisturizing Daily Baby Lotion</span><br></p>', '400 ml', 'Tzs', '340', '399', 'NO', 0, 1, '2024-03-03 07:00:52'),
(1236, 'Johnson\'s No More Tears Baby Shampoo', 371, 421, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px;\">&nbsp;No More Tears Baby Shampoo</span><br></p>', ' 500 ml', 'Tzs', '392', '490', 'NO', 0, 1, '2024-03-03 07:02:32'),
(1237, 'Himalaya Gentle Baby Shampoo', 371, 421, '<p>Noiurishes and softness hair&nbsp;</p>', ' 200 ml', 'Tzs', '171', '205', 'NO', 0, 1, '2024-03-03 07:03:44'),
(1257, 'Hide & Seek Chocolate Chip Cookies ', 384, 414, '', '100 gm', 'Tzs', '28', '30', 'NO', 0, 1, '2024-03-03 08:27:47'),
(1258, 'Let\'s Try Oats Choco Chip Cookies', 384, 414, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Oats Choco Chip Cookies</span><br></p>', '200 gm', 'Tzs', '120', '176', 'NO', 0, 1, '2024-03-03 08:29:35'),
(1259, 'Nova Nova Mini Waffle Cookies (Assorted Belgian & Dark Chocolate)', 384, 414, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;(Assorted Belgian &amp; Dark Chocolate)</span><br></p>', '1 pack 12 pieces', 'Tzs', '', '240', 'NO', 0, 1, '2024-03-03 08:30:52'),
(1260, 'Sunfeast Dark Fantasy Vanilla Fills Center Filled Biscuits', 384, 414, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Vanilla Fills Center Filled Biscuits</span><br></p>', '60 gm', 'Tzs', '26', '30', 'NO', 0, 1, '2024-03-03 08:32:08'),
(1261, 'Britannia BisCafe Coffee Crackers', 384, 414, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;Coffee Crackers</span><br></p>', '100 gm', 'Tzs', '24', '30', 'NO', 0, 1, '2024-03-03 08:33:36'),
(1262, 'RiteBite Max Protein Choco Chips Cookies', 384, 414, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Protein Choco Chips Cookies</span><br></p>', '55 gm', 'Tzs', '47', '50', 'NO', 0, 1, '2024-03-03 08:35:37'),
(1263, 'Nestle KitKat Crispy & Creamy 4 Finger Wafer Chocolate Bar', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;Crispy &amp; Creamy 4 Finger Wafer Chocolate Bar</span><br></p>', '38gm', 'Tzs', '', '30', 'NO', 0, 1, '2024-03-03 08:37:53'),
(1264, 'Cadbury Gems Duo Pack Chocolate', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Gems Duo Pack Chocolate</span><br></p>', '25gm', 'Tzs', '', '20', 'NO', 0, 1, '2024-03-03 08:39:00'),
(1265, 'Cadbury Dairy Milk Chocolate Bar', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">&nbsp;Milk Chocolate Bar</span><br></p>', '48  gm', 'Tzs', '48', '50', 'NO', 0, 1, '2024-03-03 08:40:27'),
(1266, 'Milkybar Milk Chocolate Bar', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Milk Chocolate Bar</span><br></p>', '42 gm', 'Tzs', '', '40', 'NO', 0, 1, '2024-03-03 08:41:25'),
(1267, 'Cadbury Dairy Milk Crispello Chocolate Bar', 384, 408, 'chocolate bar', '35 gm', 'Tzs', '', '35', 'NO', 0, 1, '2024-03-03 08:42:38'),
(1268, 'Twix Caramel Chocolate Bar', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Caramel Chocolate Bar</span><br></p>', '50 gm', 'Tzs', '64', '70', 'NO', 0, 1, '2024-03-03 08:43:57'),
(1269, 'Galaxy Milk Chocolate with Cookie Crumble', 384, 408, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Milk Chocolate with Cookie Crumble</span><br></p>', '50 gm', 'Tzs', '', '80', 'NO', 0, 1, '2024-03-03 08:44:57'),
(1270, 'Cadbury 5 Star Chocolate Filled Bar - Pack of 2', 384, 408, 'crunchy and choclaty', '38 gm', 'Tzs', '38', '40', 'NO', 0, 1, '2024-03-03 08:48:02'),
(1271, 'Tide Double Power Lemon & Mint Detergent Powder', 372, 402, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Double Power Lemon &amp; Mint Detergent Powder</span><br></p>', '5 kg (4 kg + 1 kg)', 'Tzs', '503', '635', 'NO', 0, 1, '2024-03-03 11:16:32'),
(1272, 'Wheel 2 in 1 Clean & Fresh Detergent Powder', 372, 402, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Clean &amp; Fresh Detergent Powder</span><br></p>', '1kg', 'Tzs', '', '73', 'NO', 0, 1, '2024-03-03 11:17:30'),
(1273, 'Ghadi Detergent Powder', 372, 402, '', '1 kg', 'Tzs', '65', '71', 'NO', 0, 1, '2024-03-03 11:18:33'),
(1274, 'Surf Excel Easy Wash Detergent Powder', 372, 402, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Easy Wash Detergent</span><br></p>', '1 kg', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-03 11:20:16'),
(1275, 'Surf Excel Easy Wash Detergent Powder', 372, 402, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Easy Wash Detergent</span><br></p>', '1 kg', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-03 11:20:19'),
(1276, 'Ariel Top Load Matic Detergent Powder', 372, 402, '', '1 kg', 'Tzs', '', '290', 'NO', 0, 1, '2024-03-03 11:21:27'),
(1277, 'Vanish Oxi Action Fabric Stain Remover', 372, 402, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Action Fabric Stain Remover</span><br></p>', '400 g', 'Tzs', '200', '240', 'NO', 0, 1, '2024-03-03 11:23:24'),
(1278, 'Persil Non Bio Detergent Powder', 372, 402, '', '1.05 kg', 'Tzs', '', '1499', 'NO', 0, 1, '2024-03-03 11:25:36'),
(1279, 'Pitambari Copper & Brass Dishwash Powder', 372, 395, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Pitambari Copper &amp; Brass&nbsp;</span><br></p>', '200 g', 'Tzs', '47', '60', 'NO', 0, 1, '2024-03-03 11:27:17'),
(1280, 'The Honest Home Company Dishwash Powder', 372, 395, '', '1 Pack', 'Tzs', '189', '225', 'NO', 0, 1, '2024-03-03 11:28:19'),
(1281, 'Vim Lemon Dishwash Gel ', 372, 395, '<p><span style=\"color: rgb(31, 31, 31); font-family: Okra, Helvetica; font-size: 19px; font-weight: 800;\">Lemon Dishwash</span><br></p>', '900 ml', 'Tzs', '210', '215', 'NO', 0, 1, '2024-03-03 11:29:52'),
(1282, 'Pril Lime Grease Fighter Dishwash Gel', 372, 395, '', '1.5 l', 'Tzs', '288', '360', 'NO', 0, 1, '2024-03-03 11:30:56'),
(1283, 'Finish Rinse Aid, Shine & Dry Dishwash Gel', 372, 395, '', '400 ml', 'Tzs', '294', '333', 'NO', 0, 1, '2024-03-03 11:31:50'),
(1284, 'Godrej Aer Power Pocket Air Freshener (Assorted)', 372, 396, '', '1 set 3 pieces', 'Tzs', '160', '180', 'NO', 0, 1, '2024-03-03 11:37:32'),
(1285, 'Godrej Aer Morning Misty Meadows Air Freshener', 372, 396, '', '220 ml', 'Tzs', '287', '338', 'NO', 0, 1, '2024-03-03 11:38:45'),
(1286, 'Odonil Gel Pocket Wild Forest Air Freshener', 372, 396, '', '10g', 'Tzs', '52', '65', 'NO', 0, 1, '2024-03-03 11:41:33'),
(1287, 'Odonil Gel Pocket Mix Air Freshener', 372, 396, '', '1 pack', 'Tzs', '138', '205', 'NO', 0, 1, '2024-03-03 11:42:57'),
(1288, 'Feel Fresh Air Freshener ', 372, 396, '', '4*50 g', 'Tzs', '102', '200', 'NO', 0, 1, '2024-03-03 12:24:57'),
(1289, 'Ambi Pur Exotic Jasmine Air Freshener', 372, 396, '', '275 gm', 'Tzs', '210', '299', 'NO', 0, 1, '2024-03-03 12:26:28'),
(1290, 'Apple', 368, 401, '', '1kg', 'Tzs', '90', '100', 'NO', 0, 1, '2024-03-04 02:51:44'),
(1291, 'Pear', 368, 401, '', '1kg', 'Tzs', '', '80', 'YES', 0, 1, '2024-03-04 02:53:30'),
(1292, 'Avocado', 368, 401, '', '1 piece', 'Tzs', '', '300', 'NO', 0, 1, '2024-03-04 02:55:32'),
(1293, 'Black Apple', 368, 401, '', '1kg', 'Tzs', '', '200', 'NO', 0, 1, '2024-03-04 02:57:54'),
(1294, 'Blue Olive', 368, 401, '', '1kg', 'Tzs', '', '210', 'NO', 0, 1, '2024-03-04 02:59:32'),
(1295, 'Energy Drink', 370, 390, '', '3 pack', 'Tzs', '', '50', 'NO', 0, 1, '2024-03-04 03:07:27'),
(1296, 'Vitamin Energy Immune Extra Strength Shot', 370, 390, '', '1 pack', 'Tzs', '', '90', 'NO', 0, 1, '2024-03-04 03:10:11'),
(1297, 'Vitamin water', 370, 390, '', '2 pack', 'Tzs', '', '50', 'NO', 0, 1, '2024-03-04 03:12:53'),
(1298, 'Redbull', 370, 413, '', '1 pack', 'Tzs', '', '120', 'NO', 0, 1, '2024-03-04 03:14:45'),
(1299, 'Redbull Spring Eddition', 370, 413, '', '1 pack', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-04 03:17:17'),
(1300, 'Earth Organic', 383, 407, '<h1 class=\"pdp-name\" style=\"box-sizing: inherit; font-size: 20px; margin-top: 0px; margin-bottom: 0px; color: rgb(83, 86, 101); padding: 5px 20px 14px 0px; opacity: 0.8; font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Natural &amp; Organic Neem Powder Face &amp; Hair Pack - 150 g</h1>', '1 pack', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-05 08:32:51'),
(1301, 'Earth Organic', 383, 407, '<h1 class=\"pdp-name\" style=\"box-sizing: inherit; font-size: 20px; margin-top: 0px; margin-bottom: 0px; color: rgb(83, 86, 101); padding: 5px 20px 14px 0px; opacity: 0.8; font-family: Assistant, -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, Helvetica, Arial, sans-serif;\">Natural &amp; Organic Neem Powder Face &amp; Hair Pack - 150 g</h1>', '1 pack', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-05 08:32:52'),
(1302, 'Skin care', 383, 407, '', '1 pack', 'Tzs', '', '150', 'NO', 0, 1, '2024-03-05 08:35:36'),
(1303, 'LemonGrass  green Tea', 383, 388, '', '1pack', 'Tzs', '', '199', 'NO', 0, 1, '2024-03-05 08:38:34'),
(1304, 'Tulsi Green tea', 383, 388, '', '1 pack', 'Tzs', '', '249', 'NO', 0, 1, '2024-03-05 08:40:13'),
(1305, 'Dry Food Organic', 383, 418, '', '3 pack', 'Tzs', '', '259', 'NO', 0, 1, '2024-03-05 08:44:19'),
(1306, 'Oats', 383, 418, '', '2 pack', 'Tzs', '', '129', 'NO', 0, 1, '2024-03-05 08:46:48'),
(1307, 'Black tea', 383, 388, 'herbal', '1 pack', 'Tzs', '', '249', 'NO', 0, 1, '2024-03-05 09:06:19'),
(1308, 'Green tea Herbal', 383, 388, '', '1 pack', 'Tzs', '', '259', 'NO', 0, 1, '2024-03-05 09:07:44'),
(1309, 'kiwi', 368, 401, '', '1kg', 'Tzs', '50', '500', 'YES', 0, 1, '2024-03-06 11:04:52'),
(1311, 'Coconut bar chocolate ', 384, 408, '<p>Tasty Coco milk creamy chocolate bites</p>', 'Pack', 'Tzs', '100', '120', 'NO', 0, 1, '2024-05-28 10:14:22'),
(1315, 'Sambusa', 384, 407, '<p>Delicious</p>', '5', 'TZS.', '4000', '5000', 'NO', 0, 1, '2025-04-18 18:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `name`, `image`, `created_date`) VALUES
(23, 'offer for the reselller', 'assets/images/OfferImage/20240522030526000000.png', '2024-03-02 06:30:55'),
(27, 'Big offer of the season ', 'assets/images/OfferImage/20240528100503000000.png', '2024-05-28 10:12:03');

-- --------------------------------------------------------

--
-- Table structure for table `orderlist`
--

CREATE TABLE `orderlist` (
  `id` int(50) NOT NULL,
  `order_id` int(10) NOT NULL,
  `itemName` varchar(500) NOT NULL,
  `itemQuantity` varchar(100) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `currency` varchar(100) NOT NULL,
  `itemImage` varchar(250) DEFAULT NULL,
  `itemPrice` varchar(30) NOT NULL,
  `itemTotal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orderlist`
--

INSERT INTO `orderlist` (`id`, `order_id`, `itemName`, `itemQuantity`, `attribute`, `currency`, `itemImage`, `itemPrice`, `itemTotal`) VALUES
(868, 269, 'Mkate wa Ufuta', '1', '1', 'TZS.', 'assets/images/ProductImage/product/1314202504181104120000001923875018880.png', '4000', '4000.0'),
(869, 269, 'Coconut bar chocolate ', '1', 'Pack', 'Tzs', 'assets/images/ProductImage/product/131120240528100549000000564963914477.png', '100', '100.0');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `zip_code` varchar(6) DEFAULT NULL,
  `landmark` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `user_id`, `date`, `total`, `name`, `email`, `phone`, `address`, `city`, `state`, `zip_code`, `landmark`) VALUES
(269, 'Delivered', 619, '2025-04-18 09:51:22', '4100', 'RAMADHANI RAMADHANI', 'info@chwakahouse.co.tz', '0612121111', 'Mountain ,Zanzibar City,Zanzibar Urban/West,2588', 'Zanzibar City', 'Zanzibar Urban/West', '2588', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `paymentMode` varchar(100) DEFAULT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `paymentId` text DEFAULT NULL,
  `paymentStatus` varchar(100) DEFAULT NULL,
  `paymentDetails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`paymentDetails`)),
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(10) NOT NULL,
  `image` text DEFAULT NULL,
  `item_id` int(10) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `image`, `item_id`, `created_date`) VALUES
(54, 'assets/images/ProductImage/product/1111202212071212550000007754006081631.png', 1111, '2022-12-07 16:58:55'),
(55, 'assets/images/ProductImage/product/1111202212071212550000003521542074305.png', 1111, '2022-12-07 16:58:55'),
(56, 'assets/images/ProductImage/product/1111202212071212550000004553717450886.png', 1111, '2022-12-07 16:58:55'),
(59, 'assets/images/ProductImage/product/1113202212071212390000002004286728868.png', 1113, '2022-12-07 17:01:39'),
(60, 'assets/images/ProductImage/product/1113202212071212390000009243230820933.png', 1113, '2022-12-07 17:01:39'),
(61, 'assets/images/ProductImage/product/1113202212071212390000002743664208139.png', 1113, '2022-12-07 17:01:39'),
(62, 'assets/images/ProductImage/product/1114202212071212520000004832551006553.png', 1114, '2022-12-07 17:02:52'),
(63, 'assets/images/ProductImage/product/1114202212071212520000008862913896565.png', 1114, '2022-12-07 17:02:52'),
(64, 'assets/images/ProductImage/product/1115202212071212360000002046401050760.png', 1115, '2022-12-07 17:04:36'),
(65, 'assets/images/ProductImage/product/1115202212071212360000002960519647003.png', 1115, '2022-12-07 17:04:36'),
(66, 'assets/images/ProductImage/product/1115202212071212360000005259756750744.png', 1115, '2022-12-07 17:04:36'),
(67, 'assets/images/ProductImage/product/111620221207121251000000671310057387.png', 1116, '2022-12-07 17:05:51'),
(68, 'assets/images/ProductImage/product/1116202212071212510000009893215474961.png', 1116, '2022-12-07 17:05:51'),
(69, 'assets/images/ProductImage/product/1116202212071212510000007994124519071.png', 1116, '2022-12-07 17:05:51'),
(83, 'assets/images/ProductImage/product/1124202307080207430000008404239224754.png', 1124, '2023-07-08 14:24:43'),
(86, 'assets/images/ProductImage/product/1125202307080207400000007178705694017.png', 1125, '2023-07-08 14:33:40'),
(88, 'assets/images/ProductImage/product/1126202307080207260000004129267319480.png', 1126, '2023-07-08 14:43:26'),
(89, 'assets/images/ProductImage/product/1127202307080207240000004568732097565.png', 1127, '2023-07-08 14:48:24'),
(90, 'assets/images/ProductImage/product/1112202307080207220000006066085451146.png', 1112, '2023-07-08 14:50:22'),
(91, 'assets/images/ProductImage/product/1128202307080307450000003235699243352.png', 1128, '2023-07-08 15:01:45'),
(92, 'assets/images/ProductImage/product/1129202307080307260000009901220320724.png', 1129, '2023-07-08 15:06:26'),
(93, 'assets/images/ProductImage/product/1130202307080307020000001225975278400.png', 1130, '2023-07-08 15:11:02'),
(94, 'assets/images/ProductImage/product/1131202307080307030000007672392973609.png', 1131, '2023-07-08 15:13:03'),
(95, 'assets/images/ProductImage/product/1132202307080307320000002779947508618.png', 1132, '2023-07-08 15:14:32'),
(97, 'assets/images/ProductImage/product/1133202307080307350000003302017213611.png', 1133, '2023-07-08 15:17:35'),
(100, 'assets/images/ProductImage/product/1136202307080607480000001406785716649.png', 1136, '2023-07-08 18:24:48'),
(105, 'assets/images/ProductImage/product/1140202307080607440000004827038586401.png', 1140, '2023-07-08 18:45:44'),
(106, 'assets/images/ProductImage/product/1141202307080607270000008515473035447.png', 1141, '2023-07-08 18:47:27'),
(107, 'assets/images/ProductImage/product/1142202307080607510000006520478214411.png', 1142, '2023-07-08 18:51:51'),
(108, 'assets/images/ProductImage/product/1143202307080607390000003934644456109.png', 1143, '2023-07-08 18:53:39'),
(109, 'assets/images/ProductImage/product/114420230708060754000000620790013485.png', 1144, '2023-07-08 18:56:54'),
(113, 'assets/images/ProductImage/product/1148202307080707430000002000076853890.png', 1148, '2023-07-08 19:08:43'),
(117, 'assets/images/ProductImage/product/115220240229090223000000127509615245.png', 1152, '2024-02-29 09:56:23'),
(118, 'assets/images/ProductImage/product/1153202402290602080000007383924068526.png', 1153, '2024-02-29 18:26:08'),
(119, 'assets/images/ProductImage/product/1154202402290702270000005619256562044.png', 1154, '2024-02-29 19:09:27'),
(120, 'assets/images/ProductImage/product/115520240229070226000000668190061368.png', 1155, '2024-02-29 19:24:26'),
(121, 'assets/images/ProductImage/product/115620240229070227000000385471815654.png', 1156, '2024-02-29 19:28:27'),
(122, 'assets/images/ProductImage/product/1157202402290702310000005460591428130.png', 1157, '2024-02-29 19:31:31'),
(123, 'assets/images/ProductImage/product/1158202402290702050000003938665413640.png', 1158, '2024-02-29 19:36:05'),
(124, 'assets/images/ProductImage/product/1159202402290702490000008460773688171.png', 1159, '2024-02-29 19:43:49'),
(125, 'assets/images/ProductImage/product/1160202402290702050000003018668056937.png', 1160, '2024-02-29 19:45:05'),
(126, 'assets/images/ProductImage/product/1161202402290702560000003481040752953.png', 1161, '2024-02-29 19:45:56'),
(128, 'assets/images/ProductImage/product/1163202402290702270000008629738978131.png', 1163, '2024-02-29 19:49:27'),
(129, 'assets/images/ProductImage/product/1162202402290702090000004483824209584.png', 1162, '2024-02-29 19:51:09'),
(130, 'assets/images/ProductImage/product/1164202402290702530000001652934203039.png', 1164, '2024-02-29 19:51:53'),
(131, 'assets/images/ProductImage/product/116520240302060359000000280730353217.png', 1165, '2024-03-02 06:43:59'),
(132, 'assets/images/ProductImage/product/1166202403020603020000004802088092491.png', 1166, '2024-03-02 06:49:02'),
(133, 'assets/images/ProductImage/product/1167202403020603580000009858125386999.png', 1167, '2024-03-02 06:55:58'),
(134, 'assets/images/ProductImage/product/116820240302020315000000429743677215.png', 1168, '2024-03-02 14:44:15'),
(135, 'assets/images/ProductImage/product/1169202403020303190000001118130210155.png', 1169, '2024-03-02 15:01:19'),
(136, 'assets/images/ProductImage/product/1170202403020303360000008346018056832.png', 1170, '2024-03-02 15:02:36'),
(137, 'assets/images/ProductImage/product/1171202403020303590000006839931937233.png', 1171, '2024-03-02 15:03:59'),
(138, 'assets/images/ProductImage/product/117220240302030354000000877868564962.png', 1172, '2024-03-02 15:04:54'),
(139, 'assets/images/ProductImage/product/1173202403020303520000002573320778424.png', 1173, '2024-03-02 15:08:52'),
(140, 'assets/images/ProductImage/product/1174202403020303020000009878635715686.png', 1174, '2024-03-02 15:10:02'),
(141, 'assets/images/ProductImage/product/1175202403020303070000009658378542256.png', 1175, '2024-03-02 15:12:07'),
(142, 'assets/images/ProductImage/product/1176202403020303360000007572177076958.png', 1176, '2024-03-02 15:18:36'),
(143, 'assets/images/ProductImage/product/1177202403020303230000001579110799977.png', 1177, '2024-03-02 15:20:23'),
(144, 'assets/images/ProductImage/product/1178202403020303080000004114215326511.png', 1178, '2024-03-02 15:22:08'),
(145, 'assets/images/ProductImage/product/1179202403020303000000009079065936820.png', 1179, '2024-03-02 15:24:00'),
(146, 'assets/images/ProductImage/product/1180202403020303340000005073315623375.png', 1180, '2024-03-02 15:25:34'),
(147, 'assets/images/ProductImage/product/1181202403020303560000008464848471136.png', 1181, '2024-03-02 15:26:56'),
(148, 'assets/images/ProductImage/product/1182202403020303440000003081181387736.png', 1182, '2024-03-02 15:35:44'),
(149, 'assets/images/ProductImage/product/118320240302030313000000510031041469.png', 1183, '2024-03-02 15:37:13'),
(150, 'assets/images/ProductImage/product/1184202403020303220000007265068577191.png', 1184, '2024-03-02 15:41:22'),
(151, 'assets/images/ProductImage/product/1185202403020303330000001911210703815.png', 1185, '2024-03-02 15:42:33'),
(152, 'assets/images/ProductImage/product/1186202403020303020000007609582374370.png', 1186, '2024-03-02 15:44:02'),
(153, 'assets/images/ProductImage/product/1187202403020303420000002186774147234.png', 1187, '2024-03-02 15:46:42'),
(154, 'assets/images/ProductImage/product/1188202403020303490000004006866724192.png', 1188, '2024-03-02 15:52:49'),
(155, 'assets/images/ProductImage/product/1189202403020303070000009037173759543.png', 1189, '2024-03-02 15:54:07'),
(156, 'assets/images/ProductImage/product/1190202403020303580000006261138058298.png', 1190, '2024-03-02 15:57:58'),
(157, 'assets/images/ProductImage/product/1191202403020703260000009521502378651.png', 1191, '2024-03-02 19:04:26'),
(158, 'assets/images/ProductImage/product/1192202403020703570000006991126439922.png', 1192, '2024-03-02 19:05:57'),
(159, 'assets/images/ProductImage/product/1193202403020703480000009451325675182.png', 1193, '2024-03-02 19:09:48'),
(160, 'assets/images/ProductImage/product/1194202403020703360000006844773991746.png', 1194, '2024-03-02 19:12:36'),
(161, 'assets/images/ProductImage/product/1195202403020703210000006154536290756.png', 1195, '2024-03-02 19:24:21'),
(162, 'assets/images/ProductImage/product/1196202403020703190000006237722692387.png', 1196, '2024-03-02 19:26:19'),
(163, 'assets/images/ProductImage/product/1197202403020703510000004277555356582.png', 1197, '2024-03-02 19:28:51'),
(164, 'assets/images/ProductImage/product/1198202403020703230000001450745915851.png', 1198, '2024-03-02 19:32:23'),
(165, 'assets/images/ProductImage/product/1199202403020703270000002224322080110.png', 1199, '2024-03-02 19:34:27'),
(166, 'assets/images/ProductImage/product/1200202403020703560000008432422932260.png', 1200, '2024-03-02 19:36:56'),
(167, 'assets/images/ProductImage/product/120120240302070311000000286256982937.png', 1201, '2024-03-02 19:41:11'),
(168, 'assets/images/ProductImage/product/1202202403020703020000004330774848393.png', 1202, '2024-03-02 19:43:02'),
(169, 'assets/images/ProductImage/product/1203202403020703370000001826028118754.png', 1203, '2024-03-02 19:44:37'),
(170, 'assets/images/ProductImage/product/1204202403020703400000008567723705697.png', 1204, '2024-03-02 19:58:40'),
(171, 'assets/images/ProductImage/product/1205202403020803170000008363978472655.png', 1205, '2024-03-02 20:04:17'),
(172, 'assets/images/ProductImage/product/1206202403020803360000004615594261719.png', 1206, '2024-03-02 20:06:36'),
(173, 'assets/images/ProductImage/product/1207202403020803430000006418621392018.png', 1207, '2024-03-02 20:07:43'),
(174, 'assets/images/ProductImage/product/1208202403020803100000004013331069720.png', 1208, '2024-03-02 20:09:10'),
(175, 'assets/images/ProductImage/product/1209202403020803150000004189540241822.png', 1209, '2024-03-02 20:11:15'),
(176, 'assets/images/ProductImage/product/1210202403020803010000008412910332883.png', 1210, '2024-03-02 20:13:01'),
(177, 'assets/images/ProductImage/product/1211202403020803110000006093884139864.png', 1211, '2024-03-02 20:14:11'),
(178, 'assets/images/ProductImage/product/1212202403020803510000007480768212063.png', 1212, '2024-03-02 20:16:51'),
(179, 'assets/images/ProductImage/product/1213202403020803140000002842774398473.png', 1213, '2024-03-02 20:19:14'),
(180, 'assets/images/ProductImage/product/1214202403020803200000005051066405062.png', 1214, '2024-03-02 20:30:20'),
(181, 'assets/images/ProductImage/product/1215202403020803310000009203638169152.png', 1215, '2024-03-02 20:32:31'),
(182, 'assets/images/ProductImage/product/1216202403020803460000001591188676006.png', 1216, '2024-03-02 20:34:46'),
(183, 'assets/images/ProductImage/product/121720240302080348000000300262670946.png', 1217, '2024-03-02 20:37:48'),
(184, 'assets/images/ProductImage/product/1218202403020803460000004811516902241.png', 1218, '2024-03-02 20:38:46'),
(185, 'assets/images/ProductImage/product/1219202403020803180000004596948230916.png', 1219, '2024-03-02 20:40:18'),
(186, 'assets/images/ProductImage/product/1220202403030603190000004381016492173.png', 1220, '2024-03-03 06:02:19'),
(187, 'assets/images/ProductImage/product/1221202403030603210000005543566497290.png', 1221, '2024-03-03 06:08:21'),
(188, 'assets/images/ProductImage/product/1222202403030603290000003983344968422.png', 1222, '2024-03-03 06:10:29'),
(189, 'assets/images/ProductImage/product/1223202403030603310000007404616275928.png', 1223, '2024-03-03 06:13:31'),
(190, 'assets/images/ProductImage/product/1224202403030603180000002162511496889.png', 1224, '2024-03-03 06:18:18'),
(191, 'assets/images/ProductImage/product/1225202403030603130000007076768246555.png', 1225, '2024-03-03 06:20:13'),
(192, 'assets/images/ProductImage/product/1226202403030603020000009988817977763.png', 1226, '2024-03-03 06:22:02'),
(193, 'assets/images/ProductImage/product/1227202403030603110000005885732982992.png', 1227, '2024-03-03 06:27:11'),
(194, 'assets/images/ProductImage/product/1228202403030603590000005370019743170.png', 1228, '2024-03-03 06:27:59'),
(195, 'assets/images/ProductImage/product/1229202403030603470000004374706492445.png', 1229, '2024-03-03 06:30:47'),
(196, 'assets/images/ProductImage/product/1230202403030603120000009336460226974.png', 1230, '2024-03-03 06:32:12'),
(197, 'assets/images/ProductImage/product/1231202403030603160000007929560283235.png', 1231, '2024-03-03 06:34:16'),
(198, 'assets/images/ProductImage/product/1232202403030603240000002485181388228.png', 1232, '2024-03-03 06:50:24'),
(199, 'assets/images/ProductImage/product/1233202403030603020000006813886817517.png', 1233, '2024-03-03 06:56:02'),
(200, 'assets/images/ProductImage/product/1234202403030603270000001244663205689.png', 1234, '2024-03-03 06:59:27'),
(201, 'assets/images/ProductImage/product/1235202403030703520000007573983960531.png', 1235, '2024-03-03 07:00:52'),
(202, 'assets/images/ProductImage/product/1236202403030703320000003911523293517.png', 1236, '2024-03-03 07:02:32'),
(203, 'assets/images/ProductImage/product/1237202403030703440000002975591064920.png', 1237, '2024-03-03 07:03:44'),
(223, 'assets/images/ProductImage/product/1257202403030803470000006949605504960.png', 1257, '2024-03-03 08:27:47'),
(224, 'assets/images/ProductImage/product/1258202403030803350000008147692184605.png', 1258, '2024-03-03 08:29:35'),
(225, 'assets/images/ProductImage/product/1259202403030803520000006779511284960.png', 1259, '2024-03-03 08:30:52'),
(226, 'assets/images/ProductImage/product/1260202403030803080000002676533926680.png', 1260, '2024-03-03 08:32:08'),
(227, 'assets/images/ProductImage/product/1261202403030803360000007791849252751.png', 1261, '2024-03-03 08:33:36'),
(228, 'assets/images/ProductImage/product/1262202403030803370000003808120994933.png', 1262, '2024-03-03 08:35:37'),
(229, 'assets/images/ProductImage/product/1263202403030803530000009222287899498.png', 1263, '2024-03-03 08:37:53'),
(230, 'assets/images/ProductImage/product/1264202403030803000000004111709330443.png', 1264, '2024-03-03 08:39:00'),
(231, 'assets/images/ProductImage/product/1265202403030803270000008740228408023.png', 1265, '2024-03-03 08:40:27'),
(232, 'assets/images/ProductImage/product/1266202403030803250000003009070646926.png', 1266, '2024-03-03 08:41:25'),
(233, 'assets/images/ProductImage/product/1267202403030803380000007552629044274.png', 1267, '2024-03-03 08:42:38'),
(234, 'assets/images/ProductImage/product/1268202403030803570000005429408496374.png', 1268, '2024-03-03 08:43:57'),
(235, 'assets/images/ProductImage/product/1269202403030803570000009249014478455.png', 1269, '2024-03-03 08:44:57'),
(236, 'assets/images/ProductImage/product/1270202403030803020000006858937865257.png', 1270, '2024-03-03 08:48:02'),
(237, 'assets/images/ProductImage/product/1271202403031103320000008938296057547.png', 1271, '2024-03-03 11:16:32'),
(238, 'assets/images/ProductImage/product/1272202403031103300000004404460298935.png', 1272, '2024-03-03 11:17:30'),
(239, 'assets/images/ProductImage/product/1273202403031103330000002502703803684.png', 1273, '2024-03-03 11:18:33'),
(240, 'assets/images/ProductImage/product/1274202403031103160000004022621951937.png', 1274, '2024-03-03 11:20:16'),
(241, 'assets/images/ProductImage/product/1275202403031103190000005622112734249.png', 1275, '2024-03-03 11:20:19'),
(242, 'assets/images/ProductImage/product/127620240303110327000000982671357429.png', 1276, '2024-03-03 11:21:27'),
(243, 'assets/images/ProductImage/product/127720240303110324000000837987826968.png', 1277, '2024-03-03 11:23:24'),
(244, 'assets/images/ProductImage/product/1278202403031103360000005591761380375.png', 1278, '2024-03-03 11:25:36'),
(245, 'assets/images/ProductImage/product/1279202403031103170000006353648353408.png', 1279, '2024-03-03 11:27:17'),
(246, 'assets/images/ProductImage/product/1280202403031103190000009709647086839.png', 1280, '2024-03-03 11:28:19'),
(247, 'assets/images/ProductImage/product/128120240303110352000000238889163260.png', 1281, '2024-03-03 11:29:52'),
(248, 'assets/images/ProductImage/product/1282202403031103560000009145685683185.png', 1282, '2024-03-03 11:30:56'),
(249, 'assets/images/ProductImage/product/1283202403031103500000008986441351433.png', 1283, '2024-03-03 11:31:50'),
(250, 'assets/images/ProductImage/product/1284202403031103320000002060678060858.png', 1284, '2024-03-03 11:37:32'),
(251, 'assets/images/ProductImage/product/1285202403031103450000006862222745899.png', 1285, '2024-03-03 11:38:45'),
(252, 'assets/images/ProductImage/product/1286202403031103330000008165964726418.png', 1286, '2024-03-03 11:41:33'),
(253, 'assets/images/ProductImage/product/1287202403031103570000001775472428696.png', 1287, '2024-03-03 11:42:57'),
(254, 'assets/images/ProductImage/product/1288202403031203570000008292365704813.png', 1288, '2024-03-03 12:24:57'),
(255, 'assets/images/ProductImage/product/1289202403031203280000008859393709931.png', 1289, '2024-03-03 12:26:28'),
(256, 'assets/images/ProductImage/product/1290202403040203440000009317393006656.png', 1290, '2024-03-04 02:51:44'),
(257, 'assets/images/ProductImage/product/1291202403040203300000008018924491372.png', 1291, '2024-03-04 02:53:30'),
(258, 'assets/images/ProductImage/product/1292202403040203320000005488264089506.png', 1292, '2024-03-04 02:55:32'),
(259, 'assets/images/ProductImage/product/1293202403040203540000002666510861702.png', 1293, '2024-03-04 02:57:54'),
(260, 'assets/images/ProductImage/product/129420240304020332000000445579711793.png', 1294, '2024-03-04 02:59:32'),
(261, 'assets/images/ProductImage/product/1295202403040303270000003025246875872.png', 1295, '2024-03-04 03:07:27'),
(262, 'assets/images/ProductImage/product/1296202403040303110000001427319097763.png', 1296, '2024-03-04 03:10:11'),
(263, 'assets/images/ProductImage/product/1297202403040303530000002914459662754.png', 1297, '2024-03-04 03:12:53'),
(264, 'assets/images/ProductImage/product/1298202403040303450000003729958616144.png', 1298, '2024-03-04 03:14:45'),
(265, 'assets/images/ProductImage/product/1299202403040303170000002474094956150.png', 1299, '2024-03-04 03:17:17'),
(266, 'assets/images/ProductImage/product/13002024030508035100000028824964265.png', 1300, '2024-03-05 08:32:51'),
(267, 'assets/images/ProductImage/product/1301202403050803520000004050587369768.png', 1301, '2024-03-05 08:32:52'),
(268, 'assets/images/ProductImage/product/1302202403050803360000004583562863221.png', 1302, '2024-03-05 08:35:36'),
(269, 'assets/images/ProductImage/product/1303202403050803340000009893051310114.png', 1303, '2024-03-05 08:38:34'),
(270, 'assets/images/ProductImage/product/1304202403050803130000008924108780287.png', 1304, '2024-03-05 08:40:13'),
(271, 'assets/images/ProductImage/product/1305202403050803190000002107568681390.png', 1305, '2024-03-05 08:44:19'),
(272, 'assets/images/ProductImage/product/1306202403050803480000006264661552833.png', 1306, '2024-03-05 08:46:48'),
(273, 'assets/images/ProductImage/product/1307202403050903190000002149560324189.png', 1307, '2024-03-05 09:06:19'),
(274, 'assets/images/ProductImage/product/1308202403050903440000007484572090185.png', 1308, '2024-03-05 09:07:44'),
(276, 'assets/images/ProductImage/product/1309202403061103520000006754570619479.png', 1309, '2024-03-06 11:04:52'),
(279, 'assets/images/ProductImage/product/131120240528100549000000564963914477.png', 1311, '2024-05-28 10:18:49'),
(283, 'assets/images/ProductImage/product/131520250418050415000000756196706945.png', 1315, '2025-04-18 18:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(10) DEFAULT NULL,
  `sub_category_title` varchar(200) DEFAULT NULL,
  `sub_category_img` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=ucs2 COLLATE=ucs2_general_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `sub_category_title`, `sub_category_img`, `created_date`) VALUES
(384, 369, 'Rice & Cereals', 'assets/images/ProductImage/category/20230708020731000000.png', '2022-12-07 16:30:45'),
(385, 369, 'Whole Grains', 'assets/images/ProductImage/category/20230708020702000000.png', '2022-12-07 16:30:53'),
(387, 383, 'Chips & Crisps', 'assets/images/ProductImage/category/20230708020752000000.png', '2022-12-07 16:31:56'),
(388, 388, 'Hot Drinks', 'assets/images/ProductImage/category/20230708020744000000.png', '2022-12-07 16:32:11'),
(389, 370, 'Coffee', 'assets/images/ProductImage/category/20230708020709000000.png', '2022-12-07 16:32:18'),
(390, 388, 'Juices', 'assets/images/ProductImage/category/20230708020756000000.png', '2022-12-07 16:32:36'),
(392, 371, 'Cheese & Butter', 'assets/images/ProductImage/category/20230708060756000000.png', '2022-12-07 16:33:09'),
(395, 372, 'Frozen Meals', 'assets/images/ProductImage/category/20230708020724000000.png', '2022-12-07 16:34:26'),
(396, 372, 'Ice Cream', 'assets/images/ProductImage/category/20230708020720000000.png', '2022-12-07 16:34:53'),
(401, 368, 'Tropical Fruits', 'assets/images/ProductImage/category/20230708010717000000.png', '2023-07-08 13:57:17'),
(402, 372, 'Frozen Vegetables', 'assets/images/ProductImage/category/20230708030740000000.png', '2023-07-08 15:09:40'),
(403, 371, 'Yogurt', 'assets/images/ProductImage/category/20230708060714000000.png', '2023-07-08 18:41:14'),
(404, 370, 'Organic Vegetables', 'assets/images/ProductImage/category/20230708070734000000.png', '2023-07-08 19:00:34'),
(407, 384, 'Cakes & Pastries', 'assets/images/ProductImage/category/20240229070234000000.png', '2024-02-29 19:07:34'),
(408, 383, 'Chocolates', 'assets/images/ProductImage/category/20240302090325000000.png', '2024-03-02 06:41:44'),
(410, 370, 'Leafy Greens', 'assets/images/ProductImage/category/20240302020301000000.png', '2024-03-02 14:59:01'),
(411, 369, 'Pasta & Noodles', 'assets/images/ProductImage/category/20240302030349000000.png', '2024-03-02 15:39:49'),
(412, 370, 'Root Vegetables', 'assets/images/ProductImage/category/20240302070321000000.png', '2024-03-02 19:30:21'),
(413, 388, 'Cold Drinks', 'assets/images/ProductImage/category/20240302070341000000.png', '2024-03-02 19:55:41'),
(414, 384, 'Cookies', 'assets/images/ProductImage/category/20240302080328000000.png', '2024-03-02 20:50:28'),
(418, 383, 'Dry Fruits & Nuts', 'assets/images/ProductImage/category/20240302090319000000.png', '2024-03-02 21:03:19'),
(420, 371, 'Milk & Cream', 'assets/images/ProductImage/category/20240303060341000000.png', '2024-03-03 06:16:41'),
(421, 371, 'JIBINI', 'assets/images/ProductImage/category/20240303060313000000.png', '2024-03-03 06:48:13'),
(423, 372, 'ALO ALOO', 'assets/images/ProductImage/category/20250408080424000000.png', '2025-04-08 21:06:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(11) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` text NOT NULL,
  `reset_code` varchar(6) DEFAULT NULL,
  `firebase_token` text DEFAULT NULL,
  `otp` int(6) DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `token` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `area`, `address`, `state`, `city`, `zip`, `mobile`, `email`, `password`, `reset_code`, `firebase_token`, `otp`, `verified`, `token`) VALUES
(615, 'RAMA', NULL, 'Chwaka', 'Zanzibar Central/South', 'Mwanakwerekwe', '50888', '0621060107', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'cGsexpOkR8mfY-DpddajoO:APA91bEsLaG1Nmr2HU8_pwlDyukLl81AFLLHsn1eJ7D-gP2eLn6uQDYMmVcWcz3rMzsx89skmMjbMvudzsDQrjw1hFIMaYq5RpK84Y9lZGpIAnL0M8YgjRU', NULL, 1, '2ddc2bed0669b37558965591c9ecd486'),
(616, 'Romeo', NULL, 'Kariakoo', 'Dar es Salaam', 'Dar es Salaam Central', '255', '0658379830', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'dOZxvKdnSNanSYBLTh5XVA:APA91bEUHUqYfvI9AT58DTfGZbXAXIYGJbaHuzmGgtidxLs7uH6AYiLvCzQsnM72bXYj4VoJI22qozgyTv1NKbtOpM9Mf2oUOj3FZOk3YPDIYnvklGZvgJ4', NULL, 1, '3a819810ce3357755cea272149936bc8'),
(617, 'Richie', NULL, 'Kariakoo ', 'Dar es Salaam', 'Dar es Salaam Central', '255', '0622045247', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'dOZxvKdnSNanSYBLTh5XVA:APA91bEUHUqYfvI9AT58DTfGZbXAXIYGJbaHuzmGgtidxLs7uH6AYiLvCzQsnM72bXYj4VoJI22qozgyTv1NKbtOpM9Mf2oUOj3FZOk3YPDIYnvklGZvgJ4', NULL, 1, '31dfba1bd7b91ff875727a05b40dd339'),
(618, 'Raulent', NULL, NULL, NULL, NULL, NULL, '098766461', NULL, '8bf729f5f3e2ba07cb421f6046e008ef4958665133b14fded2c7271c4664525f', NULL, 'fbtoken124', 796462, 0, 'dff4ce06d40eba96c83f2b4ab000a0fc'),
(619, 'RAMADHANI RAMADHANI', NULL, 'Mountain ', 'Zanzibar Urban/West', 'Zanzibar City', '2588', '0612121111', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'fUwUk_L1R5-scvwb2K3C-y:APA91bEr282KtRUVUQWBdUch3kXCyXdQTFTzGwPU1knRTKMkM9585oCv4CtqaF9BjGFE4a0hFE1SOSSjEumCfbOcYiHrg0vQAZQOHFW50O2V5U-2O-p2Pm4', NULL, 1, '93684d734810dc3e77d25e2dc84b77c4'),
(620, 'Yahya Khalfan', NULL, NULL, NULL, NULL, NULL, '0623147087', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'cDHhOQavQ-mBJppFzTgmFc:APA91bH0OxQqaX2tmawdU0JXG2Qv-l6UOsYxgafDzAzp4HGc9_Q_TM9aPqstjfhuIBADQ0rrgXOteZVTp63gmbL_OdZvIpx22mX5aAaqr_t0ih2yb-VKzOY', NULL, 1, '21cd8b8d7ffae3291e469200aa3e78b1'),
(623, 'RAMADHANI RAMADHANI', NULL, NULL, NULL, NULL, NULL, '0852965454', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, NULL, 348353, 0, '1c7eac7c67bf336c52fd7962a0de3680'),
(624, 'RAMADHANI RAMADHANI', NULL, NULL, NULL, NULL, NULL, '0885226655', NULL, 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', NULL, 'cGsexpOkR8mfY-DpddajoO:APA91bEsLaG1Nmr2HU8_pwlDyukLl81AFLLHsn1eJ7D-gP2eLn6uQDYMmVcWcz3rMzsx89skmMjbMvudzsDQrjw1hFIMaYq5RpK84Y9lZGpIAnL0M8YgjRU', NULL, 1, '9c96c6780a2758a0dca9cd2d28219149');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_image_ibfk_1` (`item_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `mobile_2` (`mobile`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1316;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=870;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=284;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=424;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=625;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orderlist`
--
ALTER TABLE `orderlist`
  ADD CONSTRAINT `orderlist_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
