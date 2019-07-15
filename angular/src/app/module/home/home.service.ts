import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { DFConfigApi } from 'src/app/app.config';
import { DFHttManager } from 'src/app/util/network/network.manager';

@Injectable()
export class HomeService {
  constructor(private dFHttManager: DFHttManager) { }

  getMenu(): Observable<any> {
    return this.dFHttManager.get(DFConfigApi.paths.menu);
  }

  getArticles(param): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.articles, param);
  }

  addArticleView(articleId): Observable<any> {
    const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.addArticleView, param);
  }

  getCenterMsgAmount(): Observable<any> {
    return this.dFHttManager.get(DFConfigApi.paths.getCenterMsgAmount);
  }
  getCenterMessage(param: any): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.getCenterMessage, param);
  }
  readCenterMessage(param: any): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.readCenterMessage, param);
  }
}