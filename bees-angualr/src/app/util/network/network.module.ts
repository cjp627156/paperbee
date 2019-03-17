import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HttpModule, JsonpModule } from '@angular/http';
import { DFHttp } from './network.base';
import { DFHttManager } from './network.manager';

@NgModule({
  declarations: [],
  imports: [
    CommonModule,
    HttpModule,
    JsonpModule
  ],
  providers: [DFHttManager, DFHttp]
})
export class NetworkModule { }
