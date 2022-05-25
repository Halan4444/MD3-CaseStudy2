package repository.impl;

import models.House;
import models.Standard;
import repository.BaseRepository;
import repository.IStandardRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StandardRepositoryImpl implements IStandardRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_STANDARD = "select * from standard";
    private static final String SELECT_ALL_STANDARD_BY_ID = "select * from standard where id = ?";
    private static final String SELECT_ALL_STANDARD_WITH_HOUSE = "select * from standard join house on house.standardId = standard.id;";

    @Override
    public List<Standard> findAll() {
        List<Standard> standards = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STANDARD);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("standard");
                standards.add(new Standard(id,name));
            }
        } catch (SQLException e) {

        }
        return standards;
    }

    @Override
    public Standard findById(int id) {
        Standard standard = null;
        try(Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STANDARD_BY_ID);) {
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("standard");
                standard = new Standard(id,name);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return standard;
    }

    @Override
    public List<Standard> findAllStandardfromHouses(List<House> houses) {
        List<Standard> standards = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_STANDARD_WITH_HOUSE);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("standard");
                standards.add(new Standard(id,name));
            }
        } catch (SQLException e) {

        }
        return standards;
    }
}
