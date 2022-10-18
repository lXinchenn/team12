<template>
  <div id="app">
    <!--    各个子路由的入口-->
    <router-view v-if="isRouterAlive"/>
  </div>
</template>

<script>
export default {
  name: 'App',
  provide() {
    return {
      reload: this.reload
    }
  },
  data() {
    return {
      isRouterAlive: true
    }
  },
  methods: {
    // 全局配置页面刷新函数
    reload() {
      this.isRouterAlive = false
      this.$nextTick(function () {
        this.isRouterAlive = true
      })
    }
  }
}
</script>

<style>
/*全局配置背景颜色*/
#app {
  /*background: url('/static/background.jpg');*/
  background-color: #B0E2FF;
  width: 100%;
  height: 100%;
  position: fixed;
  background-size: 100% 100%;
  /*overflow-y: scroll;*/
  margin: -0.9vh -0.4vw;
}

/*全局隐藏滚动条*/
::-webkit-scrollbar {
  width: 0 !important;
}

::-webkit-scrollbar {
  width: 0 !important;
  height: 0;
}

</style>
