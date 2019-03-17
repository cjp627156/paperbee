package com.definesys.bees.dao;

import com.definesys.bees.pojo.ArticleComment;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ArticleCommentDao {
    @Autowired
    private MpaasQueryFactory sw;

    public void addArticleComment(ArticleComment articleComment) {
        sw.buildQuery()
                .doInsert(articleComment);
    }

    public List<ArticleComment> getCommentsByArticle(String articleId) {
        return sw.buildQuery()
                .eq("article_id", articleId)
                .orderBy("creation_date", "asc")
                .doQuery(ArticleComment.class);

    }

}
