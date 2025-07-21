package com.frontendsource.grocerystore.model;

public class PaymentInfo {
    private String method;
    private String fullName;
    private String accountNumber;
    private int user_id;
    private int order_id;

    public PaymentInfo(String method, String fullName, String accountNumber, int user_id, int order_id) {
        this.method = method;
        this.fullName = fullName;
        this.accountNumber = accountNumber;
        this.user_id = user_id;
        this.order_id = order_id;
    }

    public String getMethod() {
        return method;
    }
    public void setMethod(String method) {
        this.method = method;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getAccountNumber() {
        return accountNumber;
    }
    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }
    public int getUser_id() {
        return user_id;
    }
    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
    public int getOrder_id() {
        return order_id;
    }
    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
} 