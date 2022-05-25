package repository;

import java.sql.SQLException;
import java.util.List;

public interface ICRUDRepository<E> {
    List<E> findAll();

    void save(E e);

    boolean update(E e);

    boolean delete(Integer id) throws SQLException;
    boolean remove(Integer id);


}
