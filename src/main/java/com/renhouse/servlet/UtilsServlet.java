package com.renhouse.servlet;

import com.google.gson.Gson;
import com.renhouse.dao.HouseDao;
import com.renhouse.dao.OrderDao;
import com.renhouse.dao.impl.HouseDaoImpl;
import com.renhouse.dao.impl.OrderDaoImpl;
import com.renhouse.pojo.vo.Bill;
import com.renhouse.service.impl.BillServiceImpl;
import com.renhouse.utils.EmailUtils;
import com.renhouse.utils.TimeUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UtilsServlet extends BaseServlet {
    /**
     * 发送邮件的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void sendEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String realName = request.getParameter("realName");
        String Subject = "房东消息";
        String SendMessage = "尊敬的："+realName+"\n您的房屋即将到期，请及时联系房东续租，或处理退房手续";
        EmailUtils emailUtils = new EmailUtils(email,Subject,SendMessage,"1078433422@qq.com","mixhkqoqgsziiaib");
        String result = null;
        try {
            emailUtils.Send();
            result = "{" +
                    "  \"code\": 0," +
                    "  \"msg\": " + "\"发送成功！\"" +
                    "} ";
        } catch (GeneralSecurityException e) {
            e.printStackTrace();
            result = "{" +
                    "  \"code\": 1," +
                    "  \"msg\": " + "\"发送失败！\"" +
                    "} ";
        }
        response.getWriter().write(result);
    }

    /**
     * 获取主页需要的数据
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void indexInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String landlordName = (String) request.getSession().getAttribute("landlordName");
        //已租赁房屋数量
        HouseDao houseDao = new HouseDaoImpl();
        OrderDao orderDao = new OrderDaoImpl();
        Integer statusAlreadyCount = houseDao.queryHouseByLandlordAndStatusAlreadyCount(landlordName);
        //租约到期房屋数量
        Integer nearDateCount = houseDao.queryForNearDateCount(landlordName);
        //房产数量
        Integer houseCount = houseDao.queryAllHouseCount(landlordName);
        //未查看订单数量
        Integer orderCount = orderDao.queryForPageTotalCount();
        //本月收入
        BigDecimal curGet = null;
        BillServiceImpl billService = new BillServiceImpl();
        String currentDateStr = TimeUtils.getCurrentDateStr();
        String[] split = currentDateStr.split("-");
        String curYear = split[0];
        String startDate = curYear+"-01";
        String endDate = curYear + "12";
        List<Bill> t1 = billService.calculateBill("admin", startDate, endDate);
        if (split[1].substring(0,1).equals("0")){
            String month = split[1].substring(1,2);
            for (int i=0;i<t1.size();i++){
                String temp = t1.get(i).getDate().split("-")[1];
                if (month.equals(temp)){
                    curGet = t1.get(i).getTotal();
                }
            }
        }else {
            String month = split[1];
            for (int i=0;i<t1.size();i++){
                String temp = t1.get(i).getDate().split("-")[1];
                if (month.equals(temp)){
                    curGet = t1.get(i).getTotal();
                }
            }
        }
        Map<Object,String> map = new HashMap<>();
        map.put("alreadyCount", String.valueOf(statusAlreadyCount.intValue()));
        map.put("nearDateCount", String.valueOf(nearDateCount.intValue()));
        map.put("houseCount", String.valueOf(houseCount.intValue()));
        map.put("orderCount", String.valueOf(orderCount.intValue()));
        map.put("curGet", String.valueOf(curGet));
        Gson gson = new Gson();
        String toJson = gson.toJson(map);
        response.getWriter().write(toJson);
//        response.getWriter().write("已租赁房屋数量："+statusAlreadyCount.intValue());
//        response.getWriter().write("租约到期数量："+nearDateCount.intValue());
//        response.getWriter().write("房产数量"+houseCount.intValue());
//        response.getWriter().write("未查看订单数量："+orderCount.intValue());
//        response.getWriter().write("本月收入："+curGet);
    }
}
