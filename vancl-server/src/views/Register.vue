<template>
    <div >
    <div id="container">
		<div class="top clear">
			<a href="index.html"><img src="img/login/logo_new.jpg" alt=""/></a>
			<a href="#" class="right">帮助</a>
		</div>
		<div class="main clear">
			<div class="main-left">
				<img src="img/login/login120412_newlogo.jpg" alt=""/>
			</div>
			<div class="main-right right">
				<span>凡客Vancl注册</span>
				<span>已有账户 <router-link to="/login">去登陆</router-link></span>
				<div class="content">
					<span>用户登录</span>
					<form action="">
						<div>
							<input type="text" v-model="uname" placeholder="请输入用户名：6~16位字母、数字、下划线"   >
                            <span :class="unameStyle">{{unameSpan}}</span>
						</div>
						<div>
							<input type="text" v-model="email" placeholder="请输入邮箱">
                            <span :class="emailStyle">{{emailSpan}}</span>
						</div>
						<div>
							<input type="password" v-model="upwd1" placeholder="请输入密码：6~16位字母、数字、下划线"  >
                            <span :class="upwd1Style">{{upwd1Span}}</span>
						</div>
						<div>
							<input type="password" v-model="upwd2" placeholder="请再次入密码"  >
                            <span :class="upwd2Style">{{upwd2Span}}</span>
						</div>
						<div>
							<input type="button" value="立即注册" @click="signup">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
  </div>
</template>
<script>
    export default{
        data(){
            return {
                uname:"",
                email:"",
                upwd1:"",
                upwd2:"",
                unameSpan:"",
                emailSpan:"",
                upwd1Span:"",
                upwd2Span:"",
                unameStyle:{
                    fail:false,
                    success:false
                },
                emailStyle:{
                    fail:false,
                    success:false
                },
                upwd1Style:{
                    fail:false,
                    success:false
                },
                upwd2Style:{
                    fail:false,
                    success:false
                },
                
                
            }
        },
        methods:{
            //正则表达式验证
            vail(reg,tar){
                if(reg.test(tar)){
                    return true;
                }else{
                    return false;
                }
            },
            signup(){
                let isSignup=this.emailStyle.success&&this.unameStyle.success&&this.upwd1Style.success&&this.upwd2Style.success;
                if(isSignup){
                    // console.log(123);
                    window.alert(`注册成功`);
                    this.axios.post("http://127.0.0.1:3000/user/reg",`uname=${this.uname}&upwd=${this.upwd1}&email=${this.email}`).then((result)=>{
                        console.log(result);
                    })
                    this.$router.push("/login");
                }
            },
        },
        watch:{
            upwd1(){
                if(!this.upwd1.trim()){
                   this.upw1Span="密码不能为空";
                   this.upw1Style.fail=true;
                   this.upw1Style.success=false;
                   return; 
                }
                var flag=this.vail(/^\d{6,16}$/,this.upwd1);
                if(!flag){
                    this.upwd1Span="密码格式不正确",
                   this.upwd1Style.fail=true;
                   this.upwd1Style.success=false;
                }else{
                    this.upwd1Span="",
                    this.upwd1Style.fail=false;
                    this.upwd1Style.success=true;
                }
            },
            upwd2(){
                if(this.upwd1!=this.upwd2){
                    this.upwd2Span="两次输入的密码不一致",
                   this.upwd2Style.fail=true;
                   this.upwd2Style.success=false;
                }else{
                    this.upwd2Span="",
                    this.upwd2Style.fail=false;
                    this.upwd2Style.success=true;
                }
            },
            uname(){
                if(!this.uname.trim()){
                   this.unameSpan="用户名不能为空";
                   this.unameStyle.fail=true;
                   this.unameStyle.success=false;
                   return; 
                }
                var flag=this.vail(/\w{6,16}$/,this.uname)
               if(!flag){
                   this.unameSpan="用户名格式不正确",
                   this.unameStyle.fail=true;
                   this.unameStyle.success=false;
               }else{
                   this.axios.get("http://localhost:3000/user/check_uname?uname="+this.uname).then(res=>{
                   if(res.data.code==1){
                       this.unameSpan="",
                        this.unameStyle.fail=false;
                        this.unameStyle.success=true;
                    }else{
                        this.unameSpan=res.data.msg;
                        this.unameStyle.fail=true;
                        this.unameStyle.success=false;
                    }
                })
               }
            },
            email(){
                if(!this.email.trim()){
                   this.emailSpan="邮箱不能为空";
                   this.emailStyle.fail=true;
                    this.emailStyle.success=false;
                   return; 
                }
                var flag=this.vail(/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/,this.email)
               if(!flag){
                   this.emailSpan="邮箱格式不正确",
                   this.emailStyle.fail=true;
                    this.emailStyle.success=false;
               }else{
                    this.axios.get("http://localhost:3000/user/check_email?email="+this.email).then(res=>{
                    console.log(res.data)
                
                   if(res.data.code==1){
                        this.emailSpan="",
                        this.emailStyle.fail=false;
                        this.emailStyle.success=true;
                    }else{
                        this.emailSpan=res.data.msg;
                        this.emailStyle.fail=true;
                        this.emailStyle.success=false;
                    
                    }
                })
            }
        }
       
    }
}

</script>
<style scoped>
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
/***input样式定制 */
#container .main .main-right .content>form>div{
    margin-top:35px;
    text-align: center;
    position:relative;
    top:0;left:0;
}
#container .main .main-right .content>form>div>span{
    display:none;
}
#container .main .main-right .content>form>div>span.fail{
    display:inline-block;
    position:absolute;
    top:45px;
    left:27px;
    color:red;
    font-size:14px;
}
#container .main .main-right .content>form>div>span.success{
    display:inline-block;
    width:22px;
    height:22px;
    position:absolute;
    bottom:8px;
    right:35px;
    background:url("../../public/img/register/true.png")
}
#container .main .main-right .content>form>div>input{
    width:300px;
    padding:10px 20px;
    background: #FAFFBD;
    outline:none;
}

#container .main .main-right .content>form>div:last-child{
    margin:  30px 0;
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