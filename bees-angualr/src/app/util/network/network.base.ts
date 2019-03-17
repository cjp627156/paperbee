import { Http, Response, Headers } from '@angular/http';
import 'rxjs/add/observable/throw';
import 'rxjs/add/observable/forkJoin';
import { Injectable } from '@angular/core';
import { LocalStorage } from '../../app.localStorage';
import { DFConfigApi } from '../../app.config';
import { Observable } from 'rxjs/internal/Observable';
import { catchError } from 'rxjs/operators';

@Injectable()
export class DFHttp {
    constructor(private http: Http, private storage: LocalStorage) {
    }

    private httpOptions = {
        'token': ""
    }

    /**
     * get 请求
     * 
     * @param {any} url 
     * @param {any} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttp
     */
    get(url, params?): Observable<any> {
        url += '?';
        for (let key in params) {
            url += `${key}=${params[key]}` + '&&';
        }
        this.httpOptions.token =this.storage.get('TOKEN');
        return this.http.get(url, { headers: new Headers(this.httpOptions) }).pipe(catchError(this.handleError));
    }

    /**
     * post 请求
     * 
     * @param {any} url 
     * @param {any} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttp
     */
    post(url, params?, isToken?): Observable<any> {
        if (isToken) {
            this.httpOptions.token =this.storage.get('TOKEN');
        }
        return this.http.post(url, params, { headers: new Headers(this.httpOptions), withCredentials: true }).pipe(catchError(this.handleError));
    }

    getTestJSon(url): Observable<any> {
        return this.http.get(url);
    }

    /**
     * 网络异常捕捉
     * 
     * @private
     * @param {(Response|any)} error 
     * @returns 
     * @memberof DFHttp
     */
    private handleError(error: Response | any) {
        console.log('************ network error ************')
        let errMsg: string;
        if (error instanceof Response) {
            const body = error.json();
            const err = body.error || JSON.stringify(body);
            errMsg = `${error.status} - ${error.statusText || ''} ${err}`;
        } else {
            errMsg = error.message ? error.message : error.toString();
        }
        console.error(errMsg);
        console.log('************ network error end ************');
        return Observable.throw(errMsg);
    }
}
