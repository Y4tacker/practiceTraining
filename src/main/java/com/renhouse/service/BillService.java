package com.renhouse.service;

import com.renhouse.pojo.vo.Bill;

import java.util.HashMap;
import java.util.List;

/**
 * @InterfaceName BillService
 * @Description 账单服务
 * @Author 1TreeForest
 * @Date 2020/7/16 19:14
 * @Version 1.0
 */
public interface BillService {

    public HashMap<Integer, HashMap<Integer, Integer>> calculateBill(String landlord, String startDate, String endDate);
}
