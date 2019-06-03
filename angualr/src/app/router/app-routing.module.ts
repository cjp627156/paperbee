import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { routers } from './app.routing';


@NgModule({
  imports: [RouterModule.forRoot(routers)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
