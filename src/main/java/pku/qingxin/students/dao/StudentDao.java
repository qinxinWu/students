package pku.qingxin.students.dao;

import pku.qingxin.students.bean.Student;


import java.util.List;
import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-15 14:26
 */
public interface StudentDao {

    //返回全部学生
    List<Student> selectStudents();

    //根据学号查询学生
    Student selectStudent(Map<String,Object> map);

    //删除学生（把状态为改成0）
    void deleteStudent(Map<String,Object> map);

    //编辑更新学生
    void updateStudent(Map<String,Object> map);

    //添加学生
    void insertStudent(Map<String,Object> map);






}
