package com.renhouse.service;

import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;

import java.util.List;

public interface HouseService {
    public void addHouse(House house);

    public void deleteHouseById(Integer id);

    public void updateHouse(House book);

    public House queryHouseById(Integer id);

    public List<House> queryHouses();

    Page<House> page(int pageNo, int pageSize);
}
