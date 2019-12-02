package com.student.filter;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.skywares.fw.pojo.RequestResult;
import com.skywares.fw.web.util.WebUtil;
import com.student.projo.User;
import com.student.util.Const;

public class AuthFilter implements Filter {
    private List<String> freeUrl = new ArrayList<String>();
    private String loginPage;

    public void init(FilterConfig config) {
        freeUrl.add("/app/login");
        freeUrl.add("/app/doLogin");
        freeUrl.add("/app/student");
        freeUrl.add("/app/insertStudent");
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);

        User user = (User) session.getAttribute(Const.ADMIN_USER_SESSION_KEY);
        String url = req.getRequestURI();
        String ctxPath = req.getContextPath();
        url = url.substring(ctxPath.length());

        if (loginPage == null) {
            loginPage = ctxPath + "/app/login?back_url=";
        }

        if (user == null && !freeUrl.contains(url)) {
            String params = req.getQueryString();
            String backUrl = url;
            if (params != null) {
                backUrl += "?" + params;
            }

            if (backUrl.startsWith("/app/admin/syserror")) {
                backUrl = "";
            } else {
                backUrl = URLEncoder.encode(ctxPath + backUrl, "UTF-8");
            }

            if (WebUtil.isAjaxRequest(req)) {
                RequestResult o = new RequestResult();
                o.setCode(RequestResult.NEED_AUTH);
                WebUtil.writeJson(o, res);
                return;
            }
            res.sendRedirect(loginPage + backUrl);
            return;
        }
        chain.doFilter(request, response);
    }

    public void destroy() {

    }
}
