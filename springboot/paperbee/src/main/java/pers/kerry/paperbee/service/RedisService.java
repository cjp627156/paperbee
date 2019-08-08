package pers.kerry.paperbee.service;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import pers.kerry.paperbee.mapper.ArticleMapper;
import pers.kerry.paperbee.pojo.ArticleContent;

import javax.annotation.Resource;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: dao层方法中，如果需要传入参数，无法将传入参数作为 cache的key，所以在本方法中进行封装
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:13
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@Service
public class RedisService {
    @Resource
    private ArticleMapper articleMapper;

    /**
     * 查询文章正文
     * @param id
     * @return
     */
    @Cacheable(value = "ArticleContent",key = "#id")
    public ArticleContent getArticleContentById(String id){
      return   articleMapper.getArticleContentById(id);
    }

    /**
     * 更新文章正文
     * @param id
     * @param content
     */
    @CacheEvict(value = "ArticleContent",key = "#id")
    public void updateArticleContent(String id,String content){
        articleMapper.updateArticleContent(id,content);
    }





}
