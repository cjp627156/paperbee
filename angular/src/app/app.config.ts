/**
 * app 常量配置文件
 */

export const DFConfigApi: any = {
    networkCode: {
        SUCCESS: "ok",
        FAILED: "error"
    },
    domain: "/api/bees", 
    //domain: "http://localhost:8010/bees", 
    //domain: "http://paperbee.definesys.com/api/bees", 
    roles: Array<string>(),
    paths: {
        "loginin": "/user/login",
        "menu": "/article/getTopLabels",
        "articles": "/article/query",
        "addArticleView":"/article/addArticleView",
        "upload":"/article/imgUpload",
        "getAllLabels":"/article/getAllLabels",
        "addArticle":"/article/addArticle",
        "addArticleLike":"/article/addArticleLike",
        "cancelArticleLike":"/article/cancelArticleLike",
        "addArticleComment":"/article/addArticleComment",
        "getArticleComments":"/article/getArticleComments",
        "getArticleById":"/article/getArticleById",
        "getMyArticleList":"/article/getMyArticleList",
        "deleteArticleByRowId":"/article/deleteArticleByRowId",
        "getUserSelfInfo":"/user/getSelfInfo",
        "updateUserSelfInfo":"/user/updateSelfInfo",
        "updateUserSignature":"/user/updateUserSignature",
        "getArticleContent":"/article/getArticleContent",
        "updateArticle":"/article/updateArticle",
        "getUserColumns":"/user/getColunmList",
        "getTopIntegralUser":"/user/getTopIntegralUser"
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