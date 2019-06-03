import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';


@Injectable()
export class MessageService {
    private articleSubject = new Subject<any>();

     //article
     sendArticleMessage(type: String) {
        this.articleSubject.next({ type });
    }

    clearArticleMessage() {
        this.articleSubject.next();
    }

    getArticleMessage(): Observable<any> {
        return this.articleSubject.asObservable();

    }

 // 使用该服务的地方，需要注册MessageService服务；
// constructor(private message: MessageService) {
// }
// // 消息接受的地方；
// public subscription: Subscription;
// ngAfterViewInit(): void {
//   this.subscription = this.message.getMessage().subscribe(msg => {
//    // 根据msg，来处理你的业务逻辑。
//   })
//  }

//  // 组件生命周期结束的时候，记得注销一下，不然会卡；
//  ngOnDestroy(): void {
//   this.subscription.unsubscribe();
//  }

//  // 调用该服务的方法，发送信息；
//  send():void {
//   this.message.sendMessage(‘我发消息了，你们接受下'); // 发送信息消息
//  }
}
