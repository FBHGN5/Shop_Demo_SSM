package com.shop.dao;

import com.shop.entity.HotSale;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HotSaleDao {
    List<HotSale> queryAll();
    HotSale queryById(int id);
    int reduceNumber(@Param("id") int id,@Param("num") int num);
}
