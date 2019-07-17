import { HomeComponent } from './component/home/home.component';
import { AuthGuard, ConfirmDeactivateGuard } from 'src/app/appGuard.service';

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
                loadChildren:"../person/person.module#PersonModule",
                canActivate:[AuthGuard],
                canDeactivate:[ConfirmDeactivateGuard]
            },
            {
                path:'chart',
                loadChildren:"../chart/chart.module#ChartModule"
            }
        ]
    }
]