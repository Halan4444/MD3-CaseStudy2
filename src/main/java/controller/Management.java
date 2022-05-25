package controller;

import models.*;
import service.IBookingService;
import service.IHouseService;
import service.IStandardService;
import service.ITypeService;
import service.impl.BookingServiceImpl;
import service.impl.HouseServiceImpl;
import service.impl.StandardServiceImpl;
import service.impl.TypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "Management", urlPatterns = "/manages")
public class Management extends HttpServlet {
    private IHouseService iHouseService = new HouseServiceImpl();
    private IStandardService iStandardService = new StandardServiceImpl();
    private ITypeService iTypeService = new TypeServiceImpl();
    private IBookingService iBookingService = new BookingServiceImpl();



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createHouse(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "delete":
                deleteHouses(request, response);
                break;
            case "edit":
                try {
                    editHouse(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "sort":
//                softByPrice(request,response);
                break;
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action){
            case "create":
                showCreateHouse(request, response);
                break;
            case "edit":
                showEditHouse(request,response);
                break;
            case "delete":
                deleteHouses(request, response);
                break;
            case "houseList":
                showListHouse(request,response);
                break;
            case "bookingList":
                showBookingList(request,response);
                break;
            default:
                request.getRequestDispatcher("/view/manage/homepage.jsp").forward(request,response);
                break;
        }
    }

    private void deleteHouses(HttpServletRequest request, HttpServletResponse response) {
        Integer id = null;
        try {
            id = Integer.valueOf(request.getParameter("id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (id != null) {
            boolean checkDelete = iHouseService.remove(id);
            if (!checkDelete) {
                try {
                    response.sendRedirect("/manages");
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("message", "delete successfully!");
                showListHouse(request, response);
            }
        } else {
            try {
                response.sendRedirect("/manages");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showBookingList(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<House> houses = iHouseService.findAll();
            List<Booking> bookingList = iBookingService.findAll();
            List<House> houseList = iBookingService.findAllHouseInBooking(bookingList);
            List<User> accountList = iBookingService.findAllUserInBooking(bookingList);
            request.setAttribute("houses", houses);
            request.setAttribute("houseList", houseList);
            request.setAttribute("bookingList", bookingList);
            request.setAttribute("accountList", accountList);
            request.getRequestDispatcher("/view/manage/bookingList.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


    private void modalDeleteHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        House house = iHouseService.findById(id);
        request.setAttribute("house",house);
        request.getRequestDispatcher("/view/manage/delete.jsp").forward(request,response);
    }

    private void deleteHouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        iHouseService.delete(id);
        showListHouse(request,response);
    }

    private void showEditHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        House house = iHouseService.findById(id);
        List<Type> typeList = iTypeService.findAll();
        List<Standard> standardList = iStandardService.findAll();
        request.setAttribute("typeList", typeList);
        request.setAttribute("standardList", standardList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/manage/edit.jsp");
        request.setAttribute("house",house);
        requestDispatcher.forward(request,response);
    }

    private void showCreateHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<House> houseList = iHouseService.findAll();
        List<Type> typeList = iTypeService.findAll();
        List<Standard> standardList = iStandardService.findAll();
        request.setAttribute("houseList", houseList);
        request.setAttribute("typeList", typeList);
        request.setAttribute("standardList", standardList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/manage/create.jsp");
        requestDispatcher.forward(request,response);
    }
    private void createHouse(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<House> houseList = iHouseService.findAll();
        int id;
        if (houseList==null){
            id = 1;
        }else {
            id= iHouseService.findAll().get(iHouseService.findAll().size()-1).getId()+1;
        }
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        System.out.println(typeId);
        int standardId = Integer.parseInt(request.getParameter("standardId"));
        System.out.println(standardId);
        String description = request.getParameter("description");
        String status = "available";
        String image = request.getParameter("image");
        Float price = Float.valueOf(request.getParameter("price"));


        iHouseService.save(new House(id,name,address,maxPeople,typeId,standardId,description,
                status,image,price));
        try {
            request.setAttribute("message", "House was create successfully!");
            request.getRequestDispatcher("/view/manage/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
    private void editHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        int standardId = Integer.parseInt(request.getParameter("standardId"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String image = request.getParameter("image");
        Float price = Float.valueOf(request.getParameter("price"));

        iHouseService.update(new House(id,name,address,maxPeople,typeId,standardId,description,status,image,price));
        List<House> houseList = iHouseService.findAll();
        List<Type> typeList = iTypeService.findAll();
        List<Standard> standardList = iStandardService.findAll();
        showListHouse(request,response);
    }

    private void showListHouse(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<House> houseList = iHouseService.findAll();
            System.out.println(houseList);
            List<Type> typeList = iTypeService.findAllTypefromHouses(houseList);
            List<Standard> standardList = iStandardService.findAllStandardfromHouses(houseList);
            request.setAttribute("houseList", houseList);
            request.setAttribute("typeList", typeList);
            request.setAttribute("standardList", standardList);
            request.getRequestDispatcher("/view/manage/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
