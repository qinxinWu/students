package pku.qingxin.students.service;

import pku.qingxin.students.bean.User;

import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-13 10:47
 */
public interface UserService {

    User selectUser(String username,String password);

    void insertUser(String username,String password);

    User selectUserByUsername(String username);
}
