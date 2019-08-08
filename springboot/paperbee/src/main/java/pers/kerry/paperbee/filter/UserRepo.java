package pers.kerry.paperbee.filter;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 用户信息类：
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:10
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
public class UserRepo {
    private static ThreadLocal<String> session = new ThreadLocal<>();

    public UserRepo(){

    }

    public static void setUid(String uid) {
        session.set(uid);
    }

    public static String getCurrentUser() {
       // return "kerry";
        return session.get() == null ? "anonymous" : session.get();
    }
}
