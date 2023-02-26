
 import Home from '../Components/puplic/Home.vue'

 import NotFound from '../Components/inc/NotFound.vue'

const routes = [
    {
        path: '/',
        name: 'home',
        component: Home,
    },
    {
        path : '/:pathMatch(.*)*',
        name : 'NotFound',
        component : NotFound
    }
];

export default routes;
