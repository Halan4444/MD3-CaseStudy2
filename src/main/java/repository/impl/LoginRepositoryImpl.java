package repository.impl;

import models.Account;
import repository.BaseRepository;
import repository.ILoginRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginRepositoryImpl implements ILoginRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ACCOUNT = "SELECT id, username, password, lastname, role from user where (username = ? and password =?);";
    @Override
    public Account chekLogin(String username, String password) {
        Account account = null;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(SELECT_ACCOUNT);
            preparedStatement.setString(1,username);
            preparedStatement.setString(2,password);
            ResultSet resultSet = preparedStatement.executeQuery();
            Integer id;
            String usernameData;
            String passwordData;
            String nameData;
            String role;
            while (resultSet.next()){
                id = resultSet.getInt("id");
                usernameData = resultSet.getString("username");
                passwordData = resultSet.getString("password");
                nameData = resultSet.getString("lastname");
                role = resultSet.getString("role");
                account = new Account(id,usernameData,passwordData,nameData,role);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }finally {
            try {
                preparedStatement.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return account;
    }
}
