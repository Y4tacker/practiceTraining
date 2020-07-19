package com.renhouse.junit.service;

import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.impl.BillServiceImpl;
import com.renhouse.utils.TimeUtils;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public class BillServiceImplTest {

    @org.junit.Test
    public void calculateBill() {
        BillServiceImpl test = new BillServiceImpl();
        String currentDateStr = TimeUtils.getCurrentDateStr();
        String[] split = currentDateStr.split("-");
        String curYear = split[0];
        String startDate = curYear+"-01";
        String endDate = curYear + "-12";
        List<Bill> t1 = test.calculateBill("admin", startDate, endDate);
        if (split[1].substring(0,1).equals("0")){
            String month = split[1].substring(1,2);
            for (int i=0;i<t1.size();i++){
                String temp = t1.get(i).getDate().split("-")[1];
                if (month.equals(temp)){
                    System.out.println(t1.get(i).getTotal());
                }
            }
        }else {
            String month = split[1];
            for (int i=0;i<t1.size();i++){
                String temp = t1.get(i).getDate().split("-")[1];
                if (month.equals(temp)){
                    System.out.println(t1.get(i).getTotal());
                }
            }
        }
    }

    @Test
    public void pageForBill() {
        BillServiceImpl test = new BillServiceImpl();
        List<Bill> t1 = test.calculateBill("admin", "2020-01", "2020-10");
        Page<Bill> admin = test.pageForBill("admin", 0, 15, t1);
        System.out.println(admin);
    }
}