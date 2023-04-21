package com.cc.dao;

import com.cc.domain.StudyTime;

import java.util.List;

public interface StudyDao {

    Double getOneSumTime(String userAccount);

    List<StudyTime> getTimeSumRankList();
}
