package com.renhouse.service.impl;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.House;
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
        HashMap<Integer, HashMap<Integer, Integer>> res = new HashMap<Integer, HashMap<Integer, Integer>>();

        if (startDate.compareTo(endDate) > 0) { //起始日期大于结束日期则返回错误
            return null;
        }

        String regex = "-";// 按照-来进行切割

        String[] date = startDate.split(regex);
        int year = Integer.parseInt(date[0]);
        int month = Integer.parseInt(date[1]);
        int interval = TimeUtils.getInterval(startDate, endDate);
        int size = bill.size();
        String dateTemp = startDate;

        for (int i = 0; i < interval; i++) {
            int sum = 0;
            dateTemp = TimeUtils.getFormatDateAdd(dateTemp, 30);
            for (int j = 0; j < size; j++) {
                Bill billItem = bill.get(j);
                if (billItem.getStart().compareTo(dateTemp) > 0 && billItem.getEnd().compareTo(dateTemp) > 0) { //开始日期比endDate小，且结束日期比temp日期大
                    sum += billItem.getMonthlyRent() - billItem.getMaintenance();
                }
            }
            if (sum != 0) { //剔除所有账单为0的月
                res.put(year, new HashMap<Integer, Integer>(month + i, sum));
            }
            if (month + i == 12) {
                month = 1;
                year++;
            }
        }
        return res;
    }
}
