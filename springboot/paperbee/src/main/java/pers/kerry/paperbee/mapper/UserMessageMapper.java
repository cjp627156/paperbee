package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.UpdateProvider;
import pers.kerry.paperbee.pojo.UserMessage;

import java.util.List;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: user_message 表mapper
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:13
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@Mapper
public interface UserMessageMapper {

    /**
     * 查询个人消息
     * @param user
     * @return
     */
    List<UserMessage> queryMessage(@Param("user")String user);

    /**
     * 查询未读通知消息数量
     * @param user
     * @return
     */
    @Select("select count(1) from user_message where receiver=#{user} and status='unread'")
    int getMsgAmount(@Param("user")String user);

    /**
     * 批量，标识消息为“已读”
     * @param user
     * @param idList
     */
    @UpdateProvider(type = Provider.class,method = "batchRead")
    void readMessageList(String user,List<String>idList);

    class Provider{
        public String batchRead(String user,List<String> idList){
            StringBuilder sb=new StringBuilder();
            sb.append("update user_message set status='read' where receiver='").append(user).append("' and id in (");
            for(int i=0;i<idList.size();i++){
                sb.append("'").append(idList.get(i)).append("'");
                if(i<idList.size()-1){
                    sb.append(",");
                }
            }
            sb.append(")");
            return sb.toString();
        }
    }

    /**
     * 新增消息
     * @param userMessage
     */
    void addMessage(@Param("userMessage")UserMessage userMessage,@Param("user")String user);
}
