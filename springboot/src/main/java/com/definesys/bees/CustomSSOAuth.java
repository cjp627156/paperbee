package com.definesys.bees;

import com.definesys.bees.util.JwtUtil;
import com.definesys.mpaas.common.adapter.IMpaasSSOAuthentication;
import com.definesys.mpaas.common.adapter.UserProfile;
import com.definesys.mpaas.common.exception.MpaasBusinessException;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class CustomSSOAuth implements IMpaasSSOAuthentication {

    @Override
    public UserProfile ssoAuth(Map<String, String> header, Map<String, String> cookies) throws MpaasBusinessException {
        UserProfile user = new UserProfile();
        String token = header.get("token");
        Map<String,String> tokenMap=new HashMap<>();
        try{
            tokenMap= JwtUtil.praseToken(token);
        }catch (RuntimeException e){
            throw new MpaasBusinessException(e.getMessage());//有bug，401抛不出来指定的message
        }
        //你的计算逻辑
        user.setAnonymous(false);
        user.setToken(token);
        user.setUid(tokenMap.get("username"));
        user.setAttributes(tokenMap);
        return user;
    }
}
