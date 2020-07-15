package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.HouseDao;
import com.renhouse.pojo.House;

import java.util.List;

public class HouseDaoImpl extends BaseDao implements HouseDao {
    @Override
    public List<House> queryHouseByLandlord(String landlord) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ?";
        return queryForList(House.class, sql,landlord);
    }

    @Override
    public List<House> queryHouseByLandlordAndTenant(String landlord, String tenant) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ? and tenant = ?";
        return queryForList(House.class, sql,landlord,tenant);
    }

    @Override
    public int addHouse(House house) {
        String sql = "INSERT INTO t_house(landlord,tenant,monthRent,space,rentalStatus,address,layout,endTime,startTime,houseName) VALUES (?,?,?,?,?,?,?,?,?,?)";
        return update(sql,house.getLandlord(),house.getTenant(),house.getMonthRent(),house.getSpace(),house.getRentalStatus(),house.getAddress(),house.getLayout(),house.getEndTime(),house.getStartTime(),house.getHouseName());
    }

    @Override
    public int deleteHouseById(Integer id) {
        String sql = "DELETE FROM t_house WHERE id = ?";
        return update(sql,id);
    }

    @Override
    public int updateHouse(House house) {
        String sql = "UPDATE t_house SET landlord = ?,tenant = ?,monthRent = ?,space = ?,rentalStatus = ?,address = ?,layout = ?,startTime = ?,endTime = ?,houseName =? WHERE id = ?";
        return update(sql, house.getLandlord(), house.getTenant(), house.getMonthRent(), house.getSpace(), house.getRentalStatus(), house.getAddress(), house.getLayout(), house.getStartTime(), house.getEndTime(), house.getHouseName(), house.getId());
    }

    @Override
    public House queryHouseById(Integer id) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where id = ?";
        return queryForOne(House.class, sql,id);
    }

    @Override
    public List<House> queryHouses() {
        String sql = "select * from t_house";
        return queryForList(House.class,sql);
    }

    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(id) from t_house";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<House> queryForPageItems(int begin, int pageSize) {
        String sql = "select `id` ,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house limit ?,?";
        return queryForList(House.class,sql,begin,pageSize);
    }

    public List<House> queryForPageItemsByLandlord(int begin, int pageSize, String username) {
        String sql = "select `id` ,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house  where landlord=? limit ?,?";
        return queryForList(House.class,sql,username, begin,pageSize);
    }
}
