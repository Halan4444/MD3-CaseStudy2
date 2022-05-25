package service.impl;

import models.House;
import models.Standard;
import repository.IStandardRepository;
import repository.impl.StandardRepositoryImpl;
import service.IStandardService;

import java.util.List;

public class StandardServiceImpl implements IStandardService {
    private IStandardRepository iStandardRepository = new StandardRepositoryImpl();
    @Override
    public List<Standard> findAll() {
        return iStandardRepository.findAll();
    }

    @Override
    public Standard findById(int id) {
        return iStandardRepository.findById(id);
    }

    @Override
    public List<Standard> findAllStandardfromHouses(List<House> houses) {
      return   iStandardRepository.findAllStandardfromHouses(houses);
    }
}
