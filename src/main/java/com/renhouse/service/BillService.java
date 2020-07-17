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
    /**
     * @param landlord
     * @param startDate yyyy-MM-dd
     * @param endDate   yyyy-MM-dd
     * @return
     */
    public HashMap<String, Integer> calculateBill(String landlord, String startDate, String endDate);
}
