package com.cc.service;

import com.cc.domain.StudyTime;
import com.cc.domain.User;

import java.util.List;

public interface UserService {

    User findUserById(Integer id);

    String findPasswordByUserAccount(String userAccount);

    boolean findUserAccount(String userAccount);

    User findUserByUserAccount(String userAccount);

    int addUser(User user);

    int updateUsername(String userName, String userAccount);

    int updateUserProfile(String profile, String userAccount);

    int updateUserPassword(String userPassword, String userAccount);

    String getSoup();

    void addStudyTime(StudyTime studyTime);

    List<StudyTime> getStudyTime(String userAccount);

}
