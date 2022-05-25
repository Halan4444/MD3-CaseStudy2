package service.impl;

import models.User;
import repository.IUserRepository;
import repository.impl.UserRepositoryImpl;
import service.IUserService;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserServiceImpl implements IUserService {
    private IUserRepository iUserRepository = new UserRepositoryImpl();

//    private static final String PHONE_REGEX = "^(090|091|\\(84\\)90|\\(84\\)91)\\d{7}$";
//    private static final String EMAIL_REGEX = "^\\w+([\\.-]?\\w+)*@[a-z]+\\.(\\w+)(\\.\\w{2,3})?";

    private Map<String, String> validate(User user) {
        Map<String, String> map = new HashMap<>();
//        if (user.getUsername() == null) {
//            map.put("username", "Username can't empty");
//        }
//        if (!user.getPhone().matches(PHONE_REGEX)) {
//            map.put("phone", "Phone is begin with 090 or 091 or (84)...");
//        }
//        if (!user.getEmail().matches(EMAIL_REGEX)) {
//            map.put("email", "Email invalid");
//        }
//        if (user.getFirstname() == null) {
//            map.put("firstname", "Firstname can't empty !");
//        }
//        if (user.getLastname() == null) {
//            map.put("lastname", "Lastname can't empty !");
//        }
        return map;
    }

    @Override
    public Map<String, String> save1(User user) {
        Map<String, String> map = validate(user);
        if (map.isEmpty()) {
            iUserRepository.save(user);
        }
        return map;
    }

    @Override
    public Map<String, String> update1(User user) {

        Map<String, String> map = validate(user);
        if (map.isEmpty()) {
            boolean checkUpdate = iUserRepository.update(user);
            if (!checkUpdate) {
                map.put("message", "Something's wrong, can't update!");
            }
        }
        return map;
    }

    @Override
    public boolean remove(Integer id) {
        return iUserRepository.remove(id);
    }

    @Override
    public List<User> getList() {

        return iUserRepository.getList();
    }

    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void save(User user) throws SQLException {

    }

    @Override
    public boolean update(User user) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(int id) throws SQLException {
        return false;
    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public User findById(Integer id) {
        return iUserRepository.findById(id);
    }

    @Override
    public List<User> search(String fieldSearch1, String fieldSearch2, String fieldSearch3, String searchKey1, String searchKey2, String searchKey3) {
        return iUserRepository.search(fieldSearch1, fieldSearch2, fieldSearch3, searchKey1, searchKey2, searchKey3);
    }

    @Override
    public User findUser(String username) {
        return iUserRepository.findUser(username);
    }

    @Override
    public User findByUsername (String username){
        for (int i =0; i<iUserRepository.findAll().size();i++){
            if (username.equals(iUserRepository.findAll().get(i).getUsername())) {
                return iUserRepository.findAll().get(i);
            }
        }
        return null;
    }

}
