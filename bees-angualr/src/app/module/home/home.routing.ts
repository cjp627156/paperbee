import { HomeComponent } from './component/home/home.component';

export const homeRouter=[
    {
        path:'',
        component:HomeComponent,
        children:[
            {
                path:'article',
                loadChildren:'../article/article.module#ArticleModule',
                
            },
            {
                path:'person',
                loadChildren:"../person/person.module#PersonModule"
            }
        ]
    }
]