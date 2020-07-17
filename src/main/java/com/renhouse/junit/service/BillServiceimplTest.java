package com.renhouse.junit.service;

import com.renhouse.service.impl.BillServiceimpl;
import org.junit.Test;

import java.util.HashMap;

public class BillServiceimplTest {

    @org.junit.Test
    public void calculateBill() {
        BillServiceimpl test = new BillServiceimpl();
        HashMap<String, Integer> t1 = test.calculateBill("admin", "2020-1", "2022-3");
        System.out.println(t1);
    }
}