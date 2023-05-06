// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios from 'axios'
import ViewUI from 'view-design';
import store from './store.js'
import 'view-design/dist/styles/iview.css';
import '@/assets/css/global.css'; //全局css

Vue.config.productionTip = false
Vue.prototype.$http = axios;
axios.defaults.withCredentials = true

Vue.use(ViewUI);

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: {
    App
  },
  template: '<App/>'
})
