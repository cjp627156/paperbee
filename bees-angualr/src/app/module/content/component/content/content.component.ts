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
  constructor(private contentService: ContentService, private message: NzMessageService,
    private localStorage: LocalStorage) { }
  public commentValue = '';
  public commentList = [];

  ngOnInit() {
    this.fun(window.location.href);
    //初始化文章
    this.contentService.getArticleContent(this.obj.id).subscribe(x => {
      this.article = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    });
    //初始化评论区
    this.initCommentList();
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

  onComment() {
    var param = {
      articleId: this.article.id,
      content: this.commentValue
    }
    this.contentService.addArticleComment(param).subscribe(x => {
      const date = new Date();
      const year: number = date.getFullYear();
      const month: any = (date.getMonth() + 1) < 10 ? '0' + (date.getMonth() + 1) : (date.getMonth() + 1);
      const day: any = date.getDate() < 10 ? '0' + date.getDate() : date.getDate();

      var commentEach = {
        createdBy: this.localStorage.get('NAME'),
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
}
