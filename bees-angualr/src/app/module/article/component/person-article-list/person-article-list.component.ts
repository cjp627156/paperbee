import { Component, OnInit } from '@angular/core';
import { NzMessageService } from 'ng-zorro-antd';

@Component({
  selector: 'app-person-article-list',
  templateUrl: './person-article-list.component.html',
  styleUrls: ['./person-article-list.component.css']
})
export class PersonArticleListComponent implements OnInit {

  constructor(private nzMessageService: NzMessageService) { }
  articles: any = [
    {
      articleViews: 1,
      title: "标题"
    },
    {
      articleViews: 1,
      title: "标题"
    }
  ];

  ngOnInit() {
  }
  onDeleteCancel(): void {
    this.nzMessageService.info('click cancel');
  }

  onDeleteConfirm(): void {
    this.nzMessageService.info('click confirm');
  }
  onApproveCancel(): void {
    this.nzMessageService.info('click cancel');
  }

  onApproveConfirm(): void {
    this.nzMessageService.info('click confirm');
  }
  onRejectCancel(): void {
    this.nzMessageService.info('click cancel');
  }

  onRejectConfirm(): void {
    this.nzMessageService.info('click confirm');
  }

}
