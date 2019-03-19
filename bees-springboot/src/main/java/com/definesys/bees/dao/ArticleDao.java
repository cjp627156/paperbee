package com.definesys.bees.dao;

import com.definesys.bees.pojo.Article;
import com.definesys.bees.pojo.ArticleContent;
import com.definesys.bees.pojo.ArticleQueryV;
import com.definesys.mpaas.query.MpaasQueryFactory;
import com.definesys.mpaas.query.db.PageQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/3 20:01
 * @history: 1. 2019/1/3 created by yongjie.lin
 */

@Component
public class ArticleDao {
    @Autowired
    private MpaasQueryFactory sw;
    @Autowired
    private LabelDao labelDao;
    @Autowired
    SystemConfigDao systemConfigDao;

    /**
     * 查询文章
     *
     * @param searchContent
     * @param label
     * @param orderBy
     * @param page
     * @param pageSize
     * @return
     */
    public PageQueryResult query(String searchContent, String label, String orderBy, Integer page, Integer pageSize, String user) {
        PageQueryResult<ArticleQueryV> result = null;
        if (orderBy != null && orderBy.trim().length() > 0) {
            result = sw.buildQuery()
                    .sql("select *,if(LOCATE('," + user + ",',like_users)>0,'liked','unlike')as liked from article_query_v where search_content like '%" + searchContent + "%' and labels like '%" + label + "%'  ORDER BY " + orderBy)
                    .doPageQuery(page, pageSize, ArticleQueryV.class);
        } else {
            result = sw.buildQuery()
                    .sql("select *,if(LOCATE('," + user + ",',like_users)>0,'liked','unlike')as liked from article_query_v where search_content like '%" + searchContent + "%' and labels like '%" + label + "%'  order by article_likes desc,article_views desc")
                    .doPageQuery(page, pageSize, ArticleQueryV.class);
        }
        for (ArticleQueryV article : result.getResult()) {
            article.setLabelList(labelDao.getLabelNameList(article.getId()));
        }
        return result;
    }

    @CacheEvict(value = "Label", key = "'labelDao.getTopLabels'")
    public void addArticle(Article article) {
        sw.buildQuery()
                .doInsert(article);
    }

//    public String getFileUrlPre() {
//        return systemConfigDao.getValueByKey("article_file_url");
//    }


    public ArticleQueryV getArticleById(String articleId) {
        ArticleQueryV article = sw.buildQuery()
                .sql("select * from article_query_v")
                .eq("id", articleId)
                .doQueryFirst(ArticleQueryV.class);
        article.setLabelList(labelDao.getLabelNameList(article.getId()));
        return article;
    }

    public PageQueryResult getArticleByCreator(String creator, Integer page, Integer pageSize) {
        PageQueryResult<ArticleQueryV> result = sw.buildQuery()
                .sql("select * from article_query_v where created_by='" + creator + "' order by creation_date desc")
                .doPageQuery(page, pageSize, ArticleQueryV.class);
        return result;
    }

    public int getArticleAmountByUser(String user) {
        Map<String, Object> result = sw.buildQuery()
                .sql("SELECT COUNT(1) AS amount FROM article t WHERE t.created_by = '" + user + "'")
                .doQueryFirst();
        return Integer.parseInt(result.get("amount").toString());
    }

    public void deleteArticle(String rowId) {
        sw.buildQuery()
                .rowid("id", rowId)
                .doDelete(Article.class);
    }

    public Article getArticleRowById(String articleId){
        return sw.buildQuery()
                .eq("id",articleId)
                .doQueryFirst(Article.class);
    }

    /**
     * 获取 article_content
     * @param id
     * @return
     */
    @Cacheable(value = "ArticleContent",key = "#id")
    public ArticleContent getArticleContentById(String id) {
       return sw.buildQuery()
               .eq("id",id)
                .doQueryFirst(ArticleContent.class);
    }

    /**
     * 更新 article_content
     * @param id
     * @param articleContent
     */
    @CacheEvict(value = "ArticleContent",key = "#id")
    public void updateArticleContent(String id,ArticleContent articleContent){
        sw.buildQuery()
                .eq("id",id)
                .doUpdate(articleContent);
    }

    /**
     * 新增 article_content
     * @param articleContent
     */
    public void addArticleContent(ArticleContent articleContent){
        sw.buildQuery()
                .doInsert(articleContent);
    }

    public void updateArticleTitle(String articleId,String title){
        sw.buildQuery()
                .update("title",title)
                .table("article")
                .eq("id",articleId)
                .doUpdate();
    }

}
