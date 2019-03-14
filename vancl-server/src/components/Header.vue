<template><!--header.html-->
<header>
  <!-- 顶部导航-->
  <div id="top">
      <div class="list  my-color">
          <span>您好,欢迎光临凡客诚品！</span>
            <span  v-if="!this.$store.state.isLogin">
                <router-link to="/register" class="my-color" target="_blank" append>注册</router-link>
                <b>|</b>
                <router-link :to="{path:'/login',append:'true'}" class="my-color" target="_blank" append>登录</router-link>

            </span>
            <span  v-else>
                <a href="javascript:;" style="color:#000">欢迎{{this.$store.state.uname}}</a>
                <b>|</b>
                <a href="JavaScript:;" style="color:#666" @click="signout">注销</a>
                <b>|</b>
                <router-link to="/collect" class="my-color">我的收藏夹</router-link>
            </span>
          <a href="javascript:;" class="par"><img src="img/header/laba.png" alt=""/></a>
          <a href="javascript:;" class="my-color">网站公告</a>
          <a href="javascript:;" class="par"><img src="img/header/weixin-weibo.png" alt=""/></a>
          <a href="javascript:;" style="display:none"><img src="img/header/weixin.png" alt=""/></a>
      </div>
  </div>
  <div id="container">
      <!-- 搜索-->
      <div id="header">
          <div id="search">
              <input type="text" placeholder='搜索"休闲裤,体验与众不同"' class="my-color search-input"  v-model="kwords"/><a href="javascript:;" class="search-btn" @click="handleSearch">搜索</a>
              <a href="javascript:;" class="search-cart" @click="gotoCart"></a>
          </div>
      </div>
      <!--导航-->

      <div class="nav">
          <router-link to="/" class="lf" ><img src="img/header/logo_new.jpg" alt=""/></router-link>
          <ul class="lf dropdown" >
              <li v-for="item of navlist" @mouseenter="onenter(item.nid,$event)" @mouseleave="onleave()" class="">
                  <a href="javascript:;">{{item.nav}}</a>
                  <ul class="dropdown-menu" :style="item.nid==nid?showMenu:''">
                      <li v-for="tmp of item.list"><a href="javascript:;">{{tmp}}</a></li>
                  </ul>
              </li>
          </ul>
      </div>
  </div>
</header>
</template>
<script>
    export default {
     data(){
        return {
            kwords:"",
            products:{},
            navlist:[
            {nid:1,nav:"T恤",list:["有领","无领","长袖","短袖"]},
            {nid:2,nav:"衬衫",list:["有领","无领","长袖","短袖"]},
            {nid:3,nav:"C9",list:["有领","无领","长袖","短袖"]},
            {nid:4,nav:"麻",list:["有领","无领","长袖","短袖"]},
            {nid:5,nav:"鞋",list:["有领","无领","长袖","短袖"]},
            {nid:6,nav:"水柔棉",list:["有领","无领","长袖","短袖"]},
            {nid:7,nav:"裤装",list:["有领","无领","长袖","短袖"]},
            {nid:8,nav:"裤装",list:["有领","无领","长袖","短袖"]},
            {nid:9,nav:"私人定制",list:["有领","无领","长袖","短袖"]},
            
        ],
        nid:0,
        showMenu:{
            display:"none",
        }
     }
    },
    created(){
       
    },
    methods:{
        gotoCart(){//去购物车
            if(this.$store.state.isLogin){
                this.$router.push("/cart")
            }else{
                this.toast("请登录",1500);
            }
        },
        handleSearch(){//搜索
        // if(this.kwords!="")
        //  this.$router.push(`/products/${this.kwords}`);
        // },
        let kwords=this.kwords;
        console.log(kwords);
        this.$router.push({
            path:"/products",
            query:{
                kwords:kwords
            }
        })
        },
        onenter(nid,e){
            e.preventDefault();
            this.nid=nid
            this.showMenu.display="block";
        },
        onleave(){
            this.showMenu.display="none";
        },
        signout(){
            this.$store.commit("signout");
            this.axios.get("http://127.0.0.1:3000/user/signout");
        }
    },
    watch:{
        "$route":{
            handler(to){ //操作发生变化的值一定要重新再这初始化一下，不然会保留上次执行后的结果
                // if(!to.params.kwords){
                //     this.kwords="";
                // }else{
                //     this.kwords=to.params.kwords;
                // }
                this.kwords=to.query.kwords;
            },
            immediate:true//立刻
        }
    }
  }
</script>
<style scoped>/* header.css */
#top{
    width:100%;
    height:37px;
    line-height:37px;
    background: #F7F7F7;
    border: 1px solid  #CCCCCC;
}
#top .list{
    margin-left:55%;
}
#top .list a{
    text-decoration: none;
    padding:0 8px;
}
#top a:last-child:hover{
    text-decoration: none;
    padding:5px 8px;
}
#top .list a.par{
    position:relative;
}
#top .list a.par>img{
    vertical-align:middle;
   /* position:relative;
    top:6px;
    left:0;*/
}
#container{
    width:1200px;
    margin: 0 auto;
}
#header{
    margin-top:15px;
}
#search{
    /*width:400px;*/
    float:right;
    position:relative;
}
#search::after,#header::after{
    content:"";
    display: block;
    clear:both;
}
#search .search-input{
    width:330px;
    height:30px;
    line-height:30px;
    display:inline-block ;
    outline:none;
    background: #fff;
    padding-left:10px;
    font-size:15px;
}
#search .search-btn{
    width:40px;
    height:34px;
    line-height:34px;
    text-align:center;
    display:inline-block ;
    color:#fff;
    font-size:14px;
    text-decoration: none;
    outline:none;
    background: #B71B22;
    margin-right:130px;
    margin-top:11px;
    margin-bottom:11px;
}
#search .search-cart {
    display: inline-block;
    background: url(../../public/img/header/cart.png);
    width: 111px;
    height: 31px;
    position:absolute;
    top:13px;
    right:0px;
}
.nav{
    width:1200px;
    height:48px;
    margin-top:20px;
}
.nav>ul{
    list-style: none;
    margin-left:104px;
    width:909px;
    height:30px;
}
.nav>ul>li{
    float:left;
    margin-top:15px;
}

/*鼠标滑动显示菜单*/
.dropdown>li{
    position: relative;
}

.dropdown>li>a{
    display: block;
}
.nav .dropdown>li>ul.dropdown-menu{
    list-style:none;
    display:none;
    width:100px;
    margin:0; padding:0;
    position:absolute;
    top:30px;
    left:0;
    z-index:20;
    box-sizing:border-box;
}
.dropdown>li>ul.dropdown-menu>li{
    width:100px;
}
.nav>ul>li>a,.nav .dropdown>li>ul.dropdown-menu a{
    width:100px;
    height:30px;
    line-height:30px;
    display: inline-block;
    text-decoration:none;
    color:#B77D66;
    font-size:15px;
    border-left:1px solid #B77D66;
    text-align: center;
    background:#fff;
}
.nav .dropdown>li>ul.dropdown-menu a{
    border:1px dotted #ddd;
}
.nav .dropdown>li>ul.dropdown-menu a:hover{
    background: #ddd;
}

</style>