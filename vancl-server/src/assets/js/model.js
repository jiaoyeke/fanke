
import Model from '@/components/Model'//引入组件
function defaultCallBack(action){
    if(!action) currentMsg.reject();
    currentMsg.resolve();
}
let myModel={}
let currentMsg=null;
 myModel.install=function(Vue,options={}){
    const VueModel=Vue.extend(Model)
    let model=null;
    VueModel.prototype.callBack=defaultCallBack;
    Vue.prototype.model=(params)=>{
        if(!model){
            model=new VueModel().$mount();//创建实例
            document.body.appendChild(model.$el)//挂载实例
        }
        model.show(params);
        return new Promise((resolve,reject)=>{
            currentMsg={resolve,reject}
        })
    }
}
export default myModel;