import { Component, OnInit } from '@angular/core';
import { NzMessageService, UploadFile, NzNotificationService } from 'ng-zorro-antd';
import { ArticleService } from '../../article.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { Router } from '@angular/router';
import { LocalStorage } from 'src/app/app.localStorage';
import { articleRouter } from '../../article.routing';

@Component({
  selector: 'app-article-edit',
  templateUrl: './article-edit.component.html',
  styleUrls: ['./article-edit.component.css'],
  providers: [ArticleService]
})
export class ArticleEditComponent implements OnInit {

  isVisible = false;
  markdown: any = "";
  index = 0;
  labels = [];
  title = "";
  content = "";
  articleId = "";

  colors = [
    'magenta', 'red', '#3496f1', 'green', 'cyan', 'blue', 'geekblue', 'purple', '#f50', '#87d068'
  ]

  constructor(private msg: NzMessageService, private articleService: ArticleService,
    private notification: NzNotificationService, public router: Router, private localStorage: LocalStorage) { }

  ngOnInit() {
    var articleInfo = this.localStorage.getObject("articleInfo");
    this.articleId = articleInfo.id;
    this.initArticle(this.articleId);
    this.initAllLabels();
  }

  showUpload() {
    this.isVisible = true;
  }

  destroyTplModal() {
    this.isVisible = false;
  }

  selectedTags = [];
  // tslint:disable-next-line:typedef
  handleChange1(checked: boolean, tag: string): void {
    if (checked) {
      if (this.selectedTags.length == 4) {
        this.msg.create('warning', '最多只能有4个标签');
        return null;
      } else {

        this.selectedTags.push(tag);
      }
    } else {
      this.selectedTags = this.selectedTags.filter(t => t !== tag);
    }
  }

  uploading = false;
  fileList: UploadFile[] = [];

  beforeUpload = (file: UploadFile): boolean => {
    this.fileList.push(file);
    return false;
  }

  handleUpload(): void {
    const formData = new FormData();
    // tslint:disable-next-line:no-any
    this.fileList.forEach((file: any) => {
      formData.append('uploadFile', file);
    });
    this.uploading = true;
    this.articleService.articleImageUpload(formData).subscribe(x => {
      var pathList = x.table;
      pathList.forEach(element => {
        if (this.markdown == "" || this.markdown == null) {
          this.markdown = this.markdown + '![avatar](' + element.path + ')';
        } else {
          //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
          var tmp1 = this.markdown.substring(0, this.index);
          var tmp2 = this.markdown.substring(this.index, this.markdown.length);
          this.markdown = tmp1 + '![avatar](' + element.path + ')' + tmp2;
        }
      });
      this.msg.success('上传成功！');
      this.fileList = [];
      this.uploading = false;
      this.isVisible = false;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
      this.uploading = false;
    })
  }

  //获取当前textarea中光标的位置
  getCaretPosWithEvent(event) {
    let field = event.target;
    if (field.selectionStart || field.selectionStart === 0) {
      this.index = field.selectionStart;
    }
  }

  /**
   * 初始化所有标签
   */
  initAllLabels() {
    this.articleService.getAllLabels().subscribe(x => {
      this.labels = x.data;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
    })
  }

  initArticle(id) {
    //初始化文章
    this.articleService.getArticleById(id).subscribe(x => {
      var article = x.data;
      this.title = article.title;
      article.labelList.forEach(element => {
        this.selectedTags.push(element.labelName);
      });
      this.articleService.getArticleContent(id).subscribe(x1 => {
        this.content = x1.data.content;
      }, (error) => {
        var errorMsg = '网络错误，请重试!';
        if (error instanceof ApiException) {
          errorMsg = error.message;
        }
        this.msg.error(errorMsg);
      });
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
    }
    )
  }

  updateArticle() {
    var params = {
      title: this.title,
      content: this.content,
      labelList: this.selectedTags,
      articleId: this.articleId
    }
    this.articleService.updateArticle(params).subscribe(x => {
      this.notification.success('Success!', '修改文章成功！请前往文章库中查看');
      this.router.navigateByUrl("home/person/myArticle");
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
    })
  }
}
