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
                component: () => import('../components/Recommendations.vue'),
            },
            {
                path: '/current-events',
                name: 'Events',
                component: () => import('../components/Events.vue'),
            }
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
                path: '/users',
                name: 'UserList',
                component: () => import('../components/UserList.vue'),
            },
            {
                path: '/users/create',
                name: 'UserCreate',
                component: () => import('../components/UserCreate.vue'),
            },
            {
                path: '/employees',
                name: 'EmployeeList',
                component: () => import('../components/EmployeeList.vue'),
            },
            {
                path: '/employees/create',
                name: 'EmployeeCreate',
                component: () => import('../components/EmployeeCreate.vue'),
            },
            {
                path: '/provinces',
                name: 'ProvinceList',
                component: () => import('../components/ProvinceList.vue'),
            },
            {
                path: '/provinces/create',
                name: 'ProvinceCreate',
                component: () => import('../components/ProvinceCreate.vue'),
            },
            {
                path: '/cities',
                name: 'CityList',
                component: () => import('../components/CityList.vue'),
            },
            {
                path: '/cities/create',
                name: 'CityCreate',
                component: () => import('../components/CityCreate.vue'),
            },
            {
                path: '/sectors/create',
                name: 'SectorCreate',
                component: () => import('../components/SectorCreate.vue'),
            },
            {
                path: '/sectors',
                name: 'SectorList',
                component: () => import('../components/SectorList.vue'),
            },
            {
                path: '/books',
                name: 'BookList',
                component: () => import('../components/BookList.vue'),
            },
            {
                path: '/books/create',
                name: 'BookCreate',
                component: () => import('../components/BookCreate.vue'),
            },
            {
                path: '/authors',
                name: 'AuthorList',
                component: () => import('../components/AuthorList.vue'),
            },
            {
                path: '/authors/create',
                name: 'AuthorCreate',
                component: () => import('../components/AuthorCreate.vue'),
            },
            {
                path: '/events',
                name: 'EventList',
                component: () => import('../components/EventList.vue'),
            },
            {
                path: '/events/create',
                name: 'EventCreate',
                component: () => import('../components/EventCreate.vue'),
            },
            {
                path: '/reservations/create',
                name: 'ReservationCreate',
                component: () => import('../components/ReservationCreate.vue'),
            },
            {
                path: '/reservations',
                name: 'ReservationList',
                component: () => import('../components/ReservationList.vue'),
            },
            {
                path: '/book-checkouts',
                name: 'BookCheckoutList',
                component: () => import('../components/BookCheckoutList.vue'),
            },
            {
                path: '/book-checkouts/create',
                name: 'BookCheckoutCreate',
                component: () => import('../components/BookCheckoutCreate.vue'),
            },
            {
                path: '/productCreate',
                name: 'ProductCreate',
                component: () => import('../components/ProductCreate.vue'),
            },
            {
                path: '/reservationSpaceCreate',
                name: 'ReservationSpaceCreate',
                component: () => import('../components/ReservationSpaceCreate.vue'),
            },
            {
                path: '/reservationSpaceList',
                name: 'ReservationSpaceList',
                component: () => import('../components/ReservationSpaceList.vue'),
            },
            {
                path: '/orderCreate',
                name: 'OrderCreate',
                component: () => import('../components/OrderCreate.vue'),
            },
            {
                path: '/orderList',
                name: 'OrderList',
                component: () => import('../components/OrderList.vue'),
            }
        ]

    }
];


const router = createRouter({
    history: createWebHashHistory(),
    routes,
});

export default router;
