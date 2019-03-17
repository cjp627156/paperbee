import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { DFConfigApi } from 'src/app/app.config';
import { DFHttManager } from 'src/app/util/network/network.manager';
import { LocalStorage } from 'src/app/app.localStorage';

@Injectable()
export class ArticleService {
  constructor(private dFHttManager: DFHttManager, private localStorage: LocalStorage) { }

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

  articleImageUpload(file: any): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.upload, file, true);
  }

  getAllLabels() {
    return this.dFHttManager.get(DFConfigApi.paths.getAllLabels);
  }

  addArticle(param): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.addArticle, param);
  }

  addArticleLike(articleId): Observable<any> {
    const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.addArticleLike, param);
  }

  cancelArticleLike(articleId): Observable<any> {
    const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.cancelArticleLike, param);
  }

  getArticleById(articleId): Observable<any> {
    const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.getArticleById, param);
  }
  
  getArticleContent(articleId): Observable<any> {
    const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.getArticleContent, param);
  }

  updateArticle(param :any): Observable<any> {
    return this.dFHttManager.post(DFConfigApi.paths.updateArticle, param);
  }
}