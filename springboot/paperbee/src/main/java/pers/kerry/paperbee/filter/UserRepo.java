package pers.kerry.paperbee.filter;

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
