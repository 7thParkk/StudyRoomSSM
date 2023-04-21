import com.cc.domain.StudyTime;
import com.cc.service.StudyService;
import com.cc.service.UserService;
import com.sun.javaws.IconUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)//让测试运行与Spring测试环境
@ContextConfiguration(locations = "classpath:applicationContext.xml")//设置Spring配置文件或者配置类
public class StudyTimeTest {

    @Autowired
    private UserService userService;

    @Autowired
    private StudyService studyService;
    @Test
    public void getStudyTimeTest() {
        List<StudyTime> studyTimes = userService.getStudyTime("yccUp");

        for(int i = 0; i < studyTimes.size(); i++) {
            System.out.println(studyTimes.get(i));
        }
    }

    @Test
    public void getOneSumTimeTest() {
        double sum = studyService.getOneSumTime("yccUp");
        System.out.println("yccUp的总自习时间为："+sum);
    }

    @Test
    public void getTimeSumRankListTest() {
        List<StudyTime> studyTimeList = studyService.getTimeSumRankList();
        for(int i = 0; i < studyTimeList.size(); i++) {
            System.out.println("用户" + studyTimeList.get(i).getUserAccount() + "的自习总时长为" + studyTimeList.get(i).getMin() + "分钟");
        }
    }
}
