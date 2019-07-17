package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import pers.kerry.paperbee.pojo.ArticleComment;

import java.util.List;

@Mapper
public interface ArticleCommentMapper {

    /**
     * 新增 article_comment
     * @param content
     * @param articleId
     * @param user
     */
    @Insert("insert into article_comment(id,article_id,content,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(REPLACE (UUID(), \"-\", \"\"),#{articleId},#{content},1,#{user},now(),#{user},now())")
    public void addArticleComment(@Param("content")String content,@Param("articleId")String articleId,@Param("user")String user);

    /**
     * 根据文章 article_id 查询文章的评论
     * @param articleId
     * @return
     */
    @Select("select * from article_comment where article_id=#{articleId} order by creation_date asc")
    public List<ArticleComment> getCommentsByArticle(@Param("articleId") String articleId);

}
