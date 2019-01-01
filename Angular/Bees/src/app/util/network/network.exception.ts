export class ApiException implements Error {
    name: string;
    message: string;
    stack?: string;
    constructor(errorMsg: string) {
        this.message = errorMsg;
    }
}