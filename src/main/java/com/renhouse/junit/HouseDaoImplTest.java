package com.renhouse.junit;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.House;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;
import java.util.Random;

import static org.junit.Assert.*;

public class HouseDaoImplTest {

    @Test
    public void queryHouseByLandlord() {
    }

    @Test
    public void queryHouseByLandlordAndTenant() {
    }

    @Test
    public void saveHouse() {
    }

    @Test
    public void addHouse() {
        HouseDao houseDao = new HouseDaoImpl();
        String landlord = "admin";
        for (int i = 21; i <= 40; i++) {
            String address = "四川省成都市人民南路" + i + "号";
            House house = new House(null,landlord,"xxy",new BigDecimal(500),50,0,address,"三室一厅",
                    null,null,"夏哥花园");
            houseDao.addHouse(house);
        }
    }

    @Test
    public void deleteHouseById() {
        HouseDao houseDao = new HouseDaoImpl();
        //返回1说明成功
        System.out.println(houseDao.deleteHouseById(99));
    }

    @Test
    public void updateHouse() {
        HouseDao houseDao = new HouseDaoImpl();
        String landlord = "admin";
        House house = new House(43,landlord,"xxy",new BigDecimal(500),50,0,"四川省成都市人民南路39号"
                ,"三室一厅",
                "2020-7-15","2020-7-17","夏哥花园");
        houseDao.updateHouse(house);
    }

    @Test
    public void queryHouseById() {
        HouseDao houseDao = new HouseDaoImpl();
        System.out.println(houseDao.queryHouseById(5));
    }

    @Test
    public void queryHouses() {
        HouseDao houseDao = new HouseDaoImpl();
        List<House> houses = houseDao.queryHouses();
        for (House house:houses) {
            System.out.println(house);
        }
    }

    @Test
    public void queryForPageTotalCount() {
        HouseDao houseDao = new HouseDaoImpl();
        System.out.println(houseDao.queryForPageTotalCount());
    }

    @Test
    public void queryForPageItems() {
        HouseDao houseDao = new HouseDaoImpl();
        List<House> houses = houseDao.queryForPageItems(0, 10);
        for (House house: houses) {
            System.out.println(house);
        }
    }
}