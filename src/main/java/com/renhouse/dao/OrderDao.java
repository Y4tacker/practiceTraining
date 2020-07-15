package com.renhouse.dao;

import com.renhouse.pojo.House;
import com.renhouse.pojo.Order;
import java.util.List;

public interface OrderDao {
    public Order queryOrderById(Integer id);

    public Order queryOrderByOrderNo(String orderNo);

    public Order queryOrderByOrderHouse(String orderHouse);

    public List<Order> queryOrderByLandLord(String landlord);

    public List<Order> queryOrderByTenantName(String tenantName);

    public List<Order> queryOrderByOrderTime(String orderTime);

    public int addOrder(Order order);

    public int deleterOrderById(Integer id);

    public int updateOrder(Order order);

    /**
     * 返回整个订单信息
     * @return
     */
    public List<Order> queryOrders();

    /**
     * 查询总共数量
     * @return
     */
    Integer queryForPageTotalCount();

    /**
     * 查询分页信息
     * @param begin
     * @param pageSize
     * @return
     */
    List<Order> queryForPageItems(int begin, int pageSize);

    public List<Order> queryForPageItemsByLandlord(int begin, int pageSize, String username);

















}
