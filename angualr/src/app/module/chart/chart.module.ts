import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RankComponent } from './component/rank/rank.component';
import { NgZorroAntdModule } from 'ng-zorro-antd';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { NetworkModule } from 'src/app/util/network/network.module';
import { ChartService } from './chart.service';
import { LocalStorage } from 'src/app/app.localStorage';
import { RouterModule } from '@angular/router';
import { ChartRouter } from './chart.routing';

@NgModule({
  imports: [
    CommonModule,
    NgZorroAntdModule,
    RouterModule.forChild(ChartRouter),
    ReactiveFormsModule,
    FormsModule,
    NetworkModule
  ],
  providers: [ChartService, LocalStorage],
  declarations: [RankComponent]
})
export class ChartModule { }
