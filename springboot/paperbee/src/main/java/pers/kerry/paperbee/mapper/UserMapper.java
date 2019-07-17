package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.*;
import pers.kerry.paperbee.pojo.User;
import pers.kerry.paperbee.pojo.UserIntegralTopV;

import java.util.List;

@Mapper
public interface UserMapper {
    /**
     * 验证用户名及密码
     *
     * @return
     */
    @Select("select count(1) from user where (username=#{username} and password=#{password})or(email=#{username} and password=#{password})")
    @ResultType(Integer.class)
     int isValid(@Param("username") String username,@Param("password") String password) ;

//    当只有一个参数时Mybatis可成功匹配参数
//    当大于一个参数时需要使用注解@Param("XXX")为Mybatis指定参数名称


    /**
     * 根据 username或email获取 用户信息
     * @param username
     * @return
     */
    @Select("select * from user where username=#{username} or email=#{username}")
     User getUserInfo(@Param("username") String username);

    @Update("update user set password=#{user.password},name=#{user.name},phone=#{user.phone},email=#{user.email},signature=#{user.signature} where id=#{user.id}")
     void updateUserInfo(@Param("user") User user);

    @Update("update user set integral=#{integral} where username=#{user}")
     void updateIntegral(@Param("user") String user,@Param("integral") int integral);

    /**
     * 获取用户的名字
     *
     * @param username
     * @return
     */
    @Select("select name from user where username=#{username}")
    @ResultType(String.class)
     String getName(@Param("username") String username) ;

//    @Select("select * from user")
//    public List<User> getAllUser();

    @Select("select * from user_integral_top_v limit 0,#{topsSize}")
     List<UserIntegralTopV> getTopIntegralUser(@Param("topsSize") int topsSize);

    @Select("select username from user")
     List<User> getAllUsername() ;

}
