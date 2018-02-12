package com.shop.dao;

import com.shop.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderDao {
    int insertOrder(@Param("img") String img,@Param("name") String name,
                     @Param("price") int price,@Param("username")String username
            ,@Param("number")int number,@Param("id")int id,@Param("hotid")int hotid);
    Order sec(int id);
    List<Order> queryAllorder();
    List<Order> queryAll(String username);
}
