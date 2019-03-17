import { ArticleHomeComponent } from "./component/article-home/article-home.component";
import { PersonArticleListComponent } from "./component/person-article-list/person-article-list.component";
import { ArticleCreateComponent } from "./component/article-create/article-create.component";


export const articleRouter = [
    {
        path: '',
        component: ArticleHomeComponent,
    },
    {
        path: 'personArticleList',
        component: PersonArticleListComponent
    }
]