package com.renhouse.service;

import com.renhouse.pojo.Order;
import com.renhouse.pojo.Page;

public interface OrderService {
    /**
     * 通过ID删除订单
     * @param id
     */
    public void deleteOrderById(Integer id);

    Page<Order> page(String username, int pageNo, int pageSize);
}
