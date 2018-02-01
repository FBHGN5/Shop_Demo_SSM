package com.shop.dto;

public class Statenow {
    private String state;


    public Statenow(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Statenow{" +
                "state='" + state + '\'' +
                '}';
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }
}
