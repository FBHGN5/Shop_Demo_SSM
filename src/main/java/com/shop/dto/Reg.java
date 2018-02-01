package com.shop.dto;

public class Reg {
   private String result;

    @Override
    public String toString() {
        return "Reg{" +
                "result='" + result + '\'' +
                '}';
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public Reg(String result) {
        this.result = result;
    }
}
