package com.cc.service.impl;

import com.cc.dao.StudyDao;
import com.cc.dao.UserDao;
import com.cc.domain.StudyTime;
import com.cc.service.StudyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudyServiceImpl implements StudyService {

    @Autowired
    private UserDao userDao;

    @Autowired
    private StudyDao studyDao;

    public Double getOneSumTime(String userAccount) {
        return studyDao.getOneSumTime(userAccount);
    }

    public List<StudyTime> getTimeSumRankList() {
        return studyDao.getTimeSumRankList();
    }
}
