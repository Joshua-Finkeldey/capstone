import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import EmployeeHome from '../views/EmployeeHome.vue'
import AboutUs from '../views/AboutUs.vue'
import ContactUs from '../views/ContactUs.vue'
import OrderNow from '../views/OrderNow.vue'
import Location from '../views/Location.vue'
import Pizza from '../views/Pizza.vue'
import Board from '../views/Board.vue'
import AddCard from '../views/AddCard.vue'
import OrderNowCustomPizzaV from '../views/OrderNowCustomPizzaV.vue'
import OrderNowSpecialtyPizzaV from '../views/OrderNowSpecialtyPizzaV.vue'
import NewSpecialtyView from '../views/NewSpecialtyView.vue'


Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth:  false //Should be true if we want to protect this route.
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/employee-home",
      name: "employee-home",
      component: EmployeeHome,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/contact-us",
      name: "contactUs",
      component: ContactUs,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/about-us",
      name: "aboutUs",
      component: AboutUs,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/order-now",
      name: "orderNow",
      component: OrderNow,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/location",
      name: "location",
      component: Location,
      meta: {
        requiresAuth: false
      }
    },
    {
        path: "/order-now-custom-pizzaV",
        name: "orderNowCustomPizzaV",
        component: OrderNowCustomPizzaV,
        meta: {
          requiresAuth: false
      }
    },
    {
      path: "/order-now-specialty-pizzaV",
      name: "orderNowSpecialtyPizzaV",
      component: OrderNowSpecialtyPizzaV,
      meta: {
        requiresAuth: false
    }
  },
    {
      path: '/board/:id',
      name: 'Board',
      component: Board,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/board/:boardID/pizza/:pizzaID',
      name: 'Pizza',
      component: Pizza,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: '/board/:boardID/card/create',
      name: 'AddCard',
      component: AddCard
    },
    {
      path: "/new-specialty-view",
      name: "NewSpecialtyView",
      component: NewSpecialtyView,
      meta: {
        requiresAuth: true
      }
    }
    


    // need path for ModifyPizza

  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
