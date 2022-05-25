package repository;

import models.House;

import java.sql.SQLException;
import java.util.List;

public interface IHouseRepository extends ICRUDRepository<House>{
    List<House> findAll();

    House findById(int id);

    List<House> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3);

    boolean delete(Integer id) throws SQLException;

    List<House> findByName(String name);
}
