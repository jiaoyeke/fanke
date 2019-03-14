<template>
    <div id="Model" v-if="isShow">
        <div class="content">
            <p>提示</p>
            <h3>{{modelMsg}}</h3>
            <span @click="closeModel">取消</span>
            <span @click="confirmModel">确定</span>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            modelMsg:"您无额定要删除",
            isShow:true
        }
    },
    methods:{
        show(params){
            this.modelMsg=params.modelMsg;
            this.isShow=true;
        },
        closeModel(){
            this.isShow=false;
            this.callBack(false);
        },
        confirmModel(){
            this.isShow=false;
            this.callBack(true);
        }
    }
}
</script>
<style scoped>
    #Model{
        position:absolute;
        top:0;
        left:0;
        width:100%;
        height:100%;
        z-index:100;
    }
    #Model .content{
        width:250px;
        height:180px;
        box-sizing:border-box;
        border-radius:2px;
        color:#333;
    }
    #Model .content>p{
        width:250px;
        height:50px;
        text-align:center;
        line-height:50px;
        font-size:18px;
    }
    #Model .content>h3{
        height:80px;
        width:250px;
        font-size:16px;
        border-top:1px solid #ddd;
        border-bottom:1px solid #ddd;
        padding:20px;
        box-sizing:border-box;
        text-align:center;
    }
    #Model .content{
        position:absolute;
        top:50%;
        left:50%;
        margin-top:-90px;
        margin-left:-125px;
        background:#fff;
        box-shadow:0px 0px 8px #333;
    }
    #Model .content>span{
        display:inline-block;
        width:124px;
        height:48px;
        line-height:48px;
        text-align:center;
        cursor:pointer;
        font-size:14px;
    }
    #Model .content>span:last-child{
        border-left:2px solid #ddd;
    }
</style>