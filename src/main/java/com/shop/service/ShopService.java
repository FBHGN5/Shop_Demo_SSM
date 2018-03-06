package com.shop.service;

import com.shop.dto.*;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.Order;
import com.shop.entity.User;

import java.util.List;


public interface ShopService {
    User queryByUsername(String username);
    int login(String username, String password);
    void update(String username);
    void update2(String username);
    Reg register(String username,String password);
    Mod update(String username,String old,String password);
   List<HotSale> getlist();
   List<User> getAll();
    List<BuyCar> getAllBuyCar();
    List<Order> getAllOrderlist();
   HotSale getById(int id);
   int hotdelById(int id);
   int buy(String img,String name,int price,String username,int number,int id,int kucun);
   void sale(String username,String name,
             int price,String img,int number,
              String wimg, String bimg,String buycarimg);
    List<BuyCar>  buycar(String username);
    List<Order>  order(String username);
    void del(int id);
    void deletecheckbox(int[] id);
    void deleteOrder(int id);
     void reduceNumber(int[]id,int[]num);
      void insertOrder(String username1,int[] checkid);
//    void increaseNumber(String[] name,int[] num);
}
