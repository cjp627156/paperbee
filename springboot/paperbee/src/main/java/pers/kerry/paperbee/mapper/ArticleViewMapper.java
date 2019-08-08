package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: article_view表mapper
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:12
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@Mapper
public interface ArticleViewMapper {

    /**
     * 新增 article_like
     * @param articleId
     * @param user
     */
    @Insert("insert into article_like(id,article_id,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(REPLACE (UUID(), \"-\", \"\"),#{articleId},1,#{user},now(),#{user},now())")
    public void addArticleView(@Param("articleId") String articleId, @Param("user") String user);

}
