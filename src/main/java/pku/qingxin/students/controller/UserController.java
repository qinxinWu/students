package pku.qingxin.students.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pku.qingxin.students.bean.User;
import pku.qingxin.students.service.UserService;

import javax.servlet.http.HttpSession;

/**
 * @author qingxin
 * @create 2019-10-13 10:51
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/query")
    public String query(){
        return "query";
    }

    @RequestMapping("/login")
    public String login(String username, String password, Model model, HttpSession httpSession){
        User user=userService.selectUser(username,password);
        if(user!=null){
            return "main";
        }else{
            String errMsg="用户名/密码为空或错误!";
            httpSession.setAttribute("errMsg",errMsg);
            return "redirect:/login.jsp";
        }
    }

    @RequestMapping("/register")
    public String register(String username, String password, Model model, HttpSession httpSession){
        userService.insertUser(username,password);
        return "redirect:/login.jsp";
    }

    @ResponseBody
    @RequestMapping("/checkUsername")
    public String checkUsername(String username){
        //System.out.print(username);

        User user=userService.selectUserByUsername(username);

        //System.out.print(user);

        String check="0";
        if (user==null){
            check="1";
        }
        return check;
    }



}
