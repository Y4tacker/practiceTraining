package com.renhouse.service.impl;

import com.renhouse.dao.HouseDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.pojo.House;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.BillService;
import com.renhouse.servlet.UtilsServlet;
import com.renhouse.utils.TimeUtils;

import java.security.Key;
import java.sql.Time;
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
    public HashMap<String, Integer> calculateBill(String landlord, String startDate, String endDate) {
        List<Bill> bill = houseDao.queryHouseByLandlordAndStatusToCreateBill_Already(landlord);
        HashMap<String, Integer> res = new HashMap<String, Integer>();

        startDate += "-1";
        endDate += "-1";

        if (startDate.compareTo(endDate) > 0) { //起始日期大于结束日期则返回错误
            return null;
        }

        int size = bill.size();

        for (int i = 0; i < size; i++) {
            Bill item = bill.get(i);
            String st = item.getStartTime();
            String et = item.getEndTime();
            if (st.compareTo(startDate) < 0) { //查询的开始日期比租房的开始日期晚
                st = startDate;
            }
            if (et.compareTo(endDate) > 0) { //查询的终止日期比租房的终止日期早
                et = endDate;
            }

            int intervalDays = (int) TimeUtils.getIntervalDays(st, et);
            int intervalMonths = intervalDays / 30;

            if (intervalDays % 30 != 0) {
                intervalMonths++;
            }


            String regex = "-";// 按照-来进行切割
            String[] date1 = st.split(regex);
            int year = Integer.parseInt(date1[0]);
            int month = Integer.parseInt(date1[1]);

            while (intervalMonths-->0) {
                int sum = 0;
                sum += item.getMonthRent();
                if (item.getMaintenanceFee() != null) {
                    sum -= item.getMaintenanceFee();
                }
                String key = year + "-" + month;
                if(sum!=0) {
                    if (res.containsKey(key)) {
                        res.put(key, res.get(key) + sum);
                    } else {
                        res.put(key, sum);
                    }
                }
                month++;
                if(month==13) {
                    month = 1;
                    year++;
                }
//                System.out.println(intervalMonths);
//                System.out.println(key);
            }
        }

        return res;
    }
}

