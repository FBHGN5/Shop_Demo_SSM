package com.shop.dao;

import com.shop.entity.BuyCar;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BuyCarDao {
    int insertBuyCar(@Param("img") String img,@Param("name") String name,
                     @Param("price") int price,@Param("username")String username
     ,@Param("number")int number,@Param("id")int id,@Param("kucun")int kucun);
    List<BuyCar> queryAll(String username);
    List<BuyCar> queryAllb();
    int queryAll1();
    int delete(int id);
    int deleteCheckBox(int[] id);
    int decrease(@Param("number")int number,@Param("username")String username,@Param("name")String name);
    BuyCar select(int id);
    BuyCar selectu(@Param("username") String username,@Param("name")String name);
    int update(@Param("number")int number,@Param("id")int id);
}
