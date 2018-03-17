package com.shop.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
public class ShopServiceImpl implements ShopService {
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

    public User queryByUsername(String username) {
     return userDao.selusername(username) ;
    }

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

    public List<HotSale> getlist() {
        return hotSaleDao.queryAll();
    }


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

    public int hotdelById(int id) {
        return hotSaleDao.deleteById(id);
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

        return 1;
    }

    public void sale(String username, String name, int price, String img, int number, String wimg, String bimg, String buycarimg) {
        hotSaleDao.insert(username,name,price,img,number,wimg,bimg,buycarimg);
    }

    public   List<BuyCar> buycar(String username) {
       return buyCarDao.queryAll(username);
        }

   public List<Order> order2(String username, String name) {
        if(name.equals(""))
        {
            return orderDao.queryAll(username);
        }
        else{
            return orderDao.queryAllName(name);
        }
    }

    public void del(int id) {
        int del=buyCarDao.delete(id);
    }

    public void deletecheckbox(int[] id) {
        buyCarDao.deleteCheckBox(id);
    }

    public int deleteOrder(int id) {
       int update= orderDao.deleteOrder(id);
       return update;
    }

    public void reduceNumber(int[] id, int[] num) {
         for(int i=0;i<id.length;i++)
         {
             hotSaleDao.reduceNumber(id[i],num[i]);
         }
    }

    public void insertOrder(int[] number,String username1, int[] checkid) {
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
        for (int i = 0; i < checkid.length; i++) {
            int update = buyCarDao.delete(checkid[i]);
        }
      }

    public PageInfo<HotSale> findpage(Integer page) {
        PageHelper.startPage(page, 5);
        List<HotSale> list=getlist();
        return new PageInfo<HotSale>(list);
    }

    public PageInfo<BuyCar> findpage1(Integer page1,String username) {
        PageHelper.startPage(page1, 5);
        List<BuyCar> buycar;
        if(username.equals(""))
        {
             buycar= buyCarDao.queryAllb();

        }
        else{
             buycar= buyCarDao.queryAll(username);
        }
        return new PageInfo<BuyCar>(buycar);
    }

    public PageInfo<Order> findpage2(Integer page2,String usernameorder) {
        PageHelper.startPage(page2, 5);
        List<Order> order;
        if(usernameorder.equals(""))
        {
           order=orderDao.queryAllorder();
        }
        else {
            order=orderDao.queryAll(usernameorder);
        }
        return new PageInfo<Order>(order);
    }

}
