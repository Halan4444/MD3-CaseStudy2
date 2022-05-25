package controller;

import models.Account;
import models.Booking;
import models.House;
import models.User;
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
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

@WebServlet(name = "BookedController", urlPatterns = "/bookeds")
public class BookedController extends HttpServlet {
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
        }switch (action) {
            case "change":
//                System.out.println("co vao case k");
//                editBooking(request, response);
                break;
            default:
                System.out.println("co vao case k");
                editBooking(request, response);
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
            case "edit":
                goEditForm(request,response);
                break;
            case "change":
                editBooking(request, response);
                break;
            case "all":
                showAllBookedList(request,response);
                break;
            default:
//                    showAllBookedList(request,response);
                    showBookedList(request,response);
                break;
        }
    }

    private void showAllBookedList(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<Booking> bookingList = iBookingService.findAll();
            List<House> houseList = iBookingService.findAllHouseInBooking(bookingList);
            List<User> accountList = iBookingService.findAllUserInBooking(bookingList);
            request.setAttribute("houseList", houseList);
            request.setAttribute("bookingList", bookingList);
            request.setAttribute("accountList", accountList);
            request.getRequestDispatcher("/view/booked/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void editBooking(HttpServletRequest request, HttpServletResponse response) {


        int id = Integer.parseInt(request.getParameter("id"));
        String newStatus = request.getParameter("newStatus");
        iBookingService.updateStatus(newStatus,id);
        Booking booking = iBookingService.findById(id);
        House house = iHouseService.findById(booking.getHouseId());
        long noOfDay = ChronoUnit.DAYS.between(booking.getStartTime(), booking.getEndTime());
        RequestDispatcher dispatcher ;

        request.setAttribute("booking", booking);
        request.setAttribute("house", house);
        request.setAttribute("noOfDay", noOfDay);
        dispatcher = request.getRequestDispatcher("/view/house/confirmBooking.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void goEditForm(HttpServletRequest request, HttpServletResponse response) {
        int bookingId = Integer.parseInt(request.getParameter("id"));
        Booking booking = iBookingService.findById(bookingId);
        House house = iHouseService.findById(booking.getHouseId());
        long noOfDay = ChronoUnit.DAYS.between(booking.getStartTime(), booking.getEndTime());
        RequestDispatcher dispatcher ;
        request.setAttribute("booking", booking);
        request.setAttribute("house", house);
        request.setAttribute("noOfDay", noOfDay);
        if (ChronoUnit.DAYS.between(LocalDate.now(), booking.getStartTime())>1&&booking.getStatus().equalsIgnoreCase("waiting")){
            dispatcher = request.getRequestDispatcher("/view/booked/edit.jsp");
        }else {
            dispatcher = request.getRequestDispatcher("/view/house/confirmBooking.jsp");
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showBookedList(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = (int) request.getSession().getAttribute("idSession");
            List<Booking> bookingList = iBookingService.findBookingListByUser(id);
            List<House> houseList = iBookingService.findAllHouseInBookingByUser(bookingList,id);
            List<User> accountList = iBookingService.findUserInBooking(bookingList,id);
            request.setAttribute("houseList", houseList);
            request.setAttribute("bookingList", bookingList);
            request.setAttribute("accountList", accountList);
            request.getRequestDispatcher("/view/booked/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
