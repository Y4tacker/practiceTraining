package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.TenantMaintenanceFee;
import com.renhouse.service.HouseService;
import com.renhouse.service.impl.HouseServiceImpl;
import com.renhouse.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BillServlet extends BaseServlet {
    private HouseService houseService = new HouseServiceImpl();
    protected void getMonthBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String landlord=request.getParameter("username");


    }

    protected void getYearBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String landlord=request.getParameter("username");


    }

    protected void getTotalBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String landlord=request.getParameter("username");


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
}
