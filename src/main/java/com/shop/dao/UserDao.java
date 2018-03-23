package com.shop.dao;

import com.shop.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    /*
    2个变量+上@Param
     */
    User selusername(String username);
    User queryByPhone(String username);
    int insertUser(@Param("username") String username, @Param("password") String password,
                   @Param("phone") String phone);
    int updateUser(@Param("username") String username,@Param("password") String password);
    int updateUser2(@Param("username") String username,@Param("password") String password);
    int update(String username);
    int update2(String username);
    List<User> queryAll();
}
