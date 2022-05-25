package service;

import models.Account;
import models.Booking;
import models.House;
import models.User;

import java.util.List;

public interface IBookingService extends ICRUDService<Booking> {
    List<Booking> findValidBookingList();

    List<House> findAllHouseInBooking(List<Booking> bookingList);

    List<User> findAllUserInBooking(List<Booking> bookingList);

    List<Booking> findBookingListByUser(int id);

    void updateStatus(String newStatus, int id);

    List<Booking> findBookingListByHouse(int houseId);

    List<House> findAllHouseInBookingByUser(List<Booking> bookingList, int id);

    List<User> findUserInBooking(List<Booking> bookingList, int id);
}
