package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.OrderDao;
import com.renhouse.pojo.Order;

import java.util.List;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    @Override
    public Order queryOrderById(Integer id) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where id = ?";
        return queryForOne(Order.class,sql,id);
    }

    @Override
    public Order queryOrderByOrderNo(String orderNo) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where orderNo = ?";
        return queryForOne(Order.class,sql,orderNo);
    }

    @Override
    public Order queryOrderByOrderHouse(String orderHouse) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where orderHouse = ?";
        return queryForOne(Order.class,sql,orderHouse);
    }

    @Override
    public Order queryOrderByLandLord(String landlord) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where landlord = ?";
        return queryForOne(Order.class,sql,landlord);
    }

    @Override
    public Order queryOrderByTenantName(String tenantName) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where tenantName = ?";
        return queryForOne(Order.class,sql,tenantName);
    }

    @Override
    public Order queryOrderByOrderTime(String orderTime) {
        String sql = "SELECT id,orderNo,orderHouse,landlord,tenantName,orderTime FROM `t_order` where orderTime = ?";
        return queryForOne(Order.class,sql,orderTime);
    }

    @Override
    public int addOrder(Order order) {
        String sql = "insert into t_order(orderNo,orderHouse,landlord,tenantName,orderTime) values (?,?,?,?,?)";
        return update(sql,order.getOrderNo(),order.getOrderHouse(),order.getLandlord(),order.getTenantName(),order.getOrderTime());
    }

    @Override
    public int deleterOrderById(Integer id) {
        String sql = "DELETE FROM t_order WHERE id = ?";
        return update(sql,id);
    }

    @Override
    public int updateOrder(Order order) {
        String sql = "update t_order set orderNo = ?,orderHouse = ?,landlord = ?,tenantName = ?,orderTime = ? where id = ?";
        return update(sql,order.getOrderNo(),order.getOrderHouse(),order.getLandlord(),order.getTenantName(),order.getOrderTime(),order.getId());
    }

    @Override
    public List<Order> queryOrders() {
        String sql = "select `orderNo`,`orderHouse`,`landlord`,`tenantName`,`orderTime` from t_order";
        return queryForList(Order.class,sql);
    }
}
