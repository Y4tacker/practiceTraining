package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.service.HouseService;
import com.renhouse.service.impl.HouseServiceImpl;
import com.renhouse.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HouseServlet extends BaseServlet {
    private HouseService houseService = new HouseServiceImpl();

    protected void addHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void getHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void editHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void delHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    /**
     * 处理分页功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("limit"), Page.PAGE_SIZE);

        Page<House> page = houseService.page(pageNo,pageSize);
        List<House> items = page.getItems();
        Gson gson = new Gson();
        String toJson = gson.toJson(items);
        resp.getWriter().write(toJson);
    }
}
