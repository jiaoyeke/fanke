import Vue from 'vue'
import Toast from '@/components/Toast'//引入组件
let ToastConstructor =Vue.extend(Toast);//返回一个扩展实例构造函数
let myToast=(message,duration)=>{
    
    let toastDom=new ToastConstructor({
        el:document.createElement("div")//将toast组件挂载到新创建的div上
    })
    document.body.appendChild(toastDom.$el);//将toast组件的dom添加到body里
    toastDom.toastMsg=message;
    toastDom.duration=duration;
    //在指定时间内让他小时
    setTimeout(()=>{
        toastDom.isShow=false;
    },toastDom.duration)
}
export default myToast;