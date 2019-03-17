import { PersonHomeComponent } from "./component/person-home/person-home.component";
import { PersonInfoComponent } from "./component/person-info/person-info.component";
import { MyArticleComponent } from "./component/my-article/my-article.component";


export const PersonRouter=[
    {
        path:'',
        component: PersonHomeComponent,
        children:[
            {
                path:'personInfo',
                component:PersonInfoComponent
            },
            {
                path:"myArticle",
                component:MyArticleComponent
            }
        ]
    }

] 