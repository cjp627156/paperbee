package com.definesys.bees.dao;

import com.definesys.bees.pojo.ArticleView;
import com.definesys.mpaas.query.MpaasQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ArticleViewDao {
    @Autowired
    private MpaasQueryFactory sw;

    public void addArticleView(ArticleView articleView){
        sw.buildQuery()
                .doInsert(articleView);
    }


}
