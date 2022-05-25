package service;

import models.House;
import models.Type;

import java.util.List;

public interface ITypeService{
    List<Type> findAll();
    Type findTypeById(int id);
List<Type> findAllTypefromHouses(List<House> houses);
}
