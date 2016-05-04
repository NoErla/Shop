package st.myc.shop.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import st.myc.shop.constant.SystemConstant;
import st.myc.shop.entity.SysAppUser;


public class LoginFilter implements Filter {

    protected final Logger logger = Logger.getLogger(this.getClass());

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        SysAppUser user = (SysAppUser) request.getSession().getAttribute(SystemConstant.SESSION_USER);
        if (user == null) {
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path;
            response.sendRedirect(basePath + "/login.htm");
        } else {
            chain.doFilter(request, response);
        }
    }

    public void destroy() {
    }
}
