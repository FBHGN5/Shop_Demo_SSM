package com.shop.service;

import com.github.pagehelper.PageInfo;
import com.shop.dto.*;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.Order;
import com.shop.entity.User;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;


public interface ShopService {
    User queryByUsername(String username);
    User queryByPhone(String username);
    int login(String username, String password, HttpSession session, HttpServletResponse response);
    void update(String username);
    void update2(String username);
    Reg register(String username,String password,String phone);
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
    List<Order>  order2(String username,String name);
    void del(int id);
    void deletecheckbox(int[] id);
    int deleteOrder(int id);
     void reduceNumber(int[]id,int[]num);
      void insertOrder(int[] number,String username1,int[] checkid);

//    void increaseNumber(String[] name,int[] num);
      PageInfo<HotSale> findpage(Integer page);
    PageInfo<BuyCar> findpage1(Integer page1,String username);
    PageInfo<Order> findpage2(Integer page2,String usernameorder);
}
