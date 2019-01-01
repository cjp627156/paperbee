import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { NgZorroAntdModule, NZ_I18N, en_US } from 'ng-zorro-antd';
import { AppComponent } from './app.component';
import { registerLocaleData } from '@angular/common';
import zh from '@angular/common/locales/zh';
import { AppRoutingModule } from './router/app-routing.module';
import { JwtModule } from '@auth0/angular-jwt';
import { MessageService } from './util/message.service';

registerLocaleData(zh);

@NgModule({
  declarations: [
    AppComponent
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
    JwtModule
  ],
  bootstrap: [AppComponent],
  /** 配置 ng-zorro-antd 国际化 **/
  providers: [{ provide: NZ_I18N, useValue: en_US }, MessageService]
})
export class AppModule { }