package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.*;
import pers.kerry.paperbee.pojo.UserColumn;

import java.util.List;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: user_column 表mapper
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:12
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@Mapper
public interface UserColumnMapper {
    /**
     * 查询当前用户username的所有专栏名称 column_name
     *
     * @param username
     * @return
     */
    @Select("select id,column_name from user_column where username=#{username}")
    List<UserColumn> getColumns(@Param("username") String username);

    /**
     * 新增专栏 column_name
     *
     * @param userColumn
     * @param user
     */
    @Insert("insert into user_column(id,column_name,username,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(#{userColumn.id},#{userColumn.columnName},#{userColumn.username},1,#{user},now(),#{user},now())")
    @SelectKey(statement = "select REPLACE(UUID(),'-','')", keyProperty = "userColumn.id", resultType = String.class, before = true)
    void add(@Param("userColumn") UserColumn userColumn, @Param("user") String user);

    /**
     * 删除 账号为username，id 不在列表范围内的 专栏
     *
     * @param username
     * @param idList
     */
    @DeleteProvider(type = Provider.class, method = "batchDelete")
    void notInDelete(String username, List<String> idList);

    class Provider {
        public String batchDelete(String username, List<String> idList) {
            StringBuilder sb = new StringBuilder();
            sb.append("delete from user_column where username='").append(username).append("' and id not in (");
            for (int i = 0; i < idList.size(); i++) {
                sb.append("'").append(idList.get(i)).append("'");
                if (i < idList.size() - 1) {
                    sb.append(",");
                }
            }
            sb.append(")");
            return sb.toString();
        }
    }

}
