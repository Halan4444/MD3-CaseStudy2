package repository.impl;

import models.House;
import models.Type;
import repository.BaseRepository;
import repository.ITypeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TypeRepositoryImpl implements ITypeRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_TYPE = "select * from type";
    private static final String SELECT_TYPE_BY_ID = "select * from type where id = ?";
    private static final String SELECT_ALL_TYPE_WITH_HOUSE_LIST = "select * from type join house on house.typeId = type.id";

    @Override
    public List<Type> findAll() {
        List<Type> types = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("type");
                types.add(new Type(id,name));

            }
        } catch (SQLException e) {

        }
        return types;
    }

    @Override
    public Type findTypeById(int id) {
        Type type = null;
        try(Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TYPE_BY_ID);) {
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("type");
                type = new Type(id,name);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return type;
    }

    @Override
    public List<Type> findAllTypefromHouses(List<House> houses) {
        List<Type> types = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();

             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE_WITH_HOUSE_LIST);) {
            System.out.println(preparedStatement);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("type");
                types.add(new Type(id,name));
            }
        } catch (SQLException e) {

        }
        return types;
    }
}
