package com.definesys.bees.util;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/1 0:03
 * @history: 1. 2019/1/1 created by yongjie.lin
 */

public class JwtUtil {

    private static String SECRET = "cacb2e1e07ff4de2856583ffcb46e751";

    /**
     * 创建JWT的token
     *
     * @return
     * @throws Exception
     */
    public static String createToken(String username) throws Exception {
        Date issDate = new Date();//签发日期
        Calendar currentTime = Calendar.getInstance();
        currentTime.add(Calendar.YEAR, 3);
        Date expDate = currentTime.getTime();//过期日期，3年后
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        String token = JWT.create()
                .withHeader(map)
                .withClaim("username", username)
                .withIssuedAt(issDate)
                .withExpiresAt(expDate)
                .sign(Algorithm.HMAC256(SECRET));
        return token;
    }

}
