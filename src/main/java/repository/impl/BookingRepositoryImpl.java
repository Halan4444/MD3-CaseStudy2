package repository.impl;

import models.Account;
import models.Booking;
import models.House;
import models.User;
import repository.BaseRepository;
import repository.IBookingRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class BookingRepositoryImpl implements IBookingRepository {
    private static final String SELECT_HOUSE_LIST_IN_BOOKING_BY_USER = "select h.id, h.name, h.address,  h.maxPeople, h.typeId, " +
            "h.standardId, h.description, h.status, h.image, h.price \n" +
            "from house h join booking b on b.houseId = h.id " +
            "join user a on a.id = b.userId where b.userId = ?;";;
    BaseRepository baseRepository = new BaseRepository();
    private static final String INSERT_BOOKING = "INSERT INTO BOOKING (startTime,endTime,houseId,userId,status,totalFee) values (?,?,?,?,?,?);";
    private static final String SELECT_ALL_BOOKING = "select * from booking";
    private static final String SELECT_BOOKING_VALID = "select * from booking where (status = 'waiting' or status = 'processing')";
    private static final String SELECT_HOUSE_LIST_IN_BOOKING = "select h.id, h.name, h.address,  h.maxPeople, h.typeId, " +
            "h.standardId, h.description, h.status, h.image, h.price \n" +
            "from house h join booking b on b.houseId = h.id;";
    private static final String SELECT_USER_LIST_IN_BOOKING = "select a.* from user a\n" +
            "join booking b on b.userId = a.id;";
    private static final String SELECT_BOOKING_BY_USER = "select * from booking where userId = ?;";
    private static final String SELECT_BOOKING_BY_HOUSE = "select * from booking where houseId = ?;";
    private static final String SELECT_BOOKING_BY_ID = "select * from booking where id = ?;";
    private static final String UPDTAE_STATUS = "update booking set status = ?" +
            "where id = ?;";
    private static final String DELETE_BOOKING = "delete from booking where id = ?";
//    private static final String SELECT_USER_IN_BOOKING = "select a.id, a.username, a.password," +
//            " a.lastname, a.role from user a\n" +
//            "join booking b on b.userId = a.id where b.userId = ?;";

    private static final String SELECT_USER_IN_BOOKING = "select a.*from user a\n" +
            "join booking b on b.userId = a.id where b.userId = ?;";



    @Override
    public List<Booking> findAll() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOKING);) {
                     ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("id");
                LocalDate startTime = rs.getDate("startTime").toLocalDate();
                LocalDate endTime = rs.getDate("endTime").toLocalDate();
                int houseId = rs.getInt("houseId");
                int userId = rs.getInt("userId");
                String status = rs.getString("status");
                float totalFee = rs.getFloat("totalFee");
                bookings.add(new Booking(id, startTime, endTime, houseId, userId, status, totalFee));
            }
        } catch (SQLException e) {

        }
        return bookings;
    }

    @Override
    public void save(Booking booking) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(INSERT_BOOKING);
            preparedStatement.setDate(1, Date.valueOf(booking.getStartTime()));
            preparedStatement.setDate(2, Date.valueOf(booking.getEndTime()));
            preparedStatement.setInt(3, booking.getHouseId());
            preparedStatement.setInt(4, booking.getUserId());
            preparedStatement.setString(5, booking.getStatus());
            preparedStatement.setFloat(6, booking.getTotalFee());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public boolean update(Booking booking) {
        return false;
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        return false;
    }

    @Override
    public boolean remove(Integer id) {
        boolean rowUpdated = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_BOOKING);
            preparedStatement.setInt(1, id);
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return rowUpdated;
    }

    @Override
    public List<Booking> findValidBookingList() {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_VALID);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                LocalDate startTime = rs.getDate("startTime").toLocalDate();
                LocalDate endTime = rs.getDate("endTime").toLocalDate();
                int houseId = rs.getInt("houseId");
                int userId = rs.getInt("userId");
                String status = rs.getString("status");
                float totalFee = rs.getFloat("totalFee");
                bookings.add(new Booking(id, startTime, endTime, houseId, userId, status, totalFee));
            }
        } catch (SQLException e) {

        }
        return bookings;
    }

    @Override
    public List<House> findAllHouseInBooking(List<Booking> bookingList) {
        List<House> houses = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOUSE_LIST_IN_BOOKING);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                int maxpeople = Integer.parseInt(rs.getString("maxPeople"));
                int typeID = rs.getInt("typeId");
                int standardId = Integer.parseInt(rs.getString("standardId"));
                String description = rs.getString("description");
                String status = rs.getString("status");
                String image = rs.getString("image");
                float price = rs.getFloat("price");

                houses.add(new House(id, name, address, maxpeople, typeID, standardId, description, status, image, price));

            }
        } catch (SQLException e) {

        }
        return houses;
    }

    @Override
    public List<User> findAllUserInBooking(List<Booking> bookingList) {
        List<User> users = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_LIST_IN_BOOKING);) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String socialNetwork = rs.getString("socialNetwork");
                String payments = rs.getString("payments");
                users.add(new User(id, username, firstname, lastname, gender, email, phone,
                        address, socialNetwork, payments));
            }
        } catch (SQLException e) {

        }
        return users;
    }

    @Override
    public List<Booking> findBookingListByUser(int id1) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_BY_USER);) {
            preparedStatement.setInt(1, id1);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                LocalDate startTime = rs.getDate("startTime").toLocalDate();
                LocalDate endTime = rs.getDate("endTime").toLocalDate();
                int houseId = rs.getInt("houseId");
                int userId = rs.getInt("userId");
                String status = rs.getString("status");
                float totalFee = rs.getFloat("totalFee");
                bookings.add(new Booking(id, startTime, endTime, houseId, userId, status, totalFee));
            }
        } catch (SQLException e) {

        }
        return bookings;
    }

    @Override
    public Booking findById(int id) {
        Booking booking = new Booking();
        try(Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_BY_ID);) {
            preparedStatement.setInt(1,id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                LocalDate startTime = rs.getDate("startTime").toLocalDate();
                LocalDate endTime = rs.getDate("endTime").toLocalDate();
                int houseId = rs.getInt("houseId");
                int userId = rs.getInt("userId");
                String status = rs.getString("status");
                float totalFee = rs.getFloat("totalFee");
                booking = new Booking(id, startTime, endTime, houseId, userId, status, totalFee);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return booking;
    }

    @Override
    public boolean updateStatus(String newStatus, int id1) {
        boolean rowUpdated = false;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDTAE_STATUS);) {
            statement.setString(1, newStatus);
            statement.setInt(2, id1);
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }  return rowUpdated;
    }

    @Override
    public List<Booking> findBookingListByHouse(int houseId1) {
        List<Booking> bookings = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOKING_BY_HOUSE);) {
            preparedStatement.setInt(1, houseId1);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                LocalDate startTime = rs.getDate("startTime").toLocalDate();
                LocalDate endTime = rs.getDate("endTime").toLocalDate();
                int houseId = rs.getInt("houseId");
                int userId = rs.getInt("userId");
                String status = rs.getString("status");
                float totalFee = rs.getFloat("totalFee");
                bookings.add(new Booking(id, startTime, endTime, houseId, userId, status, totalFee));
            }
        } catch (SQLException e) {

        }
        return bookings;
    }

    @Override
    public List<House> findAllHouseInBookingByUser(List<Booking> bookingList, int userId) {
        List<House> houses = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HOUSE_LIST_IN_BOOKING_BY_USER);) {
            preparedStatement.setInt(1,userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                int maxpeople = Integer.parseInt(rs.getString("maxPeople"));
                int typeID = rs.getInt("typeId");
                int standardId = Integer.parseInt(rs.getString("standardId"));
                String description = rs.getString("description");
                String status = rs.getString("status");
                String image = rs.getString("image");
                float price = rs.getFloat("price");

                houses.add(new House(id, name, address, maxpeople, typeID, standardId, description, status, image, price));

            }
        } catch (SQLException e) {

        }
        return houses;
    }

    @Override
    public List<User> findUserInBooking(List<Booking> bookingList, int userId) {
        List<User> accounts = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_IN_BOOKING);) {
            preparedStatement.setInt(1,userId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                String email = rs.getString("email");
                String gender = rs.getString("gender");
                String phone = rs.getString("phone");
                String address = rs.getString("address");
                String socialNetwork = rs.getString("socialNetwork");
                String payments = rs.getString("payments");
                accounts.add(new User(id, username, firstname, lastname, gender, email, phone,
                        address, socialNetwork, payments));
            }
        } catch (SQLException e) {

        }
        return accounts;
    }
}

