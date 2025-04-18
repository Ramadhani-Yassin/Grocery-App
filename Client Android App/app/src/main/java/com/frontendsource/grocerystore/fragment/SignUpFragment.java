package com.frontendsource.grocerystore.fragment;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.XmlResourceParser;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.fragment.app.Fragment;

import com.frontendsource.grocerystore.activity.OTPActivity;
import com.google.gson.Gson;
import com.frontendsource.grocerystore.R;
import com.frontendsource.grocerystore.activity.LoginRegisterActivity;
import com.frontendsource.grocerystore.api.clients.RestClient;
import com.frontendsource.grocerystore.model.User;
import com.frontendsource.grocerystore.model.UserResult;
import com.frontendsource.grocerystore.util.CustomToast;
import com.frontendsource.grocerystore.util.NetworkCheck;
import com.frontendsource.grocerystore.util.Utils;
import com.frontendsource.grocerystore.util.localstorage.LocalStorage;

import java.io.IOException;
import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SignUpFragment extends Fragment implements OnClickListener {
    private static final String TAG = "SignUpFragment";
    private View view;
    private EditText fullName, mobileNumber, password;
    private TextView login;
    private Button signUpButton;
    private CheckBox terms_conditions;
    private User user;
    private LocalStorage localStorage;
    private Gson gson = new Gson();
    private View progress;
    private String firebaseToken;

    public SignUpFragment() {
        // Required empty public constructor
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        view = inflater.inflate(R.layout.signup_layout, container, false);
        localStorage = new LocalStorage(requireContext());
        firebaseToken = localStorage.getFirebaseToken();
        initViews();
        setListeners();
        return view;
    }

    private void initViews() {
        fullName = view.findViewById(R.id.fullName);
        progress = view.findViewById(R.id.progress_bar);
        mobileNumber = view.findViewById(R.id.mobileNumber);
        password = view.findViewById(R.id.password);
        signUpButton = view.findViewById(R.id.signUpBtn);
        login = view.findViewById(R.id.already_user);
        terms_conditions = view.findViewById(R.id.terms_conditions);

        // Check network availability
        if (!NetworkCheck.isNetworkAvailable(getContext())) {
            new CustomToast().Show_Toast(getActivity(), view, "No internet connection");
        }

        // Setting text selector over textviews
        try {
            @SuppressLint("ResourceType") XmlResourceParser xrp = getResources().getXml(R.drawable.text_selector);
            ColorStateList csl = ColorStateList.createFromXml(getResources(), xrp);
            login.setTextColor(csl);
            terms_conditions.setTextColor(csl);
        } catch (Exception e) {
            Log.e(TAG, "Error setting text colors", e);
        }
    }

    private void setListeners() {
        signUpButton.setOnClickListener(this);
        login.setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.signUpBtn:
                checkValidation();
                break;
            case R.id.already_user:
                new LoginRegisterActivity().replaceLoginFragment();
                break;
        }
    }

    private void checkValidation() {
        String getFullName = fullName.getText().toString().trim();
        String getMobileNumber = mobileNumber.getText().toString().trim();
        String getPassword = password.getText().toString().trim();

        // Validation checks
        if (getFullName.isEmpty()) {
            fullName.setError("Enter Your Name");
            fullName.requestFocus();
            return;
        }

        if (getMobileNumber.isEmpty()) {
            mobileNumber.setError("Enter Your Mobile Number");
            mobileNumber.requestFocus();
            return;
        }

        if (getPassword.isEmpty()) {
            password.setError("Enter Password");
            password.requestFocus();
            return;
        }

        if (getPassword.length() < 6) {
            password.setError("Password must be at least 6 characters");
            password.requestFocus();
            return;
        }

        if (!terms_conditions.isChecked()) {
            new CustomToast().Show_Toast(getActivity(), view, "Accept Terms & Conditions");
            return;
        }

        user = new User(getFullName, getMobileNumber, getPassword, firebaseToken);
        registerUser(user);
    }

    private void registerUser(User user) {
        if (!NetworkCheck.isNetworkAvailable(getContext())) {
            new CustomToast().Show_Toast(getActivity(), view, "No internet connection");
            return;
        }

        showProgressDialog();

        Call<UserResult> call = RestClient.getRestService(getContext()).register(user);
        call.enqueue(new Callback<UserResult>() {
            @Override
            public void onResponse(Call<UserResult> call, Response<UserResult> response) {
                hideProgressDialog();

                if (response.isSuccessful()) {
                    UserResult userResult = response.body();
                    if (userResult != null) {
                        if (userResult.getStatus() == 201) {
                            handleSuccessfulRegistration(userResult);
                        } else {
                            handleRegistrationError(userResult);
                        }
                    } else {
                        new CustomToast().Show_Toast(getActivity(), view, "Server returned empty response");
                    }
                } else {
                    handleServerError(response);
                }
            }

            @Override
            public void onFailure(Call<UserResult> call, Throwable t) {
                hideProgressDialog();
                Log.e(TAG, "Registration failed: " + t.getMessage(), t);
                new CustomToast().Show_Toast(getActivity(), view, "Registration failed: " + t.getMessage());
            }
        });
    }

    private void handleSuccessfulRegistration(UserResult userResult) {
        try {
            String userString = gson.toJson(userResult.getUser());
            localStorage.createUserLoginSession(userString);
            Toast.makeText(getContext(), userResult.getMessage(), Toast.LENGTH_LONG).show();

            Intent intent = new Intent(getContext(), OTPActivity.class);
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
            startActivity(intent);
            if (getActivity() != null) {
                getActivity().finish();
            }
        } catch (Exception e) {
            Log.e(TAG, "Error handling registration", e);
            new CustomToast().Show_Toast(getActivity(), view, "Error processing registration");
        }
    }

    private void handleRegistrationError(UserResult userResult) {
        String errorMessage = "Registration failed";
        if (userResult.getMessage() != null && !userResult.getMessage().isEmpty()) {
            errorMessage = userResult.getMessage();
        }
        new CustomToast().Show_Toast(getActivity(), view, errorMessage);
    }

    private void handleServerError(Response<UserResult> response) {
        try {
            String errorBody = response.errorBody() != null ? response.errorBody().string() : "Unknown error";
            Log.e(TAG, "Server error: " + response.code() + " - " + errorBody);
            new CustomToast().Show_Toast(getActivity(), view, "Server error: " + response.code());
        } catch (IOException e) {
            Log.e(TAG, "Error reading error body", e);
            new CustomToast().Show_Toast(getActivity(), view, "Server error occurred");
        }
    }

    private void hideProgressDialog() {
        if (progress != null) {
            progress.setVisibility(View.GONE);
        }
    }

    private void showProgressDialog() {
        if (progress != null) {
            progress.setVisibility(View.VISIBLE);
        }
    }
}