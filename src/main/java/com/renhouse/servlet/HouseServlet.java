package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.pojo.House;
import com.renhouse.pojo.Page;
import com.renhouse.pojo.vo.HouseStatus;
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
        House house = WebUtils.copyParamToBean(request.getParameterMap(), new House());
        house.setId(null);
        house.setLandlord((String) request.getSession().getAttribute("landlordName"));
        house.setMaintenanceFee(null);
        try {
            houseService.addHouse(house);
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": " + "\"添加成功！\"" +
                    "} ";
            response.getWriter().write(result);
        } catch (Exception e) {
            String result = "{" +
                    "  \"code\": 1," +
                    "  \"msg\": " + "\"添加失败！\"" +
                    "} ";
            response.getWriter().write(result);
        }
    }

    protected void editHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Boolean status = false;
        House house = null;
        String monthRent = request.getParameter("monthRent");
        if (monthRent == null){
            String result = "{" +
                    "  \"code\": 1," +
                    "  \"msg\": " + "\"租金只能为数字！\"" +
                    "} ";
            response.getWriter().write(result);
        }else {
            try{
                Integer.parseInt(monthRent);
                house = WebUtils.copyParamToBean(request.getParameterMap(), new House());
                System.out.println(house);
                if (house.getSpace() == 0) {
                    String result = "{" +
                            "  \"code\": 1," +
                            "  \"msg\": " + "\"面积只能为数字！\"" +
                            "} ";
                    response.getWriter().write(result);
                } else {
                    status = true;
                }
            }catch (Exception e){
                String result = "{" +
                        "  \"code\": 1," +
                        "  \"msg\": " + "\"租金只能为数字！\"" +
                        "} ";
                response.getWriter().write(result);
            }
        }

        if (status) {
            try {
                House houseInfo = houseService.queryHouseById(house.getId());
                house.setLandlord(houseInfo.getLandlord());
                house.setTenant(request.getParameter("tenant"));
                house.setStartTime(houseInfo.getStartTime());
                house.setEndTime(houseInfo.getEndTime());
                house.setMaintenanceFee(houseInfo.getMaintenanceFee());
                houseService.updateHouse(house);
                String result = "{" +
                        "  \"code\": 0," +
                        "  \"msg\": " + "\"修改成功！\"" +
                        "} ";
                response.getWriter().write(result);
            } catch (Exception e) {
                String result = "{" +
                        "  \"code\": 1," +
                        "  \"msg\": " + "\"修改失败！\"" +
                        "} ";
                response.getWriter().write(result);
            }
        }
    }

    protected void deleteHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String temp = request.getParameter("id");
            Integer id = Integer.valueOf(temp);
            houseService.deleteHouseById(id);
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": " + "\"删除成功！\"" +
                    "} ";
            response.getWriter().write(result);
        } catch (Exception e) {
            String result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": " + "\"删除失败！\"" +
                    "} ";
            response.getWriter().write(result);
        }
    }

    /**
     * 处理分页功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("limit"), Page.PAGE_SIZE);

        Page<House> page = houseService.page((String) req.getSession().getAttribute("landlordName"), pageNo, pageSize);
        List<House> items = page.getItems();
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

    /**
     * 得到已租赁房屋用户信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageForRented(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("page"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("limit"), Page.PAGE_SIZE);

        Page<HouseStatus> page = houseService.pageForRentedHouse((String) req.getSession().getAttribute("landlordName"), pageNo, pageSize);
        List<HouseStatus> items = page.getItems();
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
