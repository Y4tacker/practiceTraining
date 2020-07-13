package com.renhouse.servlet.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * @ClassName GlobalFilter
 * @Description TODO 权限控制
 * @Author 1TreeForest
 * @Date 2020/7/13 12:59
 * @Version 1.0
 */
public class GlobalFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)servletRequest;
        Object user = httpServletRequest.getSession().getAttribute("user");

        if(user==null){
            servletRequest.getRequestDispatcher("login.jsp").forward(servletRequest,servletResponse);
            return;
        }else{
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
