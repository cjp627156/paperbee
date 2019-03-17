import { Injectable } from "@angular/core";
import { DFHttManager } from "src/app/util/network/network.manager";
import { DFConfigApi } from "src/app/app.config";
import { Observable } from "rxjs";

@Injectable()
export class PersonService {
  constructor(private dFHttManager: DFHttManager) { }

  getMyArticleList(page, pageSize): Observable<any> {
    let param = {
      page: page,
      pageSize: pageSize
    }
    return this.dFHttManager.post(DFConfigApi.paths.getMyArticleList, param, true);
  }

  deleteArticleByRowId(rowId): Observable<any> {
    let param = {
      rowId: rowId
    }
    return this.dFHttManager.get(DFConfigApi.paths.deleteArticleByRowId, param);
  }

  getUserSelfInfo(): Observable<any> {
    return this.dFHttManager.get(DFConfigApi.paths.getUserSelfInfo);
  }

  updateUserSelfInfo(rowId, username, password, name, phone, email, signature): Observable<any> {
    let param = {
      rowId: rowId,
      username: username,
      password: password,
      name: name,
      phone: phone,
      email: email,
      signature: signature
    }
    return this.dFHttManager.post(DFConfigApi.paths.updateUserSelfInfo, param, true);
  }

  updateUserSignature(rowId, signature): Observable<any> {
    let param = {
      rowId: rowId,
      signature: signature
    }
    return this.dFHttManager.post(DFConfigApi.paths.updateUserSignature, param, true);
  }
}