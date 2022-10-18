import Vue from 'vue'

import Vuex from 'vuex'

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 初始化选课学分
    points: 0,
    points1: 0,
  },
  mutations: {
    // 每次做出必修课程选择都会触发的函数
    cac_points(state, length) {
      state.points = length;
    },
    // 每次做出选修课程选择都会触发的函数
    cac_points1(state, length) {
      state.points1 = length;
    },
  },
})
