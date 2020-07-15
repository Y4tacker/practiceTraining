package com.renhouse.dao;

import com.renhouse.pojo.House;

import java.util.List;

public interface HouseDao {

    /**
     * 根据房东查询房屋信息
     * @param landlord
     * @return 若返回null，说明没有这个房屋，反之亦然
     */
    public House queryHouseByLandlord(String landlord);

    /**
     * 根据房东和租客查询房屋信息
     * @param landlord
     * @param tenant
     * @return 若返回null，说明房东或租客姓名错误，反之亦然
     */
    public House queryHouseByLandlordAndTenant(String landlord,String tenant);

    /**
     * 保存房屋信息
     * @param house
     * @return
     */
    public int saveHouse(House house);

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

    Integer queryForPageTotalCount();

    List<House> queryForPageItems(int begin, int pageSize);


}
