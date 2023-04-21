package com.cc.service;

import com.cc.domain.StudyTime;

import java.util.List;

public interface StudyService {

    Double getOneSumTime(String userAccount);

    List<StudyTime> getTimeSumRankList();
}
