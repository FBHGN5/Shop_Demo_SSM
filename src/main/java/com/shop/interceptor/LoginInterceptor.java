package com.shop.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //首先进入的方法
        System.out.println("preHandle");
        return true;
        //return false表示拦截，不向下执行
        //return true表示放行
//        System.out.println(request.getServletPath());
//        HttpSession session = request.getSession();
//        User u=(User)session.getAttribute("userInfo");
//        if(u!=null){
//            return true;
//        }else{
//            return false;
//        }

    }
    //返回modelAndView之前执行

    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        System.out.println("postHandle");
    }
    //执行Handler完成执行此方法

    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

        System.out.println("afterCompletion");
    }
}