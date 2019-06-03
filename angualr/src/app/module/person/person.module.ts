import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PersonHomeComponent } from './component/person-home/person-home.component';
import { PersonRouter } from './person.routing';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { RouterModule } from '@angular/router';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NetworkModule } from 'src/app/util/network/network.module';
import { PersonInfoComponent } from './component/person-info/person-info.component';
import { MyArticleComponent } from './component/my-article/my-article.component';
import { PersonService } from './person.service';
import { LocalStorage } from 'src/app/app.localStorage';

@NgModule({
  imports: [
    CommonModule,
    NgZorroAntdModule,
    RouterModule.forChild(PersonRouter),
    ReactiveFormsModule,
    FormsModule,
    NetworkModule
  ],
  providers: [PersonService, LocalStorage],
  declarations: [PersonHomeComponent, PersonInfoComponent, MyArticleComponent]
})
export class PersonModule { }
