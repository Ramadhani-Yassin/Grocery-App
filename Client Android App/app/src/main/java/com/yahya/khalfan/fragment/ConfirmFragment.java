package com.yahya.khalfan.fragment;


import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.Gson;
import com.yahya.khalfan.R;
import com.yahya.khalfan.activity.BaseActivity;
import com.yahya.khalfan.activity.CartActivity;
import com.yahya.khalfan.activity.SuccessActivity;
import com.yahya.khalfan.adapter.CheckoutCartAdapter;
import com.yahya.khalfan.api.clients.RestClient;
import com.yahya.khalfan.model.Cart;
import com.yahya.khalfan.model.Order;
import com.yahya.khalfan.model.OrderItem;
import com.yahya.khalfan.model.OrdersResult;
import com.yahya.khalfan.model.PlaceOrder;
import com.yahya.khalfan.model.User;
import com.yahya.khalfan.util.localstorage.LocalStorage;

import java.util.ArrayList;
import java.util.List;


import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * A simple {@link Fragment} subclass.
 */
public class ConfirmFragment extends Fragment  {
    LocalStorage localStorage;
    List<Cart> cartList = new ArrayList<>();
    Gson gson;
    RecyclerView recyclerView;
    CheckoutCartAdapter adapter;
    RecyclerView.LayoutManager recyclerViewlayoutManager;
    TextView back, order;
    TextView total, shipping, totalAmount;
    Double _total, _shipping, _totalAmount;
    ProgressDialog progressDialog;
    List<Order> orderList = new ArrayList<>();
    List<OrderItem> orderItemList = new ArrayList<>();
    PlaceOrder confirmOrder;
    String orderNo, address;
    String id;
    OrderItem orderItem = new OrderItem();

    User user;


    public ConfirmFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View view = inflater.inflate(R.layout.fragment_confirm, container, false);
        localStorage = new LocalStorage(getContext());
        recyclerView = view.findViewById(R.id.cart_rv);
        totalAmount = view.findViewById(R.id.total_amount);
        total = view.findViewById(R.id.total);
        shipping = view.findViewById(R.id.shipping_amount);
        back = view.findViewById(R.id.back);
        order = view.findViewById(R.id.place_order);

        progressDialog = new ProgressDialog(getContext());
        gson = new Gson();
        orderList = ((BaseActivity) getActivity()).getOrderList();
        orderList = ((BaseActivity) getActivity()).getOrderList();
        cartList = ((BaseActivity) getContext()).getCartList();
        user = gson.fromJson(localStorage.getUserLogin(), User.class);
        address = user.getAddress() + "," + user.getCity() + "," + user.getState() + "," + user.getZip();

        for (int i = 0; i < cartList.size(); i++) {

            orderItem = new OrderItem(cartList.get(i).getTitle(), cartList.get(i).getQuantity(), cartList.get(i).getAttribute(), cartList.get(i).getCurrency(), cartList.get(i).getImage(), cartList.get(i).getPrice(), cartList.get(i).getSubTotal());
            orderItemList.add(orderItem);
        }



        _total = ((BaseActivity) getActivity()).getTotalPrice();
        _shipping = 0.0;
        _totalAmount = _total + _shipping;
        total.setText(_total + "");
        shipping.setText(_shipping + "");
        totalAmount.setText(_totalAmount + "");

        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(getActivity(), CartActivity.class));
                getActivity().overridePendingTransition(R.anim.slide_from_right, R.anim.slide_to_left);
            }
        });

        order.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                placeUserOrder();
            }
        });

        setUpCartRecyclerview();
        return view;
    }

    private void placeUserOrder() {
        confirmOrder = new PlaceOrder(user.getToken(), user.getName(), user.getMobile(),user.getEmail(), user.getCity(),user.getState(),user.getZip(), address, orderItemList);
        progressDialog.setMessage("Confirming Order...");
        progressDialog.show();
        Log.d("Confirm Order==>", gson.toJson(confirmOrder));
        Call<OrdersResult> call = RestClient.getRestService(getContext()).confirmPlaceOrder(confirmOrder);
        call.enqueue(new Callback<OrdersResult>() {
            @Override
            public void onResponse(Call<OrdersResult> call, Response<OrdersResult> response) {
                Log.d("respose==>", response.body().getCode() + "");

                OrdersResult ordersResult = response.body();

                if (ordersResult!=null && ordersResult.getCode() == 200) {
                    localStorage.deleteCart();
                        showCustomDialog();
                        progressDialog.dismiss();
                }

            }

            @Override
            public void onFailure(Call<OrdersResult> call, Throwable t) {
                Log.d("Error respose==>", t.getMessage() + "");
                progressDialog.dismiss();
            }
        });


    }


    private void showCustomDialog() {

        startActivity(new Intent(getContext(), SuccessActivity.class));
        getActivity().finish();


    }

    private void setUpCartRecyclerview() {
        recyclerView.setHasFixedSize(true);
        recyclerViewlayoutManager = new LinearLayoutManager(getContext());
        recyclerView.setLayoutManager(recyclerViewlayoutManager);
        adapter = new CheckoutCartAdapter(cartList, getContext());
        recyclerView.setAdapter(adapter);
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Confirm");
    }



}
