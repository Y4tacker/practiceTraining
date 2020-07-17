package com.renhouse.service.impl;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.BillService;
import com.renhouse.utils.TimeUtils;

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
    public HashMap<Integer, HashMap<Integer, Integer>> calculateBill(String landlord, String startDate, String endDate) {
        List<Bill> bill = houseDao.queryHouseByLandlordAndStatusToCreateBill_Already(landlord);
        HashMap<Integer, HashMap<Integer, Integer>> res;
        HashMap<Integer, Integer> yearRes;

        if (startDate.compareTo(endDate) > 0) { //起始日期大于结束日期则返回错误
            return null;
        }

        String regex = "-";// 按照-来进行切割

        String[] date = startDate.split(regex);
        int year = Integer.parseInt(date[0]);
        int month = Integer.parseInt(date[1]);
        int interval = TimeUtils.getInterval(startDate, endDate);
        int size = bill.size();

        for (int i = 0; i < interval; i++) {
            int sum = 0;
            for (int j = 0; j < size; j++) {
                Bill billItem = bill.get(j);
                if (billItem.getEnd().compareTo(endDate)<0){ //条目结束日期早于用户选择的开始日期

                }
            }
        }
        return null;
    }
}
