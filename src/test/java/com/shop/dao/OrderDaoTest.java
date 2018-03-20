package com.shop.dao;

import com.shop.entity.Order;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit Spring配置文件的位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class OrderDaoTest {
    @Autowired
    private OrderDao orderDao;
    @Test
    public void deleteOrder() {
        orderDao.deleteOrder(1111);
    }

    @Test
    public void queryAllName() {
      List<Order> orders=  orderDao.queryAllName("小");
      System.out.println(orders+"DDSDASDA");
    }
}