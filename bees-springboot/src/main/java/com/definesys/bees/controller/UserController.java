package com.definesys.bees.controller;

import com.definesys.bees.dao.ArticleDao;
import com.definesys.bees.dao.ArticleLikeDao;
import com.definesys.bees.dao.UserDao;
import com.definesys.bees.pojo.ArticleLike;
import com.definesys.bees.pojo.User;
import com.definesys.mpaas.common.exception.MpaasBusinessException;
import com.definesys.mpaas.common.exception.MpaasRuntimeException;
import com.definesys.mpaas.common.http.Response;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static com.definesys.bees.util.JwtUtil.createToken;
import static com.definesys.mpaas.query.session.MpaasSession.getCurrentUser;

import java.util.List;
import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2018/12/31 23:04
 * @history: 1. 2018/12/31 created by yongjie.lin
 */

@RestController
@RequestMapping("/bees/user")
public class UserController {
    private final static int ARTICLE_WEIGHT=5;
    private final static int LIKE_WEIGHT=1;

    @Autowired
    UserDao userDao;
    @Autowired
    ArticleLikeDao articleLikeDao;
    @Autowired
    ArticleDao articleDao;

    /**
     * 登陆
     *
     * @param request
     * @return
     */
    @RequestMapping(path = "/login", method = RequestMethod.POST)
    public Response login(@RequestBody Map<String, Object> request) {
        String username = (String) request.get("username");
        String password = (String) request.get("password");
        String token = null;
        if (username != null && password != null) {
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            if (userDao.isValid(user)) {
                try {
                    User userInfo=userDao.getUserInfo(username);
                    token = createToken(username,userInfo.getName(), userInfo.getRoleCode());
                } catch (Exception e) {
                    e.printStackTrace();
                    throw new MpaasRuntimeException(e);
                }
            } else {
                throw new MpaasBusinessException("验证失败，请检查用户名、密码是否正确！");
            }
        } else {
            throw new MpaasBusinessException("用户名、密码不能为空，请检查后重试！");
        }
        return Response.ok().set("token", token);
    }

    @RequestMapping(path="/getSelfInfo",method = RequestMethod.GET)
    public Response getSelfInfo(){
        User user=userDao.getUserInfo(getCurrentUser());
        return Response.ok().data(user);
    }

    @RequestMapping(path = "/updateSelfInfo",method = RequestMethod.POST)
    public Response updateSelfInfo(@RequestBody Map<String,Object>request){
        String rowId=(String)request.get("rowId");
        String username=(String)request.get("username");
        String password=(String)request.get("password");
        String name=(String)request.get("name");
        String phone=(String)request.get("phone");
        String email=(String)request.get("email");
        String signature=(String)request.get("signature");
        User user=new User(username,password,name,phone,email,signature);
        userDao.updateUserInfo(rowId,user);
        return Response.ok();
    }

    private void updateIntegralByUser(String user){
        int articleCount=articleDao.getArticleAmountByUser(user);
        int likeCount=articleLikeDao.getLikeAmountByUser(user);
        int integral=ARTICLE_WEIGHT*articleCount+LIKE_WEIGHT*likeCount;
        userDao.updateIntegral(user,integral);
    }



}
