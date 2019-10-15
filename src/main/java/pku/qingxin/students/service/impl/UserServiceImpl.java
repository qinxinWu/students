package pku.qingxin.students.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pku.qingxin.students.bean.User;
import pku.qingxin.students.dao.UserDao;
import pku.qingxin.students.service.UserService;

import java.util.HashMap;
import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-13 10:48
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public User selectUserByUsername(String username) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        return userDao.selectUserByUsername(map);
    }

    @Override
    public User selectUser(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);

        return userDao.selectUser(map);
    }

    @Override
    public void insertUser(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);

        userDao.insertUser(map);

    }
}
