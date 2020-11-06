import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import Login from './components/Login.vue'
import HomePage from './Views/HomePage'
import UserList from './Views/UserList'
import TeamList from './Views/TeamList'
import TeamDetail from './Views/TeamDetail'
import BootstrapVue from 'bootstrap-vue'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
//Vue Router Config
Vue.use(VueRouter)

const routes = [
  { path: '/', component: HomePage},
  { path: '/login', component: Login },
  { path: '/teams', component: TeamList},
  { path: '/users', component: UserList },
  { path: '/team/:id', component: TeamDetail}
]

const router = new VueRouter({
  routes
})

Vue.config.productionTip = false

// //Mock API DATA in developement mode
if (process.env.NODE_ENV === 'development') {
  console.log("dev");
  const { worker } = require('./mocks/browser')
  worker.start()
}

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
