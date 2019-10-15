package pku.qingxin.students.dao;

import pku.qingxin.students.bean.User;

import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-13 10:46
 */
public interface UserDao {

    User selectUser(Map<String,Object> map);

    void insertUser(Map<String,Object> map);

    User selectUserByUsername(Map<String,Object> map);


}
