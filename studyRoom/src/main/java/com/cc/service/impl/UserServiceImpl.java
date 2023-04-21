package com.cc.service.impl;

import com.cc.dao.UserDao;
import com.cc.domain.StudyTime;
import com.cc.domain.User;
import com.cc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    public User findUserById(Integer id) {
        return userDao.findUserById(id);
    }

    public String findPasswordByUserAccount(String userAccount) {
        String password = userDao.findPasswordByUserAccount(userAccount);
        return password == null ? "" : password;
    }

//    查询用户名是否存在
    public boolean findUserAccount(String userAccount) {
        if(userDao.findUserByUserAccount(userAccount) == null) return false;
        else return true;
    }

    public User findUserByUserAccount(String userAccount) {
        if(findUserAccount(userAccount)) {
            return userDao.findUserByUserAccount(userAccount);
        } else {
            return null;
        }
    }

//    添加用户
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    public int updateUsername(String userName, String userAccount) {
        return userDao.updateUsername(userName, userAccount);
    }

    public int updateUserProfile(String userProfile, String userAccount) {
        return userDao.updateUserProfile(userProfile, userAccount);
    }

    public int updateUserPassword(String userPassword, String userAccount) {
        return userDao.updateUserPassword(userPassword, userAccount);
    }

    public String getSoup() {
        int sum = userDao.getSoupSum();
        Random random = new Random();
        int soupId = random.nextInt(sum) + 1;
        return userDao.getSoupById(soupId);
    }

    public void addStudyTime(StudyTime studyTime) {
        userDao.addStudyTime(studyTime);
    }

    public List<StudyTime> getStudyTime(String userAccount) {
        return userDao.getStudyTime(userAccount);
    }
}
