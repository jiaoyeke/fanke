<template>
    <div>
        <div id="main">
    <div id="cart">
        <!--头部-->
        <div class="cart-head">
            <ul class="clear">
                <li>商品信息</li>
                <li>颜色|尺寸</li>
                <li>单价(元)</li>
                <li>数量</li>
                <li>金额</li>
                <li>操作</li>
            </ul>
        </div>
        <!--列表
        <div class="cart-item">
            <ul class="clear">
                <li>
                    <input type="checkbox">
                    <a href="#">
                        <img src="img/product/md/6379027-5201711101839399639.jpg" alt="">
                    </a>
                        <a href="">455555555555555555555555555555555555555555555555555555555</a>
                </li>
                <li>棕色|L</li>
                <li>¥1900</li>
                <li><button>-</button><span>1</span><button>+</button></li>
                <li><span>¥1900</span></li>
                <li><span>删除</span></li>
            </ul>
        </div>-->
        <div v-if="cartList.length==0" class="noCart">
            <p>您还没有添加任何商品，<router-link to="/products">去购物~</router-link></p>
        </div>
        <div class="cart-item"  v-else  v-for="(item,i) of cartList">
            <ul class="clear">
                <li>
                    <input type="checkbox" v-model="item.select" @change="selectOne"/>
                    <a href="javascript:;">
                        <img :src="item.img" alt="">
                    </a>
                        <a href="javascript:;">{{item.title}}</a>
                </li>
                <li>{{item.color}}|{{item.size}}</li>
                <li>¥{{item.price.toFixed(2)}}</li>
                <li><button @click="item.count>1?item.count--:item.count">-</button><span>{{item.count}}</span><button @click="item.count++">+</button></li>
                <li><span>¥{{(item.price*item.count).toFixed(2)}}</span></li>
                <li><span @click="deleteOne(i,item.title)">删除</span></li>
            </ul>
        </div>
        
        <!--结算-->
        <div class="cart-count">
            <ul class="clear">
                <li><label for="chk"><input type="checkbox" id="chk" v-model="isSelAll" @change="selectAll"><span v-if="!isSelAll" >&nbsp;全选</span><span  v-else>&nbsp;取消全选</span></label></li>
                <li class="delete">
                    <a href="javascript:;" @click="deleteSel">删除</a>
                    <a href="javascript:;">移入收藏夹</a>
                </li>
                <li><span>已选择商品 <b id="count">{{sumCount}}</b> 件</span></li>
                <li><span>合计:￥<b id="yuan">{{sumMoney}}</b>元</span></li>
                <li><button @click="payMent">结算</button></li>
            </ul>
        </div>
    </div>
</div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            cartList:[],
            isSelAll:false,
        }
    },
    methods:{
        payMent(){//去结算

            var selList=this.cartList.filter((val)=>{return val.select});
            if(selList.length==0){
                this.toast("您还未选择任何商品",1500)
                return;
            }
            sessionStorage.setItem("payList",JSON.stringify(selList));
            this.$router.push("/payment");
            
        },
        //全选与取消全选
        selectAll(){
            console.log(123);
            for(var i=0;i<this.cartList.length;i++){
                // this.cartList[i].select=this.isSelAll;
                this.$set(this.cartList[i],'select',this.isSelAll)
            }
        },
        //单独某一项按钮的变化
        selectOne(){
            var result=true;
            for(var i=0;i<this.cartList.length;i++){
                result=result&&this.cartList[i].select;
            }
            this.isSelAll=result;
        },
        //单独某一项删除
        deleteOne(index,title){
            this.model({modelMsg:`您确定要删除${title}吗`}).then(()=>{
                this.cartList.splice(index,1);
            }).catch(()=>{})

        },
        //删除选中选项
        deleteSel(){
            this.model({modelMsg:"您确定要删除选中的商品吗"}).then(()=>{
                // console.log(123);
                let List=[];
                for(var i=0;i<this.cartList.length;i++){
                if(!this.cartList[i].select){
                   List.push(this.cartList[i]);
                }
                this.cartList=List;
            }
            }).catch(()=>{})
        }
    },
    computed: {
        //计算总价
        sumMoney(){
            var sum=0;
            var selList=this.cartList.filter((val)=>{return val.select});
            return selList.reduce((prev,item)=>prev+item.price*item.count,0).toFixed(2);
        },
        //计算总数量
        sumCount(){
            var sum=0;
            for(var i=0;i<this.cartList.length;i++){
                if(this.cartList[i].select){
                    sum+=this.cartList[i].count;
                }
            }
            return sum;
        }
    },
    created(){
        this.axios.get("http://127.0.0.1:3000/cart/getCarts").then((result)=>{
            console.log(result);
            if(result.data.code==1){
                this.cartList=result.data.data;
                for(var i=0;i<this.cartList.length;i++){
                // this.cartList[i].select=false;
                    this.$set(this.cartList[i],'select',false)
                }
            }
        })
    },
}
</script>
<style scoped>
    /*购物车样式*/
/*****购物车头部******/
#main{
    width:1200px;
    margin:20px auto;
}
#main .cart-head ul,#main .cart-count>ul{
    border-radius: 4px;
    border:1px solid #ddd;
    background:#eee;
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
#main .cart-head ul>li:first-child,#main .cart-count>ul>li:first-child,#main .cart-item>ul>li:first-child{
    width:368px;
    text-align: left;
    padding-left:50px;
    box-sizing: border-box;
    
}
/******购物车底部*****/
#main .cart-count ul>li>a{
    font-size:12px;
    color: #393939;
    padding:2px 5px;
    text-decoration:none;
    font-size:14px;
}
#main .cart-count>ul{
    line-height:67px;
    font-size:16px;
}
#main .cart-count>ul>li b{
        color:#ed192b;
        font-size:20px;
}
#main .cart-count ul>li:last-child>button{
    outline:none;
    display: inline-block;
    padding:10px 25px;
    background:#ed192b;
    border:2px solid #ddd;
    border-radius: 5px;
    font-size:16px;
    font-weight:bold;
    color:#fff;
}
#main .cart-count>ul>li:first-child{
    margin-right: 10px;
}
/*********购物车商品***********/
#main .cart-item>ul{
    line-height: 80px;
    border:1px dotted #ddd;
}
#main .cart-item>ul>li{
    float:left;
    overflow: hidden;
    font-weight:bold;
    color: #666;
    font-size:14px;
}
#main .cart-item>ul>li:nth-child(4)>span{
    width:40px;
    display: inline-block;
    height:35px;
    line-height: 35px;
}
#main .cart-item>ul>li:nth-child(4)>button{
    width:33px;
    padding:8px;
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


/**************购物车没有商品提示*****************/
#cart .no{
    height:200px;
    text-align: center;
    font-size:20px;
    line-height: 200px;
    color:#c39329;
    font-family: "黑体";

}
#cart .no a{
    text-decoration: underline;
    font-size:18px;
}
/**购物车没有商品 */
.noCart{
    height:300px;
    text-align:center;
    line-height:300px;
    font-size:20px;
}
.noCart a{
    color:#ed192b;
}
</style>