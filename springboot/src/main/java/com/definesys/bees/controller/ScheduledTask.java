package com.definesys.bees.controller;

import com.definesys.bees.dao.ArticleDao;
import com.definesys.bees.dao.ArticleLikeDao;
import com.definesys.bees.dao.UserDao;
import com.definesys.bees.pojo.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class ScheduledTask {
    private final static int ARTICLE_WEIGHT=5;
    private final static int LIKE_WEIGHT=1;

    @Autowired
    UserDao userDao;
    @Autowired
    ArticleLikeDao articleLikeDao;
    @Autowired
    ArticleDao articleDao;
    /**
     * 更新所有用户的积分（蜂蜜）
     * 定时调度：每天凌晨4点更新
     */
    @Scheduled(cron ="0 0 4 * * *")
    public void updateUsersIntegral(){
        List<User> userList=userDao.getAllUser();
        for(User user:userList){
            String username=user.getUsername();
            int articleCount=articleDao.getArticleAmountByUser(username);
            int likeCount=articleLikeDao.getLikeAmountByUser(username);
            int integral=ARTICLE_WEIGHT*articleCount+LIKE_WEIGHT*likeCount;
            userDao.updateIntegral(username,integral);
        }
    }
}
