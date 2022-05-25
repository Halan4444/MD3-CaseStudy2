package service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface ICRUDService<T> {
    List<T> findAll();
    void save(T t) throws SQLException;
    boolean update(T t)throws SQLException;
    boolean delete(int id) throws SQLException;
    T findById(int id);


    Map<String, String> save1(T t);
    Map<String, String> update1(T t);
    boolean remove(Integer id);

}
