<template>
    <div id="main" >
        <ul class="progress clear">
            <li class="pno1" :class="progress==1?'active':''">
                <b>确认订单信息</b>
                <i></i>
            </li>
            <li class="pno2" :class="progress==2?'active':''">
                <b>支付订单</b>
                <i class="arrow-left"></i>
                <i class="arrow-right"></i>
            </li>
            <li class="pno3" :class="progress==3?'active':''">
                <b>支付完成</b>
                <i></i>
            </li>
        </ul>
        <div v-if="progress==1">
            <div class="address">
                <h2>选择收货地址</h2>
                <div>
                    <b>张拉拉</b>
                    <span>北京市海淀区万寿路</span>
                </div>
                <a href="javascript:;">选择其他地址&gt;&gt;</a>
            </div>
            <div class="product-detail">
                <!--头部-->
                <h2>确认商品信息</h2>
                <div class="cart-head clear">
                    <ul class="clear">
                        <li>商品信息</li>
                        <li>颜色|尺寸</li>
                        <li>单价(元)</li>
                        <li>数量</li>
                        <li>金额</li>
                    </ul>
                </div>
                <!--商品信息-->
                <div class="cart-item" v-for='item of payList'>
                    <ul class="clear">
                        <li>
                            <a href="#">
                                <img :src="item.img" alt="">
                            </a>
                                <a href="">{{item.title}}</a>
                        </li>
                        <li>{{item.color}}|{{item.size}}</li>
                        <li>¥{{(item.price).toFixed(2)}}</li>
                        <li>{{item.count}}</li>
                        <li><span>¥{{(item.count*item.price).toFixed(2)}}</span></li>
                    </ul>
                </div>
                <!--结算-->
                <div class="cart-count clear">
                    <ul class="clear">
                        <li><a href="javascript:;" @click="goBack">返回&gt;&gt;</a></li>
                        <li><span>总共 <b id="count">{{sumCount}}</b> 件商品</span></li>
                        <li><span>合计:<b id="yuan">￥{{sumMoney}}</b>元</span></li>
                        <li><button @click="orderConfirm">确认订单</button></li>
                    </ul>
                </div>
            </div>
        </div>
        <div v-if="progress==2" class="progress2">
            <ul class="clear tip">
                <li>支付金额:<span>¥{{sumMoney}}</span></li>
                <li>支付订单:<span>1222222222222222222222</span></li>
                <li>收款方：凡客</li>
            </ul>
            <p>支付方式</p>
            <ul class="ways clear">
                <li><label><input type="radio" value="w1" v-model="selWay"><img src="img/payment/pay_img1.jpg" alt=""></label></li>
                <li><label><input type="radio" value="w2" v-model="selWay"><img src="img/payment/pay_img2.jpg" alt="" ></label></li>
                <li><label><input type="radio" value="w3" v-model="selWay"><img src="img/payment/pay_img3.jpg" alt=""  ></label></li>
                <li><label><input type="radio" value="w4" v-model="selWay"><img src="img/payment/pay_img4.jpg" alt=""></label></li>
                <li><label><input type="radio" value="w5" v-model="selWay"><img src="img/payment/pay_img5.jpg" alt=""  ></label></li>
            </ul>
            <p>剩余时间：{{minutes | time}}:{{seconds | time}}
                <button v-if="selWay" @click="wayConfirm">确认</button>
            </p>
        </div>   
        <div v-show="progress==3" class="progress3">
            <div>
                <p>支付成功！！<router-link to="/products">继续购物&gt;&gt;</router-link></p>
            </div>
        </div>   
    </div>
</template>
<script>
export default {
    data(){
        return {
            progress:1,
            sumCount:0,
            sumMoney:0,
            payList:[],
            order:0,
            selWay:'',
            minutes:15,
            seconds:0,
            timer:null
        }
    },
    created(){
        console.log(this.progress);
        let payList=JSON.parse(sessionStorage.getItem('payList'));
        this.payList=payList;
        let sumMoney=0;
        let sumCount=0
        for(var i=0;i<this.payList.length;i++){
            sumCount+=this.payList[i].count;
            sumMoney+=(this.payList[i].count)*(this.payList[i].price);
        }
        this.sumMoney=sumMoney.toFixed(2);
        this.sumCount=sumCount;
        // console.log(payList);
       this.timer=setInterval(()=>{
            if(this.seconds=='00'&&this.minutes!='00'){
                this.seconds=59;
                this.minutes-=1;
            }else if(this.seconds=='00'&&this.minutes=='00'){
                clearInterval(timer);
                this.model({modelMsg:"订单已经取消"}).then(()=>{
                this.$router.go(-1);
                }).catch(()=>{
                    this.$router.go(-1);
                })   
            }else{
                this.seconds-=1;
            }
        },1000)
    },
    filters:{
        time(t){
            return t<10? "0"+t:""+t
        }
    },
    methods:{
        orderConfirm(){//订单确认信息
            this.progress=2;
        },
        wayConfirm(){//支付方式
            this.progress=3;
            clearInterval(this.timer)
        },
        checkTime(t){
            return t<10? "0"+t:""+t
        },
        goBack(){
            this.$router.go(-1);
        },
    },
    beforeDestroy(){
        if(this.timer){
            clearInterval(this.timer)
        }
    },
}
</script>
<style scoped>
    #main{
        width:1200px;
        margin:20px auto;
    }
    .progress li{
        float:left;
        width:360px;
        height:50px;
        line-height:50px;
        font-size:20px;
        text-align:center;
        position:relative;
        background:#ddd;
        color:#000;
    }
    .progress li.active{
        color:#fff;
    }
    .progress li:nth-child(2n){
        margin:0 60px;
    }
    .progress li.active{
        background:#b71c20;
        color:#fff;
    }
    .progress .pno1 i,.progress .pno2 i.arrow-left,.progress .pno3 i,.progress .pno2 i.arrow-right{
        display:block;
        width:0px;
        border-top: 25px solid transparent;
        border-right: 25px solid transparent;
        border-bottom: 25px solid transparent;
        position:absolute;
        top:0;
        
    }
    .progress .pno1 i{/*会变*/
        right:-50px;
        border-left: 25px solid #ddd;
    }
    .progress .pno1.active i{
        border-left: 25px solid #b71c20;
    }
    .progress .pno2 i.arrow-left{
        left:0px;
        border-left: 25px solid #fff;
    }
    .progress .pno2 i.arrow-right{/*会变*/
        right:-50px;
        border-left: 25px solid #ddd;
    }
    .progress .pno2.active i.arrow-right{
        border-left: 25px solid #b71c20;
    }
    .progress .pno3 i{
        left:0px;
        border-left: 25px solid #fff;
    }
    /*选择收货地址 */
    .address h2,.product-detail h2{
        height:80px;
        line-height:80px;
        border-bottom:1px solid #ddd;
    }
    .address div{
        border:2px solid #b71c20;
        height:50px;
        line-height:50px;
        border-radius:5px;
        margin-bottom:10px;
    }
    .address b{
        display:inline-block;
        height:50px;
        background:#b71c20;
        width:10%;
        color:#fff;
        font-size:16px;
        text-align:center;
    }
    .address span{
        font-size:14px;
        padding-left:20px;
    }
    .address a{
        font-size:14px;
        color:#666;
    }
    /*****商品信息头部******/
    #main .cart-head ul{
        border-radius: 4px;
        border:1px solid #ddd;
        background:#eee;
        padding:0 90px;
    }
    #main .cart-head ul>li,#main .cart-item>ul>li{
        float:left;
        width:155px;
        padding:10px 0px;
        text-align: center;
        color:#333;
        overflow: hidden;
        box-sizing: border-box;
        font-size:16px;
    }

    #main .cart-count>ul>li{
        float:left;
        width:170px;
        text-align: center;
        color:#333;
        overflow: hidden;
        box-sizing: border-box;
    }
    #main .cart-head ul>li:first-child,#main .cart-item>ul>li:first-child{
        width:368px;
        text-align: left;
        padding-left:50px;
        box-sizing: border-box;
        
    }
    /*********商品***********/
    #main .cart-item>ul{
        line-height: 80px;
        border:1px dotted #ddd;
       /* margin:0 90px;*/
        padding:0 90px;
    }
    #main .cart-item>ul>li{
        float:left;
        overflow: hidden;
        font-weight:bold;
        color: #666;
        font-size:14px;
    }
    #main .cart-item>ul>li:last-child>span{
        cursor:pointer;
    }
    #main .cart-item>ul>li a:nth-child(2){
        display: inline-block;
        width:60px;
        margin-left:10px;
    }
    #main .cart-item>ul>li a:last-child{
        display: inline-block;
        width:200px;
        height:20px;
        line-height:20px;
        overflow: hidden;
        text-overflow:ellipsis;
        white-space: nowrap;
        color:#393939;
    }

    #main .cart-item>ul>li:first-child>a>img{
        vertical-align: middle;
        width:50px;
    }
    /******商品信息底部*****/
    #main .cart-count>ul{
        line-height:67px;
        font-size:16px;
        float:right;
        width:1200px;
        box-sizing:border-box;
        border-radius: 4px;
        border:1px solid #ddd;
        background:#eee;
        padding:0 90px;
    }
    #main .cart-count>ul>li{
        width:250px;
        box-sizing:border-box;
        font-weight:bold;
    }
    #main .cart-count>ul>li>a{
        color:#666;
        font-size:14px;
    }
    #main .cart-count ul>li:last-child>button, .progress2 p button{
        outline:none;
        display: inline-block;
        padding:10px 40px;
        background:#ed192b;
        border:2px solid #ddd;
        border-radius: 5px;
        font-size:16px;
        font-weight:bold;
        color:#fff;
    }
    #main .cart-count>ul>li b{
        color:#ed192b;
        font-size:20px;
    }
    /**支付方式 */
    .progress2 ul.tip{
        margin:10px 0;
    }
    .progress2 ul.tip>li{
        float:left;
        font-size:16px;
        width:400px;
    }
    .progress2 ul.tip>li:first-child>span{
        color:#ed192b;
        font-weight:bold;
    }
    .progress2 ul.tip>li~li{
        text-align:right;
    }
    .progress2 p{
        font-size:15px;
        background:#ddd;
        padding:20px;
    }
    .progress2 ul.ways>li{
        float:left;
        font-size:16px;
        width:240px;
        text-align:center;
        background:#fff;
    }
    .progress2 ul.ways li{
        line-height:52px;
        padding:50px 0;
    }
    .progress2 ul.ways li img{
        vertical-align:middle;
        margin-left:10px;
    }
    .progress2 p button{/*298*/
        float:right;
        margin-top:-13px;
    }
    .progress3 p{
        width:1200px;
        height:300px;
        text-align:center;
        line-height:300px;
        font-size:24px;
    }
    .progress3 p a{
        color:#666;
        font-size:18px;
    }
</style>