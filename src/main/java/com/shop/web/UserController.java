package com.shop.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.dao.BuyCarDao;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

import java.util.List;


@Controller
@RequestMapping("/shop")
public class UserController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private ShopService shopService;
   @Autowired
    private BuyCarDao buyCarDao;
/*
登陆验证
 */
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    @ResponseBody
    public int check(@RequestParam("username") String username,
                     @RequestParam("password") String password, Model model, HttpSession session) {

      int result=shopService.login(username,password);
      if(result==-1||result==0)
      {
          session.setAttribute("username",username);
      }
      System.out.println("用户状态：0登录成功，1账户错误，2密码错误,3封号.现在状态:" + result);
        return result;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, HttpSession session) {
        session.invalidate();
        return "login";
    }

    /*
    首页
     */
    @RequestMapping(value = "/shouye", method = RequestMethod.GET)
    public String shouye(Model model, HttpSession session) {
        String but;
        List<HotSale> list = shopService.getlist();

        model.addAttribute("list", list);
        if (session.getAttribute("username") == null) {
            but = "登录";
        } else {
            but = "退出";
        }
        model.addAttribute("but", but);
        return "shouye";
    }

    /*
    注册
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String Reg(Model model) {
        return "reg";
    }

    /*
    ajax请求
     */
    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    @ResponseBody
    public Reg Reg(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
        Reg reg = shopService.register(username, password);
        String result;
        result = reg.getResult();
        System.out.println(result);
        return new Reg(result);

    }

    /*修改密码
    ajax请求
     */
    @RequestMapping(value = "/mod", method = RequestMethod.POST)
    @ResponseBody
    public int Update(Model model, @RequestParam("username") String username, @RequestParam("old") String old,
                      @RequestParam("password") String password) {
        Mod mod = shopService.update(username, old, password);
        System.out.println("old=" + old + "password=" + password);
        if (mod.getResult().equals("success")) {
            return 0;
        }
        else if(mod.getResult().equals("same"))
        {
            return 2;
        }
        else {
            return 1;
        }

    }

    @RequestMapping(value = "/wupin", method = RequestMethod.GET)
    public String Wupin(Model model, @RequestParam("id") int id) {
        HotSale hotSale = shopService.getById(id);
        if(hotSale==null)
        {
            return "redirect:/shop/shouye";
        }
        model.addAttribute("hotsale", hotSale);
        return "wupin";
    }

    /*
    购物ajax请求
     */
    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    @ResponseBody
    public int Buy(Model model, @RequestParam("img") String img, @RequestParam("name") String name,
                   @RequestParam("price") int price, @RequestParam("username") String username
            , @RequestParam("number") int number,@RequestParam("id") int id,@RequestParam("kucun") int kucun) {
        int i = shopService.buy(img,name,price, username,number,id,kucun);
        System.out.println("购买成功");
        return i;
    }

  @RequestMapping(value = "/buycar", method = RequestMethod.POST)

    public String Buycar(Model model,@RequestParam("username")String username,HttpSession session) {
      if(session.getAttribute("username")==null)
      {
          return "login";
      }
        List<BuyCar> list =shopService.buycar(username);
        model.addAttribute("list", list);
        return "buycar";
    }

    /*
    购物车ajax请求a标签的删除
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public void Buycar(Model model,@RequestParam("id")int id) {
//       int i =buyCarDao.delete(id);
        shopService.del(id);
//        shopService.increaseNumber(name,num);
     }

   /*
   多选删除
    */
   @RequestMapping(value = "/delcheck", method = RequestMethod.POST)
    public void DelBuycar(Model model, @RequestParam("check")int[] id){
                   shopService.deletecheckbox(id);
//             shopService.increaseNumber(name,num);


    }
    /*
    购物车结算生成订单
     */
    @RequestMapping(value = "/clearing",method = RequestMethod.POST)
    public void Clearing(Model model,
                         @RequestParam("id")int[] id,
                         @RequestParam("number")int[] number,
                         @RequestParam("username")String username1,
                         @RequestParam("check")int[] checkid){
       for (int i=0;i<id.length;i++)
     {
         int update=buyCarDao.update(number[i],id[i]);
     }

       shopService.insertOrder(username1,checkid);
      System.out.println("成功");
/*
在此创建一张确定下单的订单表
 */
    }
    /*管理员
    分页1
     */
    /*返回的数据不是html标签的页面，而是其他某种格式的数据时（如json、xml等）使用；
而以前说异步请求的controller方法都要有@responseBody注解，
是因为那时用的异步都设定了返回数据类型为json，所以必须用@responseBody注解。
而有些异步请求返回的jsp，或者是html类型的数据（load()方法请求返回的内容就不是json数据），
此时controller映射的方法上就不能适应@responseBody注解了，否则会映射不到请求路径！
     */
    @RequestMapping(value = "/admin",method = RequestMethod.GET)

    public String Admin(Model model,@RequestParam(value="page",defaultValue="1",required =true)Integer page,
                        @RequestParam(value="page1",defaultValue="1",required =true)Integer page1,
                        @RequestParam(value="page2",defaultValue="1",required =true)Integer page2,
                        @RequestParam(value="username",defaultValue ="",required = true)String username,
                        @RequestParam(value="usernameorder",defaultValue ="",required = true)String usernameorder,
                        HttpSession session){
        String s= (String) session.getAttribute("username");
        System.out.println(username+"=1111111username");
        if(!s.equals("123456"))
        {   System.out.println(s);
            session.invalidate();
            return "login";
        }
        else{
/*
热卖商品分页
 */

            PageHelper.startPage(page,4);
            List<HotSale> hotSale=shopService.getlist();
            PageInfo<HotSale> p=new PageInfo<HotSale>(hotSale);
            model.addAttribute("page",p);
            model.addAttribute("hotsale",hotSale);
/*
用户分页
 */
              List<User> user=shopService.getAll();
           // PageInfo<User> page1=new PageInfo<User>(user);
            model.addAttribute("user",user);
/*
购物车分页
 */
            PageHelper.startPage(page1,5);

            if(username.equals(""))
            {
                List<BuyCar> buycar=shopService.getAllBuyCar();
                PageInfo<BuyCar> page3=new PageInfo<BuyCar>(buycar);
                model.addAttribute("page3",page3);
                model.addAttribute("buycar",buycar);
            }
             else{
                List<BuyCar> buycar=shopService.buycar(username);
                PageInfo<BuyCar> page3=new PageInfo<BuyCar>(buycar);
                model.addAttribute("usernames",username);
                model.addAttribute("page3",page3);
                model.addAttribute("buycar",buycar);
            }


             /*
             订单分页
              */
             PageHelper.startPage(page2,6);
             if(usernameorder.equals(""))
             {
                 List<Order> order=shopService.getAllOrderlist();
                 PageInfo<Order> page4=new PageInfo<Order>(order);
                 model.addAttribute("page4",page4);
                 model.addAttribute("order",order);
             }
            else{
                 List<Order> order=shopService.order(usernameorder);
                 PageInfo<Order> page4=new PageInfo<Order>(order);
                 model.addAttribute("usernameorder",usernameorder);
                 model.addAttribute("page4",page4);
                 model.addAttribute("order",order);
             }
              return "admin";
        }

}
/*
封号--解封
 */
@RequestMapping(value = "/userstate",method = RequestMethod.POST)
@ResponseBody
    public void Fh(Model model,@RequestParam("username")String username){
        shopService.update(username);
}

@RequestMapping(value = "/userstate2",method = RequestMethod.POST)
@ResponseBody
    public void JF(Model model,@RequestParam("username")String username){
        shopService.update2(username);
    }

}
