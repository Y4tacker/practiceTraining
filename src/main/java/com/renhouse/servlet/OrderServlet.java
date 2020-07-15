package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.pojo.Order;
import com.renhouse.pojo.Page;
import com.renhouse.service.OrderService;
import com.renhouse.service.impl.OrderServiceImpl;
import com.renhouse.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class OrderServlet extends BaseServlet {
    private OrderService orderService = new OrderServiceImpl();

    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("limit"), Page.PAGE_SIZE);

        Page<Order> page = orderService.page(pageNo,pageSize);
        List<Order> items = page.getItems();
        Gson gson = new Gson();
        String toJson = gson.toJson(items);
        String result = "{" +
                "  \"code\": 0," +
                "  \"msg\": \"\"," +
                "  \"count\": "+page.getPageTotalCount()+"," +
                "  \"data\": "+toJson +
                "} ";
        resp.getWriter().write(result);
    }

}
