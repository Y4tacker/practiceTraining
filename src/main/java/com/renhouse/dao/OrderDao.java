package com.renhouse.dao;

import com.renhouse.pojo.Order;
import java.util.List;

public interface OrderDao {
    public Order queryOrderById(Integer id);

    public Order queryOrderByOrderNo(String orderNo);

    public Order queryOrderByOrderHouse(String orderHouse);

    public Order queryOrderByLandLord(String landlord);

    public Order queryOrderByTenantName(String tenantName);

    public Order queryOrderByOrderTime(String orderTime);

    public int addOrder(Order order);

    public int deleterOrderById(Integer id);

    public int updateOrder(Order order);

    public List<Order> queryOrders();

//    Integer queryForPageTotalCount();

//    List<Order> queryForPageItems(int begin, int pageSize);

















}
