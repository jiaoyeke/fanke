<template>
    <div>
        <div id="pop" v-if="isShow">
            <div id="toast">
                {{toastMsg}}
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            toastMsg:"",
            duration:1500,
            isShow:true
        }
    },
            
}
</script>
<style scoped>
#pop{
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:100;
}
#toast{
    position:absolute;
    top:50%;
    left:50%;
    margin-top:-30px;
    margin-left:-100px;
    width:200px;
    height:60px;
    background:rgba(0,0,0,0.9);
    z-index:101;
    color:#fff;
    font-size:18px;
    line-height:60px;
    text-align:center;
    border-radius:5px;
    font-family:"微软雅黑";
}
</style>