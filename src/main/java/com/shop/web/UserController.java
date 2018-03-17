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
import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.net.URLEncoder;
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
                     @RequestParam("password") String password, Model model, HttpSession session,HttpServletResponse response) {

        int result = shopService.login(username, password);
        if (result == -1 || result == 0) {
            session.setAttribute("username", username);
            //存sessionId的cookie
            Cookie cookieSId = new Cookie("JSESSIONID",session.getId());
            cookieSId.setMaxAge(60*60);
            cookieSId.setPath("/");
            response.addCookie(cookieSId);
        }
        System.out.println("用户状态：0登录成功,1账户错误,2密码错误,3封号,-1管理员。 现在状态:" + result);
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
    public String reg(Model model) {
        return "reg";
    }

    /*
    ajax请求
     */
    @RequestMapping(value = "/reg", method = RequestMethod.POST)
    @ResponseBody
    public Reg reg(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
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
    public int update(Model model, @RequestParam("username") String username, @RequestParam("old") String old,
                      @RequestParam("password") String password) {
        Mod mod = shopService.update(username, old, password);
        System.out.println("old=" + old + "password=" + password);
        if (mod.getResult().equals("success")) {
            return 0;
        } else if (mod.getResult().equals("same")) {
            return 2;
        } else {
            return 1;
        }

    }

    @RequestMapping(value = "/wupin", method = RequestMethod.GET)
    public String wupin(Model model, @RequestParam("id") int id) {
        HotSale hotSale = shopService.getById(id);
        if (hotSale == null) {
            return "forward:/shop/shouye";
        }
        model.addAttribute("hotsale", hotSale);
        return "wupin";
    }

    /*
    购物ajax请求
     */
    @RequestMapping(value = "/buy", method = RequestMethod.POST)
    @ResponseBody
    public int buy(Model model, @RequestParam("img") String img, @RequestParam("name") String name,
                   @RequestParam("price") int price, @RequestParam("username") String username
            , @RequestParam("number") int number, @RequestParam("id") int id, @RequestParam("kucun") int kucun) {
        int i = shopService.buy(img, name, price, username, number, id, kucun);
        System.out.println("购买成功");
        return i;
    }

    @RequestMapping(value = "/buycar", method = RequestMethod.POST)
    public String buycar(Model model,  HttpSession session) {
        String username= (String) session.getAttribute("username");
        if (session.getAttribute("username") == null) {
            return "login";
        }
        List<BuyCar> list = shopService.buycar(username);
        model.addAttribute("list", list);
        return "buycar";
    }

    /*
    购物车ajax请求a标签的删除
     */
    @RequestMapping(value = "/del", method = RequestMethod.POST)
    @ResponseBody
    public void buycar(Model model, @RequestParam("id") int id) {
//       int i =buyCarDao.delete(id);
        shopService.del(id);
//        shopService.increaseNumber(name,num);
    }

    /*
    多选删除
     */
    @RequestMapping(value = "/delcheck", method = RequestMethod.POST)
    public String delBuycar(Model model, @RequestParam("check") int[] id, @RequestParam("number") int[] number,
                          @RequestParam("username") String username1,
                          @RequestParam("name")String name) {
        shopService.deletecheckbox(id);
        return "forward:/shop/buycar";
 }

    /*
    购物车结算生成订单
     */
    @RequestMapping(value = "/clearing", method = RequestMethod.POST)
    public String clearing(Model model,
                         @RequestParam("number") int[] number,
                         @RequestParam("username") String username1,
                         @RequestParam("check") int[] checkid) {
      shopService.insertOrder(number,username1, checkid);
      return "forward:/shop/buycar";
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
    @RequestMapping(value = "/admin", method = RequestMethod.GET)

    public String admin(Model model, @RequestParam(value = "page", defaultValue = "1", required = true) Integer page,
                        @RequestParam(value = "page1", defaultValue = "1", required = true) Integer page1,
                        @RequestParam(value = "page2", defaultValue = "1", required = true) Integer page2,
                        @RequestParam(value = "username", defaultValue = "", required = true) String username,
                        @RequestParam(value = "usernameorder", defaultValue = "", required = true) String usernameorder,
                        HttpSession session) {
        String name=(String)session.getAttribute("username");
          User user1=shopService.queryByUsername(name);
          logger.info("user{}",user1);
        if (session.getAttribute("username")==null) {

            return "redirect:/shop/login";
        }
        else if(user1.getState()==0)
        {
            logger.info("user{}",user1);
            return "forward:/shop/shouye";
        }
        else {
/*
热卖商品分页
 */
            PageInfo<HotSale> p = shopService.findpage(page);
            model.addAttribute("page", p);

/*
用户分页
 */
            List<User> user = shopService.getAll();
            // PageInfo<User> page1=new PageInfo<User>(user);
            model.addAttribute("user", user);
/*
购物车分页
 */
                PageInfo<BuyCar> page3 = shopService.findpage1(page1,username);
                model.addAttribute("usernames", username);
                model.addAttribute("page3", page3);
          /*
             订单分页
              */
                PageInfo<Order> page4 = shopService.findpage2(page2,usernameorder);
                model.addAttribute("usernameorder", usernameorder);
                model.addAttribute("page4", page4);
                return "admin";
        }

    }

    /*
    封号--解封
     */
    @RequestMapping(value = "/userstate", method = RequestMethod.POST)
    @ResponseBody
    public void Fh(Model model, @RequestParam("username") String username) {
        shopService.update(username);
    }

    @RequestMapping(value = "/userstate2", method = RequestMethod.POST)
    @ResponseBody
    public void JF(Model model, @RequestParam("username") String username) {
        shopService.update2(username);
    }
    /*
    管理员删除热卖商品
     */
    @RequestMapping(value = "/delhot",method = RequestMethod.GET)

    public void delhot(@RequestParam("hotid")int hotid)
    {   shopService.hotdelById(hotid);

    }


    /*
    sale
     */
    @RequestMapping(value = "/sale",method = RequestMethod.GET)
    public  String sale(HttpSession session)
    {
        if(session.getAttribute("username")==null)
        {
            return "forward:/shop/login";
        }
        else{
            return "sale";
        }
    }

    @RequestMapping(value = "/ins", method = RequestMethod.POST)

    public String uploadhotsale(@RequestParam("username")String username,
                         @RequestParam("name")String name,
                         @RequestParam("price")int price,
                         @RequestParam("number")int number,

                         @RequestParam("file") MultipartFile[] file,
                         HttpServletRequest request) throws IOException {
     //   String path="F:\\Web\\SSM框架学习\\Shop_Demo\\src\\main\\webapp\\resources\\img";

        String path =  request.getSession().getServletContext().getRealPath("/resources/img");

        String[] imgname=new String[file.length];
         for (int i = 0; i < file.length; i++) {
             String fileName= file[i].getOriginalFilename();
            System.out.println("fileName---------->" + file[i].getOriginalFilename());
            File dir = new File(path, fileName);
            if (!dir.exists()) {
                dir.mkdirs();
                file[i].transferTo(dir);
            }
            else{
                System.out.println("文件名相同的是第"+(i+1)+"个文件");
            }
            //MultipartFile自带的解析方法
           imgname[i]=fileName;
        }

       shopService.sale(username,name,price,
               "/resources/img/"+imgname[0],number,
              "/resources/img/"+imgname[1],
              "/resources/img/"+imgname[2],"/resources/img/"+imgname[3]);
        System.out.println("上传成功!"+path+"test");
   return "redirect:/shop/shouye";
    }
    /*
    用户个人订单页面
     */
    @RequestMapping(value = "/order",method = RequestMethod.GET)
    public String order(Model model,@RequestParam(value = "name",defaultValue = "",required = true)String name, HttpSession session)
    {  if(session.getAttribute("username")==null)
    {
        return "redirect:/shop/login";
    }
        String username= (String) session.getAttribute("username");

        List<Order> order=shopService.order2(username,name);
         model.addAttribute("name",name);
         model.addAttribute("order",order);
        return "order";
    }

/*
删除订单
 */
@RequestMapping(value = "/delorder",method = RequestMethod.GET)
public String delorder(Model model,@RequestParam("id") int id)
{   shopService.deleteOrder(id);
    return "redirect:/shop/order";
}

    /*
文件上传下载大全
 */
    @RequestMapping(value = "/upload", method = RequestMethod.GET)
    public String upload() {
        return "upload";
    }


    @RequestMapping(value = "/uploadnew", method = RequestMethod.POST)
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile[] file, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("../../src/main/webapp/resources/uploadfile");
        for (int i = 0; i < file.length; i++) {
            String fileName = file[i].getOriginalFilename();
            System.out.println("fileName---------->" + file[i].getOriginalFilename());
            File dir = new File(path, fileName);
            if (!dir.exists()) {
                dir.mkdirs();
                file[i].transferTo(dir);
            }

            //MultipartFile自带的解析方法
         }
        System.out.println("上传成功!"+path);
        return "中文";
    }
    @RequestMapping("/down")
    public void down(HttpServletRequest request,HttpServletResponse response) throws Exception{
        //模拟文件，myfile.txt为需要下载的文件
        String fileName = request.getSession().getServletContext().getRealPath("../../src/main/webapp/resources/uploadfile")+"/a.jpg";
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(fileName)));
        //假如以中文名下载的话
        String filename = "下载文件.jpg";
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }
}