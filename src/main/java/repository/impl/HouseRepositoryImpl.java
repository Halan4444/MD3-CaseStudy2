package repository.impl;

import models.House;
import models.User;
import repository.BaseRepository;
import repository.IHouseRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class HouseRepositoryImpl implements IHouseRepository {
    private BaseRepository baseRepository = new BaseRepository();
    private static final String SELECT_ALL_HOUSE = "select * from house";

    private static final String INSERT_HOUSE = "insert into house(name,address,maxpeople,typeId," +
            "standardId,description,status," +
            "image,price) " +
            "values (?,?,?,?,?,?,?,?,?);";
    private static final String UPDATE_HOUSE = "update house set name = ?," +
            "address = ?," +
            "maxpeople = ?,typeId = ?,standardId = ?,description = ?," +
            "status = ?,image = ?,price = ? " +
            "where id = ?;";
    private static final String DELETE_HOUSE = "delete from house where id = ?";
    private static final String FIND_HOUSE_BY_ID = "select * from house where id = ?";
    private static final String FIND_HOUSE_BY_NAME = "select*from house where address like ?";


    @Override
    public List<House> findAll() {
        List<House> houses = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HOUSE);) {
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String address = rs.getString("address");
                int maxpeople = Integer.parseInt(rs.getString("maxpeople"));
                int typeID = rs.getInt("typeID");
                int standardId = Integer.parseInt(rs.getString("standardId"));
                String description = rs.getString("description");
                String status = rs.getString("status");
                String image = rs.getString("image");
                float price = rs.getFloat("price");

                houses.add(new House(id,name,address,maxpeople,typeID,standardId,description,status,image,price));

            }
        } catch (SQLException e) {

        }
        return houses;
    }

    @Override
    public House findById(int id) {
        House house = null;
        try(Connection connection = baseRepository.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_HOUSE_BY_ID);) {
            preparedStatement.setInt(1,id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String name = rs.getString("name");
                String address = rs.getString("address");
                int maxpeople = Integer.parseInt(rs.getString("maxpeople"));
                int typeID = rs.getInt("typeID");
                int standardId = Integer.parseInt(rs.getString("standardId"));
                String description = rs.getString("description");
                String status = rs.getString("status");
                String image = rs.getString("image");
                float price = rs.getFloat("price");
                house = new House(id,name,address,maxpeople,typeID,standardId,description,status,image,price);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } return house;
    }

    @Override
    public List<House> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3) {
        List<House> houseList = new ArrayList<>();
        PreparedStatement preparedStatement = null;

        String searchQuery = SELECT_ALL_HOUSE + " WHERE `" + fieldSearch1 + "` LIKE ? " +
                "AND `" + fieldSearch2 + "` LIKE ? " +
                "AND `" + fieldSearch3 + "` LIKE ? ;";
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(searchQuery);
            preparedStatement.setString(1, "%" + searchKey1 + "%");
            preparedStatement.setString(2, "%" + searchKey2 + "%");
            preparedStatement.setString(3, "%" + searchKey3 + "%");

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
                houseList.add(new House(id,name,address,maxpeople,typeID,standardId,description,status,image,price));
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
        return houseList;
    }

    @Override
    public void save(House house) {
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HOUSE)){
            preparedStatement.setString(1,house.getName());
            preparedStatement.setString(2,house.getAddress());
            preparedStatement.setInt(3,house.getMaxPeople());
            preparedStatement.setInt(4,house.getTypeId());
            preparedStatement.setInt(5,house.getStandardId());
            preparedStatement.setString(6,house.getDescription());
            preparedStatement.setString(7,house.getStatus());
            preparedStatement.setString(8,house.getImage());
            preparedStatement.setFloat(9,house.getPrice());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        }
        catch (SQLException e) {

        }
    }

    @Override
    public boolean update(House house) {
        boolean rowUpdated = false;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_HOUSE);) {
            statement.setString(1, house.getName());
            statement.setString(2, house.getAddress());
            statement.setInt(3, house.getMaxPeople());
            statement.setInt(4, house.getTypeId());
            statement.setInt(5, house.getStandardId());
            statement.setString(6, house.getDescription());
            statement.setString(7, house.getStatus());
            statement.setString(8, house.getImage());
            statement.setFloat(9, house.getPrice());
            statement.setInt(10, house.getId());
            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }  return rowUpdated;
    }

    @Override
    public boolean delete(Integer id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_HOUSE);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    @Override
    public boolean remove(Integer id) {
        boolean rowUpdated = false;
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = this.baseRepository.getConnection().prepareStatement(DELETE_HOUSE);
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
    public List<House> findByName(String namesearch) {
        List<House> houses = new ArrayList<>();
        try (Connection connection = baseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(FIND_HOUSE_BY_NAME);) {
            preparedStatement.setString(1, "%" + namesearch + "%");
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

                houses.add(new House(id,name,address,maxpeople,typeID,standardId,description,status,image,price));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return houses;
    }
}
