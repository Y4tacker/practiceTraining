package com.renhouse.servlet;

import com.renhouse.pojo.User;
import com.renhouse.service.UserService;
import com.renhouse.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {
    private UserService userService = new UserServiceImpl();

    /**
     * 处理登陆的功能
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取请求参数
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String code = request.getParameter("captcha");
        //获取前端生成的验证码
        String token = (String) request.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        request.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        if (token != null && token.equalsIgnoreCase(code)){
            User loginUser = userService.login(new User(null, username, password, null, null));
            if (loginUser != null && code.equalsIgnoreCase(token)){
                // 将user绑定到session域中，便于filter
                request.getSession().setAttribute("user",loginUser);
                response.getWriter().write("登录成功");
                // TODO 跳转到登录成功页面
            }else {
                //密码错误
                //把回显信息保存到request域中
                request.setAttribute("msg","用户名或密码错误，登陆失败！");
                // 跳回登录页面
                request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
            }
        }else {
            //验证码输入错误
            //把回显信息保存到request域中
            request.setAttribute("msg","验证码输入错误！");
            request.setAttribute("username", username);
            request.setAttribute("password", password);
            // 跳回登录页面
            request.getRequestDispatcher("/pages/user/login.jsp").forward(request, response);
        }


    }


}
