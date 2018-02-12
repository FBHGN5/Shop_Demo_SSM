package com.shop.service.impl;

import com.shop.dao.*;
import com.shop.dto.Mod;
import com.shop.dto.Reg;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
import com.shop.entity.Order;
import com.shop.entity.User;
import com.shop.service.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
写上@Service创建这个类对象
 */
@Service
public class ShopServiceImp implements ShopService {
    private Logger logger= LoggerFactory.getLogger(this.getClass());
    /*
    @Autowired自动注入该对象
     */
    @Autowired
    private UserDao userDao;
    @Autowired
    private HotSaleDao hotSaleDao;
    @Autowired
    private BuyCarDao buyCarDao;
    @Autowired
    private OrderDao orderDao;
    public int login(String username, String password) {
        User user=userDao.selusername(username);
        int result;
        /*
        result=-1;管理员密码验证正确
        result=3;用户被封号
        result=0;用户登陆成功
        result=1;用户输入账户错误
        result=2;用户密码错误
         */
        if (user!=null&&password.equals(user.getPassword())) {
            System.out.println(password+"=password1");
            System.out.println(user.getPassword()+"=password2");
            if(user.getState()==2)
            /*
          管理员
             */

            {
                result=-1;
                logger.info("管理员上线");
                System.out.println("管理员上线!");
            }
            else {
                 if(user.getState()==1)
                {
                    result=3;
                    logger.info("用户被封号!");
                }
                else{
                     result = 0;
                     System.out.println(user.getUsername()+"登陆成功!");
                }

            }
        }
        /*
        没注册
         */
        else if (user==null) {
            result = 1;
            System.out.println("账户未注册!");
        }
        /*
        密码错误
         */
        else {
            result = 2;
            System.out.println(user.getUsername()+"的用户登陆密码错误！");
        }
        return  result;
    }

    public void update(String username) {
        userDao.update(username);
    }

    public void update2(String username) {
        userDao.update2(username);
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
        {   if(old.equals(password))
        {  logger.info("原密码与新密码相同！");
            return new Mod("same");

        }
        else{
            int update=userDao.updateUser(username,password);
            return new Mod("success");
        }
        }
        else{
            return new Mod("fail");
        }

    }

    public List<HotSale> getlist() {return hotSaleDao.queryAll();}

    public List<User> getAll() {
        return userDao.queryAll();
    }

    public List<BuyCar> getAllBuyCar() {
       return  buyCarDao.queryAllb();
    }

    public List<Order> getAllOrderlist() {
        return  orderDao.queryAllorder();
    }

    public HotSale getById(int id) {
        return hotSaleDao.queryById(id);
    }

    public int buy(String img, String name, int price,String username,int number,int id,int kucun) {
        BuyCar buycar=buyCarDao.selectu(username,name);
        /*
        在购物车中商品的热销号不是唯一的！！商品名+用户名是唯一!!。
         */
       if(buycar==null)
       {int insert=buyCarDao.insertBuyCar(img,name,price,username,number,id,kucun);}

         else {
           buyCarDao.decrease(number,username,name);
       }

//               try {
//               BuyCar buycar1=buyCarDao.selectu(username,name);
//               System.out.println(buycar.getNumber()+"asdd");
//               /*
//               如果是另外一个用户购买同一商品执行异常
//                */
//               }catch (Exception e)
//               {   int i=buyCarDao.queryAll1();
//               System.out.println(i);
//               buyCarDao.insertBuyCar(img,name,price,username,number,i+1,kucun);
//               }



//        int up=hotSaleDao.reduceNumber(id,num);
        return 1;
    }

    public   List<BuyCar> buycar(String username) { return buyCarDao.queryAll(username);}

    public List<Order> order(String username) {
        return orderDao.queryAll(username);
    }

    public void del(int id) {
        int del=buyCarDao.delete(id);
    }

    public void deletecheckbox(int[] id) {
        buyCarDao.deleteCheckBox(id);
    }

    public void reduceNumber(int[] id, int[] num) {
         for(int i=0;i<id.length;i++)
         {
             hotSaleDao.reduceNumber(id[i],num[i]);
         }
    }

    public void insertOrder(String username1, int[] checkid) {
        String username=username1;
        String[] img=new String[checkid.length];
        String[] name=new String[checkid.length];
        int[] price=new int[checkid.length];
        int[] num=new int[checkid.length];
        int[] hotid=new int[checkid.length];
        for(int j=0;j<checkid.length;j++)
        {   BuyCar buyCar=buyCarDao.select(checkid[j]);
            img[j]=buyCar.getImg();
            name[j]=buyCar.getName();
            num[j]=buyCar.getNumber();
            price[j]=buyCar.getPrice()*num[j];
            hotid[j]=buyCar.getHotid();
        }
       for (int i=0;i<checkid.length;i++)
      {
          orderDao.insertOrder(img[i],name[i],price[i],username,num[i],checkid[i],hotid[i]);
      }
      }


//    public void increaseNumber(String[] name, int[] num) {
//        for(int i=0;i<num.length;i++)
//        {
//            hotSaleDao.update(name[i],num[i]);
//        }
//    }


}
