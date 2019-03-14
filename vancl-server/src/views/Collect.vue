<template>
    <div id="main">
        <p>我的收藏夹<span>Collection</span></p>
        <div id="my-collect" class="clear" v-if="colList.item">
            <div class="collect-item" v-for="(item,index) of colList">
                <img :src="item.img" alt="">
                <p>{{item.title}}</p>
                <a href="javascript:;"class="delete" @click="handleDel(index,item.pid)">删除</a>
                <a href="javascript:;" class="addCart">加入购物车</a>
            </div> 
        </div>
        <div id="no-collect" v-else>
            <p>您还未收藏任何商品,<router-link to="/products">去逛逛~</router-link></p>  
        </div>
    </div>
</template>
<script>

export default {
    data(){
        return {
            colList:[],
        }
    },
    created(){
        this.axios.get("http://127.0.0.1:3000/products/getCollect").then((result)=>{
            console.log(result);
            if(result.data.code==1){
                this.colList=result.data.data;
            }else if(result.data.code==-1){
                this.colList=[];
            }else {
                console.log(123);
                this.toast('网络故障，请检查',1500);
            }
        })
    },
    methods:{
        handleDel(index,pid){
            this.toast("删除成功",1000);
            this.colList.splice(index,1)
            this.axios.get("http://127.0.0.1:3000/products/deleteCollect",{
                params:{
                     pid:pid
                }
            }).then((result)=>{
                console.log(result);
            })
        }
    }
}
</script>
<style scoped>
#main{
    width:1200px;
    margin:20px auto;
}
#main>p{
    color:#B71B22;
    font-size:16px;
    font-weight:bold;
    text-align:left;
}
#main>p>span{
    font-family:"Embassy","mv boli";
    font-size:24px;
    font-weight: normal;   
}
#my-collect{
    width:1200px;
    overflow: hidden;
    background:#eee;
}
#my-collect .collect-item{
    float:left;
    margin:10px 0px 10px 11px;
    border:1px solid #B71B22;
    width:215px;
    background:#fff;
    padding-bottom:10px;
    height:330px;
    box-sizing: border-box;
}
#my-collect .collect-item p{
    /* margin:5px 2.5px; */
    width:208px;
    margin:10px auto;
    text-align: center;
    color:#666;
    font-size:10px;
}
#my-collect .collect-item:hover{
    box-shadow: 0px 0px 4px  #B71B22;
}
#my-collect .collect-item img{
    width:213px;
}
#my-collect .collect-item a{
    display: inline-block;
    border-radius:3px;
    padding:2px 5px;
    margin:5px 10px;
    border-radius:3px;
}
#my-collect .collect-item a:hover{
    box-shadow: 0px 0px 4px  #B71B22;
}
#my-collect .collect-item a:nth-child(3){
    background:#fff;
    color:#000;
    margin-left:30px;
    border:1px solid #aaa;
    font-size:14px;
}
#my-collect .collect-item a:last-child{
    background:#B71B22;
    color:#fff;
    font-size:15px;
    padding:4px 8px;
}
/**没有收藏商品样式 */
#no-collect{
    width:1200px;
    height:300px;
    text-align:center;
    color:#B71B22;
    font-size:24px;
    line-height:300px;
}
#no-collect a{
    font-size:20px;
    padding:2px 0px;
    text-decoration:underline;
}
</style>