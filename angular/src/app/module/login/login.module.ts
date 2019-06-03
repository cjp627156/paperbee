import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LoginComponent } from './component/login/login.component';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { RouterModule } from '@angular/router';
import { loginRouter } from './login.routing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LoginService } from './login.service';
import { NetworkModule } from 'src/app/util/network/network.module';
import { LocalStorage } from 'src/app/app.localStorage';
import { NgxLoadingModule } from 'ngx-loading';


@NgModule({
  declarations: [LoginComponent],
  providers: [LoginService, LocalStorage],
  imports: [
    CommonModule,
    /** 导入 ng-zorro-antd 模块 **/
    NgZorroAntdModule,
    // 导入APP路由模块
    RouterModule.forChild(loginRouter),
    ReactiveFormsModule,
    FormsModule,
    NetworkModule,
    NgxLoadingModule
  ]
})
export class LoginModule { }
