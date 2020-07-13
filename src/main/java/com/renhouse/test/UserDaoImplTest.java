package com.renhouse.test;

import com.renhouse.dao.UserDao;
import com.renhouse.dao.impl.UserDaoImpl;
import com.renhouse.pojo.User;
import org.junit.Test;

public class UserDaoImplTest {

    @Test
    public void queryUserByUsername() {
        UserDao userDao = new UserDaoImpl();
        if (userDao.queryUserByUsername("admin") == null){
            System.out.println("用户名可用");
        }else {
            System.out.println("用户已存在");
        }
    }

    @Test
    public void queryUserByUsernameAndPassword() {
        UserDao userDao = new UserDaoImpl();
        if (userDao.queryUserByUsernameAndPassword("admin","admin") == null){
            System.out.println("用户名或者密码错误，登陆失败");
        }else {
            System.out.println("登陆成功");
        }
    }


    @Test
    public void saveUser() {
        User user = new User(null,"admin3","123456","6666@qq.com");
        UserDao userDao = new UserDaoImpl();
        if (userDao.saveUser(user) == -1){
            System.out.println("用户已存在");
        }else {
            System.out.println("保存成功");
        }
    }
}