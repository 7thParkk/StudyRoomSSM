package com.cc.controller;

import com.cc.domain.StudyTime;
import com.cc.domain.User;
import com.cc.service.StudyService;
import com.cc.service.UserService;
import com.cc.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class StudyController {

    @Autowired
    private UserService userService;

    @Autowired
    private StudyService studyService;

    @GetMapping("/getSoup")
    @ResponseBody
    public String getSoup(HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        if (httpSession.getAttribute("user") == null) {
            return "您还未登录~";
        } else {
            return userService.getSoup();
        }
    }

    @PostMapping("/addStudyTime")
    public void addStudyTime(@RequestBody StudyTime studyTime, HttpServletRequest request) {
        HttpSession httpSession = request.getSession();
        if(httpSession.getAttribute("user") == null) return;

        User user = (User)httpSession.getAttribute("user");
        studyTime.setUserAccount(user.getUserAccount());
        userService.addStudyTime(studyTime);
    }

    /*
    以列表形式返回一个用户的所有自习记录
     */
    @GetMapping("/getStudyTime")
    @ResponseBody
    public List<StudyTime> getStudyTime(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            return null;
        } else {
            return userService.getStudyTime(user.getUserAccount());
        }
    }


    /**
     * 返回一个用户的自习总时长
     * @param request
     * @return 返回-1.0，说明用户未登录
     */
    @GetMapping("/getOneSumTime")
    @ResponseBody
    public Double getOneSumTime(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if(user == null) {
            return -1.0;
            //返回-1.0说明用户还未登录，前端判断总时间是否小于0，来判断用户是否登录
        } else {
            return studyService.getOneSumTime(user.getUserAccount());
        }
    }

    /**
     * 以列表形式返回每个用户的自习总时长，按照自习时间从大到小排列
     * @return List
     */
    @GetMapping("/getTimeSumRankList")
    @ResponseBody
    public List<StudyTime> getTimeSumRankList() {
        List<StudyTime> list = studyService.getTimeSumRankList();
        return list;
    }
}
