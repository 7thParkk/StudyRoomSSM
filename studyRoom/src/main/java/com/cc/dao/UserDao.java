package com.cc.dao;

import com.cc.domain.StudyTime;
import com.cc.domain.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {

    User findUserById(Integer id);
    String findPasswordByUserAccount(String userAccount);

    User findUserByUserAccount(String userAccount);

    int addUser(User user);

    int updateUsername(@Param("userName") String userName, @Param("userAccount") String userAccount);

    int updateUserProfile(@Param("userProfile") String userProfile,@Param("userAccount") String userAccount);

    int updateUserPassword(String userPassword, String userAccount);

    int getSoupSum();

    String getSoupById(int soupId);

    int addStudyTime(StudyTime studyTime);

    List<StudyTime> getStudyTime(String userAccount);
}
