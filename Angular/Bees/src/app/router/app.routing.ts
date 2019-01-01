
export const routers = [
    {
        path: '',
        redirectTo: 'login',
        pathMatch: 'full'
    },
    {
        path: 'login',
        loadChildren: "../module/login/login.module#LoginModule"
    },
    {
        path: 'home',
        loadChildren: "../module/home/home.module#HomeModule"
    }
]