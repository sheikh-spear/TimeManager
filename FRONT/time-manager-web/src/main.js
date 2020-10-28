import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import Login from './views/Login.vue'
import HomePage from './components/Views/HomePage.vue';
import Profile from './views/Profile.vue';
import BootstrapVue from 'bootstrap-vue';
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)
//Vue Router Config
Vue.use(VueRouter)

const routes = [
  { path: '/', component: HomePage },
  { path: '/login', component: Login },
  { path: '/profile', component: Profile }
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
