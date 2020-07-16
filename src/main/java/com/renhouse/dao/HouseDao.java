package com.renhouse.dao;

import com.renhouse.pojo.House;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.pojo.vo.HouseStatus;
import com.renhouse.pojo.vo.TenantMaintenanceFee;

import java.util.List;

public interface HouseDao {

    /**
     * 根据房东查询房屋信息
     * @param landlord
     * @return 若返回null，说明没有这个房屋，反之亦然
     */
    public List<House> queryHouseByLandlord(String landlord);

    /**
     * 根据房东和租客查询房屋信息
     * @param landlord
     * @param tenant
     * @return 若返回null，说明房东或租客姓名错误，反之亦然
     */
    public List<House> queryHouseByLandlordAndTenant(String landlord,String tenant);

    /**
     * 添加房屋信息
     * @param house
     * @return
     */
    public int addHouse(House house);

    /**
     * 通过ID删除房屋信息
     * @param id
     * @return
     */
    public int deleteHouseById(Integer id);

    /**
     * 更新房屋信息
     * @param house
     * @return
     */
    public int updateHouse(House house);

    /**
     * 通过房屋ID查询房屋
     * @param id
     * @return
     */
    public House queryHouseById(Integer id);

    /**
     * 返回整个房屋信息
     * @return
     */
    public List<House> queryHouses();

    /**
     * 查询总共数量
     * @return
     */
    Integer queryForPageTotalCount();

    /**
     * 根据房东信息查询已经出租的房子
     * @return
     */
    public List<HouseStatus> queryHouseByLandlordAndStatus_Already(String landlord);

    public List<Bill> queryHouseByLandlordAndStatusToCreateBill_Already(String landlord);

    public Integer queryHouseByLandlordAndStatusAlreadyCount(String landlord);

    /**
     * 根据房东信息查询未出租的房子
     * @return
     */
    public List<House>queryHouseByLandlordAndStatus_Still(String landlord);


    /**
     * 查询分页信息
     * @param begin
     * @param pageSize
     * @return
     */
    List<House> queryForPageItems(int begin, int pageSize);

    public List<House> queryForPageItemsByLandlord(int begin, int pageSize, String username);

    public List<HouseStatus> queryForPageItemsByRentedStatus(int begin, int pageSize, String username);

    public Integer queryMaintenanceFeeByLandlordCount(String username, String tenant);

    public List<TenantMaintenanceFee> queryPagesForMaintenanceFeeByLandlordAndTenant(int begin, int pageSize, String username,String tenant);

}
