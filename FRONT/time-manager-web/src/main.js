import Vue from 'vue'
import VueRouter from 'vue-router'
import App from './App.vue'
import Home from './components/Home.vue'
import Login from './components/Login.vue'

//Vue Router Config
Vue.use(VueRouter)

const routes = [
  { path: '/', component: Home },
  { path: '/login', component: Login }
]

const router = new VueRouter({
  routes
})

Vue.config.productionTip = false

//Mock API DATA in developement mode
if (process.env.NODE_ENV === 'development') {
  console.log("dev");
  const { worker } = require('./mocks/browser')
  worker.start()
}

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')
