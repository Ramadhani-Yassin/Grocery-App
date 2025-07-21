package com.frontendsource.grocerystore.fragment;


import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Spinner;
import android.widget.EditText;
import android.widget.AdapterView;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentTransaction;

import com.frontendsource.grocerystore.R;
import com.frontendsource.grocerystore.activity.BaseActivity;
import com.frontendsource.grocerystore.api.RestService;
import com.frontendsource.grocerystore.model.PaymentInfo;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * A simple {@link Fragment} subclass.
 */
public class PaymentFragment extends Fragment {

    // Remove old RadioGroup/card/cash
    LinearLayout payll;
    TextView pay;
    Spinner paymentMethodSpinner;
    LinearLayout paymentInfoFields;
    EditText paymentFullName, paymentAccountNumber;
    RestService restService;

    public PaymentFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        final View view = inflater.inflate(R.layout.fragment_payment, container, false);
        payll = view.findViewById(R.id.pay_ll);
        pay = view.findViewById(R.id.total_pay);
        Double amount = ((BaseActivity) getActivity()).getTotalPrice();
        pay.append(amount + "");

        paymentMethodSpinner = view.findViewById(R.id.payment_method_spinner);
        paymentInfoFields = view.findViewById(R.id.payment_info_fields);
        paymentFullName = view.findViewById(R.id.payment_full_name);
        paymentAccountNumber = view.findViewById(R.id.payment_account_number);
        restService = com.frontendsource.grocerystore.api.clients.RestClient.getRestService(getContext());

        paymentMethodSpinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                // Show payment info fields for all methods
                paymentInfoFields.setVisibility(View.VISIBLE);
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                paymentInfoFields.setVisibility(View.GONE);
            }
        });

        payll.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String selectedMethod = paymentMethodSpinner.getSelectedItem().toString();
                String fullName = paymentFullName.getText().toString().trim();
                String accountNumber = paymentAccountNumber.getText().toString().trim();
                if (fullName.isEmpty() || accountNumber.isEmpty()) {
                    Toast.makeText(getContext(), "Please enter your full name and phone/account number", Toast.LENGTH_SHORT).show();
                    return;
                }
                // TODO: Replace 1, 1 with actual user_id and order_id from user/order context
                PaymentInfo paymentInfo = new PaymentInfo(selectedMethod, fullName, accountNumber, 1, 1);
                restService.submitPayment(paymentInfo).enqueue(new Callback<Void>() {
                    @Override
                    public void onResponse(Call<Void> call, Response<Void> response) {
                        FragmentTransaction ft = getActivity().getSupportFragmentManager().beginTransaction();
                        ft.setCustomAnimations(R.anim.slide_from_right, R.anim.slide_to_left);
                        ft.replace(R.id.content_frame, new ConfirmFragment());
                        ft.commit();
                    }
                    @Override
                    public void onFailure(Call<Void> call, Throwable t) {
                        FragmentTransaction ft = getActivity().getSupportFragmentManager().beginTransaction();
                        ft.setCustomAnimations(R.anim.slide_from_right, R.anim.slide_to_left);
                        ft.replace(R.id.content_frame, new ConfirmFragment());
                        ft.commit();
                    }
                });
            }
        });

        return view;
    }

    @Override
    public void onViewCreated(View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        //you can set the title for your toolbar here for different fragments different titles
        getActivity().setTitle("Payment");
    }
}
