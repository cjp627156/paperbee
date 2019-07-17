import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './component/home/home.component';
import { RouterModule } from '@angular/router';
import { homeRouter } from './home.routing';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HomeService } from './home.service';
import { NetworkModule } from 'src/app/util/network/network.module';
import { MarkdownModule } from 'ngx-markdown';
import { LoadingBarModule } from '@ngx-loading-bar/core';

@NgModule({
  declarations: [HomeComponent],
  providers:[HomeService],
  imports: [
    CommonModule,
    RouterModule.forChild(homeRouter),
    NgZorroAntdModule,
    ReactiveFormsModule,
    FormsModule,
    NetworkModule,
    MarkdownModule.forChild(),
    LoadingBarModule,
  ]
})
export class HomeModule { }
