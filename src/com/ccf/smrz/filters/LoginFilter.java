package com.ccf.smrz.filters;

import org.apache.commons.lang.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by dell on 2016/6/25.
 */
public class LoginFilter extends HttpServlet implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if (request.getSession().getAttribute("userinfo") == null) {
            if ("/admin/getKaptchaImage.do".equals(request.getServletPath())) {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
            if ("/admin/doLogin.do".equals(request.getServletPath())) {
                filterChain.doFilter(servletRequest, servletResponse);
                return;
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
        return;
    }
}
