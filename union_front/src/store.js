import Vue from "vue"
import Vuex from 'vuex'

Vue.use(Vuex)
const actions = {}
const state = {
  token: localStorage.getItem('token') || null
}
const mutations = {
  handleToken: (state, token) => {
    state.token = token
    localStorage.setItem('token', token); //把用户信息存储到localStorage中
  },
  deleteToken: () => {
    localStorage.removeItem('token');
  }
}

const getters = {
  token: (state) => state.token
}

const store = new Vuex.Store({
  actions,
  mutations,
  state,
  getters
})

export default {
  store
}
