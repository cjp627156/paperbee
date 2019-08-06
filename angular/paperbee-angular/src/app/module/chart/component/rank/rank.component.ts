import { Component, OnInit } from '@angular/core';
import { ChartService } from '../../chart.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { NzMessageService } from 'ng-zorro-antd';
import { LoadingBarService } from '@ngx-loading-bar/core';

@Component({
  selector: 'app-rank',
  templateUrl: './rank.component.html',
  styleUrls: ['./rank.component.css']
})
export class RankComponent implements OnInit {

  constructor(private chartService :ChartService,private message: NzMessageService,private loadingBar: LoadingBarService) { }

  ngOnInit() {
    this.loadingBar.start();
    this.initRank();
  }

  dataSet = [];

  initRank(){
    this.chartService.getTopIntegralUser().subscribe(response=>{
      this.dataSet= response.data;
      this.loadingBar.complete();
    }, (error) => {
      var errorMsg = '网络异常，请稍后再试';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
      this.loadingBar.complete();
    })
  }

}
