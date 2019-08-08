package pers.kerry.paperbee.controller;

import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pers.kerry.paperbee.common.EmailClient;
import pers.kerry.paperbee.mapper.*;
import pers.kerry.paperbee.pojo.*;
import pers.kerry.paperbee.common.PageQueryResult;
import pers.kerry.paperbee.common.Response;
import pers.kerry.paperbee.service.RedisService;

import javax.annotation.Resource;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import static pers.kerry.paperbee.filter.UserRepo.getCurrentUser;

/**
 *  @Copyright: Shanghai Definesys Company.All rights reserved.
 *  @Description: 文章相关的 Controller
 *  @author: kerry.wu
 *  @since: 2019/8/8  18:07
 *  @history:
 *          1.2019/8/8 created by kerry.wu
 */
@RestController
@RequestMapping("/paperbee/article")
public class ArticleController {
    @Value("${file.absolute.dir}")
    private String imgAbsoluteDir;
    @Value("${file.relative.dir}")
    private String imgRelativeDir;

    @Resource
    private ArticleMapper articleMapper;
    @Resource
    private LabelMapper labelMapper;
    @Resource
    private UserMapper userMapper;
    @Resource
    private ArticleLikeMapper articleLikeMapper;
    @Resource
    private ArticleCommentMapper articleCommentMapper;
    @Resource
    private UserMessageMapper userMessageMapper;
    @Resource
    private EmailClient emailClient;
    @Resource
    private RedisService redisService;


    /**
     * 返回32位uuid
     * @return
     */
    public static String get32Uuid(){
        String uuid= UUID.randomUUID().toString();
        return uuid.replace("-","");
    }

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
        PageHelper.startPage(page,pageSize,true);
        PageQueryResult<ArticleQueryV> pageQueryResult=new PageQueryResult<>(articleMapper.queryFull(searchContent, label, orderBy, getCurrentUser()));
        for (ArticleQueryV article : pageQueryResult.getResult()) {
            article.setLabelList(labelMapper.getLabelNameList(article.getId()));
        }
        return Response.ok().data(pageQueryResult);
  }

    /**
     * 获取TOP8技术标签
     *
     * @return
     */
    @RequestMapping(path = "/getTopLabels", method = RequestMethod.GET)
    public Response getTopLabels() {
        return Response.ok().setData(labelMapper.getTopLabels());
    }

    /**
     * 获取所有技术标签
     *
     * @return
     */
    @RequestMapping(path = "/getAllLabels", method = RequestMethod.GET)
    public Response getAllLabels() {
        return Response.ok().setData(labelMapper.getAllLabels());
    }

    /**
     * 新增文章
     *
     * @param request
     * @return
     */
    @RequestMapping(path = "/addArticle", method = RequestMethod.POST)
    public Response addArticle(@RequestBody Map<String, Object> request) {
            String title = (String) request.get("title");
            String columnId=(String)request.get("columnId");
            String author = userMapper.getName(getCurrentUser());
            //article_content
            ArticleContent articleContent=new ArticleContent();
            articleContent.setContent((String) request.get("content"));
            articleMapper.addArticleContent(articleContent,getCurrentUser());
        String contentId=articleContent.getId();
            //article
            List<String> labelList = (List<String>) request.get("labelList");
            Article article=new Article();
            article.setTitle(title);
            article.setAuthor(author);
            article.setContentId(contentId);
            article.setColumnId(columnId);
            articleMapper.addArticle(article,getCurrentUser());
        String articleId=article.getId();
            //article_label
            for (String name : labelList) {
                String labelId = labelMapper.getLabelId(name);
                labelMapper.addArticleLabel(articleId,labelId,name,getCurrentUser());
            }
            return Response.ok();
    }

    /**
     * 更新文章
     *
     * @param request
     * @return
     */
    @RequestMapping(path = "/updateArticle", method = RequestMethod.POST)
    public Response updateArticle(@RequestBody Map<String, Object> request) {
            String articleId = (String) request.get("articleId");
            String title = (String) request.get("title");
            String columnId=(String)request.get("columnId");
            String contentId = articleMapper.getArticleById(articleId).getContentId();
            //article_content
            redisService.updateArticleContent(contentId, (String) request.get("content"));
            //article
            articleMapper.updateArticleTitle(articleId, title,columnId);
            //article_label
            labelMapper.deleteArticleLabelByArticle(articleId);
            List<String> labelList = (List<String>) request.get("labelList");
            for (String name : labelList) {
                String labelId = labelMapper.getLabelId(name);
                labelMapper.addArticleLabel(articleId,labelId,name,getCurrentUser());
            }
            return Response.ok();
    }

    /**
     * 增加文字浏览量
     *
     * @param articleId
     * @return
     */
    @RequestMapping(path = "/addArticleView", method = RequestMethod.GET)
    public Response addArticleView(@RequestParam String articleId) {
        articleMapper.addArticleView(articleId,getCurrentUser());
        return Response.ok();
    }

    /**
     * 上传图片，返回图片的地址
     *
     * @param multipartFiles
     * @return
     */
    @RequestMapping(value = "/imgUpload", method = RequestMethod.POST)
    public Response uploadFile(@RequestParam("uploadFile") MultipartFile[] multipartFiles){

        if (multipartFiles.length > 0) {
            Response response = Response.ok();
            File fileDir = new File(imgAbsoluteDir);
            if (!fileDir.exists()) {
                fileDir.setWritable(true);
                fileDir.mkdirs();
            }
            for (MultipartFile multipartFile : multipartFiles) {
                String fileName = multipartFile.getOriginalFilename();
                String fileExtensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
                // 生成最终保存的文件名,格式为: 32位uuid.扩展名
                String id = get32Uuid();
                String targetFileName = id + "." + fileExtensionName;
                File targetFile = new File(fileDir, targetFileName);
                 try {
                multipartFile.transferTo(targetFile);
                Map<String, Object> fileItem = new HashMap<>();
                fileItem.put("name", fileName);
                fileItem.put("path", imgRelativeDir + targetFileName);
                response.addListItem(fileItem);
                } catch (Exception e) {
                    return Response.error("系统异常，请稍后再试");
                }
            }
            return response;
        } else {
            return Response.error("上传文件不能为空");
        }
    }

        /**
         * 点赞
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "/addArticleLike", method = RequestMethod.GET)
        public Response addArticleLike(@RequestParam String articleId) {
            if("anonymous".equals(getCurrentUser())){
                return Response.ok();
            }
            int count=articleLikeMapper.getUserLikeAmount(articleId,getCurrentUser());
            if (count == 0) {
                //点赞
                articleLikeMapper.addArticleLike(articleId,getCurrentUser());
                //消息
                Article article=articleMapper.getArticleById(articleId);
                UserMessage userMessage=new UserMessage();
                userMessage.setArticleId(articleId);
                userMessage.setReceiver(article.getCreatedBy());
                userMessage.setMessageType("like");
                userMessage.setContent("点赞了");
                userMessageMapper.addMessage(userMessage,getCurrentUser());
            }
            return Response.ok();
        }

        /**
         * 取消点赞
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "/cancelArticleLike", method = RequestMethod.GET)
        public Response cancelArticleLike(@RequestParam String articleId) {
            if("anonymous".equals(getCurrentUser())){
                return Response.ok();
            }
            //取消点赞
            articleLikeMapper.deleteLikeByUser(articleId,getCurrentUser());
            //消息
            Article article=articleMapper.getArticleById(articleId);
            UserMessage userMessage=new UserMessage();
            userMessage.setArticleId(articleId);
            userMessage.setReceiver(article.getCreatedBy());
            userMessage.setMessageType("like");
            userMessage.setContent("取消点赞");
            userMessageMapper.addMessage(userMessage,getCurrentUser());
            return Response.ok();
        }

        /**
         * 新增评论
         *
         * @param request
         * @return
         */
        @RequestMapping(path = "/addArticleComment", method = RequestMethod.POST)
        public Response addArticleComment(@RequestBody Map<String, String> request) {
            String articleId=request.get("articleId");
            String content=request.get("content");
            //评论
            articleCommentMapper.addArticleComment(content,articleId,getCurrentUser());
            //消息
            Article article=articleMapper.getArticleById(articleId);
            UserMessage userMessage=new UserMessage();
            userMessage.setArticleId(articleId);
            userMessage.setReceiver(article.getCreatedBy());
            userMessage.setMessageType("comment");
            userMessage.setContent("评论：“"+content+"”");
            userMessageMapper.addMessage(userMessage,getCurrentUser());
            //邮件
            User sendUser=userMapper.getUserInfo(getCurrentUser());
            User receiveUser=userMapper.getUserInfo(article.getCreatedBy());
            EmailBean emailBean=new EmailBean();
            emailBean.setContent("“"+sendUser.getName()+"”在您的文章《"+article.getTitle()+"》下留言： “"+content+"”");
            emailBean.setSubject("纸蜂博客-消息通知");
            emailBean.setRecipient(receiveUser.getEmail());
            new Thread(()->{
                try {
                    emailClient.sendSimpleMail(emailBean);
                }catch (Exception e){
                    //忽略错误
                    e.printStackTrace();
                }
               }).start();
            return Response.ok();

        }

        /**
         * 获取文章评论
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "/getArticleComments", method = RequestMethod.GET)
        public Response getArticleComments(@RequestParam String articleId) {
            List<ArticleComment> list =articleCommentMapper.getCommentsByArticle(articleId) ;
            for (int i = 0; i < list.size(); i++) {
                if("anonymous".equals(list.get(i).getCreatedBy())){
                    list.get(i).setCreatedBy("匿名用户");
                }else {
                    list.get(i).setCreatedBy(userMapper.getName(list.get(i).getCreatedBy()));
                }
            }
            return Response.ok().data(list);
        }

        /**
         * 根据主键获取文章
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "/getArticleById", method = RequestMethod.GET)
        public Response getArticleById(@RequestParam String articleId) {
            ArticleQueryV article = articleMapper.getArticleQueryVById(articleId);
            return Response.ok().data(article);
        }

        /**
         * 查询我的文章列表
         *
         * @param request
         * @return
         */
        @RequestMapping(path = "/getMyArticleList", method = RequestMethod.POST)
        public Response getMyArticleList(@RequestBody Map<String, Object> request) {
            Integer page = (Integer) request.get("page");
            Integer pageSize = (Integer) request.get("pageSize");
            String columnId=(String)request.get("columnId");

            PageHelper.startPage(page,pageSize,true);
            PageQueryResult<ArticleQueryV> pageQueryResult=new PageQueryResult<>( articleMapper.getArticleByCreator(getCurrentUser(),columnId));
            return Response.ok().setData(pageQueryResult);
        }

        /**
         * 删除文章
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "/deleteArticleById", method = RequestMethod.GET)
        public Response deleteArticleByRowId(@RequestParam String articleId) {
            //删除文章正文 article_content
            String contentId =articleMapper.getArticleById(articleId).getContentId();
            articleMapper.deleteArticleContent(contentId);
            //删除文章 article
            articleMapper.deleteArticle(articleId);
            // 还需要删除 article_label
            labelMapper.deleteArticleLabelByArticle(articleId);
            return Response.ok();
        }


        /**
         * 获取文章正文
         *
         * @param articleId
         * @return
         */
        @RequestMapping(path = "getArticleContent", method = RequestMethod.GET)
        public Response getArticleContent(@RequestParam String articleId) {
            String contentId =articleMapper.getArticleById(articleId).getContentId();
            ArticleContent articleContent=redisService.getArticleContentById(contentId);
            return Response.ok().data(articleContent);
        }


}
