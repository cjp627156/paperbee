import { Component, OnInit } from '@angular/core';
import { ContentService } from '../../content.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { NzMessageService } from 'ng-zorro-antd';
import { LocalStorage } from 'src/app/app.localStorage';


@Component({
  selector: 'app-content',
  templateUrl: './content.component.html',
  styleUrls: ['./content.component.css']
})
export class ContentComponent implements OnInit {
  obj: any = {};
  article: any = {};
  data: any = {};
  constructor(private contentService: ContentService, private message: NzMessageService,
    private localStorage: LocalStorage) { }
  public commentValue = '';
  public commentList = [];
  shareVisible = false;
  shareDesc = "";
  shareType = "";

  ngOnInit() {
    this.fun(window.location.href);
    //初始化文章
    this.initArticleContent();
    this.initArticle();
    //初始化评论区
    this.initCommentList();
    this.addArticleViews();
  }

  addArticleViews(){
    console.log('11')
    this.contentService.addArticleView(this.obj.id).subscribe(x => {
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }

  fun(url) {
    var reg = /\?/;
    if (url.match(reg)) {
      //判断传入参数，以问号截取，问号后是参数
      var chars = url.split('?')[1];
      //再截&号
      var arr = chars.split('&');
      //获得截取后的数组为键值对字符串
      for (var i = 0; i < arr.length; i++) {
        //保守一点确定看是否为 name=value形式
        var num = arr[i].indexOf("=");
        if (num > 0) {
          //拼接字符串
          var name = arr[i].substring(0, num);
          var value = arr[i].substr(num + 1);
          //拼接对象，并转码
          this.obj[decodeURIComponent(name)] = decodeURIComponent(value);
        }
      }
    }
  }

  /**
   * 评论
   */
  onComment() {
    var param = {
      articleId: this.obj.id,
      content: this.commentValue
    }
    this.contentService.addArticleComment(param).subscribe(x => {
      const date = new Date();
      const year: number = date.getFullYear();
      const month: any = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
      const day: any = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();

      var commentEach = {
        createdBy: this.localStorage.get('NAME') ? this.localStorage.get('NAME') : '匿名用户',
        creationDate: year + '-' + month + '-' + day,
        content: this.commentValue
      };
      this.commentList.push(commentEach);
      this.commentValue = '';
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    }
    )
  }

  /**
   * 初始化评论列表
   */
  initCommentList() {
    this.contentService.getArticleComments(this.obj.id).subscribe(x => {
      this.commentList = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    }
    )
  }


  /**
   * 初始化文章内容
   */
  initArticleContent() {
    this.contentService.getArticleContent(this.obj.id).subscribe(x => {
      this.article = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    });
  }

  /**
   * 获取文章信息
   */
  initArticle() {
    this.contentService.getArticleById(this.obj.id).subscribe(x => {
      this.data = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    });
  }

  onShare(stype) {
    this.shareVisible = true;
    this.shareType = stype;
  }

  shareCancel() {
    this.shareVisible = false;
  }

  shareOK() {
    this.shareVisible = false;
    this.shareTo();
  }

  shareTo() {
    var ftit = '';
    var lk = '';
    var desc = this.shareDesc;
    //获取文章标题
    ftit = this.data.title;
    //获取网页中内容的第一张图片
    //当内容中没有图片时，设置分享图片为网站logo
    if (lk == '') {
      lk = 'http://paperbee.definesys.com/assets/images/beeslogo.png';
    }
    //qq空间接口的传参
    if (this.shareType == 'qzone') {
      window.open('https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=' + document.location.href + '&sharesource=qzone&title=' + ftit + '&pics=' + lk + '&summary=' + desc);
    }
    //新浪微博接口的传参
    if (this.shareType == 'sina') {
      window.open('http://service.weibo.com/share/share.php?url=' + document.location.href.replace('&', '%26') + '&sharesource=weibo&title=' + ftit + '&pic=' + lk + '&appkey=2706825840' + desc);
    }
    //qq好友接口的传参
    if (this.shareType == 'qq') {
      window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + document.location.href + '&sharesource=qzone&title=' + ftit + '&pics=' + lk + '&summary=' + desc);
    }
    //生成二维码给微信扫描分享
    if (this.shareType == 'wechat') {
      window.open('http://zixuephp.net/inc/qrcode_img.php?url=' + document.location.href);
    }
  }

}
