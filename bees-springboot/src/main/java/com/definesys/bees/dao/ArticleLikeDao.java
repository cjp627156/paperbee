package com.definesys.bees.dao;


import com.definesys.bees.pojo.ArticleLike;
import com.definesys.mpaas.query.MpaasQueryFactory;
import com.definesys.mpaas.query.db.PageQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class ArticleLikeDao {
    @Autowired
    private MpaasQueryFactory sw;

    public void addArticleLike(ArticleLike articleLike) {
        sw.buildQuery()
                .doInsert(articleLike);
    }

    public long getUserLikeAmount(String articleId, String user) {
        PageQueryResult result = sw.buildQuery()
                .countSql("select 1 from article_like")
                .eq("article_id", articleId)
                .eq("created_by", user)
                .doPageQuery(1, 2, ArticleLike.class);
        return result.getCount();
    }

    public void deleteLikeByUser(String articleId, String user) {
        sw.buildQuery()
                .eq("article_id", articleId)
                .eq("created_by", user)
                .doDelete(ArticleLike.class);
    }

    public int getLikeAmountByUser(String user) {
        Map<String,Object> result = sw.buildQuery()
                .sql("SELECT COUNT(1) AS amount FROM ( SELECT l.id,a.created_by FROM article_like l LEFT JOIN article a ON l.article_id = a.id ) t WHERE t.created_by = '" + user + "'")
                .doQueryFirst();
        return Integer.parseInt(result.get("amount").toString()) ;
    }

}
