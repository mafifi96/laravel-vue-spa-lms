
//import Home from '../Components/inc/Home'

 import Login from '../Components/auth/Login.vue'

 import NotFound from '../Components/inc/NotFound.vue'

/*

import Category from '../Components/Guest/Category'

import Brand from '../Components/Guest/Brand'

import Search from '../Components/Guest/Search'

import Product from '../Components/Guest/Product'

import Cart from '../Components/Guest/Cart'

import Checkout from '../Components/Guest/Checkout'
 */

const routes = [
    {
        path: '/',
        name: 'login',
        component: Login
    },
    {
        path : '/:pathMatch(.*)*',
        name : 'NotFound',
        component : NotFound
    }
];

export default routes;
