package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.pojo.vo.TenantMaintenanceFee;
import com.renhouse.service.BillService;
import com.renhouse.service.HouseService;
import com.renhouse.service.impl.BillServiceImpl;
import com.renhouse.service.impl.HouseServiceImpl;
import com.renhouse.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public class BillServlet extends BaseServlet {
    private BillService billService = new BillServiceImpl();
    private HouseService houseService = new HouseServiceImpl();
    protected void getBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(request.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("limit"), Page.PAGE_SIZE);
        String landlord=request.getParameter("landlordName");
        String startDate=request.getParameter("startDate");
        String endDate=request.getParameter("endDate");

        try {
            List<Bill> res = billService.calculateBill(landlord,startDate,endDate);
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": " + "\"查询成功，请稍候...\"" +
                    "} ";
            response.getWriter().write(result);
        } catch (Exception e) {
            String result = "{" +
                    "  \"code\": 1," +
                    "  \"msg\": " + "\"查询失败！\"" +
                    "} ";
            response.getWriter().write(result);
        }




    }


    protected void pageForFee(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("limit"), Page.PAGE_SIZE);

        String tenantName = req.getParameter("tenantName");

        if (tenantName==null || tenantName.length() ==0){
            Page<TenantMaintenanceFee> page = houseService.pageForMaintenanceFee((String) req.getSession().getAttribute("landlordName"),
                    pageNo, pageSize);
            List<TenantMaintenanceFee> items = page.getItems();
            Gson gson = new Gson();
            String toJson = gson.toJson(items);
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": \"\"," +
                    "  \"count\": " + page.getPageTotalCount() + "," +
                    "  \"data\": " + toJson +
                    "} ";
            resp.getWriter().write(result);

        }else {
            Page<TenantMaintenanceFee> page = houseService.pageForMaintenanceFee((String) req.getSession().getAttribute("landlordName"),
                    tenantName,pageNo, pageSize);
            List<TenantMaintenanceFee> items = page.getItems();
            Gson gson = new Gson();
            String toJson = gson.toJson(items);
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": \"\"," +
                    "  \"count\": " + page.getPageTotalCount() + "," +
                    "  \"data\": " + toJson +
                    "} ";
            resp.getWriter().write(result);
        }


    }

    protected void editFee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        House house = WebUtils.copyParamToBean(request.getParameterMap(), new House());
        House houseInfo = houseService.queryHouseById(house.getId());
        house.setLandlord(houseInfo.getLandlord());
        house.setTenant(houseInfo.getTenant());
        house.setMonthRent(houseInfo.getMonthRent());
        house.setSpace(houseInfo.getSpace());
        house.setRentalStatus(houseInfo.getRentalStatus());
        house.setAddress(houseInfo.getAddress());
        house.setLayout(houseInfo.getLayout());
        house.setStartTime(houseInfo.getStartTime());
        house.setEndTime(houseInfo.getEndTime());
        house.setHouseName(houseInfo.getHouseName());
        houseService.updateHouse(house);
        String result = "{" +
                "  \"code\": 0," +
                "  \"msg\": " + "\"修改成功！\"" +
                "} ";
        response.getWriter().write(result);
    }
}
