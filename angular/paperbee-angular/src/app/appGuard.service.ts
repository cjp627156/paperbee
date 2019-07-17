import { Injectable } from '@angular/core';
import { CanActivate, CanDeactivate, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { LocalStorage } from './app.localStorage';

@Injectable()
export class AuthGuard implements CanActivate {
	constructor(
		private router: Router,
		private localStorage: LocalStorage
	) { }
	canActivate(): boolean {
		if (JSON.stringify(this.localStorage.get('TOKEN')) != "false") {
			return true;
		}
		this.router.navigate(["login"]);
		return false;
	}
}

@Injectable()
export class ConfirmDeactivateGuard implements CanDeactivate<CanComponentDeactivate> {
	constructor(
	) { }
	canDeactivate(component: CanComponentDeactivate) {
		return true;
	}
}

export interface CanComponentDeactivate {
	canDeactivateTag?: boolean;
	canDeactivate: () => Observable<boolean> | Promise<boolean> | boolean;
}
