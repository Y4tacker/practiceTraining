package com.renhouse.junit.service;

import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.impl.BillServiceImpl;
import org.junit.Test;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public class BillServiceImplTest {

    @org.junit.Test
    public void calculateBill() {
        BillServiceImpl test = new BillServiceImpl();
        List<Bill> t1 = test.calculateBill("admin", "2020-1", "2020-10");
        System.out.println(t1);
    }

    @Test
    public void pageForBill() {
        BillServiceImpl test = new BillServiceImpl();
        List<Bill> t1 = test.calculateBill("admin", "2020-1", "2020-10");
        Page<Bill> admin = test.pageForBill("admin", 0, 15, t1);
        System.out.println(admin);
    }
}