import Vue from 'vue'
import Router from 'vue-router'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'

Vue.use(Router)

const createRouter = () =>
  new Router({
    mode: "history",
    routes: [
      // 路由重定向到login
      {
        path: '/',
        redirect: '/login',
      },
      // login路由
      {
        path: '/login',
        name: 'Login',
        component: () => import("../pages/login"),
      },
      // 专业方向选择路由
      {
        path: '/choice',
        name: 'Choice',
        component: () => import("../pages/choice"),
      },
      // 选课界面路由
      {
        path: '/home',
        name: 'Home',
        component: () => import("../pages/home"),
      },
    ]
  })

const router = createRouter()
router.beforeEach(async (to, from, next) => {
  NProgress.start();
  next();
});

router.afterEach(() => {
  NProgress.done();
});

export default router;
