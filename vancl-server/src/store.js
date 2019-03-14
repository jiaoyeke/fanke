import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin:false,
    uname:"",
    payState:1,//支付状态
    payTime:0
  },
  mutations: {
    signin(state,uname){ 
      state.isLogin=true;
      state.uname=uname; 
    },
    signout(){ 
      this.state.isLogin=false;
      this.state.uname="";
    },
    payState(state,progress){
      this.state.payState=progress;
    }
  },
  actions: {

  }
})
