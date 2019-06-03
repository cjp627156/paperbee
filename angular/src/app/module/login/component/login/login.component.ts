import { ViewChild,Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { NzMessageService } from 'ng-zorro-antd';
import { Router } from '@angular/router';
import { LoginService } from '../../login.service';
import { ApiException } from 'src/app/util/network/network.exception';
import { NgxLoadingComponent } from 'ngx-loading';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  @ViewChild('ngxLoading') ngxLoadingComponent: NgxLoadingComponent;
  validateForm: FormGroup;
  loading = false;

  constructor(private fb: FormBuilder, private message: NzMessageService,
    public router: Router, private loginService: LoginService
  ) {
  }

  ngOnInit(): void {
    this.validateForm = this.fb.group({
      userName: [null, [Validators.required]],
      password: [null, [Validators.required]],
      remember: [true]
    });
  }

  submitForm(): void {
    for (const i in this.validateForm.controls) {
      this.validateForm.controls[i].markAsDirty();
      this.validateForm.controls[i].updateValueAndValidity();
    }
  }

  login() {
    console.log(this.validateForm.valid);
    
    const formValue = this.validateForm.getRawValue();
    if (formValue.userName != null && formValue.userName != '' && formValue.password != null && formValue.password != '') {
      this.loading = true;
      this.loginService.onLogin(formValue.userName, formValue.password).subscribe(x => {
        this.loading = false;
        this.router.navigateByUrl("home/article");
      }, (error) => {
        this.loading = false;
        var errorMsg = '网络错误，请重试!';
        if (error instanceof ApiException) {
          errorMsg = error.message;
        }
        this.message.error(errorMsg);
      })
    }
  }
}