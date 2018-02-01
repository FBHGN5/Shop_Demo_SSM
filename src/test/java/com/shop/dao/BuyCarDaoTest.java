package com.shop.dao;

import com.shop.entity.BuyCar;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit Spring配置文件的位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class BuyCarDaoTest {
    @Resource
    private BuyCarDao buyCarDao;
    @Test
    public void insertBuyCar() {
        int i=buyCarDao.insertBuyCar("!","1",1,"1",1);
    }

    @Test
    public void queryAll() {
        List<BuyCar> buycar=buyCarDao.queryAll("1");
        System.out.println("fsaaaaaaaaaa"+buycar);
 }

    @Test
    public void delete() {
        int i=buyCarDao.delete(1);
    }
}