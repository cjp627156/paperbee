package com.definesys.bees.pojo;

import com.definesys.mpaas.query.annotation.*;
import com.definesys.mpaas.query.json.MpaasDateDeserializer;
import com.definesys.mpaas.query.json.MpaasDateSerializer;
import com.definesys.mpaas.query.model.MpaasBasePojo;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.Date;
import java.util.List;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/3 19:38
 * @history: 1. 2019/1/3 created by yongjie.lin
 */

public class ArticleQueryV extends MpaasBasePojo {
    @RowID(type = RowIDType.UUID)
    @Column(value = "ID")
    private String id;

    @Column(value = "TITLE")
    private String title;

    @Column(value = "AUTHOR")
    private String author;

    @JsonSerialize(using = MpaasDateSerializer.class)
    @JsonDeserialize(using = MpaasDateDeserializer.class)
    @SystemColumn(SystemColumnType.CREATE_ON)
    @Column(value = "PUBLISH_DATE")
    private String publishDate;

    @SystemColumn(SystemColumnType.OBJECT_VERSION)
    @Column(value = "OBJECT_VERSION_NUMBER")
    private Integer objectVersionNumber;

    @SystemColumn(SystemColumnType.CREATE_BY)
    @Column(value = "CREATED_BY")
    private String createdBy;

    @JsonSerialize(using = MpaasDateSerializer.class)
    @JsonDeserialize(using = MpaasDateDeserializer.class)
    @SystemColumn(SystemColumnType.CREATE_ON)
    @Column(value = "CREATION_DATE")
    private Date creationDate;

    @SystemColumn(SystemColumnType.LASTUPDATE_BY)
    @Column(value = "LAST_UPDATE_BY")
    private String lastUpdatedBy;

    @JsonSerialize(using = MpaasDateSerializer.class)
    @JsonDeserialize(using = MpaasDateDeserializer.class)
    @SystemColumn(SystemColumnType.LASTUPDATE_ON)
    @Column(value = "LAST_UPDATE_DATE")
    private Date lastUpdateDate;

    @Column(value = "ARTICLE_VIEWS", type = ColumnType.CALCULATE)
    private Long articleViews;

    @Column(value = "ARTICLE_LIKES",type = ColumnType.CALCULATE)
    private Long articleLikes;

    @Column(value = "SEARCH_CONTENT")
    private String searchContent;

    @Column(value = "LABELS")
    private String labels;

    @Column(value = "STATUS")
    private String status;

    @Column(value = "LIKE_USERS")
    private String likeUsers;

    private String liked;

    private List<ArticleLabel> labelList;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public Integer getObjectVersionNumber() {
        return objectVersionNumber;
    }

    public void setObjectVersionNumber(Integer objectVersionNumber) {
        this.objectVersionNumber = objectVersionNumber;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public String getLastUpdatedBy() {
        return lastUpdatedBy;
    }

    public void setLastUpdatedBy(String lastUpdatedBy) {
        this.lastUpdatedBy = lastUpdatedBy;
    }

    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    public Long getArticleViews() {
        return articleViews;
    }

    public void setArticleViews(Long articleViews) {
        this.articleViews = articleViews;
    }

    public Long getArticleLikes() {
        return articleLikes;
    }

    public void setArticleLikes(Long articleLikes) {
        this.articleLikes = articleLikes;
    }

    public List<ArticleLabel> getLabelList() {
        return labelList;
    }

    public void setLabelList(List<ArticleLabel> labelList) {
        this.labelList = labelList;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public String getLabels() {
        return labels;
    }

    public void setLabels(String labels) {
        this.labels = labels;
    }

    public String getLikeUsers() {
        return likeUsers;
    }

    public void setLikeUsers(String likeUsers) {
        this.likeUsers = likeUsers;
    }

    public String getLiked() {
        return liked;
    }

    public void setLiked(String liked) {
        this.liked = liked;
    }
}
