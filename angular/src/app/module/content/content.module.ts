import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContentComponent } from './component/content/content.component';
import { RouterModule } from '@angular/router';
import { contentRouter } from './content.routing';
import { MarkdownModule } from 'ngx-markdown';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { ContentService } from './content.service';

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forChild(contentRouter),
    MarkdownModule.forChild(),
    NgZorroAntdModule,
    ReactiveFormsModule,
    FormsModule,
  ], 
  providers:[ContentService],
  declarations: [ContentComponent]
})
export class ContentModule { } 
