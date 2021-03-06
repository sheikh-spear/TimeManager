import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap-vue/dist/bootstrap-vue.css'

//Component 
import Login from './views/Login.vue'
import HomePage from './views/HomePage'
import Profile from './views/Profile.vue'
import Employees from './views/Employees.vue'
import Team from './views/Team.vue'
import UserList from './views/UserList'
import TeamDetail from './views/TeamDetail'
import UserDashboard from './views/UserDashboard'
import ToggleButton from 'vue-js-toggle-button'

//utils

import { isLoggedIn } from './utils/auth';

Vue.use(ToggleButton)
Vue.use(BootstrapVue)
//Vue Router Config
Vue.use(VueRouter)

//Route config here 


const routes = [
  { path: '/', component: HomePage },
  //allowAnonymous: true => unprotected route
  {
    path: '/login', component: Login, meta: {
      allowAnonymous: true
    }
  },
  { path: '/profile', component: Profile },
  {
    path: '/employees', component: Employees, meta: {
      allowManager: true
    }
  },
  {
    path: '/team', component: Team, meta: {
      allowManager: true
    }
  },
  { path: '/users', component: UserList },
  { path: '/users/:id', component: UserDashboard },
  { path: '/team/:id', component: TeamDetail }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

//Perform checks on all route changes before they occur
router.beforeEach((to, from, next) => {


  //If the page can't be accessed by non-manager and the user isn't a manager...
  // if (!to.meta.allowManager && !isManager()) {
  //   //..then redirect him to the home page
  //   next({
  //     path: '/'
  //   })
  // }
  //If the page can't be accessed anonymously and the user isn't logged,..
  if (!to.meta.allowAnonymous && !isLoggedIn()) {
    //...then redirect the user to the login page 
    next({
      path: '/login'
    })
  }
  else {
    //Else, we can access to this page 
    next()
  }
})

Vue.config.productionTip = false

//Mock API DATA in developement mode
// if (process.env.NODE_ENV === 'development') {
//   const { worker } = require('./mocks/browser')
//   worker.start()
// }

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
