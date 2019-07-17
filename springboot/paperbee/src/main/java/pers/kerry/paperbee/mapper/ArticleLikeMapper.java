package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.*;

@Mapper
public interface ArticleLikeMapper {

    /**
     * 新增 article_like
     *
     * @param articleId
     * @param user
     */
    @Insert("insert into article_like(id,article_id,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(REPLACE (UUID(), \"-\", \"\"),#{articleId},1,#{user},now(),#{user},now())")
    public void addArticleLike(@Param("articleId") String articleId, @Param("user") String user);

    /**
     * 查询 user 在 当前文章的点赞数
     * @param articleId
     * @param user
     * @return
     */
    @Select("select count(1) from article_like where article_id=#{articleId} and created_by=#{user}")
    public int getUserLikeAmount(@Param("articleId") String articleId,@Param("user") String user);

    /**
     * 删除 user 对 当前文章的点赞
     * @param articleId
     * @param user
     */
    @Delete("delete from article_like where article_id=#{articleId} and created_by=#{user}")
    public void deleteLikeByUser(@Param("articleId") String articleId,@Param("user") String user);

    /**
     * 查询 user 的历史 被点赞数
     * @param user
     * @return
     */
    @Select("SELECT COUNT(1) AS amount FROM ( SELECT l.id,a.created_by FROM article_like l LEFT JOIN article a ON l.article_id = a.id ) t WHERE t.created_by =#{user}")
    public int getLikeAmountByUser(@Param("user") String user);


}
