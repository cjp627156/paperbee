import { Injectable } from "@angular/core";
import { DFHttManager } from "src/app/util/network/network.manager";
import { Observable } from "rxjs";
import { DFConfigApi } from "src/app/app.config";

@Injectable()
export class ChartService {
  constructor(private dFHttManager: DFHttManager) { }

  getTopIntegralUser():Observable<any>{
    return this.dFHttManager.get(DFConfigApi.paths.getTopIntegralUser);
  }
}