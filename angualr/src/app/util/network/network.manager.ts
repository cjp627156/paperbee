
import { Injectable } from "@angular/core";
import { DFConfigApi } from '../../app.config';
import { ApiException } from './network.exception';
import { Observable } from 'rxjs/internal/Observable';
import { map, catchError, timeout } from 'rxjs/operators';
import { DFHttp } from './network.base';


@Injectable()
export class DFHttManager {

    /**
     * domian 
     * 超时时间
     * @type {string}
     * @memberof DFHttManager
     */
    public domain: string = DFConfigApi.domain;
    timeout: number = 12000;

    constructor(public dfHttp: DFHttp) { }

    /**
     * 全路径网络请求get
     * 
     * @param {string} url 
     * @param {*} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttManager
     */
    fullGet(url: string, params?: any): Observable<any> {
        return this.dfHttp.get(url, params).pipe(map((response) => {
            let data = response.json();
            if (typeof data === 'undefined') {
                data = {};
            } else if (data.code != DFConfigApi.networkCode.SUCCESS) {
                throw new ApiException(data.msg);
            }
            return data;
        }, (error) => {
            return error;
        }),
            timeout(this.timeout),
            catchError((error: Response | any) => {
                return Observable.throw(error);
            })
        );
    }

    /**
     * 全路径网络请求post
     * 
     * @param {any} url 
     * @param {any} string 
     * @param {*} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttManager
     */
    fullPost(url: string, params?: any, isToken?: boolean): Observable<any> {
        return this.dfHttp.post(url, params, isToken).pipe(
            map((response) => {
                let data = response.json();
                if (typeof data === 'undefined') {
                    data = {};
                }
                else if (data.code !== DFConfigApi.networkCode.SUCCESS) {
                    throw new ApiException(data.message);
                }
                return data;
            }, (error) => {
                return error;
            }),
            // timeout(this.timeout),
            // catchError((error:Response | any)=>{
            //   return error;
            //     //     // console.log(error.message );
            //     // return Observable.throw(error);
            // })
        );
    }

    /**
     * 使用domain的网络请求get
     * 
     * @param {any} url 
     * @param {any} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttManager
     */
    get(url, params?): Observable<any> {
        var fullURL = this.domain + url;
        return this.fullGet(fullURL, params);
    }

    getTestJson(url): Observable<any> {
        return this.dfHttp.getTestJSon(url).pipe(map((response) => {
            let data = response.json();
            console.log(data);
            return data;
        }));
    }


    /**
     * 使用domain的网络请求post
     * 
     * @param {any} url 
     * @param {any} [params] 
     * @returns {Observable<any>} 
     * @memberof DFHttManager
     */
    post(url, params?, isToken?): Observable<any> {
        var fullURL = this.domain + url;
        return this.fullPost(fullURL, params, isToken);
    }
}