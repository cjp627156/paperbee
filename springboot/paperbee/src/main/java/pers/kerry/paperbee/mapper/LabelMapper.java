package pers.kerry.paperbee.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.cache.annotation.Cacheable;
import pers.kerry.paperbee.pojo.ArticleLabel;
import pers.kerry.paperbee.pojo.Label;

import java.util.List;

@Mapper
public interface LabelMapper {

    /**
     * 获取文章下的标签列表
     *
     * @param articleId
     * @return
     */
    @Select("select label_name from article_label where article_id=#{articleId}")
    List<ArticleLabel> getLabelNameList(@Param("articleId") String articleId);

    /**
     * 获取TOP8技术标签
     *
     * @return
     */
    @Cacheable(value = "Label",key = "'labelMapper.getTopLabels'")
    @Select("select label_name from article_label group by label_name order by count(1) desc limit 0,8")
    List<ArticleLabel> getTopLabels();

    /**
     * 获取所有技术标签
     *
     * @return
     */
    @Cacheable(value = "Label",key = "'labelMapper.getAllLabels'")
    @Select("select id,label_name from label order by label_name asc")
    List<Label> getAllLabels();

    /**
     * 根据 label_name 获取 label_id
     *
     * @param labelName
     * @return
     */
    @Select("select id from label where label_name=#{labelName}")
    String getLabelId(@Param("labelName") String labelName);

    /**
     * mapper.xml
     * 新增 article_label
     */
    @Insert("insert into article_label(id,article_id,label_id,label_name,object_version_number,created_by,creation_date,last_update_by,last_update_date)" +
            "values(REPLACE(UUID(),'-',''),#{articleId},#{labelId},#{labelName},1,#{user},now(),#{user},now())")
    void addArticleLabel(@Param("articleId") String articleId, @Param("labelId") String labelId, @Param("labelName") String labelName, @Param("user") String user);

    /**
     * 根据 article_id 删除 article_label
     *
     * @param articleId
     */
    @Delete("delete from article_label where article_id=#{articleId}")
    void deleteArticleLabelByArticle(@Param("articleId") String articleId);
}
