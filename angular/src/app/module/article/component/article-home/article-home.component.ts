import { Component, OnInit } from '@angular/core';
import { DFConfigApi } from 'src/app/app.config';
import { ApiException } from 'src/app/util/network/network.exception';
import { Router } from '@angular/router';
import { LocalStorage } from 'src/app/app.localStorage';
import { MessageService } from 'src/app/util/message.service';
import { NzMessageService, NzNotificationService } from 'ng-zorro-antd';
import { ArticleService } from '../../article.service';
import { Subscription } from 'rxjs';
import { LoadingBarService } from '@ngx-loading-bar/core';

@Component({
  selector: 'app-article-home',
  templateUrl: './article-home.component.html',
  styleUrls: ['./article-home.component.css']
})
export class ArticleHomeComponent implements OnInit {

  constructor(private router: Router, private localStorage: LocalStorage,
    private messageService: MessageService, private message: NzMessageService,
    private articleService: ArticleService, private notification: NzNotificationService,
    private loadingBar: LoadingBarService, ) { }
  public subscription: Subscription;
  menuList = [];
  isMore = false;
  isMore1 = true;
  articles: any = [];
  pageSize = 15;
  pageIndex = 1;
  publishDateSort = "DESC";
  articleViewSort = "DESC";
  articleLikeSort = "DESC";
  label = "";
  searchContent = "";
  viewBoolean = false;
  timeBoolean = false;
  likeBoolean = false;
  greate = false;
  week = false;
  mouth = false;
  orderBy = [];
  order = " CREATION_DATE DESC";

  ngOnInit() {
    this.loadingBar.start();
    this.scrollMore();
    this.menuQuery();
    this.articlesQuery();
  }

  /**
 * 路由守卫
 */
  routingGuard() {
    if (JSON.stringify(this.localStorage.get('TOKEN')) === "false") {
      this.router.navigateByUrl('login');
    }
  }

  /**
   * 组件销毁
   */
  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

  /**
  * 监听查询框信息
  */
  ngAfterViewInit(): void {
    this.subscription = this.messageService.getArticleMessage().subscribe(msg => {
      this.searchContent = msg.type;
      this.initPageIndex();
      this.articlesQuery();
    })
  }

  menuQuery() {
    this.articleService.getMenu().subscribe(x => {
      this.menuList = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }

  articlesQuery() {
    let param = {
      "searchContent": this.searchContent,
      "label": this.label,
      "orderBy": this.order == "" ? "CREATION_DATE DESC" : this.order,
      "page": this.pageIndex,
      "pageSize": this.pageSize
    };
    this.articleService.getArticles(param).subscribe(x => {
      this.loadingBar.complete();
      this.articles = x.data.result;
      if (x.data.count <= this.articles.length) {
        this.isMore1 = false;
      }
    }, (error) => {
      this.loadingBar.complete();
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }

  changeSort(type) {
    if (type == 'view') {
      if (this.articleViewSort == 'DESC') {
        this.articleViewSort = 'ASC';
        this.order = 'ARTICLE_VIEWS ASC';
      } else {
        this.articleViewSort = 'DESC';
        this.order = 'ARTICLE_VIEWS DESC';
      }
      this.viewBoolean = !this.viewBoolean;
    } else if (type == 'time') {
      if (this.publishDateSort == 'DESC') {
        this.publishDateSort = 'ASC';
        this.order = 'CREATION_DATE ASC';
      } else {
        this.publishDateSort = 'DESC';
        this.order = 'CREATION_DATE DESC';
      }
      this.timeBoolean = !this.timeBoolean;
    } else if (type == 'like') {
      if (this.articleLikeSort == 'DESC') {
        this.articleLikeSort = 'ASC';
        this.order = 'ARTICLE_LIKES ASC';
      } else {
        this.articleLikeSort = 'DESC';
        this.order = 'ARTICLE_LIKES DESC';
      }
      this.likeBoolean = !this.likeBoolean;

    }
    this.articlesQuery();
  }

  getLabelArticle(param) {
    if (this.label == param) {
      this.label = "";
    } else {
      this.label = param;
    }
    this.articlesQuery();
  }

  detail(data) {
    data.articleViews += 1;
    window.open("/content?id=" + data.id);
  }

  array = ["../../../../../assets/images/announce1.png", "../../../../../assets/images/announce2.png"];

  getMore() {
    this.isMore = true;
    this.pageIndex = this.pageIndex + 1;
    let param = {
      "searchContent": this.searchContent,
      "label": this.label,
      "orderBy": this.order == "" ? "CREATION_DATE DESC" : this.order,
      "page": this.pageIndex,
      "pageSize": this.pageSize
    };
    this.articleService.getArticles(param).subscribe(x => {
      var articlesMore = x.data.result;
      articlesMore.forEach(element => {
        this.articles.push(element);
      });
      this.isMore = false;
      if (x.data.count <= this.articles.length) {
        this.isMore1 = false;
      }
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }

  initPageIndex() {
    this.pageIndex = 1;
    this.isMore1 = true;
  }

  getvalue(data, param) {
    var num = -1;
    data.forEach((element, index) => {
      if (element.indexOf(param) != -1) {
        num = index;
      }
    });
    return num;
  }

  like(data) {
    if (data.liked == 'unlike') {
      this.articleService.addArticleLike(data.id).subscribe(x => {
        this.notification.success('赞数 + 1 !', data.title, { nzDuration: 2000 });
        data.articleLikes += 1;
        data.liked = 'liked';
      }, (error) => {
        var errorMsg = '网络错误，请重试!';
        if (error instanceof ApiException) {
          errorMsg = error.message;
        }
        this.message.error(errorMsg);
      })
    } else {
      this.articleService.cancelArticleLike(data.id).subscribe(x => {
        this.notification.blank('已取消点赞', data.title, { nzDuration: 1000 });
        data.articleLikes -= 1;
        data.liked = 'unlike';
      }, (error) => {
        var errorMsg = '网络错误，请重试!';
        if (error instanceof ApiException) {
          errorMsg = error.message;
        }
        this.message.error(errorMsg);
      })
    }

  }


//获取滚动条当前的位置
  getScrollTop() {
    var scrollTop = 0;
    if (document.documentElement && document.documentElement.scrollTop) {
      scrollTop = document.documentElement.scrollTop;
    }
    else if (document.body) {
      scrollTop = document.body.scrollTop;
    }
    return scrollTop;
  }

  //获取当前可视范围的高度
  getClientHeight() {
    var clientHeight = 0;
    if (document.body.clientHeight && document.documentElement.clientHeight) {
      clientHeight = Math.min(document.body.clientHeight, document.documentElement.clientHeight);
    }
    else {
      clientHeight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
    }
    return clientHeight;
  }

  //获取文档完整的高度
  getScrollHeight() {
    return Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
  }

  scrollMore() {
    window.onscroll = () => {
      if (this.getScrollTop() + this.getClientHeight() == this.getScrollHeight()) {
        if (this.pageIndex % 5 != 0 && this.isMore1) {
          this.getMore();
        }
      }
    }
  }



}
