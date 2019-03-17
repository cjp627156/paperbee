package com.definesys.bees.dao;

import com.definesys.bees.pojo.ArticleLabel;
import com.definesys.bees.pojo.Label;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/3 21:23
 * @history: 1. 2019/1/3 created by yongjie.lin
 */

@Component
public class LabelDao {
    @Autowired
    private MpaasQueryFactory sw;

    /**
     * 获取文章下的标签列表
     *
     * @param articleId
     * @return
     */
    public List<ArticleLabel> getLabelNameList(String articleId) {
        return sw.buildQuery()
                .sql("SELECT l.label_name FROM article_label l")
                .eq("articleId", articleId)
                .doQuery(ArticleLabel.class);
    }

    /**
     * 获取TOP8技术标签
     * @return
     */
    @Cacheable(value = "Label",key = "'labelDao.getTopLabels'")
    public List<ArticleLabel> getTopLabels() {
        return sw.buildViewQuery("getName")
                .page(1)
                .pageSize(8)
                .doQuery(ArticleLabel.class);
    }

    /**
     * 获取所有技术标签
     * @return
     */
    @Cacheable(value = "Label",key = "'labelDao.getAllLabels'")
    public List<Label> getAllLabels() {
        return sw.buildQuery()
                .select("id,label_name")
                .doQuery(Label.class);
    }

    public String getLabelId(String labelName){
       return sw.buildQuery()
                .sql("select id from label where label_name=#name")
                .setVar("name",labelName)
                .doQueryFirst(Label.class)
               .getId();
    }

    /**
     * 新增 article_label
     * @param articleLabel
     */
    public void addArticleLabel(ArticleLabel articleLabel){
        sw.buildQuery()
                .doInsert(articleLabel);
    }

    public void deleteArticleLabelByArticle(String articleId){
        sw.buildQuery()
                .eq("article_id",articleId)
                .doDelete(ArticleLabel.class);
    }
}
