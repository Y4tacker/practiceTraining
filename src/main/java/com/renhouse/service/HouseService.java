package com.renhouse.service;

import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.pojo.vo.HouseStatus;
import com.renhouse.pojo.vo.TenantMaintenanceFee;

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

    public List<Bill> queryHouseByLandlordAndStatusToCreateBill_Already(String landlord);

    /**
     * 根据房东名字查询已经租赁的客户信息
     * @param username
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<HouseStatus> pageForRentedHouse(String username, int pageNo, int pageSize);

    /**
     * 通过房东名和租客名查询记录
     * @param username
     * @param tenant
     * @param pageNo
     * @param pageSize
     * @return
     */
    public Page<TenantMaintenanceFee> pageForMaintenanceFee(String username, String tenant,int pageNo, int pageSize);

}
