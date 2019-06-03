package com.definesys.bees.dao;

import com.definesys.bees.pojo.User;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/3 19:09
 * @history: 1. 2019/1/3 created by yongjie.lin
 */
@Component
public class UserDao {
    @Autowired
    private MpaasQueryFactory sw;

    /**
     * 验证用户名及密码
     *
     * @param user
     * @return
     */
    public Boolean isValid(User user) {
        return sw.buildQuery(User.class)
                .sql("SELECT count(1) rownum FROM user")
                .and()
                .eq("username", user.getUsername())
                .eq("password", user.getPassword())
                .conjuctionOr()
                .and()
                .eq("email", user.getUsername())
                .eq("password", user.getEmail())
                .doQueryFirst(Long.class) > 0;
    }

//    /**
//     * 获取用户的角色
//     *
//     * @param user
//     * @return
//     */
//    public String getRole(User user) {
//        return sw.buildQuery(User.class)
//                .sql("SELECT role_code FROM user")
//                .eq("username", user.getUsername())
//                .doQueryFirst(String.class);
//    }

    public User getUserInfo(String username){
        return sw.buildQuery()
                .eq("username",username)
                .doQueryFirst(User.class);
    }


    public void updateUserInfo(String rowId,User user){
         sw.buildQuery()
                .rowid("id",rowId)
                .update(new String []{"username","password","name","phone","email","signature"})
                .doUpdate(user);
    }

    public void updateIntegral(String user,int integral){
        sw.buildQuery()
                .eq("username",user)
                .update("integral",integral)
                .doUpdate(User.class);
    }

    /**
     * 获取用户的名字
     *
     * @param username
     * @return
     */
    public String getName(String username) {
        return (String)sw.buildQuery(User.class)
                .select("name")
                .eq("username", username)
                .doQueryFirst()
                .get("NAME");
    }

    public List<User> getAllUser(){
      return   sw.buildQuery()
                .doQuery(User.class);
    }
}
