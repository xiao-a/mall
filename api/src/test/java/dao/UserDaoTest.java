package dao;

import com.qfmall.ApiApplication;
import com.qfmall.fmmall.dao.UserDao;
import com.qfmall.fmmall.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = ApiApplication.class)
public class UserDaoTest {

    @Resource
    private UserDao userDao;

    @Test
    public void queryUserByName(){
        User user = userDao.queryUserByName("张三");
        System.out.println(user);
    }
}
