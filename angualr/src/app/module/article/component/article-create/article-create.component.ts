import { Component, OnInit } from '@angular/core';
import { NzMessageService, UploadFile, NzNotificationService } from 'ng-zorro-antd';
import { ArticleService } from '../../article.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { Router } from '@angular/router';

@Component({
  selector: 'app-article-create',
  templateUrl: './article-create.component.html',
  styleUrls: ['./article-create.component.css'],
  providers: [ArticleService]
})
export class ArticleCreateComponent implements OnInit {

  isVisible = false;
  markdown: any = "";
  index = 0;
  labels = [];
  title = "";

  colors = [
    'magenta', 'red', '#3496f1', 'green', 'cyan', 'blue', 'geekblue', 'purple', '#f50', '#87d068'
  ]

  columnList = [];
  selectedColumn = null;

  constructor(private msg: NzMessageService, private articleService: ArticleService,
    private notification: NzNotificationService, public router: Router) { }

  ngOnInit() {
    this.initColumns();
    this.initAllLabels();
    this.setPasteImg();
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

  onPublic() {
    var columnId = null;
    if (this.selectedColumn != null) {
      columnId = this.selectedColumn.id;
    }
    var params = {
      title: this.title,
      content: this.markdown,
      labelList: this.selectedTags,
      columnId: columnId
    }
    this.articleService.addArticle(params).subscribe(x => {
      this.notification.success('Success!', '上传文章成功！请前往文章库中查看', { nzDuration: 2000 });
      this.router.navigateByUrl("home/article");
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
    })
  }

  formData1 = new FormData();
  //获取粘贴板上的图片
  setPasteImg() {
    // //粘贴事件
    var blob: any;
    document.addEventListener('paste', (event: any) => {
      if (event.clipboardData || event.originalEvent) {
        var clipboardData = (event.clipboardData || event.originalEvent.clipboardData);
        if (clipboardData.items) {
          for (var i = 0; i < clipboardData.items.length; i++) {
            if (clipboardData.items[i].type.indexOf("image") !== -1) {
              blob = clipboardData.items[i].getAsFile();
            }
          }
          // console.log(blob);
          if (blob) {
            this.formData1.append('uploadFile', blob);
            this.articleService.articleImageUpload(this.formData1).subscribe(x => {
              blob = "";
              this.formData1 = new FormData();
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
            }, (error) => {
              var errorMsg = '网络错误，请重试!';
              if (error instanceof ApiException) {
                errorMsg = error.message;
              }
              this.msg.error(errorMsg);
            })
          }
        }
      }
    })
  }


  initColumns() {
    this.articleService.getColunmList().subscribe(response => {
      this.columnList = response.data;
    }, (error) => {
      var errorMsg = '网络异常，请稍后再试';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.msg.error(errorMsg);
    })
  }

}
