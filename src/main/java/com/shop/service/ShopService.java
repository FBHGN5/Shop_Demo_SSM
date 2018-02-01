package com.shop.service;

import com.shop.dto.*;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.User;

import java.util.List;


public interface ShopService {
    Statenow login(String username, String password);
    Reg register(String username,String password);
    Mod update(String username,String old,String password);
   List<HotSale> getlist();
   List<User> getAll();
   HotSale getById(int id);
   int buy(String img,String name,int price,String username,int id,int number,int num);
    List<BuyCar>  buycar(String username);

}
