import {
    createRouter,
    createWebHistory
} from 'vue-router'
import adminRoutes from './admin'
import publicRoutes from './public'

const routes = [...adminRoutes, ...publicRoutes]

const router = createRouter({
    history: createWebHistory(),
    routes
})

export default router
