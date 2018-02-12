package com.shop.dao;

import com.shop.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit Spring配置文件的位置
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class UserDaoTest {
    @Resource
    private UserDao userDao;
    private final Logger logger= LoggerFactory.getLogger(getClass());
    @Test
    public void queryAll() {

        List<User> user=userDao.queryAll();
        System.out.println(user);
    }
    @Test
    public void login() {

        User user=userDao.selusername("123456");
        System.out.println(user.getCreateTime());

    }

    @Test
    public void insertUser() {
        String username="zj2l";
        String password="123";
        int count=userDao.insertUser(username,password);

        System.out.println(count);
    }

    @Test
    public void updateUser() {
        int count=userDao.updateUser("123456","1234");
    }

    @Test
    public void updateUser2() {
        userDao.updateUser2("123456","12");
    }
}