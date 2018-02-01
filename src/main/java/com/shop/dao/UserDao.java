package com.shop.dao;

import com.shop.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    /*
    2个变量+上@Param
     */
    User selusername(String username);
    int insertUser(@Param("username") String username, @Param("password") String password);
    int updateUser(@Param("username") String username,@Param("password") String password);
    List<User> queryAll();
}
