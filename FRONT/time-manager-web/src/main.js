import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap-vue/dist/bootstrap-vue.css'
import Login from './views/Login.vue'
import HomePage from './views/HomePage'
import Profile from './views/Profile.vue'
import UserList from './views/UserList'
import TeamList from './views/TeamList'
import TeamDetail from './views/TeamDetail'
import UserDashboard from './views/UserDashboard'
import ToggleButton from 'vue-js-toggle-button'

Vue.use(ToggleButton)
Vue.use(BootstrapVue)
//Vue Router Config
Vue.use(VueRouter)

const routes = [
  { path: '/', component: HomePage },
  { path: '/login', component: Login },
  { path: '/profile', component: Profile },
  { path: '/teams', component: TeamList },
  { path: '/users', component: UserList },
  { path: '/users/:id', component: UserDashboard },
  { path: '/team/:id', component: TeamDetail }
]

const router = new VueRouter({
  mode: 'history',
  routes
})

Vue.config.productionTip = false

// //Mock API DATA in developement mode
if (process.env.NODE_ENV === 'development') {
  const { worker } = require('./mocks/browser')
  worker.start()
}

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
