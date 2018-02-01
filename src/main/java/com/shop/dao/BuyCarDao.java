package com.shop.dao;

import com.shop.entity.BuyCar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BuyCarDao {
    int insertBuyCar(@Param("img") String img,@Param("name") String name,
                     @Param("price") int price,@Param("username")String username
     ,@Param("number")int number);

    List<BuyCar> queryAll(String username);
    int delete(int id);
}
