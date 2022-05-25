package controller;

import models.*;
import service.IBookingService;
import service.IHouseService;
import service.ITypeService;
import service.IStandardService;
import service.impl.BookingServiceImpl;
import service.impl.HouseServiceImpl;
import service.impl.TypeServiceImpl;
import service.impl.StandardServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.DataInput;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

@WebServlet(name = "HouseController", urlPatterns = "/houses")
public class HouseController extends HttpServlet {
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
                createHouse(request, response);
                break;
            case "book":
                try {
                    newBooking(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "edit":
//                editCustomer(request, response);
                break;
            case "delete":
//                deleteCustomer(request, response);
                break;
            case "detail":
//                goDetailHouse(request, response);
                break;
            default:
//                goListHouse(request, response);
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
        switch (action) {
            case "create":
                goCreateHouse(request, response);
                break;
            case "search":
                searchListHouse(request, response);
                break;
            case "searchModal":
                goSearchHouses(request, response);
                break;
            case "list":
                goListHouse(request, response);
                break;
            case "book":
                goBookingPage(request, response);
                break;
            case "detail":
                goDetailHouse(request, response);
                break;
            default:
                showListHouse(request,response);
                break;
        }
    }

    private void newBooking(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Booking> bookingList = iBookingService.findAll();
        HttpSession session = request.getSession();
        List<House> houseList = iHouseService.findAll();

        int id;
        if (bookingList.size() == 0) {
            id = 1;
        } else {
            id = iBookingService.findAll().get(iBookingService.findAll().size() - 1).getId() + 1;
        }
        LocalDate startTime = null;
        try {
            startTime = LocalDate.parse(request.getParameter("startTime"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        LocalDate endTime = null;
        try {
            endTime = LocalDate.parse(request.getParameter("endTime"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        int houseId = Integer.parseInt(request.getParameter("houseId"));
        Integer userId = (Integer) request.getSession().getAttribute("idSession");
        String status = "waiting";
        House house = iHouseService.findById(houseId);
        if (LocalDate.now().isAfter(startTime)){
            request.setAttribute("houseList", houseList);
            request.setAttribute("mess", "You cant't choose start Date after today");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/booking.jsp");
            dispatcher.forward(request, response);
            return;
        }
        if (endTime.isBefore(startTime)){
            request.setAttribute("houseList", houseList);
            request.setAttribute("mess", "You cant't choose start Date after end Date");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/booking.jsp");
            dispatcher.forward(request, response);
            return;
        }

        if(house.getStatus().equals("not available")||house.getStatus().equals("repairing")){
            request.setAttribute("houseList", houseList);
            request.setAttribute("mess", "This house is repairing or not available");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/booking.jsp");
            dispatcher.forward(request, response);
            return;
        }
        long noOfDay = ChronoUnit.DAYS.between(startTime, endTime);
        Float totalFee = house.getPrice() * noOfDay;
        Booking booking = new Booking(id, startTime, endTime, houseId, userId, status, totalFee);
        List<Booking> validBooking = iBookingService.findValidBookingList();
        for (int i = 0; i < validBooking.size(); i++) {
            if ((validBooking.get(i).getHouseId()==houseId)&&(validBooking.get(i).getEndTime().isAfter(startTime))){
                houseList = iHouseService.findAll();
                request.setAttribute("houseList", houseList);
                request.setAttribute("mess", "This time house was booked");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/booking.jsp");
                dispatcher.forward(request, response);
                return;
            }
        }

        iBookingService.save(booking);
        request.setAttribute("houseList", houseList);
        request.setAttribute("booking", booking);
        request.setAttribute("house", house);
        request.setAttribute("noOfDay", noOfDay);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/confirmBooking.jsp");
        dispatcher.forward(request, response);
    }


    private void goDetailHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int houseId = Integer.parseInt(request.getParameter("id"));
        House house = iHouseService.findById(houseId);
        Type type = iTypeService.findTypeById(house.getTypeId());
        Standard standard = iStandardService.findById(house.getStandardId());
        request.setAttribute("house",house);
        request.setAttribute("type",type);
        request.setAttribute("standard",standard);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/detail.jsp");
        dispatcher.forward(request,response);
    }
    private void goSearchHouses(HttpServletRequest request, HttpServletResponse response) {
        try {
            String fieldSearch1 = request.getParameter("fieldSearch1");
            String searchKey1 = request.getParameter("searchKey1");
            String fieldSearch2 = request.getParameter("fieldSearch2");
            String searchKey2 = request.getParameter("searchKey2");
            String fieldSearch3 = request.getParameter("fieldSearch3");
            String searchKey3 = request.getParameter("searchKey3");
            List<House> houseList = iHouseService.search(fieldSearch1, fieldSearch2, fieldSearch3, searchKey1, searchKey2, searchKey3);
            List<Type> typeList = iTypeService.findAllTypefromHouses(houseList);
            List<Standard> standardList = iStandardService.findAllStandardfromHouses(houseList);
            request.setAttribute("urlPath", "houses");
            request.setAttribute("houseList", houseList);
            request.setAttribute("standardList", standardList);
            request.setAttribute("typeList", typeList);
            request.getRequestDispatcher("/view/manage/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    private void goBookingPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
//        House house = iHouseService.findById(id);
        List<House> houseList = iHouseService.findAll();
//        request.setAttribute("house",house);
        request.setAttribute("houseList", houseList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/house/booking.jsp");
        dispatcher.forward(request, response);
    }

    private void searchListHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("placeName");
        System.out.println(name);
        List<House> houses = iHouseService.findByName(name);
        List<Standard> standards= iStandardService.findAll();
        List<Standard> standards1 = iStandardService.findAllStandardfromHouses(houses);
        List<Type> types = iTypeService.findAll();
        List<Type> types1 = iTypeService.findAllTypefromHouses(houses);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/house/show.jsp");
        request.setAttribute("houses",houses);
        request.setAttribute("standards",standards);
        request.setAttribute("standard1",standards1);
        request.setAttribute("types",types);
        request.setAttribute("types1",types1);
        requestDispatcher.forward(request,response);
    }


    private void showListHouse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<House> houseList = iHouseService.findAll();
        List<Standard> standardList = iStandardService.findAllStandardfromHouses(houseList);
        List<Type> typeList = iTypeService.findAllTypefromHouses(houseList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/view/house/show.jsp");
        request.setAttribute("houseList",houseList);
        request.setAttribute("standardList",standardList);
        request.setAttribute("typeList",typeList);
        requestDispatcher.forward(request,response);
    }

    private void goCreateHouse(HttpServletRequest request, HttpServletResponse response) {
        List<Standard> standardList = iStandardService.findAll();
        List<Type> HouseTypeList = iTypeService.findAll();

        try {
            request.setAttribute("urlPath", "service");
            request.setAttribute("rentTypeList", standardList);
            request.setAttribute("HouseTypeList", HouseTypeList);
            request.getRequestDispatcher("/view/house/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void goListHouse(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<House> houseList = iHouseService.findAll();
            request.setAttribute("urlPath", "service");
            request.setAttribute("HouseList", houseList);
            request.getRequestDispatcher("/view/house/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createHouse(HttpServletRequest request, HttpServletResponse response) {

        Integer HouseTypeId = null;
        try {
            HouseTypeId = Integer.valueOf(request.getParameter("HouseTypeId"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer rentTypeId = null;
        try {
            rentTypeId = Integer.valueOf(request.getParameter("rentTypeId"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        String code = request.getParameter("code");
        String name = request.getParameter("name");

        Double floorSquare = null;
        try {
            floorSquare = Double.valueOf(request.getParameter("floorSquare"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Double rentalFee = null;
        try {
            rentalFee = Double.valueOf(request.getParameter("rentalFee"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer maximumPeople = null;
        try {
            maximumPeople = Integer.valueOf(request.getParameter("maximumPeople"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        String roomStandard = request.getParameter("roomStandard");
        String description = request.getParameter("description");
        Double poolSquare = null;
        try {
            poolSquare = Double.valueOf(request.getParameter("poolSquare"));
        } catch (Exception e) {
            e.printStackTrace();
        }

        Integer numberFloor = null;
        try {
            numberFloor = Integer.valueOf(request.getParameter("numberFloor"));
        } catch (Exception e) {
            e.printStackTrace();
        }


//        if (map.isEmpty()) {
//            try {
//                request.setAttribute("message", "Service was create successfully!");
//                request.setAttribute("urlPath", "service");
//                request.getRequestDispatcher("/view/House/create.jsp").forward(request, response);
//            } catch (ServletException | IOException e) {
//                e.printStackTrace();
//            }
//        } else {
//            request.setAttribute("error", map);
//            request.setAttribute("House", house);
//            goCreateHouse(request, response);
//        }
    }
}
