package com.shop.web;

import com.shop.dao.BuyCarDao;
import com.shop.dao.UserDao;
import com.shop.dto.Mod;
import com.shop.dto.Reg;
import com.shop.dto.Statenow;
import com.shop.entity.BuyCar;
import com.shop.entity.HotSale;
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
    private UserDao userDao;
    @Autowired
    private BuyCarDao buyCarDao;

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    @ResponseBody
    public int check(@RequestParam("username") String username,
                     @RequestParam("password") String password, Model model, HttpSession session) {
        Statenow statenow = shopService.login(username, password);
        int result;

        if (statenow.getState().equals("0")) {
            session.setAttribute("username", username);
            result = 0;

        }
        /*
        没注册
         */
        else if (statenow.getState().equals("1")) {
            result = 1;
        }
        /*
        错误
         */
        else {
            result = 2;
        }
        model.addAttribute("statenow", statenow);

        System.out.println("用户状态：0登录成功，1账户错误，2密码错误" + result);
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

    /*
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
        } else {
            return 1;
        }

    }

    @RequestMapping(value = "/wupin", method = RequestMethod.GET)
    public String Wupin(Model model, @RequestParam("id") int id) {
        HotSale hotSale = shopService.getById(id);
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
            , @RequestParam("id") int id, @RequestParam("number") int number) {
        int i = shopService.buy(img, name, price, username, id, number,number);
        System.out.println("购买成功");
        return i;
    }

    /*
    购物车ajax请求
     */
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

    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public void Buycar(Model model,@RequestParam("id")int id) {
       int i =buyCarDao.delete(id);
     }
}
