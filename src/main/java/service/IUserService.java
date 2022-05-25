package service;

import models.User;

import java.util.List;

public interface IUserService extends ICRUDService<User> {
    List<User> getList();
     List<User> findAll();
    User findUser(String username);
    User findById(Integer id);

    List<User> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1,
                             String searchKey2, String searchKey3);
     User findByUsername (String username);

}
