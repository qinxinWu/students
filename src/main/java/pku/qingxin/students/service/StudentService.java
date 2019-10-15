package pku.qingxin.students.service;

import pku.qingxin.students.bean.Student;

import java.util.List;
import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-15 14:35
 */
public interface StudentService {

    //返回全部学生
    List<Student> selectStudents();

    //根据学号查询学生
    Student selectStudent(String num);


    //删除学生（把状态为改成0）
    void deleteStudent(String num);

    //编辑更新学生
    void updateStudent(String num,String name,String cls,Integer age,String gender);

    //添加学生
    void insertStudent(String num,String name,String cls,Integer age,String gender);

}
