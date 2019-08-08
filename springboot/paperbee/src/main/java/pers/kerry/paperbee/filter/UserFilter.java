package pers.kerry.paperbee.filter;

import org.springframework.stereotype.Component;
import pers.kerry.paperbee.common.JwtUtil;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 过滤器：token校验
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:10
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@Component
public class UserFilter implements Filter {

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpServletRequest=(HttpServletRequest)servletRequest;
        String token=httpServletRequest.getHeader("token");

        try{
            Map<String,String>  tokenMap= JwtUtil.praseToken(token);
            UserRepo.setUid(tokenMap.get("username"));
        }catch (RuntimeException e){
          //  e.printStackTrace();
        }finally {
            filterChain.doFilter(servletRequest,servletResponse);
        }

    }

}
