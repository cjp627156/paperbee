package pers.kerry.paperbee.mapper;


import org.apache.ibatis.annotations.*;
import org.springframework.cache.annotation.CacheEvict;
import pers.kerry.paperbee.pojo.Article;
import pers.kerry.paperbee.pojo.ArticleContent;
import pers.kerry.paperbee.pojo.ArticleQueryV;
import java.util.List;


@Mapper
public interface ArticleMapper {

    /**
     * 查询文章（包括全文检索）
     *
     * @param searchContent
     * @param label
     * @param orderBy
     * @param user
     * @return
     */
     List<ArticleQueryV> queryFull(@Param("searchContent") String searchContent, @Param("label") String label,
                                         @Param("orderBy") String orderBy, @Param("user") String user);

    /**
     * 新增文章
     */
    @CacheEvict(value = "Label", key = "'labelMapper.getTopLabels'")
     void addArticle(@Param("article") Article article,@Param("user") String user);

    /**
     * 根据 articleId 获取文章视图
     * @param articleId
     * @return
     */
    @Select("select * from article_query_v where id=#{articleId}")
     ArticleQueryV getArticleQueryVById(@Param("articleId") String articleId) ;



    /**
     * 根据 articleId 获取文章
     * @param articleId
     * @return
     */
    @Select("select * from article where id=#{articleId}")
    public Article getArticleById(@Param("articleId") String articleId) ;

    /**
     * 根据 creator、columnId 查询 文章列表
     * @param creator
     * @return
     */
     List<ArticleQueryV> getArticleByCreator(@Param("creator") String creator,@Param("columnId") String columnId) ;


    /**
     * 查询 作者的文章数量
     * @param user
     * @return
     */
    @Select("SELECT COUNT(1) FROM article t WHERE t.created_by =#{user}")
     int getArticleAmountByUser(@Param("user") String user) ;

    /**
     * 删除文章
     * @param articleId
     */
    @Delete("delete from article where id=#{articleId}")
     void deleteArticle(@Param("articleId") String articleId);

    /**
     * 删除文章正文
     * @param id
     */
    @Delete("delete from article_content where id=#{id}")
     void deleteArticleContent(@Param("id") String id);

    /**
     * 获取 article_content
     * @param id
     * @return
     */
    @Select("select * from article_content where id=#{id}")
     ArticleContent getArticleContentById(@Param("id") String id);

    /**
     * 更新 article_content
     * @param id
     * @param content
     */
    @Update("update article_content set content=#{content} where id=#{id}")
     void updateArticleContent(@Param("id") String id,@Param("content") String content);

    /**
     * 新增 article_content

     */
     void addArticleContent(@Param("articleContent") ArticleContent articleContent,@Param("user") String user);

    /**
     * 更新文章 标题、专栏
     * @param articleId
     * @param title
     * @param columnId
     */
    @Update("update article set title=#{title},column_id=#{columnId} where id=#{articleId}")
     void updateArticleTitle(@Param("articleId") String articleId,@Param("title") String title,@Param("columnId") String columnId);

    /**
     * 新增 文章浏览量
     * @param articleId
     */
    @Insert("insert into article_view(id,article_id,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(REPLACE(UUID(),'-',''),#{articleId},1,#{user},now(),#{user},now())")
     void addArticleView(@Param("articleId") String  articleId,@Param("user")String user);
}
