package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.HouseDao;
import com.renhouse.pojo.House;

import java.util.List;

public class HouseDaoImpl extends BaseDao implements HouseDao {
    @Override
    public House queryHouseByLandlord(String landlord) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ?";
        return queryForOne(House.class, sql,landlord);
    }

    @Override
    public House queryHouseByLandlordAndTenant(String landlord, String tenant) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ? and tenant = ?";
        return queryForOne(House.class, sql,landlord,tenant);
    }

    @Override
    public int saveHouse(House house) {
        String sql = "insert into t_house(`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName`) values(?,?,?,?,?,?,?,?,?,?)";
        return update(sql, house.getLandlord(),house.getTenant(),house.getMonthRent(),house.getSpace(),house.getRentalStatus(),house.getAddress(),house.getLayout(),house.getEndTime(),house.getStartTime(),house.getHouseName());
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
        String sql = "UPDATE t_house SET landlord = ?,tenant = ?,monthRent = ?,space = ?,rentalStatus = ?,address = ?,layout = ?,endTime = ?，startTime = ?,houseName =? WHERE id = ?";
        return update(sql, house.getLandlord(), house.getTenant(), house.getMonthRent(), house.getSpace(), house.getRentalStatus(), house.getAddress(), house.getLayout(), house.getEndTime(), house.getStartTime(), house.getHouseName(), house.getId());
    }

    @Override
    public House queryHouseById(Integer id) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ?";
        return queryForOne(House.class, sql,id);
    }

    @Override
    public List<House> queryHouses() {
        String sql = "select * from t_house";
        return queryForList(House.class,sql);
    }
}
