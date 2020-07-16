package com.renhouse.junit;

import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.HouseStatus;
import com.renhouse.service.HouseService;
import com.renhouse.service.impl.HouseServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.Assert.*;

public class HouseServiceImplTest {
    HouseService houseService = new HouseServiceImpl();
    @Test
    public void addHouse() {
        House house = new House(null,"admin","xxy",new BigDecimal(500),50,"未租赁","四川省成都市人民南路40号","三室一厅",
                null,null,"夏哥花园",new BigDecimal(100));
        houseService.addHouse(house);
    }

    @Test
    public void deleteHouseById() {
        houseService.deleteHouseById(43);
    }

    @Test
    public void updateHouse() {
    }

    @Test
    public void queryHouseById() {
        System.out.println(houseService.queryHouseById(5));
    }

    @Test
    public void queryHouses() {
    }

    @Test
    public void page() {
    }


    @Test
    public void pageForRentedHouse() {
        Page<HouseStatus> admin = houseService.pageForRentedHouse("admin", 1, 15);
        List<HouseStatus> items = admin.getItems();
        for (HouseStatus houseStatus: items) {
            System.out.println(houseStatus);
        }
    }
}