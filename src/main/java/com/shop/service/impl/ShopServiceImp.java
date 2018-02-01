package com.shop.service.impl;

import com.shop.dao.*;
import com.shop.dto.Mod;
import com.shop.dto.Reg;
import com.shop.dto.Statenow;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.User;
import com.shop.service.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ShopServiceImp implements ShopService {
    private Logger logger= LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserDao userDao;
    @Autowired
    private HotSaleDao hotSaleDao;
    @Autowired
    private BuyCarDao buyCarDao;
    public Statenow login(String username, String password) {
        User user=userDao.selusername(username);

        if(user==null)
        {
            logger.error("该账户未注册");
            return new Statenow("1");

        }
        /*
        字符串判断用equal
         */
        else{
            if(password.equals(user.getPassword()))
            {
                return new Statenow("0");
            }
            else{
               logger.error("密码错误");
               return new Statenow("2");
            }
        }

    }

    public Reg register(String username, String password) {
        int count = userDao.insertUser(username, password);
        if (count == 0) {
            logger.error("该用户名已注册！");
            return new Reg("fail");
        } else {
            logger.info("恭喜你注册成功！");
            return new Reg("success");
        }
    }

    public Mod update(String username, String old, String password) {
        User user=userDao.selusername(username);
        logger.error(user.getPassword());
        logger.error(old);
        if(user.getPassword().equals(old))
        {   int update=userDao.updateUser(username,password);
            return new Mod("success");
        }
        else{
            return new Mod("fail");
        }

    }

    public List<HotSale> getlist() {return hotSaleDao.queryAll();}

    public List<User> getAll() {
        return userDao.queryAll();
    }

    public HotSale getById(int id) {
        return hotSaleDao.queryById(id);
    }

    public int buy(String img, String name, int price,String username,int id,int number,int num) {
        int insert=buyCarDao.insertBuyCar(img,name,price,username,number);
        int up=hotSaleDao.reduceNumber(id,num);
        return insert;
    }

    public   List<BuyCar> buycar(String username) { return buyCarDao.queryAll(username);}


}
