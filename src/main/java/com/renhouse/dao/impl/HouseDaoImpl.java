package com.renhouse.dao.impl;

import com.renhouse.dao.BaseDao;
import com.renhouse.dao.HouseDao;
import com.renhouse.pojo.House;

public class HouseDaoImpl extends BaseDao implements HouseDao {
    @Override
    public House queryHouseByLandload(String landload) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ?";
        return queryForOne(House.class, sql,landload);
    }

    @Override
    public House queryHouseByLandloadAndTenant(String landload, String tenant) {
        String sql = "select `id`,`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName` from t_house where landlord = ? and tenant = ?";
        return queryForOne(House.class, sql,landload,tenant);
    }

    @Override
    public int saveHouse(House house) {
        String sql = "insert into t_house(`landlord`,`tenant`,`monthRent`,`space`,`rentalStatus`,`address`,`layout`,`endTime`,`startTime`,`houseName`) values(?,?,?,?,?,?,?,?,?,?)";
        return update(sql, house.getLandlord(),house.getTenant(),house.getMonthRent(),house.getSpace(),house.getRentalStatus(),house.getAddress(),house.getLayout(),house.getEndTime(),house.getStartTime(),house.getHouseName());
    }
}
