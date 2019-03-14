<template>
  <div>
    <div id="main" class="clear" v-if="dataList.product">
        <div id="bread">
            <a href="">首页</a>
            <span>&gt;</span>
            <a href="">女装</a>
            <span>&gt;</span>
            <a href="">大衣</a>
            <span>&gt;</span>
        </div>
        <div id="name" class="clear">
            <p class="lf">{{dataList.product.title}}</p>
            <p class="right">
                <a href="javascript:;"  @click="goToHash('goumai')">购买指南</a>
                <span>|</span>
                <a href="javascript:;" @click="goToHash('mote')">模特搭配</a>
                <span>|</span>
                <a href="javascript:;" @click="goToHash('banxing')">版型工艺</a>
                <span>|</span>
                <a href="javascript:;" @click="goToHash('sheji')">设计细节</a>
                <span>|</span>
                <a href="javascript:;"  >评论</a>
                <span>|</span>
                <a href="javascript:;">提问</a>
            </p>
        </div>
        <div id="details" class="clear">
            <!--左边内容-->
            <div id="left-content" class="lf">
                <div class="md-img" v-if="dataList.pics">
                    <img :src="mdImg" alt=" " >
                    <div id="mask":style="maskStyle"></div>
                    <div id="superMask" @mousemove="changeMove($event)" @mouseover="show" @mouseout="hide"></div>
                </div>
                <div id="lg-img" :style="lgStyle"></div>
                <div id="slide-img">
                    <a href="javascript:;"@click="moveRight" :class="{disabled:!canRight}"></a>
                    <div>
                        <ul v-if="dataList.pics" :style="ulImgStyle">
                        <li v-for="item of dataList.pics">
                            <img :src="item.sm" @mouseover="changeMImg(item.md,item.lg,item.pic_id)" :style="selLi==item.pic_id?'border: 1px solid red':''"/>
                        </li>
                        </ul>
                    </div>
                    <a href="javascript:;" @click="moveLeft" :class="{disabled:!canLeft}"></a>
                </div>
            </div>
            <div id="right-content" class="right">
                <div class="p-price">
                    <p>售价：<span>¥{{dataList.product.price}}</span></p>
                    <p>服务承诺：{{dataList.product.promise}}</p>
                </div>
                <p>客服: <span>联系客服</span><img src="img/product/product_details/kefuf.gif" alt=""></p>
                <div class="spec" v-if="dataList.specs">
                    <span>颜色:</span>
                     <router-link v-for="item of dataList.specs" :to="'/details/'+item.pid" :key="item.cid":style="$route.params.lid==item.pid?colorStyle:''">{{item.color}}</router-link>
                    <!--<a href="#" class="active">深蓝色</a>
                    <a href="#">酒红色</a>
                    <a href="#">墨绿色</a>
                    <a href="#">咖啡色</a>
                    <a href="#">粉色</a>
                    <a href="#">淡黄色</a>-->
                </div>
                <div class="spec" v-if="dataList.specs">
                    <span>尺寸:</span>
                    <a href="javascript:;" class="size" v-for="item of dataList.product.size.split('|')" :class="size==item?'active':''"@click="selSize(item)">{{item}}</a>
                    <!--<a href="#">XL</a>
                    <a href="#">XXL</a>
                    <a href="#">XXXL</a>-->
                </div>
                <div class="num">
                    <span>数量:</span>
                    <button @click="changeNum(-1)">-</button>
                    <input type="text" v-model="count"/>
                    <button @click="changeNum(+1)">+</button>
                </div>
                <div class="btn">
                    <a href="javascript:;" @click="payMent">立即购买</a>
                    <a href="javascript:;" @click="addCart($route.params.lid)">
                        <img src="img/icon/product_detail_cart.png" alt="">
                        加入购物车</a>
                    <a href="javascript:;"@click="collectPro($route.params.lid)">
                        <img src="img/icon/product_detail_shoucang.png" alt="">
                        收藏</a>
                </div>
                <div class="count">
                    <fieldset>
                        <legend>优惠信息</legend>
                        <p>· 两件8折，三件7折</p>
                        <p>· 全场699元免运费</p>
                    </fieldset>
                </div>
            </div>
        </div>
        <div id="recommend">
            <p @click="recommend">猜你喜欢 <span>大家都在看</span></p>
            <div class="recommend-content" @mouseleave="recommend" @mouseenter="clearRecom"ref="tab" style="width:1280px;overflow:hidden">
                <div class="scrollLeft"  style="float:left;width:200%">
                    <div class="scroll-item1" ref="tab1" style="float:left">
                        <img src="img/product/md/6375214-1j201709151925388161.jpg" alt="">
                        <img src="img/product/md/6375218-1j201710130915288969.jpg" alt="">
                        <img src="img/product/md/6375440-1j201709151926140815.jpg" alt="">
                        <img src="img/product/md/6375443-1j201710131550493576.jpg" alt="">
                    </div>
                    <div class="scroll-item2" ref="tab2" style="float:left">
                        <img src="img/product/md/6377996-1j201710121408227197.jpg" alt="">
                        <img src="img/product/md/6375218-1j201710130915288969.jpg" alt="">
                        <img src="img/product/md/6375451-1j201710130915290844.jpg" alt="">
                        <img src="img/product/md/6379027-1j201711101839399639.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div id="product-details">
            <div id="goumai" ref="goumai">
                <img src="img/product/product_details/lid1/lid1_01.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_02.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_03.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_04.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_05.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_07.jpg" alt=""/>
            </div>
            <div id="mote" ref="mote">
                <img src="img/product/product_details/lid1/lid1_07.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_08.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_09.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_10.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_11.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_12.jpg" alt=""/>
            </div>
            <div id="banxing" ref="banxing">
                <img src="img/product/product_details/lid1/lid1_13.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_14.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_15.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_16.jpg" alt=""/>
            </div>
            <div id="sheji" ref="sheji">
                <img src="img/product/product_details/lid1/lid1_17.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_18.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_19.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_20.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_21.jpg" alt=""/>
                <img src="img/product/product_details/lid1/lid1_22.jpg" alt=""/>
            </div>
        </div>
    </div>
    <div class="totop" v-show="scrollTop>500"  @click="goTo">
        <img src="img/totop.png" alt="">
    </div>
  </div>
</template>
<script>
    export default{
        data(){
           return{
               count:1,//商品个数 //操作发生变化
               dataList:{},
               ulImgStyle:{//小图片滑动
                    "margin-left":0,//操作发生变化
                   width:"",
               },
               selLi:0,//被选中的li
               mdImg:"",//中图片
               lgStyle:{//大图片样式
                   "background-image":"", 
                   "background-position":"0px 0px",
               },
               moved:0,//左移的元素个数 //操作发生变化
               canLeft:false,//小图片左滑动 //操作发生变化
               canRight:false,//小图片右滑动 //操作发生变化
               size:"", //操作发生变化
               maskStyle:{//小的遮罩层样式
                "display":"none",
                "top":0,
                "left":0,
               },
               
               colorStyle:{
                   "border":"2px solid red",
               },
               scrollTop:0,
               timer:null
           } 
        },
        created(){
            this.sendRequest();
        },
        mounted() {
            window.addEventListener("scroll",this.handleScroll);
            // this.recommend();
            console.log(this.$refs);
        },
        methods:{
            goToHash(name){//点击电梯导航去指定地方
                console.log(this.$refs[name].offsetTop);
                let top=this.$refs[name].offsetTop-178;//减去头部高度
                window.scrollTo(0,top);
            },
            recommend(){//推荐商品
                console.log(this.$refs);
                var tab=this.$refs.tab;
                var tab1=this.$refs.tab1;
                var tab2=this.$refs.tab2;
                var i=0;
                this.timer=setInterval(()=>{
                    if(tab2.offsetWidth<=tab.scrollLeft){
                        tab.scrollLeft-=tab1.offsetWidth;
                    }else {
                       tab.scrollLeft++;
                    } 
                },20);
               
            },
            clearRecom(){
                clearInterval(this.timer)
            },
            goTo(){
                window.scrollTo(0,0)
            },
            handleScroll(){
                var scrollTop=document.body.scrollTop||document.documentElement.scrollTop;
                this.scrollTop=scrollTop;
            },
            payMent(){
                if(!this.$store.state.isLogin){
                    this.toast("请先登录",1500);
                    return;
                }
                let size=this.size;
                if(!size){
                    this.toast("请选择衣服尺码",1500);
                    return;
                }
                let count=this.count;
                let title=this.dataList.product.title;
                let color=this.dataList.product.color;
                let img=this.dataList.pics[0].sm;
                let price=this.dataList.product.price;
                let list={
                    count:count,
                    title:title,
                    color:color,
                    size:size,
                    img:img,
                    price:price,
                }
                let payList=[];
                payList.push(list);
                console.log(payList);
                sessionStorage.setItem("payList",JSON.stringify(payList));
                this.$router.push("/payment");
            },
            addCart(lid){//添加购物车
                console.log(lid);
                let pid=lid;
                let size=this.size;
                let count=this.count;
                if(size==""){
                    this.toast("请选择衣服尺码",1500);
                    return;
                }
                this.axios.get("http://127.0.0.1:3000/cart/addCart",{params:{
                    pid:pid,
                    size:size,
                    count:count
                }}).then((result)=>{
                    console.log(result);
                    this.toast(result.data.msg,1000)
                })
            },
            collectPro(lid){//收藏商品
                let pid =lid;
                this.axios.get("http://127.0.0.1:3000/products/addCollect",{params:{
                    pid:pid,
                }}).then((result)=>{
                    console.log(result);
                    this.toast(result.data.msg,1000)
            })
            },
            selSize(size){
                this.size=size;
            },
            moveLeft(){//图片左移
                // console.log("Right");
                if(this.canLeft){
                    this.moved+=1;
                    this.ulImgStyle["margin-left"]=-60*this.moved+"px";
                    this.canRight=true;
                    if(this.moved==this.dataList.pics.length-6){//剩余的图片刚好展示完
                        this.canLeft=false;
                    }
                }
            },
            moveRight(){//图片右移
                if(this.canRight){
                    this.moved+=-1;
                    this.ulImgStyle["margin-left"]=-60*this.moved+"px";
                    this.canLeft=true;
                    if(this.moved==0){//刚开始没有移动，图片不能右移
                        this.canRight=false;
                    }
                }
                
            },
            changeMove(e){//显示改变遮罩层的位置及显示方式
                // console.log(`showMStyle`);
                // console.log(e.offsetX,e.offsetY);
                var mWidth=200;//小的遮罩层的宽和高
                var mHeight=200;
                var sMHeight=400;
                var sMWidth=400;//大的遮罩层的宽和高
                var mleft=e.offsetX-mWidth/2;
                var mtop=e.offsetY-mHeight/2;
                if(mleft<0){
                    mleft=0;
                }else if(mleft>sMWidth-mWidth){
                    mleft=sMWidth-mWidth
                }
                if(mtop<0){
                    mtop=0;
                }else if(mtop>sMHeight-mHeight){
                    mtop=sMHeight-mHeight
                }
                // console.log(mtop);
                // console.log(mleft);
                this.maskStyle.top=mtop+"px";//千万不要忘记写px单位
                this.maskStyle.left=mleft+"px";
                this.lgStyle["background-position"]=`-${2*mleft}px -${2*mtop}px`
            },
            changeNum(num){//商品数量
                if(num>0){
                    this.count=this.count+1;
                }
                if(num<0&&this.count>1){
                    this.count=this.count-1;
                }
            },
            //封装显示mask和大图背景的方法
            show(){
                this.maskStyle.display="block";
                this.lgStyle.display="block";
            },
            //封装隐藏mask和大图背景的方法
            hide(){
                this.maskStyle.display="none";
                this.lgStyle.display="none";
            },
            //封装大图和中图变化的函数
              changeMImg(md,lg,id){
                this.mdImg=md;
                this.lgStyle["background-image"]="url("+lg+")";
                this.selLi=id;
                    
            },
            //封装ajax请求
            sendRequest(){
                var lid=this.$route.params.lid
                // console.log(lid);
                this.axios.get("http://127.0.0.1:3000/details?pid="+lid).then((result)=>{
                // console.log(result);
                this.dataList=result.data;
                this.ulImgStyle.width=60*this.dataList.pics.length+"px",
                this.mdImg=this.dataList.pics[0].md;
                this.lgStyle["background-image"]="url("+this.dataList.pics[0].lg+")";//不要忘记写url()!!
                // console.log(this.lgStyle["background-image"]);
                this.canLeft=this.dataList.pics.length>6;
                this.canRight=false;
            })
            },

        },
        destroyed() {
            window.removeEventListener('scroll',this.handleScroll);
            clearInterval(this.timer)
            this.timer=null;
        },
        watch:{//监视路由一旦发生变化就重新发送请求
            "$route":{
                handler(){ //操作发生变化的值一定要重新再这初始化一下，不然会保留上次执行后的结果
                    this.sendRequest();
                    this.size="";
                    this.count=1;
                    this.canLeft=false;//小图片左滑动
                    this.canRight=false;//小图片右滑动
                    this.moved=0;
                    this.ulImgStyle["margin-left"]=0;
                },
                immediate:true//立刻
            },
        }
    }
</script>
<style scoped>
  #main{
    text-align:left;
    width:1200px;
    margin:0 auto;
}
/**面包屑导航 */
#bread{
    padding:20px 0px 0px;
}
#bread>a{
    font-size:16px;
    color:#666;
    text-decoration: none;
}
#name{
    padding: 20px 0px 10px 0;
    border-bottom: 1px solid #666;
}
#name>p:first-child,#name>p>a{
    color:#000;
    font-size:20px;
    font-weight: bold;
    font-family: "Microsoft YaHei";
}
#name>p>a{
    display: inline-block;
    padding:0px 6px;
    font-size:18px;
    color:#000;
    text-decoration: none;
}
#name>p>a:first-child{
    border:0;
}
#details{
    margin:50px 0 0 50px;
}
#left-content{
    position:relative;
}
/**中图片显示**/
#left-content .md-img{
    position:relative;
    top:0;
    left:0;
}
/**遮罩层 */
#mask{
    width:200px;
    height:200px;
    background:rgba(255,0,0,0.2);
    position:absolute;
    top:0;
    left:0;
    display:none;
}
#mask.show{
    display:block;
}
/**大的遮罩层 */
#superMask{
    width:400px;
    height:400px;
    position:absolute;
    top:0px;
    left:0px;
    /*border:1px solid red;*/
    z-index:1
}
/**大图片背景图 */
#left-content #lg-img{
    width:400px;
    height:400px;
    position:absolute;
    left:400px;
    top:0;
    display:none;
    /* border:1px solid red;*/
    z-index:10;
    background-size:200% 200%;
}
/*图片滑动样式*/
#slide-img{
    position:relative;
    width:400px;
    overflow: hidden;
    height:56px;
    transition:all .5s linear;
}
#slide-img>a{
    display:block;
    width:18px;
    height:54px;
    position:absolute;
    top:0;
    z-index:10;
}
/**左箭头 */
#slide-img>a:first-child{
    /*border:1px solid black;*/
    background: url("../../public/img/icon/iconlist_1.png") 0 -139px;
}
#slide-img>a.disabled{
    opacity:0.5;
}
/**右箭头 */
#slide-img>a:last-child{
    background: url("../../public/img/icon/iconlist_1.png") -18px -139px;
    right:0;
}
#slide-img>div{
    position:absolute;
    left:18px;
    width:360px;
    height:56px;
    overflow:hidden;
}
/**小图片展示 */
#slide-img>div>ul{
    /* position:absolute;
    left:0px;
    /*width:350px;*/
    display: inline-block;
    height:56px;
    width:600px;
    overflow:hidden;
    padding-top: 0;
}
#slide-img>div>ul>li{
    float:left;
    box-sizing:border-box;
}
#slide-img>div>ul>li>img{
    border:1px solid #ddd;
    width:52px;
    vertical-align:bottom;
    margin:0 3px;
}
/**商品详情===标题。价格 */
#right-content{
    width:540px;
}
#right-content p,#right-content .spec>span,#right-content .num>span{
    font-size:15px;
    margin:10px 0;
}
#right-content>.p-price{
    background-image: linear-gradient(to top, #FCE4DF 0%, #F2DEDE 100%);
    padding:10px 5px;
    box-shadow: 0px 0px 2px 2px #ddd;
    border-radius:3px;
}
#right-content>.p-price>p:first-child>span {
    color: #ed192b;
    font-size:34px;
}
#right-content>:nth-child(2)>span{
    font-size:12px;
}
#right-content>:nth-child(2)>img{
    position:relative;
    top:-6px;
    left:2px;
}
#right-content .spec{
    margin:5px 0;
    position:relative;
}
#right-content .spec>a{
    display:inline-block;
    border:1px solid #ddd;
    padding:11px 9px;
    margin:3px;
    text-decoration: none;
    color:#333;
    box-sizing: border-box;
}
#right-content .spec>a.size.active{
    border:2px solid red;

}
#right-content .spec>a.active{
    border:#ed5428 3px solid;
    padding:9px 7px;
}
#right-content .spec>a:hover{
    color: #ed192b;
}
#right-content .num input{
    width:40px;
    height: 34px;
    outline:none;
    border:1px solid #ddd;
    font-size:15px;
    text-align: center;
}
#right-content .num button{
    width:36px;
    height:36px;
    line-height: 36px;
    text-align: center;
}
#right-content img,#product-details img{
    vertical-align: bottom;
}
#right-content .btn{
    margin:20px 0px;
}
#right-content .btn>a{
    display: inline-block;
    padding:15px 20px;
    color: #fff;
    font-size:22px;
    text-decoration: none;
    /*border:1px solid  #ed192b;*/
    background: #ed192b;
    border-radius: 5px;
    box-shadow: 0 0 1px 2px #ddd;
    margin-right: 15px;
}
#right-content .btn>a:first-child{
    background-image: linear-gradient(to bottom,#f0f0f0,#e0e0e0);
    color:#ed192b;
}
#right-content .btn>a:last-child{
    font-size:15px;
    width:35px;
    text-align: center;
    padding:11px 20px;
    position:relative;
    top:6px;
}
#right-content .count fieldset{
    border-top:2px solid #ed192b;
    border-bottom:2px solid #ed192b;
    border-left:0;
    border-right:0px;
    color:#000;
}
#right-content .count fieldset>legend{
    text-align: center;
    font-size:16px;
    padding: 0 5px;
}
#right-content .count fieldset>p{
    margin:5px 0;
}
/*轮播推荐*/
#recommend{
    width:1200px;
    height:370px;
    margin:30px 0 10px 0;
    overflow:hidden;
    box-sizing:border-box;
}
#recommend>p{
    font-family: "微软雅黑";
    font-size:22px;
    color:#000;
    font-weight:bold;
    margin-bottom:10px;

}
#recommend>p>span{
    font-size:14px;
    background:#333333;
    color:#fff;
    padding:1px 3px;
    border-radius: 1px;
}
#recommend .recommend-content{
    height:320px;
    border:1px solid #333;
    width:1280px;
}
#recommend .scrollLeft{
    height:320px;
    float:left;
    width:200%;
}
#recommend img{
    width:300px;
    margin:10px;
}
#recommend .scroll-item1,#recommend .scroll-item2{
    float:left;
    width:1280px;
}

/**模特展示 */
#product-details img{
    vertical-align:top;
}
/******totop*****/
.totop{
    position:fixed;
    right:0;
    bottom:100px;
    width:40px;
    height:40px;
    background:#b81b22;
    color:#fff;
}
.totop:hover{
    background: #000;
}
</style>