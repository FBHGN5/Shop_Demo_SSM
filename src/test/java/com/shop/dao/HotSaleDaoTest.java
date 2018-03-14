package com.shop.dao;

import com.shop.entity.HotSale;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit Spring配置文件的位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class HotSaleDaoTest {
    @Resource
    private HotSaleDao hotSaleDao;
    @Test
    public void queryAll() {
        List<HotSale> hotsale=hotSaleDao.queryAll();
        System.out.println(hotsale);
    }

    @Test
    public void queryById() {
        int id=1;
        HotSale hotSale=hotSaleDao.queryById(id);
        System.out.println(hotSale);
    }

    @Test
    public void update() {
        hotSaleDao.update(12222,1,1);
    }

    @Test
    public void insert() {
        hotSaleDao.insert("1","1",1,"1",1,"2","2","1");
    }

//    @Test
//    public void reduceNumber() {
//        int id=1;
//        int up=hotSaleDao.reduceNumber(id,2);
//    }
//
//    @Test
//    public void update() {
//       String[] name={"1"};
//        int num[]={10};
//        for(int i=0;i<num.length;i++)
//        {
//           hotSaleDao.update(name[i],num[i]);
//      }
//    }


}