import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ArticleHomeComponent } from './component/article-home/article-home.component';
import { RouterModule } from '@angular/router';
import { articleRouter } from './article.routing';
import { ArticleService } from './article.service';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NetworkModule } from 'src/app/util/network/network.module';
import { PersonArticleListComponent } from './component/person-article-list/person-article-list.component';
import { MarkdownModule } from 'ngx-markdown';

@NgModule({
  declarations: [ArticleHomeComponent, PersonArticleListComponent],
  providers:[ArticleService],
  imports: [
    CommonModule,
    RouterModule.forChild(articleRouter),
    NgZorroAntdModule,
    ReactiveFormsModule,
    FormsModule,
    MarkdownModule.forChild(),
    NetworkModule
  ]
})
export class ArticleModule { }
