package service;

import models.House;
import models.Standard;

import java.util.List;

public interface IStandardService {
    List<Standard> findAll();
    Standard findById(int id);
    List<Standard> findAllStandardfromHouses(List<House> houses);
}
