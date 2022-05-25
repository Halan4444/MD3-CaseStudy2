package service.impl;

import models.House;
import models.Type;
import repository.ITypeRepository;
import repository.impl.TypeRepositoryImpl;
import service.ITypeService;

import java.sql.SQLException;
import java.util.List;

public class TypeServiceImpl implements ITypeService {
    private ITypeRepository iTypeRepository = new TypeRepositoryImpl();

    @Override
    public List<Type> findAll() {
        return iTypeRepository.findAll();
    }

    @Override
    public Type findTypeById(int id) {
        return iTypeRepository.findTypeById(id);
    }

    @Override
    public List<Type> findAllTypefromHouses(List<House> houses) {
      return   iTypeRepository.findAllTypefromHouses(houses);
    }

}
