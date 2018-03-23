package com.shop.web;

import com.shop.message.GetMessageCode;
import com.shop.service.util.ReturnContant;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/total")
public class CodeController {

    @Autowired
    private ReturnContant returnContant;
    @RequestMapping(value="/sendSMS",method= RequestMethod.POST)
    public @ResponseBody ReturnContant sendSMS(HttpServletRequest request,String phone) throws JSONException {
        //根据获取到的手机号发送验证码
        String code= GetMessageCode.getCode(phone);
        returnContant.setStatus(1);
        returnContant.setData(code);
        return returnContant;
    }

}