import { Injectable } from "@angular/core";
import { DFHttManager } from "src/app/util/network/network.manager";
import { Observable } from "rxjs";
import { DFConfigApi } from "src/app/app.config";

declare let wx:any;

@Injectable()
export class ContentService{
  

    constructor(private dFHttManager: DFHttManager) { }

    addArticleComment(param):Observable<any>{
        return this.dFHttManager.post(DFConfigApi.paths.addArticleComment, param);
    }

    getArticleComments(articleId):Observable<any>{
        const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.getArticleComments, param);
    }

    getArticleContent(articleId):Observable<any>{
        const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.getArticleContent, param);
    }

    getArticleById(articleId):Observable<any>{
        const param = { articleId: articleId };
    return this.dFHttManager.get(DFConfigApi.paths.getArticleById, param);
    }

    addArticleView(articleId): Observable<any> {
        const param = { articleId: articleId };
        return this.dFHttManager.get(DFConfigApi.paths.addArticleView, param);
      }


}