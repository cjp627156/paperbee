import { Component, OnInit } from '@angular/core';
import { MessageService } from 'src/app/util/message.service';
import { LocalStorage } from 'src/app/app.localStorage';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  constructor(private router: Router, private localStorage: LocalStorage, private messageService: MessageService) { }

  searchContent = "";
  public username = '';

  ngOnInit() {
    this.username = this.localStorage.get('USER');
    if (JSON.stringify(this.localStorage.get('TOKEN')) == "false") {
      this.router.navigateByUrl('login');
    } else {
      this.articlesQuery();
    }
  }

  articlesQuery() {
    this.messageService.sendArticleMessage(this.searchContent);
  }


  createArticle() {
    window.open("/createArticle", '_self');
  }

}

