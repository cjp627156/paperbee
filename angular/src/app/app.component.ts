import { Component } from '@angular/core';
import { NzIconService } from 'ng-zorro-antd';



@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Bees';
  constructor(iconService : NzIconService){
    //iconService.addIcon({name : "heading1",theme: 'outline',icon: './assets/images/heading1.svg'});
  }
}
