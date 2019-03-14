import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Index from './views/Index'
import Details from './views/Details'
import Products from './views/Products'
import Login from './views/Login'
import NotFound from './views/NotFound'
import Cart from "./views/Cart"
import Register from "./views/Register"
import Collect from "./views/Collect"
import Payment from "./views/Payment"

import  Model from "./components/Model"
//ES6

Vue.use(Router)

export default new Router({
  // mode:"history",
  base: process.env.BASE_URL,
  routes: [
    { path: '/', component: Home, children:[
      { path:"/details/:lid", component: Details },
      { path:"/products",name:'products', component: Products},
      { path:"/collect",component:Collect},
      { path:"/cart",component:Cart},
      { path:"/payment",component:Payment},
      { path:"", component: Index },
    ]},
    { path: '/login', component: Login },
    { path:"/register",component:Register},
    { path:"/model",component:Model},
    { path: '/*', component:NotFound },
  ]
})
