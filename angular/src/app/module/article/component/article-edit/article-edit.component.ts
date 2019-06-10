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
  index = 0;
  labels = [];
  title = "";
  content = "";
  articleId = "";

  colors = [
    'magenta', 'red', '#3496f1', 'green', 'cyan', 'blue', 'geekblue', 'purple', '#f50', '#87d068'
  ]

  columnList = [];
  selectedColumn = null;

  constructor(private msg: NzMessageService, private articleService: ArticleService,
    private notification: NzNotificationService, public router: Router, private localStorage: LocalStorage) { }

  ngOnInit() {
    this.initColumns();
    var articleInfo = this.localStorage.getObject("articleInfo");
    this.articleId = articleInfo.id;
    this.initArticle(this.articleId);
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
        if (this.content == "" || this.content == null) {
          this.content = this.content + '![avatar](' + element.path + ')';
        } else {
          //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
          var tmp1 = this.content.substring(0, this.index);
          var tmp2 = this.content.substring(this.index, this.content.length);
          this.content = tmp1 + '![avatar](' + element.path + ')' + tmp2;
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
      this.selectedColumn = { id: article.columnId, columnName: article.columnName };
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
    var columnId = null;
    if (this.selectedColumn != null) {
      columnId = this.selectedColumn.id;
    }
    var params = {
      title: this.title,
      content: this.content,
      labelList: this.selectedTags,
      articleId: this.articleId,
      columnId: columnId
    }
    this.articleService.updateArticle(params).subscribe(x => {
      this.notification.success('Success!', '修改文章成功！请前往文章库中查看', { nzDuration: 2000 });
      this.router.navigateByUrl("home/person/myArticle");
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
                if (this.content == "" || this.content == null) {
                  this.content = this.content + '![avatar](' + element.path + ')';
                } else {
                  //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
                  var tmp1 = this.content.substring(0, this.index);
                  var tmp2 = this.content.substring(this.index, this.content.length);
                  this.content = tmp1 + '![avatar](' + element.path + ')' + tmp2;
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

  compareFn = (o1: any, o2: any) => (o1 && o2 ? o1.id === o2.id : o1 === o2);

  addTemplate(tmp){
    let position;
    if (this.content == "" || this.content.length == 0) {
      this.content = this.content + tmp;
      position = this.getCursorPositionFromAction(tmp);
    } else {
      //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
      var tmp1 = this.content.substring(0, this.index);
      var tmp2 = this.content.substring(this.index, this.content.length);
      this.content = tmp1 + "\n" + tmp + tmp2;
      position = this.index + 1 + this.getCursorPositionFromAction(tmp);
    }

    this.setCursorPosition(position);
  }

  getCursorPositionFromAction(temp) : number{
    let offset;
    switch (temp) {
      case '```\n\n```\n':
        offset = 4;
        break;
      case '1. ':
        offset = 3;
        break;
      case '- ':
        offset = 2;
        break;
      case '---\n':
        offset = 4;
        break;
      case '- [ ] ':
        offset = 6;
        break;
      case '- [x] ':
        offset = 6;
        break;
      case '> ':
        offset = 2;
        break;
      case '# ':
        offset = 2;
        break;
      case '## ':
        offset = 3;
        break;
      case '### ':
        offset = 4;
        break;
      case '#### ':
        offset = 5;
        break;
      case '##### ':
        offset = 6;
        break;
    }

    return offset;
  }

  setCursorPosition(offset){
    var etextarea: any = document.getElementById("textarea");
    setTimeout(() => {
      etextarea.focus();
      etextarea.selectionStart = offset;
      etextarea.selectionEnd = offset;
      this.index = offset;
    }, 100);
  }

  selectionStart = 0;
  selectionEnd = 0;

  selection(event){
    this.selectionStart = event.target.selectionStart;
    this.selectionEnd = event.target.selectionEnd;
    console.log(this.selectionStart+"-"+this.selectionEnd);
  }

  addMutiSelectTemplate(type){
    let position;
    let rule = this.getRuleFromType(type);
    if (this.content == "" || this.content.length == 0) {
      if(type == "underline"){
        this.content = rule + this.content + "</u>";
      }else{
        this.content = rule + this.content + rule;
      }
      position = this.getCursorPositionFromMutiSelect(type);
    } else {
      //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
      var tmp1 = this.content.substring(0, this.selectionStart);
      var tmp2 = this.content.substring(this.selectionStart, this.selectionEnd);
      var tmp3 = this.content.substring(this.selectionEnd, this.content.length);
      if(type == "underline"){
        this.content = tmp1 + rule + tmp2 + "</u>" + tmp3;
      }else{
        this.content = tmp1 + rule + tmp2 + rule + tmp3;
      }
      position = this.selectionStart + this.getCursorPositionFromMutiSelect(type);
    }

    this.setCursorPosition(position);
    this.selectionStart = 0;
    this.selectionEnd = 0;
  }

  getRuleFromType(type){
    let rule;
    switch (type) {
      case "bold":
        rule = "**";
        break;
      case "italic":
        rule = "*";
        break;
      case "strikethrough":
        rule = "~~";
        break;
      case "underline":
        rule = "<u>";
        break;

    }
    return rule;
  }

  getCursorPositionFromMutiSelect(type){
    let offset;
    switch (type) {
      case "bold":
        offset = 2;
        break;
      case "italic":
          offset = 1;
        break;
      case "strikethrough":
          offset = 2;
        break;
      case "underline":
          offset = 3;
        break;
    }

    return offset;
  }

  addTableTemplate(){
    let position;
    let tmp = " | Header1 | Header2 | Header3 | Header4 | \n | --- | --- | --- | --- | \n | Row1 |  |  |  | \n | Row2 |  |  |  |";
    if (this.content == "" || this.content.length == 0) {
      this.content = this.content + tmp;
      position = 9;
    } else {
      //oldStr:原字符串，insertStr:要插入的字符串，caretPos:要插入的位置
      var tmp1 = this.content.substring(0, this.index);
      var tmp2 = this.content.substring(this.index, this.content.length);
      this.content = tmp1 + "\n" + tmp + "\n" + tmp2;
      position = this.index + 1 + 9;
    }

    this.setCursorPosition(position);
  }


}
