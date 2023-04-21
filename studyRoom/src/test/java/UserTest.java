import com.cc.domain.User;
import com.cc.service.UserService;
import com.sun.javaws.IconUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)//让测试运行与Spring测试环境
@ContextConfiguration(locations = "classpath:applicationContext.xml")//设置Spring配置文件或者配置类
public class UserTest {
    @Autowired
    private UserService userService;

    @Test
    public void addUserTest() {
        int t = userService.addUser(new User(null, "zxy111", "123456", null, null, null));
        if(t == 1) System.out.println("添加用户成功");
        else System.out.println("添加用户失败");
    }
}
