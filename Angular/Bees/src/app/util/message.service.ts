import { Injectable } from '@angular/core';
import { Subject, Observable } from 'rxjs';


@Injectable()
export class MessageService {
    private areaSubject = new Subject<any>();
    private agentSubject = new Subject<any>();
    private elevatorSubject = new Subject<any>();
    private faultSubject = new Subject<any>();
    private mapSubject = new Subject<any>();
    /**
    * content模块里面进行信息传输，类似广播
    * @param type 发送的信息类型
    */

    //area
    sendAreaMessage(type: String) {
        this.areaSubject.next({ type });
    }

    clearAreaMessage() {
        this.areaSubject.next();
    }

    getAreaMessage(): Observable<any> {
        return this.areaSubject.asObservable();

    }
    //agent
    sendAgentMessage(type: String) {
        this.agentSubject.next({ type });
    }

    clearAgentMessage() {
        this.agentSubject.next();
    }

    getAgentMessage(): Observable<any> {
        return this.agentSubject.asObservable();
    }
    //elevator
    sendElevatorMessage(type: String) {
        this.elevatorSubject.next({ type });
    }

    clearElevatorMessage() {
        this.elevatorSubject.next();
    }

    getElevatorMessage(): Observable<any> {
        return this.elevatorSubject.asObservable();
    }
    //fault
    sendFaultMessage(type: String) {
        this.faultSubject.next({ type });
    }

    clearFaultMessage() {
        this.faultSubject.next();
    }

    getFaultMessage(): Observable<any> {
        return this.faultSubject.asObservable();
    }
    //map
    sendMapMessage(type: String) {
        this.mapSubject.next({ type });
    }

    clearMapMessage() {
        this.mapSubject.next();
    }

    getMapMessage(): Observable<any> {
        return this.mapSubject.asObservable();
    }


}
// // 使用该服务的地方，需要注册MessageService服务；
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
