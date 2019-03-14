<template>
   <div>
    <div id="container">
        <!--轮播图-->
        <div class="carousel" @mouseenter="clear" @mouseleave="run">
            <ul class="carousel-inner" :style="isPlay?ulStyle:''">
                <li><img src="img/carousel/banner4.png" alt="0" title="0"/></li>
                <li><img src="img/carousel/banner1.png" alt="1" title="1"/></li>
                <li><img src="img/carousel/banner2.png" alt="2" title="2"/></li>
                <li><img src="img/carousel/banner3.png" alt="3" title="3"/></li>
                <li><img src="img/carousel/banner4.png" alt="4" title="4"/></li>
                <li><img src="img/carousel/banner1.png" alt="5" title="5"/></li>
            </ul>
            <a v-show="isShowArrow" href="javascript:;" class="arrow arrow-left" @click="move(false)">&lt;</a>
            <a v-show="isShowArrow" href="javascript:;" class="arrow arrow-right" @click="move(true)">&gt;</a>
            <ul class="indicators">
                <li :class="i==0?'active':''" @click="gotoIndicator(0)"></li>
                <li :class="i==1?'active':''" @click="gotoIndicator(1)"></li>
                <li :class="i==2?'active':''" @click="gotoIndicator(2)"></li>
                <li :class="i==3?'active':''" @click="gotoIndicator(3)"></li>
            </ul>
        </div>
        <!-- 新特卖-->
        <div id="floor-01">
            <img src="img/floor/aaa.jpg" alt=""/>
        <!-- 1F-->
            <div class="floor-content">
                <div class="desc" v-for="item of f1"  @mouseenter="handle1(item.pid,$event)" @mouseleave="handle2" @click="jump(item.pid)">
                    <div class="mask"></div>
                    <a :href="item.href" :style="item.pid==pid?opacity:''">
                        <img :src='item.pic' alt="" :style="item.pid==pid?scaleStyle:''" />
                    </a>
                    <div class="detail">
                        <p class="ptop"></p>
                        <p class="pright"></p>
                        <p class="pbottom"></p>
                        <p class="pleft"></p>
                       <a href="#" :style="item.pid==pid?popStyle:''">{{item.title}}</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 2F-->
        <div id="floor-02">
            <!-- 2F标题-->
            <p><span>时尚</span>精选&nbsp;<span>WOMEN FASHION</span></p>
            <!-- 2F图片-->
            <div class="floor-content">
                <div class="desc" v-for="item of f2"  @mouseenter="handle1(item.pid,$event)" @mouseleave="handle2" @click="jump(item.pid)">
                    <div class="mask"></div>
                    <a :href="item.href" :style="item.pid==pid?opacity:''">
                        <img :src='item.pic' alt="" :style="item.pid==pid?scaleStyle:''" />
                    </a>
                    <div class="detail">
                        <p class="ptop"></p>
                        <p class="pright"></p>
                        <p class="pbottom"></p>
                        <p class="pleft"></p>
                       <a href="#" :style="item.pid==pid?popStyle:''">{{item.title}}</a>
                    </div>
                </div> 
            </div>
        </div>
        <!-- 3F-->
        <div id="floor-03">
            <!-- 3F标题-->
            <p><span>女装</span>潮流&nbsp;<span>WOMEN FASHION</span></p>
            <!-- 3F图片-->
            <div class="floor-content">
                <div class="desc" v-for="item of f3"  @mouseenter="handle1(item.pid,$event)" @mouseleave="handle2" @click="jump(item.pid)">
                    <div class="mask"></div>
                    <a :href="item.href" :style="item.pid==pid?opacity:''">
                        <img :src='item.pic' alt="" :style="item.pid==pid?scaleStyle:''" />
                    </a>
                    <div class="detail">
                        <p class="ptop"></p>
                        <p class="pright"></p>
                        <p class="pbottom"></p>
                        <p class="pleft"></p>
                       <a href="#" :style="item.pid==pid?popStyle:''">{{item.title}}</a>
                    </div>
                </div>     
            </div>
        </div>
        <!-- 4F-->
        <div id="floor-04">
            <!-- 4F标题-->
            <p><span>男装</span>潮流&nbsp;<span>MEN FASHION</span></p>
            <!-- 4F图片-->
            <div class="floor-content">
                <div class="desc" v-for="item of f4"  @mouseenter="handle1(item.pid,$event)" @mouseleave="handle2" @click="jump(item.pid)">
                    <div class="mask"></div>
                    <a :href="item.href" :style="item.pid==pid?opacity:''">
                        <img :src='item.pic' alt="" :style="item.pid==pid?scaleStyle:''" />
                    </a>
                    <div class="detail">
                        <p class="ptop"></p>
                        <p class="pright"></p>
                        <p class="pbottom"></p>
                        <p class="pleft"></p>
                       <a href="#" :style="item.pid==pid?popStyle:''">{{item.title}}</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <ul class="fixed">
        <li :style="floor==1? floorStyle:''"><a href="javascript:;" @click="goTo(1)">首页推荐</a></li>
        <li :style="floor==2? floorStyle:''"><a href="javascript:;" @click="goTo(2)">时尚精选</a></li>
        <li :style="floor==3? floorStyle:''"><a href="javascript:;" @click="goTo(3)">女装潮流</a></li>
        <li :style="floor==4? floorStyle:''"><a href="javascript:;" @click="goTo(4)">男装潮流</a></li>
    </ul>
    <div class="totop" v-show="scrollTop>500"  @click="goTo(0)">
        <img src="img/totop.png" alt="">
    </div>
   </div>
</template>
<script>
    export default { 
        data(){
            return {
                f1:[{title:"",href:"",pic:""}],
                f2:[],
                f3:[],
                f4:[],
                floor:0,//电梯导航
                floorStyle:{
                    background:"#b81b22"
                },
                scrollTop:0,
                // 是否显示title
                scaleStyle:{
                    transform:"scale(1.1)",
                },
                popStyle:{
                    opacity:0,
                },
                pid:0,
                opacity:"opacity:1",
                timer:null,//轮播定时器
                imgWidth:1200,//轮播图宽度
                count:6,//轮播图张数
                ulStyle:{//轮播外包裹样式
                    left:"-1200px",
                    transition:"left 0.5s linear",
                },
                index:1,//轮播图图片下标（第几张）
                i:0,//小圆点的图片
                isPlay:true,//轮播是否播放
                isShowArrow:false
            }
        },
        mounted() {
            window.addEventListener('scroll',this.handleScroll);
        },
        methods:{
            gotoIndicator(i){//点击小圆点
                this.ulStyle.left=-(i+1)*this.imgWidth+"px"; 
                this.i=i;
            },
            //轮播图左右移动
            move(isLeft){
                if(isLeft){
                   if(this.index==this.count-1){
                       
                       this.ulStyle.transition="left 0s linear";
                       this.ulStyle.left=-this.imgWidth+"px";//立刻切换到index-1
                       this.i=1;//下一个目标的i
                       this.index=2;//目标
                       setTimeout(()=>{
                            this.ulStyle.transition="left 0.5s linear"   
                            this.ulStyle.left=-this.index*this.imgWidth+"px";
                        },50)
                   }else{
                       this.index++;
                       this.i++;
                       if(this.index==this.count-1){
                        this.i=0;
                       }
                       this.ulStyle.left=-this.index*this.imgWidth+"px";
                   }
                }else{
                    if(this.index==0){
                       this.i=3;
                       this.ulStyle.transition="left 0s linear";
                       this.ulStyle.left=-(this.count-2)*this.imgWidth+"px";//立刻切换到index-4的位置
                       this.i=2;//下一个目标的i
                       this.index=this.count-3;//下一个目标
                       setTimeout(()=>{
                            this.ulStyle.transition="left 0.5s linear"
                            this.ulStyle.left=-this.index*this.imgWidth+"px";
                        },50)
                   }else{
                       this.index--;
                       this.i--;
                       if(this.index==0){
                            this.i=3;
                       }
                       this.ulStyle.left=-this.index*this.imgWidth+"px";
                   }
                   
                }
            },
            goTo(i){//点击电梯导航去指定地方
                this.floor=i;
                var top=0;
                if(i){
                    top=document.querySelector(`#floor-0${i}`).offsetTop-178;
                }
                window.scrollTo(0,top)
            },
            handleScroll(){
                var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
                this.scrollTop=scrollTop;
                // console.log(scollTop);
                var f1=document.querySelector("#floor-01").offsetTop-178;//减去header的高度
                // console.log("f1"+f1);
                var f2=document.querySelector("#floor-02").offsetTop-178;
                // console.log("f2"+f2);
                var f3=document.querySelector("#floor-03").offsetTop-178;
                // console.log("f3"+f3);
                var f4=document.querySelector("#floor-04").offsetTop-178;
                // console.log("f4"+f4);
                // console.log(f4);
                if(scrollTop>=f1&&scrollTop<f2){
                    this.floor=1
                }else if(scrollTop>=f2&&scrollTop<f3){
                    this.floor=2
                }else if(scrollTop>=f3&&scrollTop<f4){
                    this.floor=3
                }else if(scrollTop>=f4){
                    this.floor=4
                }else{
                    this.floor=0
                }
    
            },
            handle1(pid,e){
                // console.log(`handle里边的`+pid);
                e.preventDefault();
                this.pid=pid;
                this.popStyle.opacity=1;
                this.scaleStyle.transform="scale(1.1)"
                // console.log(this.pid);
                this.opacity="opacity:0.85"
            },
            handle2(e){
                e.preventDefault();
                this.popStyle.opacity=0;
                this.scaleStyle.transform="scale(1)";
                this.opacity="opacity:1"
            },
            jump(pid){
                this.$router.push(`/details/${pid}`);
            },
            run(){//播放动画
                this.isShowArrow=false;
                this.timer=setInterval(()=>{
                    if(this.index<this.count-1){
                        this.index=this.index+1; 
                        this.ulStyle.transition="left 0.5s linear"
                        this.ulStyle.left=-this.index*this.imgWidth+"px";
                        this.i++;
                        if(this.index==this.count-1){
                            this.i=0
                        }
                    }else{
                        this.ulStyle.transition="left 0s linear",
                        this.index=2;
                        this.ulStyle.left=-this.imgWidth+"px";
                        this.i=1;
                        setTimeout(()=>{
                            this.ulStyle.transition="left 0.5s linear"
                            this.ulStyle.left=-(this.index)*this.imgWidth+"px";
                        },50)
                    }
                        
                },2000);
            },
            clear(){//暂停动画
                this.isShowArrow=true;
                clearInterval(this.timer)
            }
            
        },
        created(){

            this.axios.get("http://127.0.0.1:3000/index",{withCredentials:true})
            .then(res=> {
                // this.res=res.data
                // console.log(res.data);
                this.f1=res.data.slice(0,4);
                this.f2=res.data.slice(4,8);
                this.f3=res.data.slice(8,12);
                this.f4=res.data.slice(12,16);
                // console.log(this.f1);
            } );
            //开启定时器
            this.run();

        },
        beforeDestroy() {
            window.removeEventListener('scroll',this.handleScroll);
            clearInterval(this.timer);
            this.timer=null;
        },
    }
</script>
<style scoped>/*拷贝index.css*/
#container{
    /*border:1px solid #000;*/
    width:1200px;
    margin:0 auto;
}
.carousel{
    margin-top:10px;
}
#floor-01 .hot-floor{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}
#floor-01 .hot-desc img{
    width:390px;
}
.floor-content{
    width:1200px;
    box-sizing: border-box;
    padding:0 5px 20px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    border-bottom:1px solid #9A9A9A;
}
.floor-content .desc{
    width:571px;
    height: 350px;
    overflow: hidden;
    transition:all 0.5s linear;
    margin-top:10px;
    margin-bottom:10px;
    position:relative;
    top:0;
    left:0;
}
.floor-content .desc .mask{
    width:571px;
    height: 350px;
    position:absolute;
    top:0;
    left:0;
    z-index:10;
}
.floor-content .desc a img{
    vertical-align: bottom;
    transition:all 0.3s linear;
}

.floor-content .detail{
    /* border:1px solid red; */
    width:300px;
    height:100px;
    position: absolute;
    top:50%;
    left:50%;
    margin-left:-150px;
    margin-top:-50px;
    z-index: 2;
    transition:all 0.5s linear;
}

.floor-content .detail p{
    display:block;
    position:absolute;
    transition: all 1s linear;
}
.floor-content .detail p.ptop{
    top:0px;
    right:-0px;
    width:0;
    height: 2px;
    background: #fff;
}
.floor-content .desc:hover p.ptop{
    width:320px;
    transition: all 1s;
}
.floor-content .detail p.pright{
    bottom:0px;
    right:0px;
    height:0px;
    width:2px;
    background: #fff;
}
.floor-content .desc:hover p.pright{
    height:120px;
    transition: all 1s;
}
.floor-content .detail p.pbottom{
    bottom:0px;
    left:0px;
    width:0;
    height: 2px;
    background: #fff
}
.floor-content .desc:hover p.pbottom{
    /* border:1px solid #fff; */
    width:320px;
    transition: all 1s;
}
.floor-content .detail p.pleft{
    top:0px;
    left:0px;
    height:0px;
    width:2px;
    background: #fff
}
.floor-content .desc:hover p.pleft{
    /* border:1px solid #fff; */
    height:120px;
    transition: all 1s;
}
.floor-content .detail a{
    position: relative;
    top:41px;
    left:7px;   
    color:#000;
    font-size:18px;
    font-weight:500;
    text-align: center;
    text-decoration: none;
    transition:all 1.5s linear;
    opacity:0
}
#floor-02 p,#floor-03 p,#floor-04 p{
    color:#3E3E3E;
    font-size:30px;
    text-align:left;
}
#floor-02>p>span,#floor-03>p>span,#floor-04>p>span{
    font-size:35px;
}
#floor-02>p>span:last-child,#floor-03>p>span:last-child,#floor-04>p>span:last-child{
    font-size:15px;
}
#floor-04 .floor-content{
    border:none;
}
/**电梯导航 */
ul.fixed{
    list-style: none;
    position:fixed;
    top: 40%;
    left: 10px;
    /* box-shadow: 0px 0px 1px 1px yellow; */
}
ul.fixed>li{
    width:40px;
    height:40px;
    background: rgba(0,0,0,0.5);
    padding:5px;
    text-align: center;
    margin-top:1px;
    border-radius: 50%;
    transition:all 0.3s;
}
ul.fixed>li:hover{
    background:#7eaacd;
}

ul.fixed>li:hover a{
    font-weight: normal;
    border-radius: 50%;
}
ul.fixed>li>a{
    text-decoration: none;
    color:#fff;
    font-size:15px;
    font-weight: bold;
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
/****轮播 */
ul,li,div,a{
margin:0;
padding:0;
}
.carousel{
    width:1200px;
    height:535px;
    margin:20px auto 10px;
    overflow:hidden;
    position:relative;
}
.carousel .carousel-inner{
    width:7200px;
    list-style:none;
    position:absolute;
    top:0;
    left:0;
    z-index:9;
    transition:left 0.5s linear;
}
.carousel .carousel-inner li{
    float:left;
}
.carousel .indicators{
    position:absolute;
    bottom:20px;
    right:50%;
    margin-right:-36px;
    z-index:10;
    color:#fff;
    list-style:none;
}
.carousel .indicators li{
    float:left;
    width:10px;
    height:10px;
    border-radius:50%;
    background:rgba(0,0,0,0.5);
    margin-left:10px;
}
.carousel .indicators li.active{
    background:#B71B22;
}
.arrow{
    position:absolute;
    display:inline-block;
    color:#fff;
    text-align:center;
    font-size:20px;
    text-decoration:none;
    line-height:50px;
    height:50px;
    width:30px;
    background:rgba(112, 112, 112, 0.788);
   /* background:#000;*/
    z-index:11;
    top:50%;
    margin-top:-25px;
}
.arrow.arrow-left{
    left:0;
}
.arrow.arrow-right{
    right:0;
}
</style>