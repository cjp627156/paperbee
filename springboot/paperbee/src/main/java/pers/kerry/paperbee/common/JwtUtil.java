package pers.kerry.paperbee.common;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.Claim;
import com.auth0.jwt.interfaces.DecodedJWT;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: jwt工具类
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:08
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
public class JwtUtil {
    private static String SECRET = "cacb2e1e07ff4de2856583ffcb46e751";
    //private static String SECRET ="defineSysJwtSigningKey";

    /**
     * 创建JWT的token
     *
     * @return
     * @throws Exception
     */
    public static String createToken(String username,String name, String role) throws Exception {
        //签发日期
        Date issDate = new Date();
        Calendar currentTime = Calendar.getInstance();
        currentTime.add(Calendar.YEAR, 3);
        //过期日期，3年后
        Date expDate = currentTime.getTime();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("alg", "HS256");
        map.put("typ", "JWT");
        String token = JWT.create()
                .withHeader(map)
                .withClaim("username", username)
                .withClaim("name",name)
                .withClaim("role", role)
                .withIssuedAt(issDate)
                .withExpiresAt(expDate)
                .sign(Algorithm.HMAC256(SECRET));
        return token;
    }

    public static Map<String, String> praseToken(String token)  {
        Map<String, String> map = new HashMap<String, String>();
        try {
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(SECRET)).build();
            DecodedJWT jwt = jwtVerifier.verify(token);
            Map<String, Claim> claimMap = jwt.getClaims();
            map.put("username", claimMap.get("username").asString());
        }catch (Exception e){
            throw new RuntimeException("auth failed");
        }
        return map;
    }

    public static void main(String[] args) {
        try {
            String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NDEzOTQyMzAsImlhdCI6MTU0NjY5OTgzMCwidXNlcm5hbWUiOiIxIn0.xWs4A0g9YK9fSocgbtsXSDtDrt34_a4_z_74Sj-J76U";
            try {
                Map<String,String> map=praseToken(token);
                System.out.println(map.get("username"));
            }catch (RuntimeException e){
                System.out.println(e.getMessage());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
