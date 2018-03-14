package com.shop.service.impl;


import com.shop.dao.BuyCarDao;
import com.shop.dto.Mod;
import com.shop.dto.Reg;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.User;
import com.shop.service.ShopService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit Spring配置文件的位置
@ContextConfiguration({"classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class ShopServiceImpTest {
    private final Logger logger= LoggerFactory.getLogger(this.getClass());
    @Resource
    private ShopService shopService;
    @Resource
    private BuyCarDao buyCarDao;
    @Test
    public void login() {


    }


    @Test
    public void register() {
        Reg reg= shopService.register("dd","1");
        System.out.println(reg.getResult());
    }

    @Test
    public void update() {
        Mod mod= shopService.update("1","1","2");
        System.out.println(mod.getResult());
    }

    @Test
    public void gethotsalelist() {
        List<HotSale> hotsale=shopService.getlist();
        logger.info("hotsale{}",hotsale);
    }

    @Test
    public void getAll() {
        List<User> user=shopService.getAll();
         logger.error("user{}",user);
    }

    @Test
    public void getById() {
        int id=2;
        HotSale hotSale=shopService.getById(id);
        System.out.println(hotSale);
    }


    @Test
    public void buy() {
        shopService.buy("1","2",1,"2",1,1,1);

    }





    @Test
    public void queryByUsername() {
        User user=shopService.queryByUsername("1");
        logger.info("user{}",user);
    }
}