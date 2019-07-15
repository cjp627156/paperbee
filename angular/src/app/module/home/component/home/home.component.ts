import { Component, OnInit } from '@angular/core';
import { MessageService } from 'src/app/util/message.service';
import { LocalStorage } from 'src/app/app.localStorage';
import { Router } from '@angular/router';
import { HomeService } from '../../home.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { NzMessageService } from 'ng-zorro-antd';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private router: Router, private localStorage: LocalStorage, private messageService: MessageService, private nzMessage: NzMessageService, private homeService: HomeService) {
  }

  searchContent = "";
  username = '';
  todo = "待办";
  message = "消息";
  notice = "通知";
  tagIndexTitle = "消息";
  messageCount: any;
  noticeCount: any;
  todoCount: any;
  img = "../../../../../assets/images/message.png";
  messageData: any = [];
  noticeData: any = [];
  todoData: any = [];
  index = 1;
  count = 0;
  dataType: any = [];
  isSpinning = false;

  ngOnInit() {
    this.username = this.localStorage.get('USER');
    this.articlesQuery();
    this.getCenterMsgAmount();
    this.getMessages();
  }

  articlesQuery() {
    this.messageService.sendArticleMessage(this.searchContent);
  }

  getCenterMsgAmount() {
    this.homeService.getCenterMsgAmount().subscribe(x => {
      this.count = x.data.msgAmount;
    }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.nzMessage.error(errorMsg);
    })
  }

  createArticle() {
    window.open("/createArticle", '_self');
  }

  onLogin() {
    this.router.navigateByUrl('login');
  }

  loginOut() {
    this.localStorage.remove('TOKEN');
    this.localStorage.remove('USER');
    this.localStorage.remove('NAME');
    this.router.navigateByUrl('login');
  }

  tagChange(param: any) {
    if (param.index == 0 && this.tagIndexTitle == "通知") {
      this.img = "../../../../../assets/images/notice.png";
      this.tagIndexTitle = "通知";
     // this.dataType = this.noticeData;
    } else if (param.index == 1 && this.tagIndexTitle == "消息") {
      this.img = "../../../../../assets/images/message.png";
      this.tagIndexTitle = "消息";
      this.dataType = this.messageData;
    } else if (param.index == 2 && this.tagIndexTitle == "待办") {
      this.img = "../../../../../assets/images/todo.png";
      this.tagIndexTitle = "待办";
      this.dataType = this.todoData;
    } else {
      this.img = "../../../../../assets/images/message.png";
      this.tagIndexTitle = "消息";
    //  this.dataType = this.messageData;
    }
  }

  minCount(): void {
    this.count--;
    if (this.count < 0) {
      this.count = 0;
    }
  }

  isCheck(i: number, data: any) {
    if (this.dataType[i].status == "unread") {
      this.dataType[i].status = "read";
      this.minCount();
      var param = [];
      param.push(data.id);
      this.update(param, 'one');
    }
  }

  clearAll() {
    var data = this.dataType.filter((value: any) => value.status == 'unread');
    if (data.length > 0) {
      this.dataType.forEach((element: any) => {
        if (element.status == 'unread') {
          element.status = 'read';
        };
      });
      if (this.count - this.dataType.length < 0) {
        this.count = 0;
      } else {
        this.count = this.count - this.dataType.length;
      }
      var param = [];
      data.forEach((element: any) => {
        param.push(element.id);
      });
      this.update(param, 'all');
    }
  }

  getTotalMessage() {
    this.isSpinning = true;
    this.getMessages();
    // this.getNotice();
    // this.getTodo();
  }

  pageSizeMessage = 15;
  pageIndexMessage = 1;

  getMessages() {
    var param = {
      "pageSize": this.pageSizeMessage,
      "page": this.pageIndexMessage
    }
    this.homeService.getCenterMessage(param).subscribe(x => {
      this.isSpinning = false;
      this.messageData = x.data.result;
      this.dataType = this.messageData;//默认初始化的时，使用消息数组
      this.messageCount = this.messageData.filter((value: any) => value.status == 'unread').length;
      this.getMessageTitle('message');
    }, (error) => {
      this.isSpinning = false;
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.nzMessage.error(errorMsg);
    })
  }



  getMessageTitle(type: any) {
    if (type == 'message') {
      if (this.messageCount > 0) {
        this.message = "消息" + "(" + this.messageCount + ")";
      } else {
        this.message = "消息";
      }
    } else if (type == 'notice') {
      if (this.noticeCount > 0) {
        this.notice = "通知" + "(" + this.noticeCount + ")";
      } else {
        this.notice = "通知";
      }
    } else if (type == 'todo') {
      if (this.todoCount > 0) {
        this.todo = "待办" + "(" + this.todoCount + ")";
      } else {
        this.todo = "待办";
      }
    }
  }

  updateMessage(param: any) {
    this.homeService.readCenterMessage(param).subscribe(x => { }, (error) => {
      var errorMsg = '网络错误，请重试!';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.nzMessage.error(errorMsg);
    })
  }


  update(param: any, type: any) {
    if (this.tagIndexTitle == '通知') {
      if (type == 'one') {
        this.noticeCount--;
        if (this.noticeCount < 0) {
          this.noticeCount = 0;
        }
      } else {
        this.noticeCount = 0;
      }
      this.getMessageTitle('notice');
      // this.updateNotice(param);
    } else if (this.tagIndexTitle == '消息') {
      if (type == 'one') {
        this.messageCount--;
        if (this.messageCount < 0) {
          this.messageCount = 0;
        }
      } else {
        this.messageCount = 0;
      }
      this.getMessageTitle('message');
      this.updateMessage(param);
    } else if (this.tagIndexTitle == '待办') {
      if (type == 'one') {
        this.todoCount--;
        if (this.todoCount < 0) {
          this.todoCount = 0;
        }
      } else {
        this.todoCount = 0;
      }
    }
    this.getMessageTitle('todo');
    // this.updateTodo(param);
  }

  openDetail(param: any) {
    window.open(param);
  }

}

