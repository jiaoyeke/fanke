<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>
<script>
export default {
  name:"app",
  created(){//在页面加载时读取sessionStorage中的值
    if( sessionStorage.getItem("store")){
      this.$store.replaceState(Object.assign({},this.$store.state,JSON.parse(sessionStorage.getItem("store"))))
    }
    window.addEventListener("beforeunload",()=>{
      sessionStorage.setItem("store",JSON.stringify(this.$store.state));
    })
  }
  
}
</script>
<style scoped>

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  /*text-align: center;*/
  color: #2c3e50;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

</style>
