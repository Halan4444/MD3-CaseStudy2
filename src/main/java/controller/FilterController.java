package controller;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "FilterController", value = "/login")
public class FilterController implements Filter {

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        HttpSession session = request.getSession(false);

        String signupURI = request.getContextPath() + "/signup"; // http://localhost:8080/login
        String loginURI = request.getContextPath() + "/login"; // http://localhost:8080/login
        String employeeURI = request.getContextPath() + "/employees";
        String houseURI = request.getContextPath() + "/houses";
        String bookingURI = request.getContextPath() + "/bookeds";

        boolean loggedIn = session != null && session.getAttribute("usernameSession") != null;
        boolean loginRequest = request.getRequestURI().equals(loginURI);
        boolean signupRequest = request.getRequestURI().equals(signupURI);
        boolean houseRequest = request.getRequestURI().equals(houseURI);

        boolean employeeRequest = request.getRequestURI().equals(employeeURI);
        boolean havePermission = session != null &&
                ("admin".equals(session.getAttribute("roleSession"))
                        || "manager".equals(session.getAttribute("roleSession")));

        if (signupRequest){
            chain.doFilter(request, response);
            return;
        }


        if (loggedIn || loginRequest) {
            if (employeeRequest) {
                if (havePermission) {
                    chain.doFilter(request, response);
                } else {
                    response.sendRedirect("/common/access_denied.jsp");
                }
            } else {
                chain.doFilter(request, response);
            }
        }
        else {
            response.sendRedirect(loginURI);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}