package service.impl;

import models.Account;
import models.Booking;
import models.House;
import models.User;
import repository.IBookingRepository;
import repository.impl.BookingRepositoryImpl;
import service.IBookingService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class BookingServiceImpl implements IBookingService {
IBookingRepository iBookingRepository = new BookingRepositoryImpl();

    @Override
    public List<Booking> findAll() {
        return iBookingRepository.findAll();
    }

    @Override
    public void save(Booking booking) throws SQLException {
iBookingRepository.save(booking);
    }

    @Override
    public boolean update(Booking booking) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public Booking findById(int id) {
        return iBookingRepository.findById(id);
    }

    @Override
    public Map<String, String> save1(Booking booking) {
        return null;
    }

    @Override
    public Map<String, String> update1(Booking booking) {
        return null;
    }

    @Override
    public boolean remove(Integer id) {
        return false;
    }

    @Override
    public List<Booking> findValidBookingList() {
        return iBookingRepository.findValidBookingList();
    }

    @Override
    public List<House> findAllHouseInBooking(List<Booking> bookingList) {
        return iBookingRepository.findAllHouseInBooking(bookingList);
    }

    @Override
    public List<User> findAllUserInBooking(List<Booking> bookingList) {
        return iBookingRepository.findAllUserInBooking(bookingList);
    }

    @Override
    public List<Booking> findBookingListByUser(int id) {
        return iBookingRepository.findBookingListByUser(id);
    }

    @Override
    public void updateStatus(String newStatus, int id) {
        iBookingRepository.updateStatus(newStatus,id);
    }

    @Override
    public List<Booking> findBookingListByHouse(int houseId) {
        return iBookingRepository.findBookingListByHouse(houseId);
    }

    @Override
    public List<House> findAllHouseInBookingByUser(List<Booking> bookingList, int id) {
        return iBookingRepository.findAllHouseInBookingByUser(bookingList,id);
    }

    @Override
    public List<User> findUserInBooking(List<Booking> bookingList, int id) {
        return iBookingRepository.findUserInBooking(bookingList,id);
    }
}
