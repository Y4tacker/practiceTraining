package com.renhouse.service;

import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.HouseStatus;

import java.util.List;

public interface HouseService {
    public void addHouse(House house);

    public void deleteHouseById(Integer id);

    public void updateHouse(House book);

    public House queryHouseById(Integer id);

    public List<House> queryHouses();

    Page<House> page(String username, int pageNo, int pageSize);

    /**
     * 根据房东信息查询已经出租的房子
     * @return
     */
    public List<HouseStatus> queryHouseByLandlordAndStatus_Already(String landlord);

    public Page<HouseStatus> pageForRentedHouse(String username, int pageNo, int pageSize);
}
