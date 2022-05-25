package controller;

import models.Account;
import models.User;
import service.ILoginService;
import service.IUserService;
import service.impl.LoginServiceImpl;
import service.impl.UserServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@WebServlet(name = "SignUpController", urlPatterns = "/signup")
public class SignUpController extends HttpServlet {
    private IUserService iUserService = new UserServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            createUser(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
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
            case "login":
            default:
                goSignUp(request, response);
        }
    }

    private void goSignUp(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/common/signup.jsp").forward(request, response);
            return;
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
    private void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException,SQLException, IOException {
        String username = request.getParameter("username");
        LocalDate dateOfBirth = null;
        try {
            dateOfBirth = LocalDate.parse(request.getParameter("dateOfBirth"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String role = "user";
        RequestDispatcher dispatcher;
        if (username==""||email==""||password==""){
            request.setAttribute("mess3","have '*' need to fill");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
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
        if (!checkUsername(username)){
            request.setAttribute("mess1","username has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        if (!checkEmail(email)){
            request.setAttribute("mess2","email has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        if (!checkPhone(phone)){
            request.setAttribute("mess4","phone number has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        User user = new User(username,firstname,lastname,gender,dateOfBirth,email,phone,address,socialNetworking,payments,role,password);
        Map<String, String> map = iUserService.save1(user);

        if (map.isEmpty()) {
            try {
                request.setAttribute("message", "User was created successfully!");
                request.setAttribute("urlPath", "user");
                request.getRequestDispatcher("/common/signup.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            request.setAttribute("error", map);
            request.setAttribute("user", user);
            goSignUp(request, response);
        }

    }






    private void createUserA(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
//        if (iUserService.findAll()==null){
//            id = 1;
//        }else {
//            id = iUserService.findAll().get(iUserService.findAll().size()-1).getId()+1;
//        }
        RequestDispatcher dispatcher;
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");;
        if (username==""||email==""||password==""){
            request.setAttribute("mess3","have '*' need to fill");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        if (!checkUsername(username)){
            request.setAttribute("mess1","username has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        if (!checkEmail(email)){
            request.setAttribute("mess2","email has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
        if (!checkPhone(phone)){
            request.setAttribute("mess4","phone number has existed");
            dispatcher = request.getRequestDispatcher("/common/signup.jsp");
            dispatcher.forward(request,response);
            return;
        }
//        iUserService.save( new User(username, firstname, lastname, email,password));
        response.sendRedirect("/login");
    }
    public boolean checkUsername(String username){
        List<User> users = iUserService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUsername().equals(username)) {
                return false;
            }
        }
        return true;
    }
    public boolean checkEmail(String email){
        List<User> users = iUserService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getEmail().equals(email)) {
                return false;
            }
        }
        return true;
    }
    public boolean checkPhone(String phone){
        List<User> users = iUserService.findAll();
        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getPhone().equals(phone)) {
                return false;
            }
        }
        return true;
    }

}




