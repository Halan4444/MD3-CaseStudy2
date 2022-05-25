package repository;

import models.House;
import models.Standard;

import java.util.List;

public interface IStandardRepository {
    List<Standard> findAll();

    Standard findById(int id);

    List<Standard> findAllStandardfromHouses(List<House> houses);
}
