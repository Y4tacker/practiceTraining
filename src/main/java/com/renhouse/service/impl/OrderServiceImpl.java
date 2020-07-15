package com.renhouse.service.impl;

import com.renhouse.dao.OrderDao;
import com.renhouse.dao.impl.OrderDaoImpl;
import com.renhouse.service.OrderService;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();

    @Override
    public void deleteOrderById(Integer id) {
        orderDao.deleterOrderById(id);
    }
}
