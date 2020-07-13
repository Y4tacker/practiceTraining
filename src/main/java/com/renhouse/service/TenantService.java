package com.renhouse.service;

import com.renhouse.pojo.User;

public interface TenantService {
    /**
     * 通过房东名字查找租客
     * @return  user
     */
    public User[] queryTenantNameByUser();
}
