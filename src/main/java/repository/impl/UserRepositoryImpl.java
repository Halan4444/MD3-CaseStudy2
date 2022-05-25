package repository.impl;

import models.User;
import repository.BaseRepository;
import repository.IUserRepository;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements IUserRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_USER =
            "SELECT * FROM user";

    private static final String SELECT_USER_BY_ID =
            "SELECT * FROM user\n" +
                    "WHERE id = ?;";

    private static final String INSERT_USER = "INSERT INTO user (`username`,\n" +
            "                      firstname,\n" +
            "                      lastname,\n" +
            "                      gender,\n" +
            "                      dateofbirth,\n" +
            "                      email,\n" +
            "                      phone,\n" +
            "                      address,\n" +
            "                      socialNetwork,\n" +
            "                      payments,\n" +
            "                      role,\n" +
            "                      password)\n" +
            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";

    private static final String UPDATE_USER = "UPDATE user SET `username` = ?,\n" +
            "                      firstname = ?,\n" +
            "                      lastname = ?,\n" +
            "                      gender = ?,\n" +
            "                      dateofbirth = ?,\n" +
            "                      email = ?,\n" +
            "                      phone = ?,\n" +
            "                      address = ?,\n" +
            "                      socialNetwork = ?,\n" +
            "                      payments = ?,\n" +
            "                      role = ? ,\n" +
            "                      password = ?\n" +
            "WHERE id = ?;";

    private static final String DELETE_USER = "DELETE FROM user WHERE id = ?;";

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("select * from user ");) {
            System.out.println(preparedStatement);
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
    public List<User> getList() {
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ALL_USER);
            ResultSet resultSet = preparedStatement.executeQuery();
            Integer id;
            String username;
            LocalDate dateOfBirth;
            String firstname;
            String lastname;
            String phone;
            String email;
            String address;
            String gender;
            String socialNetwork;
            String payment;
            String role;
            String password;
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                username = resultSet.getString("username");
                dateOfBirth = resultSet.getDate("dateofbirth").toLocalDate();
                firstname = resultSet.getString("firstname");
                lastname = resultSet.getString("lastname");
                gender = resultSet.getString("gender");
                phone = resultSet.getString("phone");
                email = resultSet.getString("email");
                address = resultSet.getString("address");
                socialNetwork = resultSet.getString("socialNetwork");
                payment = resultSet.getString("payments");
                role = resultSet.getString("role");
                password = resultSet.getString("password");
                userList.add(new User(id, username, firstname, lastname, gender, dateOfBirth, email, phone,
                        address, socialNetwork, payment,role,password));

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return userList;
    }


    @Override
    public User findById(Integer id) {
        User user = null;
        PreparedStatement preparedStatement = null;

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            String username;
            LocalDate dateOfBirth;
            String firstname;
            String lastname;
            String phone;
            String email;
            String address;
            String gender;
            String socialNetwork;
            String payment;
            String role;
            String password;

            while (resultSet.next()) {
                id = resultSet.getInt("id");
                username = resultSet.getString("username");
                dateOfBirth = resultSet.getDate("dateofbirth").toLocalDate();
                firstname = resultSet.getString("firstname");
                lastname = resultSet.getString("lastname");
                gender = resultSet.getString("gender");
                phone = resultSet.getString("phone");
                email = resultSet.getString("email");
                address = resultSet.getString("address");
                socialNetwork = resultSet.getString("socialNetwork");
                payment = resultSet.getString("payment");
                role = resultSet.getString("role");
                password = resultSet.getString("password");
                user = new User(id, username, firstname, lastname, gender, dateOfBirth, email, phone,
                        address, socialNetwork, payment,role,password);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }

    @Override
    public List<User> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3) {
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        String searchQuery = SELECT_ALL_USER + " WHERE `" + fieldSearch1 + "` LIKE ? " +
                "AND `" + fieldSearch2 + "` LIKE ? " +
                "AND `" + fieldSearch3 + "` LIKE ? ;";

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(searchQuery);
            preparedStatement.setString(1, "%" + searchKey1 + "%");
            preparedStatement.setString(2, "%" + searchKey2 + "%");
            preparedStatement.setString(3, "%" + searchKey3 + "%");

            ResultSet resultSet = preparedStatement.executeQuery();

            Integer id;
            String username;
            LocalDate dateOfBirth;
            String firstname;
            String lastname;
            String phone;
            String email;
            String address;
            String gender;
            String socialNetwork;
            String payment;
            String role;
            String password;
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                username = resultSet.getString("username");
                dateOfBirth = resultSet.getDate("dateofbirth").toLocalDate();
                firstname = resultSet.getString("firstname");
                lastname = resultSet.getString("lastname");
                gender = resultSet.getString("gender");
                phone = resultSet.getString("phone");
                email = resultSet.getString("email");
                address = resultSet.getString("address");
                socialNetwork = resultSet.getString("socialNetwork");
                payment = resultSet.getString("payments");
                role = resultSet.getString("role");
                password = resultSet.getString("password");
                userList.add(new User(id, username, firstname, lastname, gender, dateOfBirth, email, phone,
                        address, socialNetwork, payment,role,password));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert preparedStatement != null;
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return userList;
    }

    @Override
    public void save(User user) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(INSERT_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getFirstname());
            preparedStatement.setString(3, user.getLastname());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setDate(5, Date.valueOf(user.getDateOfBirth()));
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getPhone());
            preparedStatement.setString(8, user.getAddress());
            preparedStatement.setString(9, user.getSocialNetwork());
            preparedStatement.setString(10, user.getPayments());
            preparedStatement.setString(11, user.getRole());
            preparedStatement.setString(12, user.getPassword());
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
    public boolean update(User user) {
        boolean rowUpdated = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(UPDATE_USER);
            preparedStatement.setString(1, user.getUsername());
            preparedStatement.setString(2, user.getFirstname());
            preparedStatement.setString(3, user.getLastname());
            preparedStatement.setString(4, user.getGender());
            preparedStatement.setDate(5, Date.valueOf(user.getDateOfBirth()));
            preparedStatement.setString(6, user.getEmail());
            preparedStatement.setString(7, user.getPhone());
            preparedStatement.setString(8, user.getAddress());
            preparedStatement.setString(9, user.getSocialNetwork());
            preparedStatement.setString(10, user.getPayments());
            preparedStatement.setString(11, user.getRole());
            preparedStatement.setString(12, user.getPassword());
            preparedStatement.setInt(13, user.getId());
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
    public boolean delete(Integer id) throws SQLException {
        return false;
    }

    @Override
    public boolean remove(Integer id) {
        boolean rowUpdated = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_USER);
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
    public User findUser(String username) {
       User user = null;
        PreparedStatement preparedStatement = null;

        String searchQuery = "SELECT * from user where username = ?;";

        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(searchQuery);
            preparedStatement.setString(1,username);
            ResultSet resultSet = preparedStatement.executeQuery();
            Integer id;
            LocalDate dateOfBirth;
            String firstname;
            String lastname;
            String phone;
            String email;
            String address;
            String gender;
            String socialNetwork;
            String payment;
            String role;
            String password;
            while (resultSet.next()) {
                id = resultSet.getInt("id");
                username = resultSet.getString("username");
                dateOfBirth = resultSet.getDate("dateofbirth").toLocalDate();
                firstname = resultSet.getString("firstname");
                lastname = resultSet.getString("lastname");
                gender = resultSet.getString("gender");
                phone = resultSet.getString("phone");
                email = resultSet.getString("email");
                address = resultSet.getString("address");
                socialNetwork = resultSet.getString("socialNetwork");
                payment = resultSet.getString("payments");
                role = resultSet.getString("role");
                password = resultSet.getString("password");
                user = new User(id, username, firstname, lastname, gender, dateOfBirth, email, phone,
                        address, socialNetwork, payment,role,password);
            }
            System.out.println("Co vao khong ?" + user);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                assert preparedStatement != null;
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return user;
    }
}


