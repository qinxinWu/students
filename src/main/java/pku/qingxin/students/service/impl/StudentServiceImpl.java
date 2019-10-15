package pku.qingxin.students.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pku.qingxin.students.bean.Student;
import pku.qingxin.students.dao.StudentDao;
import pku.qingxin.students.service.StudentService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author qingxin
 * @create 2019-10-15 14:39
 */
@Service
public class StudentServiceImpl implements StudentService {


    @Autowired
    private StudentDao studentDao;

    @Override
    public Student selectStudent(String num) {
        Map<String,Object> map = new HashMap<>();
        map.put("num",num);
        return studentDao.selectStudent(map);
    }

    @Override
    public List<Student> selectStudents() {
        return studentDao.selectStudents();
    }

    @Override
    public void deleteStudent(String num) {
        Map<String,Object> map = new HashMap<>();
        map.put("num",num);
        studentDao.deleteStudent(map);

    }

    @Override
    public void updateStudent(String num, String name, String cls, Integer age, String gender) {
        Map<String,Object> map = new HashMap<>();
        map.put("num",num);
        map.put("name",name);
        map.put("cls",cls);
        map.put("age",age);
        map.put("gender",gender);

        studentDao.updateStudent(map);
    }

    @Override
    public void insertStudent(String num, String name, String cls, Integer age, String gender) {
        Map<String,Object> map = new HashMap<>();
        map.put("num",num);
        map.put("name",name);
        map.put("cls",cls);
        map.put("age",age);
        map.put("gender",gender);

        studentDao.insertStudent(map);
    }
}
