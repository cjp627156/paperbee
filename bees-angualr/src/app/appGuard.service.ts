import { Injectable } from '@angular/core';
import { CanActivate, CanDeactivate, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LocalStorage } from './app.localStorage';
import { DFConfigApi } from './app.config';

@Injectable()
export class AuthGuard implements CanActivate {
	constructor(
		private router: Router,
		private localStorage: LocalStorage
	) { }
	canActivate(): boolean {
		// console.log("cdsdvcds");
		// console.log(this.localStorage.getObject(DFConfigApi.localStorageKey.TOKEN));
		// console.log("cdsdvcds");
		// console.log(this.localStorage.getObject(DFConfigApi.localStorageKey.username));
		// console.log("cdsdvcds");
		if (this.localStorage.getObject(DFConfigApi.localStorageKey.TOKEN) && this.localStorage.getObject(DFConfigApi.localStorageKey.username)) {
			return true;
		}
		this.router.navigate(["login"]);
		return false;
		// console.log('canActivateGuard-----------------------------------');
	}
}

@Injectable()
export class ConfirmDeactivateGuard implements CanDeactivate<CanComponentDeactivate> {
	constructor(
	) { }
	canDeactivate(component: CanComponentDeactivate) {
		// console.log('canDeactivateGuard-----------------------------------');
		return true;
	}
}

export interface CanComponentDeactivate {
	canDeactivateTag?: boolean;
	canDeactivate: () => Observable<boolean> | Promise<boolean> | boolean;
}
