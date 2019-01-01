import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HomeComponent } from './component/home/home.component';
import { RouterModule } from '@angular/router';
import { homeRouter } from './home.routing';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

@NgModule({
  declarations: [HomeComponent],

  imports: [
    CommonModule,
    RouterModule.forChild(homeRouter),
    NgZorroAntdModule,
    ReactiveFormsModule,
    FormsModule
  ]
})
export class HomeModule { }
