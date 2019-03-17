package com.definesys.bees.controller;

import com.definesys.bees.dao.*;
import com.definesys.bees.pojo.*;
import com.definesys.mpaas.common.exception.MpaasBusinessException;
import com.definesys.mpaas.common.exception.MpaasRuntimeException;
import com.definesys.mpaas.common.http.Response;
import com.definesys.mpaas.query.db.PageQueryResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import static com.definesys.bees.util.CommUtil.get32Uuid;
import static com.definesys.mpaas.query.session.MpaasSession.getCurrentUser;

import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Copyright: Shanghai Mitsubishi Elevator Company.All rights reserved.
 * @Description:
 * @author: yongjie.lin
 * @since: 2019/1/3 21:37
 * @history: 1. 2019/1/3 created by yongjie.lin
 */

@RestController
@RequestMapping("/bees/article")
public class ArticleController {
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private LabelDao labelDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private ArticleViewDao articleViewDao;
    @Autowired
    private ArticleLikeDao articleLikeDao;
    @Autowired
    private ArticleCommentDao articleCommentDao;

    @Value("${file.absolute.dir}")
    private String imgAbsoluteDir;
    @Value("${file.relative.dir}")
    private String imgRelativeDir;

    /**
     * 查询文章接口
     *
     * @param request
     * @return
     */
    @RequestMapping(path = "/query", method = RequestMethod.POST)
    public Response query(@RequestBody Map<String, Object> request) {
        String searchContent = (String) request.get("searchContent");
        String label = (String) request.get("label");
        String orderBy = (String) request.get("orderBy");
        Integer page = (Integer) request.get("page");
        Integer pageSize = (Integer) request.get("pageSize");
        PageQueryResult result = null;
        if (page != null && pageSize != null) {
            result = articleDao.query(searchContent, label, orderBy, page, pageSize,getCurrentUser());
        } else {
            throw new MpaasBusinessException("页数及每页返回数量不能为空！");
        }
        return Response.ok().setData(result);
    }

    /**
     * 获取TOP8技术标签
     *
     * @return
     */
    @RequestMapping(path = "/getTopLabels", method = RequestMethod.GET)
    public Response getTopLabels() {
        return Response.ok().setData(labelDao.getTopLabels());
    }

    /**
     * 获取所有技术标签
     *
     * @return
     */
    @RequestMapping(path = "/getAllLabels", method = RequestMethod.GET)
    public Response getAllLabels() {
        return Response.ok().setData(labelDao.getAllLabels());
    }

    /**
     * 新增文章
     * @param request
     * @return
     */
    @RequestMapping(path = "/addArticle", method = RequestMethod.POST)
    public Response addArticle(@RequestBody Map<String, Object> request) {
        try {
            String title = (String) request.get("title");
            String author = userDao.getName(getCurrentUser());
            //article_content
            ArticleContent articleContent=new ArticleContent();
            articleContent.setContent((String) request.get("content"));
            articleDao.addArticleContent(articleContent);
            //article
            List<String> labelList = (List<String>) request.get("labelList");
            Article article = new Article();
            article.setTitle(title);
            article.setAuthor(author);
            article.setContentId(articleContent.getId());
            articleDao.addArticle(article);
            //article_label
            String articleId = article.getId();
            for (String name : labelList) {
                String labelId = labelDao.getLabelId(name);
                ArticleLabel articleLabel = new ArticleLabel();
                articleLabel.setArticleId(articleId);
                articleLabel.setLabelId(labelId);
                articleLabel.setLabelName(name);
                labelDao.addArticleLabel(articleLabel);
            }
            return Response.ok();
        } catch (Exception e) {
            throw new MpaasRuntimeException(e.getMessage());
        }
    }

    /**
     * 更新文章
     * @param request
     * @return
     */
    @RequestMapping(path = "/updateArticle", method = RequestMethod.POST)
    public Response updateArticle(@RequestBody Map<String, Object> request) {
        try {
            String articleId=(String) request.get("articleId");
            String title = (String) request.get("title");
            String contentId=articleDao.getArticleRowById(articleId).getContentId();
            //article_content
            ArticleContent articleContent=new ArticleContent();
            articleContent.setContent((String)request.get("content"));
            articleDao.updateArticleContent(contentId,articleContent);
            //article
            articleDao.updateArticleTitle(articleId,title);
            //article_label
            labelDao.deleteArticleLabelByArticle(articleId);
            List<String> labelList = (List<String>) request.get("labelList");
            for (String name : labelList) {
                String labelId = labelDao.getLabelId(name);
                ArticleLabel articleLabel = new ArticleLabel();
                articleLabel.setArticleId(articleId);
                articleLabel.setLabelId(labelId);
                articleLabel.setLabelName(name);
                labelDao.addArticleLabel(articleLabel);
            }
            return Response.ok();
        } catch (Exception e) {
            throw new MpaasRuntimeException(e.getMessage());
        }
    }

    /**
     * 增加文字浏览量
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/addArticleView", method = RequestMethod.GET)
    public Response addArticleView(@RequestParam String articleId) {
        ArticleView articleView = new ArticleView();
        articleView.setArticleId(articleId);
        articleViewDao.addArticleView(articleView);
        return Response.ok();
    }

//    /**
//     * 上传文章
//     *
//     * @param request
//     * @return
//     *
//     * -----------作废该接口
//     */
//    @RequestMapping(value = "/upload", method = RequestMethod.POST)
//    public Response uploadArticle(@RequestBody Map<String, Object> request) {
//        try {
//            String title = (String) request.get("title");
//            String author = userDao.getName(getCurrentUser());
//            String content = (String) request.get("content");
//            String fileUuid = this.uploadArticle(content);
//            List<String> labelList = (List<String>) request.get("labelList");
//            Article article = new Article();
//            article.setTitle(title);
//            article.setAuthor(author);
//            article.setFileUuid(fileUuid);
//            articleDao.addArticle(article);
//            String articleId = article.getId();
//            for (String name : labelList) {
//                String labelId = labelDao.getLabelId(name);
//                ArticleLabel articleLabel = new ArticleLabel();
//                articleLabel.setArticleId(articleId);
//                articleLabel.setLabelId(labelId);
//                articleLabel.setLabelName(name);
//                labelDao.addArticleLabel(articleLabel);
//            }
//            return Response.ok();
//        } catch (Exception e) {
//            throw new MpaasRuntimeException(e.getMessage());
//        }
//    }

//    /**
//     * 上传文章内容(在服务器相应路径创建文件)
//     *
//     * @param content
//     * @return
//     */
//    public String uploadArticle(String content) throws IOException {
//        /**
//         * 上传操作：可能upload目录不存在，所以先判断一下如果不存在，那么新建这个目录
//         */
//        File fileDir = new File(articleAbsoluteDir);
//        if (!fileDir.exists()) {
//            fileDir.setWritable(true);
//            fileDir.mkdirs();
//        }
//        String id = get32Uuid();
//        String fileName = id + "." + "md";
//        File targetFile = new File(fileDir, fileName);
//        FileOutputStream fos = new FileOutputStream(targetFile);
//        try {
//            fos.write(content.getBytes());
//        } finally {
//            if (fos != null) {
//                fos.flush();
//                fos.close();
//            }
//        }
//        return id;
//    }

    /**
     * 上传图片，返回图片的地址
     * @param multipartFiles
     * @return
     */
    @RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
    public Response uploadFile(@RequestParam("uploadFile") MultipartFile[] multipartFiles) {
        /**
         * 可能会出现重复文件，所以我们要对文件进行一个重命名的操作
         * 截取文件的原始名称，然后将扩展名和文件名分开，使用：32位uuid.扩展名的格式保存
         */
        if (multipartFiles.length > 0) {
            Response response = Response.ok();
            /**
             * 上传操作：可能upload目录不存在，所以先判断一下如果不存在，那么新建这个目录
             */
            File fileDir = new File(imgAbsoluteDir);
            if (!fileDir.exists()) {
                fileDir.setWritable(true);
                fileDir.mkdirs();
            }
            for (MultipartFile multipartFile : multipartFiles) {
                // 获取文件名称
                String fileName = multipartFile.getOriginalFilename();
                // 获取扩展名
                String fileExtensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
                // 生成最终保存的文件名,格式为: 32位uuid.扩展名
                String id = get32Uuid();
                String targetFileName = id + "." + fileExtensionName;
                /**
                 * 上传
                 */
                File targetFile = new File(fileDir, targetFileName);
                try {
                    multipartFile.transferTo(targetFile);
                    Map<String, Object> fileItem = new HashMap<>();
                    fileItem.put("name", fileName);
                    fileItem.put("path", imgRelativeDir + targetFileName);
                    response.addListItem(fileItem);
                } catch (Exception e) {
                    throw new MpaasRuntimeException(e.getMessage());
                }
            }
            return response;
        } else {
            throw new MpaasBusinessException("所上传文件列表项不能为空,请重试!");
        }
    }


    /**
     * 点赞
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/addArticleLike", method = RequestMethod.GET)
    public Response addArticleLike(@RequestParam String articleId) {
        long count=articleLikeDao.getUserLikeAmount(articleId,getCurrentUser());
        if(count==0){
            ArticleLike articleLike=new ArticleLike();
            articleLike.setArticleId(articleId);
            articleLikeDao.addArticleLike(articleLike);
        }
        return Response.ok();
    }
    /**
     * 取消点赞
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/cancelArticleLike", method = RequestMethod.GET)
    public Response cancelArticleLike(@RequestParam String articleId) {
       articleLikeDao.deleteLikeByUser(articleId,getCurrentUser());
        return Response.ok();
    }

    /**
     * 新增评论
     * @param request
     * @return
     */
    @RequestMapping(path = "/addArticleComment",method = RequestMethod.POST)
    public Response addArticleComment(@RequestBody Map<String,Object>request){
        ArticleComment articleComment=new ArticleComment();
        articleComment.setContent((String) request.get("content"));
        articleComment.setArticleId((String)request.get("articleId"));
        articleCommentDao.addArticleComment(articleComment);
        return Response.ok();
    }

    /**
     * 获取文章评论
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/getArticleComments",method = RequestMethod.GET)
    public Response getArticleComments(@RequestParam String articleId){
        List<ArticleComment> list=articleCommentDao.getCommentsByArticle(articleId);
        for(int i=0;i<list.size();i++){
            list.get(i).setCreatedBy(userDao.getName(list.get(i).getCreatedBy()));
        }
        return Response.ok().data(list);
    }

    /**
     * 根据主键获取文章
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/getArticleById",method = RequestMethod.GET)
    public Response getArticleById(@RequestParam String articleId){
       ArticleQueryV article=articleDao.getArticleById(articleId);
        return Response.ok().data(article);
    }

    /**
     * 查询我的文章列表
     * @param request
     * @return
     */
    @RequestMapping(path = "/getMyArticleList",method = RequestMethod.POST)
    public Response getMyArticleList(@RequestBody Map<String,Object> request){
        Integer page = (Integer) request.get("page");
        Integer pageSize = (Integer) request.get("pageSize");
        PageQueryResult result=null;
        result= articleDao.getArticleByCreator(getCurrentUser(),page,pageSize);
        return Response.ok().setData(result);
    }

    /**
     * 删除文章
     * @param rowId
     * @return
     */
    @RequestMapping(path = "/deleteArticleByRowId",method = RequestMethod.GET)
    public Response deleteArticleByRowId(@RequestParam String rowId){
        articleDao.deleteArticle(rowId);
        return Response.ok();
    }

    /**
     * 获取文章正文
     * @param articleId
     * @return
     */
    @RequestMapping(path = "getArticleContent",method = RequestMethod.GET)
    public Response getArticleContent(@RequestParam String articleId){
        String contentId=articleDao.getArticleRowById(articleId).getContentId();
            ArticleContent articleContent=articleDao.getArticleContentById(contentId);
            return Response.ok().data(articleContent);
    }







}
