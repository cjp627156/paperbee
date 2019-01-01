import { HomeComponent } from './component/home/home.component';

export const homeRouter=[
    {
        path:'',
        component:HomeComponent,
        children:[
            // {
            //     path:'agent',
            //     loadChildren:'../agent/agent.module#AgentModule'
            // },
            // {
            //     path:'area',
            //     loadChildren:'../area/area.module#AreaModule'
            // },
            // {
            //     path:'elevator',
            //     loadChildren:'../elevator/elevator.module#ElevatorModule'
            // },
            // {
            //     path:'fault',
            //     loadChildren:'../fault/fault.module#FaultModule'
            // },
            // {
            //     path:'map',
            //     loadChildren:'../map/map.module#MapModule'
            // }
        ]
    }


]