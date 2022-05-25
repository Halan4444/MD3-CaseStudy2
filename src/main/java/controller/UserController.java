package controller;

import models.User;
import service.IUserService;
import service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "UserController", urlPatterns = "/user")
public class UserController extends HttpServlet {
    private IUserService iUserService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "edit":
                editUser(request, response);
                break;
            case "delete":
//                deleteUser(request, response);
                break;
            default:
                goUser(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("login.jsp").forward(request, response);

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "logout":
                request.getSession().removeAttribute("usernameSession");
                request.getRequestDispatcher("/common/login.jsp").forward(request, response);
                break;
            case "contract":
                goListUser(request,response);
                break;
            case "search":
                goSearchUser(request, response);
                break;
            default:
                goUser(request, response);
        }
    }
    private void goSearchUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String fieldSearch1 = request.getParameter("fieldSearch1");
            String searchKey1 = request.getParameter("searchKey1");
            String fieldSearch2 = request.getParameter("fieldSearch2");
            String searchKey2 = request.getParameter("searchKey2");
            String fieldSearch3 = request.getParameter("fieldSearch3");
            String searchKey3 = request.getParameter("searchKey3");
            List<User> userList = iUserService.search(fieldSearch1, fieldSearch2, fieldSearch3, searchKey1, searchKey2, searchKey3);
            request.setAttribute("urlPath", "contract");
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("/view/contract/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void goUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            HttpSession session = request.getSession(false);
            System.out.println(session.getAttribute("accountUsernameSession"));
           User user = iUserService.findUser(String.valueOf(session.getAttribute("accountUsernameSession")));
            request.setAttribute("user", user);
            System.out.println(user.toString());
            request.getRequestDispatcher("/view/user/detail.jsp").forward(request, response);
            return;
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        System.out.println(session.getAttribute("accountUsernameSession"));

        String username = iUserService.findUser(String.valueOf(session.getAttribute("accountUsernameSession"))).getUsername();
        Integer id = iUserService.findUser(String.valueOf(session.getAttribute("accountUsernameSession"))).getId();
        LocalDate dateOfBirth = null;
        try {
            dateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = String.valueOf(session.getAttribute("passwordSession"));
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String role = "user";
        String phone = null;
        try {
            phone = request.getParameter("phone");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String gender  = null;
        try {
            gender = request.getParameter("gender");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String socialNetworking  = null;
        try {
            socialNetworking = request.getParameter("socialNetworking");
        } catch (Exception e) {
            e.printStackTrace();
        }
        String payments = null;
        try {
            payments = request.getParameter("payments");
        } catch (Exception e) {
            e.printStackTrace();
        }
        User user = new User(id,username,firstname,lastname,gender,dateOfBirth,email,phone,address,socialNetworking,payments,role,password);
        Map<String, String> map = iUserService.update1(user);

        if (map.isEmpty()) {
            request.setAttribute("message", "Update successfully!");
            goUser(request, response);
        } else {
            request.setAttribute("error", map);
            editUser(request, response);
        }
    }

    private void goListUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<User> userList = iUserService.findAll();
            request.setAttribute("urlPath", "contract");
            request.setAttribute("userList", userList);
            System.out.println("Checklist==="+userList);
            request.getRequestDispatcher("/view/contract/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }



}
