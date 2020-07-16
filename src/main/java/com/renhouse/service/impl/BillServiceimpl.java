package com.renhouse.service.impl;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.BillService;

import java.util.HashMap;
import java.util.List;

/**
 * @ClassName BillServiceimpl
 * @Description 账单计算服务实现
 * @Author 1TreeForest
 * @Date 2020/7/16 19:19
 * @Version 1.0
 */
public class BillServiceimpl implements BillService {
    private HouseDao houseDao = new HouseDaoImpl();

    @Override
    public HashMap<String, Integer> calculate(String startDate, int interval) {
        return null;
    }

    @Override
    public List<Bill> queryHouseByLandlordAndStatusToCreateBill_Already(String landlord) {
        return houseDao.queryHouseByLandlordAndStatusToCreateBill_Already(landlord);
    }
}
