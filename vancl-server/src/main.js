import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios'
import myToast from '../src/assets/js/toast'
import myModel from '../src/assets/js/model'
import bus from '../src/assets/js/bus'
Vue.config.debug=true;
Vue.config.productionTip = false;
//要求axios每次必须携带cookie去服务端
axios.defaults.withCredentials=true;
Vue.prototype.axios=axios;
Vue.use(myModel)
Vue.prototype.toast=myToast;
new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
