import { Component, OnInit, ViewChild, ElementRef } from '@angular/core';
import { PersonService } from '../../person.service';
import { NzMessageService, NzModalService } from 'ng-zorro-antd';
import { MessageService } from 'src/app/util/message.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { LoadingBarService } from '@ngx-loading-bar/core';

@Component({
  selector: 'app-person-info',
  templateUrl: './person-info.component.html',
  styleUrls: ['./person-info.component.css']
})
export class PersonInfoComponent implements OnInit {

  constructor(private personService:PersonService, private message: NzMessageService,
    private messageService: MessageService, private modalService: NzModalService,private loadingBar: LoadingBarService) { }

  ngOnInit() {
    this.loadingBar.start();
    this.initColumns();
    this.initUserInfo();
  }

  rowId:string;
  username:string;
  name:string;
  password:string;
  email:string;
  phone:string;
  signature:string;
  integral:number;
  inputVisible='N';
  columnInputVisible=false;
  columnInputValue='';
  columnTags=[];
  @ViewChild('inputElement') inputElement: ElementRef;

  initUserInfo(){
    this.personService.getUserSelfInfo().subscribe(response=>{
      this.rowId=response.data.rowId;
      this.username=response.data.username;
      this.name=response.data.name;
      this.password=response.data.password;
      this.email=response.data.email;
      this.phone=response.data.phone;
      this.signature=response.data.signature;
      this.integral=response.data.integral;
      this.loadingBar.complete();
    }, (error) => {
      var errorMsg = '网络异常，请稍后再试';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
      this.loadingBar.complete();
    })
  }

  initColumns(){
    this.personService.getColunmList().subscribe(response=>{
      this.columnTags=response.data;
    }, (error) => {
      var errorMsg = '网络异常，请稍后再试';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }

  onEdit(){
    this.initColumns();
    this.inputVisible='Y';
  }

  onSave(){
    this.personService.updateUserSelfInfo(this.rowId,this.username,this.password,this.name,this.phone,
      this.email,this.signature,this.columnTags).subscribe(response=>{
        this.inputVisible='N';
      }, (error) => {
        var errorMsg = '网络异常，请稍后再试';
        if (error instanceof ApiException) {
          errorMsg = error.message;
        }
        this.message.error(errorMsg);
      })
  }


  handleClose(removedTag: {}): void {
    this.columnTags = this.columnTags.filter(tag => tag !== removedTag);
  }

  showInput(): void {
    this.columnInputVisible=true;
    setTimeout(() => {
      this.inputElement.nativeElement.focus();
    }, 10);
  }

  handleInputConfirm(): void {
    if (this.columnInputValue && this.columnTags.indexOf(this.columnInputValue) === -1) {
      this.columnTags = [...this.columnTags,{id:"add",columnName:this.columnInputValue} ];
    }
    this.columnInputValue = '';
    this.columnInputVisible=false;
  }


  getUserInfo(){
    this.personService.getUserSelfInfo().subscribe(response=>{
      this.rowId=response.data.rowId;
      this.username=response.data.username;
      this.name=response.data.name;
      this.password=response.data.password;
      this.email=response.data.email;
      this.phone=response.data.phone;
      this.signature=response.data.signature;
      this.integral=response.data.integral;
    }, (error) => {
      var errorMsg = '网络异常，请稍后再试';
      if (error instanceof ApiException) {
        errorMsg = error.message;
      }
      this.message.error(errorMsg);
    })
  }


}
