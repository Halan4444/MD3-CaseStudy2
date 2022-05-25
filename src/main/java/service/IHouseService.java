package service;

import models.House;

import java.util.List;

public interface IHouseService extends ICRUDService<House>{
    List<House> findAll();

    House findById(int id);

    List<House> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3);

    List<House> findByName(String name);
}
