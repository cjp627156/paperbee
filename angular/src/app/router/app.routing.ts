import { ArticleCreateComponent } from "../module/article/component/article-create/article-create.component";
import { ArticleEditComponent } from "../module/article/component/article-edit/article-edit.component";
import { AuthGuard, ConfirmDeactivateGuard } from "../appGuard.service";

export const routers = [
    {
        path: '',
        redirectTo: 'home/article',
        pathMatch: 'full'
    },
    {
        path: 'login',
        loadChildren: "../module/login/login.module#LoginModule"
    },
    {
        path: 'home',
        loadChildren: "../module/home/home.module#HomeModule"
    },
    {
        path: 'content',
        loadChildren: "../module/content/content.module#ContentModule"
    },
    {
        path: 'createArticle',
        component: ArticleCreateComponent,
        canActivate:[AuthGuard],
        canDeactivate:[ConfirmDeactivateGuard]
    },
    {
        path: 'editArticle',
        component: ArticleEditComponent,
        canActivate:[AuthGuard],
        canDeactivate:[ConfirmDeactivateGuard]
    }
]