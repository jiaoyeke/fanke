<template>
    <div>
        <div id="main" class="clear">
            <div id="adv">
                <img src="img/product/adv/2018-11-08_094707.png" alt="">
            </div>
            <div id="bread">
                <p>当前位置：所有分类 > 女装 > 大衣</p>
                <img src="img/product/adv/2018-11-08_205751.png" alt="">
            </div>
            <div id="list" v-if="productList.length!=0">
                <!-- <div id="product-404">
                    <img src="img/404/404.png" alt="">
                    <h2>暂无改商品,敬请期待</h2>
                </div> -->
                <div class="desc" v-for="item of productList">
                    <a href="javascript:;" class="out-img"><img :src="item.img">
                    <div id="mask">
                        <router-link :to="'/details/'+item.pid">查看详情</router-link>
                        <!--<a href="#">收藏</a>-->
                    </div>
                    </a>
                    <span>{{item.title}}</span>
                    <p>售价:￥{{(item.price).toFixed(2)}}</p>
                </div>
            </div>
            <div class="notfound" v-else>
                <p>非常抱歉，没有找到与<span>{{kwords}}</span>相关的商品</p>
            </div>
            <div id="page" class="right" v-if="productList.length!=0">
                <ul class="pagination">
                    <li :class="pno==0?'disabled':''"><a href="javascript:;"@click="pno==0?'':pno=pno-1">上一页</a></li>
                    <li  v-for=" i of pageCount" :class="i==pno+1?'active':''"><a href="javascript:;" @click="pno=i-1">{{i}}</a></li>
                    <li :class="pno+1==pageCount?'disabled':''"><a href="javascript:;" @click="pno+1==pageCount?'':pno=pno+1">下一页</a></li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return {
                productList:[],
                pno:0,
                pageCount:0,
                canLeft:false,
                canRight:true,
                kwords:''
            }
        },
        created(){
        },
        methods:{
            getMore(){
                // this.kwords=sessionStorage.getItem("kwords")
                this.kwords=this.$route.query.kwords;
                console.log(this.kwords);
                this.axios.get("http://127.0.0.1:3000/products",{params:{pno:this.pno,kwords:this.kwords}}).then((result)=>{
                console.log(result);
                if(result.data.code==1){
                this.productList=result.data.data.products;
                this.pageCount=result.data.data.pageCount
                }else{
                    this.productList=[]
                }
            })
            },
            changePno(i){
                this.pno=i-1;
            },
        },
        watch:{
            pno:{
                handler(){
                    this.getMore();
                }
            },
            $route:{
                handler(to){
                this.kwords=to.query.kwords;
                console.log(this.kwords);
                this.pno=0;
                this.getMore();
                },
                immediate:true,
                // deep:true
            },
        }, 
        created(){
            this.getMore();
        },  
        
    }
</script>

<style scoped>
    
#main{
    width:1200px;
    margin:0 auto;
    padding:0;
}
#list{
    display: flex;
    justify-content:space-between;
    flex-wrap: wrap;
}
#product-404{
    width:1200px;
    height:400px;
    position:relative;
}
@keyframes change{
    0%{transform: rotate(0deg)}
    50%{transform: rotate(180deg) scale(1.5)}
    100%{transform: rotate(-180deg) scale(1)}
}
#product-404>img{
    position: absolute;
    top:50%;
    left:50%;
    margin-left:-39px;
    margin-top:-57px;
    animation: change 1s linear; 
}
#product-404>h2{
    position: absolute;
    top:70%;
    left:50%;
    margin-left:-110px;
}
#list>.desc{
    width:285px;
    text-align: center;
    position:relative;
    top:0;
    left: 0;
    overflow:hidden;
}
/*图片上边hover效果图*/
.out-img{
    overflow:hidden;
    position:relative;
}
 #mask{
    position:absolute;
    bottom:-100px;
    width:285px;
    height:100px;
    background: rgba(255,255,255,0.5);
    transition:all 0.5s linear;

}
#mask>a{
    display: inline-block;
    padding:8px 15px;
    color: #fff;
    font-size:18px;
    text-decoration: none;
    background: #ed192b;
    border-radius: 5px;
    box-shadow: 0 0 1px 2px #ddd;
    position:relative;
    top:28px;

}
#list>.desc>a{
    display: inline-block;
}

#list>.desc>.out-img>img{
    width:285px;
    margin-bottom:10px;
    vertical-align: bottom;
    box-shadow: 0px 0px 8px  #999;

}
#list>.desc>.out-img:hover #mask{
    bottom:0px;

}
#list>.desc>p{
    color: #B81C22;
    font-weight: bold;
    font-size:15px;
    margin:5px 0;
}
#page{
    margin:20px 0;
}
#page>.pagination{
    list-style: none;
}
#page>.pagination>li{
    float:left;
}
#page>.pagination>li>a{
    display: inline-block;
    text-decoration: none;
    padding:6px 10px;
    font-size:15px;
    color:#666;
    font-weight: bold;
    border:1px solid #B81C22;
    height:21px;
}
#page>.pagination>li~li>a{
    border-left:0;
}
#page>.pagination>li:first-child>a{
    border-radius: 3px 0 0 3px;
}
#page>.pagination>li:last-child>a{
    
}
#page>.pagination>li.active>a{
    background-image: linear-gradient(0deg,#FF363A 0%,#FF8C3A 100%);
    color:#fff;
}
#page>.pagination>li.disabled{
    opacity:0.5;
}
/**没有找到相关商品 */
.notfound{
    padding:240px;
    text-align:center;
    font-size:24px;
}
.notfound span{
    color:#b81c22;
}
</style>