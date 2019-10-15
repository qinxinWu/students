package pku.qingxin.students.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import pku.qingxin.students.bean.Student;
import pku.qingxin.students.service.StudentService;

import java.util.List;

/**
 * @author qingxin
 * @create 2019-10-15 10:57
 */
@Controller
public class StudentController {
    @Autowired
    StudentService studentService;

    //跳转到欢迎页
    @RequestMapping("/wel")
    public String wel(){
        return "main";
    }

    //跳转到学生信息列表
    @RequestMapping("/view")
    public String view(Model model){
        List<Student> students = studentService.selectStudents();
        model.addAttribute("students",students);

        return "tables";
    }

    //跳转到添加页面
    @RequestMapping("/addPage")
    public String addPage(){
        return "add";
    }


    //编辑后提交
    @RequestMapping("/editPage/edit")
    public String edit(String num,String name,String cls,String age,String gender){
        studentService.updateStudent(num,name,cls,Integer.parseInt(age),gender);
        return "redirect:/view";
    }




    //添加后提交
    @RequestMapping("/add")
    public String add(String num,String name,String cls,String age,String gender){
        studentService.insertStudent(num,name,cls,Integer.parseInt(age),gender);
        return "redirect:/view";
    }


    //删除学生
    @RequestMapping("/delete/{num}")
    public String delete(@PathVariable("num") String num){
        studentService.deleteStudent(num);
        return "redirect:/view";
    }

    //跳转到编辑页面
    @RequestMapping("/editPage/{num}")
    public String editPage(@PathVariable("num") String num,Model model){
        Student student=studentService.selectStudent(num);
        model.addAttribute("student",student);

        return "edit";
    }








}
