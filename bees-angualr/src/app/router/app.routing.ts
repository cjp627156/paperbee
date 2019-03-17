import { ArticleCreateComponent } from "../module/article/component/article-create/article-create.component";
import { ArticleEditComponent } from "../module/article/component/article-edit/article-edit.component";

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
        loadChildren: "../module/home/home.module#HomeModule",
        // canActivate: [AuthGuard],
        // canDeactivate: [ConfirmDeactivateGuard]
    },
    {
        path: 'content',
        loadChildren: "../module/content/content.module#ContentModule"
    },
    {
        path: 'createArticle',
        component: ArticleCreateComponent
    },
    {
        path: 'editArticle',
        component: ArticleEditComponent
    }
]