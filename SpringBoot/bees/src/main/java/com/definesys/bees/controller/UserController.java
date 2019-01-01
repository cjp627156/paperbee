package com.definesys.bees.controller;

import com.definesys.bees.pojo.User;
import com.definesys.mpaas.common.exception.MpaasBusinessException;
import com.definesys.mpaas.common.exception.MpaasRuntimeException;
import com.definesys.mpaas.common.http.Response;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import static com.definesys.bees.util.JwtUtil.createToken;

import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2018/12/31 23:04
 * @history: 1. 2018/12/31 created by yongjie.lin
 */

@RestController
@RequestMapping("/bees/comm")
public class UserController {

    @Autowired
    private MpaasQueryFactory sw;

    @RequestMapping(path = "/test",method = RequestMethod.GET)
    public Response test(){
        return  Response.ok().data("Hello 2019!");
    }

    /**
     * 更新
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
            if (isValid(user)) {
                try {
                    token = createToken(username);
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

    public Boolean isValid(User user) {
        return (Long)sw.buildQuery()
                .sql("SELECT count(1) rownum FROM user")
                .eq("username", user.getUsername())
                .eq("password", user.getPassword())
                .doQueryFirst()
                .get("rownum") > 0;
    }

}
