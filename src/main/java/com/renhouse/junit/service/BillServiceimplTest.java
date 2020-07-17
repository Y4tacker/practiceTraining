package com.renhouse.junit.service;

import com.renhouse.service.impl.BillServiceimpl;
import org.junit.Test;

import java.util.HashMap;

public class BillServiceimplTest {

    @org.junit.Test
    public void calculateBill() {
        BillServiceimpl test = new BillServiceimpl();
        HashMap<Integer, HashMap<Integer, Integer>> t1 = test.calculateBill("admin", "2000-1-1", "2022-3-3");
        System.out.println(t1);
    }
}