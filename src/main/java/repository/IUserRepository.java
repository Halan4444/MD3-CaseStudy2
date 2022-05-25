package repository;

import models.User;

import java.util.List;

public interface IUserRepository extends ICRUDRepository<User> {
    public List<User> findAll();
    User findUser(String username);

    List<User> getList();

    User findById(Integer id);

    List<User> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3);
}