package com.shop.entity;

public class BuyCar {
    private String img;
    private String name;
    private int price;
    private int number;
    private String creatTime;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(String creatTime) {
        this.creatTime = creatTime;
    }

    @Override
    public String toString() {
        return "BuyCar{" +
                "img='" + img + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", number=" + number +
                ", creatTime='" + creatTime + '\'' +
                ", id=" + id +
                '}';
    }
}
