package repository;

import models.House;
import models.Type;

import java.util.List;

public interface ITypeRepository {
    List<Type> findAll();

    Type findTypeById(int id);

    List<Type> findAllTypefromHouses(List<House> houses);
}
