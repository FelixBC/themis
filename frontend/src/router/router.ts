import {createRouter, createWebHashHistory, RouteRecordRaw} from 'vue-router';

const routes: Array<RouteRecordRaw> = [
    {
        path: '/',
        name: 'Login',
        component: () => import('../components/Login.vue'),
    },
    {
        path: '/userCreate',
        name: 'UserCreate',
        component: () => import('../components/UserCreate.vue'),
    },
    {
        path: '/mainUserLayout',
        name: 'MainUserLayout',
        component: () => import('../components/MainUserLayout.vue'),
        children: [
            {
                path: '/recommendations',
                name: 'Recommendations',
                component: () => import('../components/UserCreate.vue'),
            },
        ]
    },
    {
        path: '/mainLayout',
        name: 'MainLayout',
        component: () => import('../components/MainLayout.vue'),
        children: [
            {
                path: '/dashboard',
                name: 'home ',
                component: () => import('../components/Home.vue'),
            },
            {
                path: '/users/create',
                name: 'UserCreate',
                component: () => import('../components/UserCreate.vue'),
            },
        ]

    }
];


const router = createRouter({
    history: createWebHashHistory(),
    routes,
});

export default router;
