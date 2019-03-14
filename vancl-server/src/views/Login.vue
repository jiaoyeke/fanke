<template><!--login.html <body>-->
  <div >
    <div id="container">
		<div class="top clear">
			<router-link to="/"><img src="img/login/logo_new.jpg" alt=""/></router-link>
			<a href="#" class="right">帮助</a>
		</div>
		<div class="main clear">
			<div class="main-left">
				<img src="img/login/login120412_newlogo.jpg" alt=""/>
			</div>
			<div class="main-right right">
				<span>凡客Vancl登录</span>
				<span>没有账户 <router-link to="/register">注册</router-link></span>
				<div class="content">
					<span>用户登录</span>
					<form action="">
						<div>
							<input type="text" v-model="uname" placeholder="请输入用户名" autofocus  >
						</div>
						<div>
							<input type="password" v-model="upwd" placeholder="请输入密码"  >
						</div>
						<div>
							<a href="#">找回密码</a>
						</div>
						<div>
							<input type="button" value="立即登录" @click="signin">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </div>
</template>
<script>
  export default {
    data(){
      return {
        uname:"",
        upwd:""
      }
    },
    // created(){
    //     this.axios.post(
    //      "http://127.0.0.1:3000/user/login",`uname=zhangmanman&upwd=123456`
    //     ).then(res=>{
    //          this.axios.get("http://127.0.0.1:3000/cart/addCart?pid=1&size=2&count=1").then((result)=>{
    //                 console.log(result);
    //             })
    //     })
    // },
    methods:{
      signin(){
        this.axios.post(
         "http://127.0.0.1:3000/user/login",`uname=${this.uname}&upwd=${this.upwd}`
        ).then(res=>{
          if(res.data.code==1){
            alert("登陆成功!");
            this.$store.commit(
              "signin", res.data.uname
            );
            this.$router.push("/");
          }else{
            alert("用户名或密码错误!");
          }
        })
      }
    }
  }
</script>
<style scoped>/*login.html <style>*/
#container{
    text-align:left;
    width:1200px;
    margin:0 auto;
}
#container div.top{
    margin-top:80px;
    border-bottom:1px solid #000;
    padding-bottom: 20px;
    position:relative;
}
#container div.top>a{
    text-decoration: none;
    color:#000000;
    margin-top:30px;
    position:relative;
    top:5px;
    right: 0;
}
#container  .main{
    margin-top:100px;
    margin-left: 50px;
}
#container .main .main-right{
    width:600px;
    height:400px;
    box-sizing: border-box;
    padding:0 100px;
}
#container .main .main-left{
    display: inline-block;
}
#container .main .main-right>span:first-child{
    color:#9F808F;
    font-size:23px;
    font-weight: bold;
}
#container .main .main-right>span:nth-child(2){
    font-size:15px;
    float:right;
    margin-top: 8px;
}
#container .main .main-right>span:nth-child(2)>a{
    color:#666666;
    font-size:15px;
    text-decoration: none;
}
#container .main .main-right .content{
    border: 1px solid #ddd;
}
#container .main .main-right .content>span{
    display: block;
    padding:16px 20px;
    text-align: center;
    font-size:17px;
    background: #B71B22;
    color:#fff;
    border-radius: 3px;
}
#container .main .main-right .content>form>div{
    margin-top:30px;
    text-align: center;
}
#container .main .main-right .content>form>div>input{
    width:300px;
    padding:10px 20px;
    background: #FAFFBD;
    outline:none;
}
#container .main .main-right .content>form>div:nth-child(3){
    margin: 20px 0 10px;
    text-align: right;
}
#container .main .main-right .content>form>div:nth-child(4){
    margin: 0 0 20px;
}
#container .main .main-right .content>form>div>a{
    text-decoration: none;
    color:#666;
    margin-right: 27px;
}
#container .main .main-right .content>form>div>a:hover{
    color:#0aa1ed;
}
#container .main .main-right .content>form>div:last-child input{
    color:#fff;
    background: #B71B22;
    font-size:17px;
    height:50px;
    width:344px;
    border-radius: 3px;
}
</style>
