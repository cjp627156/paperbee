/**
 * app 常量配置文件
 */
export const DFConfigApi: any = {
    networkCode: {
        SUCCESS: "ok",
        FAILED: "error"
    },
    domain: "http://47.96.238.21:8010/bees",
    roles: Array<string>(),
    paths: {
        "loginin": "/comm/login",
    },
    lookupType: {

    }
    ,
    localStorageKey: {
        "TOKEN": "undefined",//token
        "USER": "USER",
        "ROLE": ""
    }
}