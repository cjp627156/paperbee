package pers.kerry.paperbee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import pers.kerry.paperbee.common.Response;
import pers.kerry.paperbee.mapper.ArticleLikeMapper;
import pers.kerry.paperbee.mapper.ArticleMapper;
import pers.kerry.paperbee.mapper.UserMapper;
import pers.kerry.paperbee.pojo.User;

import javax.annotation.Resource;
import java.util.List;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 定时调度
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:09
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@RestController
@RequestMapping("/scheduler")
public class ScheduledTask {
    private final static int ARTICLE_WEIGHT=5;
    private final static int LIKE_WEIGHT=1;

    @Resource
    private UserMapper userMapper;
    @Resource
    private ArticleLikeMapper articleLikeMapper;
    @Resource
    private ArticleMapper articleMapper;
    /**
     * 更新所有用户的积分（蜂蜜）
     * 定时调度：每天凌晨4点更新
     */
    @Scheduled(cron ="0 0 4,12,18 * * *")
    @RequestMapping(path = "/updateIntegral", method = RequestMethod.GET)
    public Response updateUsersIntegral(){
        List<User> userList=userMapper.getAllUsername();
        for(User user:userList){
            String username=user.getUsername();
            int articleCount=articleMapper.getArticleAmountByUser(username);
            int likeCount=articleLikeMapper.getLikeAmountByUser(username);
            int integral=ARTICLE_WEIGHT*articleCount+LIKE_WEIGHT*likeCount;
            userMapper.updateIntegral(username,integral);
        }
        return Response.ok();
    }
}
