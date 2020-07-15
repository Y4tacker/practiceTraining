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
        return 0;
    }

    @Override
    public int deleteHouseById(Integer id) {
        return 0;
    }

    @Override
    public int updateHouse(House house) {
        return 0;
    }

    @Override
    public House queryHouseById(Integer id) {
        return null;
    }

    @Override
    public List<House> queryHouses() {
        return null;
    }
}
