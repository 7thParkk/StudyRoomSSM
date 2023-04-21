package com.cc.controller;

import com.cc.domain.EditUser;
import com.cc.domain.StudyTime;
import com.cc.domain.User;
import com.cc.service.UserService;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@SessionAttributes({"user"})
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    //参数是注册页面中提交的
    public String register(@RequestParam("userAccount") String userAccount, @RequestParam("userPassword") String userPassword, @RequestParam("confirmPassword") String confirmPassword, Model model) {
        if(!userService.findUserAccount(userAccount)) {
            //没有找到已存在的用户名，即用户名可用，再检查确认密码是否和密码相同
            if (userPassword.equals(confirmPassword)) {
                model.addAttribute("msg", "注册成功，请返回登录！");
                userService.addUser(new User(null, userAccount, userPassword, null, null, null));
            } else {
                model.addAttribute("msg", "确认密码与密码不符！");
            }
            return "/pages/user/register.jsp";
        } else {
//            用户名已存在
            model.addAttribute("msg", "用户名已存在！");
            return "/pages/user/register.jsp";
        }
    }

    /*
    用户登录
     */
    @PostMapping("/login")
    public String login(User user, Model model) {
        String userAccount = user.getUserAccount();
        User userReal = userService.findUserByUserAccount(userAccount);
        if(userReal.getUserPassword().equals(user.getUserPassword())) {
            //密码正确，登录成功，跳回首页
            model.addAttribute("user", userReal);
//            登录成功的话，user会被当作一个属性扔到session中
            return "/index.jsp";
        } else {
//            密码错误，登陆失败
//            继续停留在登陆页
            model.addAttribute("msg", "用户名或密码错误");
            model.addAttribute("userAccount", userAccount);
//            使用return，是用请求转发的方式跳转到指定页面
            return "/pages/user/login.jsp";
        }
    }

    /*
    退出登录：删除session中保存的用户信息，返回
     */
    @RequestMapping("/logOut")
    public void logOut(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate(); // 销毁会话
    }


//    跳转到用户登录信息页面，和登录是同一个按键，如果未登录，则跳转到登录页面，已登录，则跳转到用户信息页面
    @GetMapping("/loginOrInformation")
    public RedirectView loginOrInformation(HttpServletRequest httpServletRequest) {
        RedirectView redirectView = new RedirectView();
        HttpSession httpSession = httpServletRequest.getSession();
        User user = (User) httpSession.getAttribute("user");
        if(user == null) {
            //用户未登录，跳转到用户登录页面
            redirectView.setUrl("/pages/user/login.jsp");
        } else {
            //用户已登录，跳转到用户信息展示页面
            redirectView.setUrl("/pages/user/userInformation.jsp");
        }
        return redirectView;
    }

    /*
根据id查询用户
 */
    @GetMapping("/findUserById/{id}")
    @ResponseBody
    public User findUserById(@PathVariable("id") Integer id) {
        return userService.findUserById(id);
    }

    /*
    编辑用户信息
     */
    @PostMapping("/edit")
    public String editUserInformation(EditUser editUser, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User t = (User) session.getAttribute("user");
        String userAccount = t.getUserAccount();
        User user = userService.findUserByUserAccount(userAccount);

        //需要修改的信息
        String userName = editUser.getUserName();
        String userPassword = editUser.getUserPassword();
        String confirmPassword = editUser.getConfirmPassword();
        String profile = editUser.getUserProfile();

        if(!confirmPassword.equals("")) {
            //用户想要修改密码，检查password和confirmPassword是否一致
            if(userPassword.equals(confirmPassword)) {
                userService.updateUserPassword(userPassword, userAccount);
            } else {
                //密码不一致
                model.addAttribute("editMsg", "密码与确认密码不一致");
                return "/pages/user/editUserInformation.jsp";
            }
        }

        if(!userName.equals(""))userService.updateUsername(userName,userAccount);
        if(!profile.equals(""))userService.updateUserProfile(profile, userAccount);
        model.addAttribute("editMsg", "提交成功");

        user = userService.findUserByUserAccount(userAccount);
        model.addAttribute("user", user);

        //修改成功之后仍然停留在修改信息页面\
        return "/pages/user/editUserInformation.jsp";
    }
}