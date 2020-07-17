package com.renhouse.servlet;

import com.renhouse.utils.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.GeneralSecurityException;

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
        String Subject = "房东消息";
        String SendMessage = "您的房屋即将到期，请及时联系房东续租，或处理退房手续";
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
}
