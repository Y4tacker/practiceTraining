package com.renhouse.dao;

import com.renhouse.pojo.House;

public interface HouseDao {

    /**
     * 根据房东查询房屋信息
     * @param landload
     * @return 若返回null，说明没有这个房屋，反之亦然
     */
    public House queryHouseByLandload(String landload);

    /**
     * 根据房东和租客查询房屋信息
     * @param landload
     * @param tenant
     * @return 若返回null，说明房东或租客姓名错误，反之亦然
     */
    public House queryHouseByLandloadAndTenant(String landload,String tenant);

    /**
     * 保存房屋信息
     * @param house
     * @return
     */
    public int saveHouse(House house);

}
