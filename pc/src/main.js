// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import settings from "./settings";

Vue.config.productionTip = false
Vue.prototype.$settings = settings;   // 挂载settings.js里的后台跨域地址

Vue.config.productionTip = false

//  element-ui配置
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import locale from '../node_modules/element-ui/lib/locale/lang/en';

Vue.use(ElementUI,{locale});

import axios from "axios"

axios.defaults.withCredentials = false;
Vue.prototype.$axios = axios;    //挂载请求发送工具axios

// 引入vuex
import store from './store/index';

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: {App},
  template: '<App/>'
})
