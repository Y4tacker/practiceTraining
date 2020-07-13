package com.renhouse.dao.impl;

import com.renhouse.dao.UserDao;
import com.renhouse.pojo.User;

public class UserDaoImpl extends BaseDao implements UserDao {
    @Override
    public User queryUserByUsername(String username) {
        String sql = "select `id`,`username`,`password`,`phone`,`income` from t_user where username = ?";
        return queryForOne(User.class, sql, username);
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "select `id`,`username`,`password`,`phone`,`income` from t_user where username = ? and password = ?";
        return queryForOne(User.class, sql, username,password);
    }

    @Override
    public int saveUser(User user) {
        String sql = "insert into t_user(`username`,`password`,`phone`,`income`) values(?,?,?,?)";
        return update(sql, user.getUsername(),user.getPassword(),user.getPhone(),user.getIncome());
    }
}
