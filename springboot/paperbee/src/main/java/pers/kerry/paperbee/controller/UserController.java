package pers.kerry.paperbee.controller;

import com.github.pagehelper.PageHelper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;
import pers.kerry.paperbee.common.EmailClient;
import pers.kerry.paperbee.common.PageQueryResult;
import pers.kerry.paperbee.mapper.UserColumnMapper;
import pers.kerry.paperbee.mapper.UserMapper;
import pers.kerry.paperbee.mapper.UserMessageMapper;
import pers.kerry.paperbee.pojo.EmailBean;
import pers.kerry.paperbee.pojo.User;
import pers.kerry.paperbee.common.Response;
import pers.kerry.paperbee.pojo.UserColumn;
import pers.kerry.paperbee.pojo.UserMessage;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static pers.kerry.paperbee.common.JwtUtil.createToken;
import static pers.kerry.paperbee.filter.UserRepo.getCurrentUser;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 用户相关的Controller
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:06
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@RestController
@RequestMapping("/paperbee/user")
public class UserController {
    @Resource
    private UserMapper userMapper;
    @Resource
    private UserColumnMapper userColumnMapper;
    @Resource
    private UserMessageMapper userMessageMapper;
    @Resource
    private EmailClient emailClient;

    /**
     * 登录
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
            if (userMapper.isValid(username, password) > 0) {
                try {
                    User userInfo = userMapper.getUserInfo(username);
                    token = createToken(userInfo.getUsername(), userInfo.getName(), userInfo.getRoleCode());
                } catch (Exception e) {
                    e.printStackTrace();
                    return Response.error("系统异常，请稍后再试");
                }
            } else {
                return Response.error("登录失败，请检查用户名/密码");
            }
        } else {
            return Response.error("用户名/密码不能为空");
        }
        return Response.ok().set("token", token);
    }

    /**
     * 获取自己的个人信息
     *
     * @return
     */
    @RequestMapping(path = "/getSelfInfo", method = RequestMethod.GET)
    public Response getSelfInfo() {
        User user = userMapper.getUserInfo(getCurrentUser());
        return Response.ok().data(user);
    }

    /**
     * 更新用户信息
     *
     * @param request
     * @return
     */
    @RequestMapping(path = "/updateSelfInfo", method = RequestMethod.POST)
    public Response updateSelfInfo(@RequestBody Map<String, Object> request) {
        String id = (String) request.get("id");
        String password = (String) request.get("password");
        String name = (String) request.get("name");
        String phone = (String) request.get("phone");
        String email = (String) request.get("email");
        String signature = (String) request.get("signature");
        List<Map<String, String>> columnList = (ArrayList<Map<String, String>>) request.get("columnList");
        //更新用户信息
        User user = new User(id, getCurrentUser(), password, name, phone, email, signature);
        userMapper.updateUserInfo(user);
        //更新专栏信息
        //1、多的（新增） 2、少的（删除）
        List<String> idList = new ArrayList<>();
        for (Map<String, String> columnMap : columnList) {
            String columnId = columnMap.get("id");
            String columnName = columnMap.get("columnName");
            if ("add".equals(columnId)) {
                UserColumn userColumn = new UserColumn();
                userColumn.setColumnName(columnName);
                userColumn.setUsername(getCurrentUser());
                userColumnMapper.add(userColumn, getCurrentUser());
                idList.add(userColumn.getId());
            } else {
                idList.add(columnId);
            }
        }
        userColumnMapper.notInDelete(getCurrentUser(), idList);
        return Response.ok();
    }

    /**
     * 获取专栏列表
     *
     * @return
     */
    @RequestMapping(path = "/getColunmList", method = RequestMethod.GET)
    public Response getColunmList() {
        return Response.ok().data(userColumnMapper.getColumns(getCurrentUser()));
    }

    /**
     * 查询 积分排名前十 账号
     *
     * @return
     */
    @RequestMapping(path = "/getTopIntegralUser", method = RequestMethod.GET)
    public Response getTopIntegralUser() {
        return Response.ok().data(userMapper.getTopIntegralUser(10));
    }

    /**
     * 通知中心-消息列表
     * @param request
     * @return
     */
    @RequestMapping(path = "/getCenterMessage",method = RequestMethod.POST)
    public Response getNotifyCenterAll(@RequestBody Map<String, Object> request){
        Integer page = (Integer) request.get("page");
        Integer pageSize = (Integer) request.get("pageSize");
        PageHelper.startPage(page,pageSize,true);
        PageQueryResult<UserMessage> pageQueryResult=new PageQueryResult<>( userMessageMapper.queryMessage(getCurrentUser()));
        return Response.ok().data(pageQueryResult);
    }

    /**
     * 通知中心-未读消息数量
     * @return
     */
    @RequestMapping(path = "/getCenterMsgAmount",method = RequestMethod.GET)
    public Response getCenterMsgAmount(){
      int msgAmount=  userMessageMapper.getMsgAmount(getCurrentUser());
      Map<String,Integer> dataMap=new HashMap<>();
      dataMap.put("msgAmount",msgAmount);
      return Response.ok().data(dataMap);
    }

    /**
     * 通知中心-标识消息为已读
     * @param request
     * @return
     */
    @RequestMapping(path = "/readCenterMessage",method = RequestMethod.POST)
    public Response readCenterMessage(@RequestBody List<String> request){
       userMessageMapper.readMessageList(getCurrentUser(),request);
        return Response.ok();
    }

    @RequestMapping(path = "/loadUserByUsername",method = RequestMethod.GET)
    public String loadUserByUsername(@RequestParam("username")String username){
        User user = userMapper.getUserInfo(username);
        return user.getPassword();
    }

    @RequestMapping(path = "/sendEmail",method = RequestMethod.GET)
    public Response sendEmail() throws Exception{
        EmailBean emailBean=new EmailBean();
        emailBean.setContent("test");
        emailBean.setSubject("纸蜂博客-消息通知");
        emailBean.setRecipient("kerry.wu@definesys.com");
        emailClient.sendSimpleMail(emailBean);
        return Response.ok();
    }



}
