<template>
    <p class="myCount">
        <button @click="changeNum(-1)">-</button><span>{{count}}</span><button @click="changeNum(+1)">+</button>
    </p>
</template>
<script>
export default {
     data(){
            return {
                count:1
            }
        },
    methods:{
        changeNum(num){//商品数量
            if(num>0){
                this.count=this.count+1;
            }
            if(num<0&&this.count>1){
                this.count=this.count-1;
            }
        },
    }
}
</script>
<style scoped>
    .myCount span{
    width:40px;
    display: inline-block;
    height:35px;
    line-height: 35px;
}
.myCount button{
    width:33px;
    padding:8px;
}

</style>