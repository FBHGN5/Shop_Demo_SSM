package com.shop.interceptor;


import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //首先进入的方法
        System.out.println("preHandle");
        String url=request.getRequestURI();
        if(url.indexOf("/shop/user")>=0)
        {
            return true;
        }
        HttpSession session = request.getSession();
        String user= (String) session.getAttribute("username");
        if(user!=null)
        {
            return true;
        }

        else{
            request.getRequestDispatcher("/WEB-INF/views/html/login.jsp").forward(request,response);
            return  false;
        }

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