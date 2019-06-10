import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HttpClient } from '@angular/common/http';
import { NgZorroAntdModule, NZ_I18N, en_US } from 'ng-zorro-antd';
import { AppComponent } from './app.component';
import { registerLocaleData } from '@angular/common';
import zh from '@angular/common/locales/zh';
import { AppRoutingModule } from './router/app-routing.module';
import { JwtModule } from '@auth0/angular-jwt';
import { MessageService } from './util/message.service';
import { LocalStorage } from './app.localStorage';
import { MarkdownModule, MarkedOptions, MarkedRenderer } from 'ngx-markdown';
import { AuthGuard, ConfirmDeactivateGuard } from './appGuard.service';
import { ArticleCreateComponent } from './module/article/component/article-create/article-create.component';
import { NetworkModule } from './util/network/network.module';
import { ArticleEditComponent } from './module/article/component/article-edit/article-edit.component';
import en from '@angular/common/locales/en';

registerLocaleData(zh);

export function markedOptionsFactory(): MarkedOptions {
  const renderer = new MarkedRenderer();

  renderer.blockquote = (text: string) => {
    return '<blockquote class="blockquote"><p>' + text + '</p></blockquote>';
  };

  return {
    renderer: renderer,
    gfm: true,
    tables: true,
    breaks: false,
    pedantic: false,
    sanitize: false,
    smartLists: true,
    smartypants: false,
  };
}

@NgModule({
  declarations: [
    AppComponent, ArticleCreateComponent,ArticleEditComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpClientModule,
    BrowserAnimationsModule,
    /** 导入 ng-zorro-antd 模块 **/
    NgZorroAntdModule,
    // 导入APP路由模块
    AppRoutingModule,
    NetworkModule,
    JwtModule,
    MarkdownModule.forRoot({
      loader: HttpClient,
      markedOptions: {
        provide: MarkedOptions,
        useFactory: markedOptionsFactory
      },
    }),
  ],
  bootstrap: [AppComponent],
  /** 配置 ng-zorro-antd 国际化 **/
  providers: [{ provide: NZ_I18N, useValue: en_US }, MessageService, LocalStorage, AuthGuard, ConfirmDeactivateGuard]
})
export class AppModule { }