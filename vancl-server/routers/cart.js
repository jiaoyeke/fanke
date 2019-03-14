const express=require('express');
var router=express.Router();
const pool=require('../pool.js');
router.get("/addCart",(req,res)=>{
    //1:获取3个参数
    // console.log('cart add',req.session);
    var uid = req.session.uid;
    
    console.log(uid);
    var pid = req.query.pid;
    var count = req.query.count;
    var size = req.query.size;
    if(!uid){
        res.send({code:-1,msg:"请先登录"});
        return;
    }
    //2:创建sql语句
    var sql="SELECT  cid FROM vancl_shopping_cart WHERE uid=? AND pid=? AND size=?";
    pool.query(sql,[uid,pid,size],(err,result)=>{
      if(err)throw err;
      if(result.length==0){
        pool.query(" INSERT INTO  vancl_shopping_cart  VALUES (null,?,?,?,?)",[uid,pid,size,count],(err,result)=>{
          if(err)throw err;
          res.send({code:1,msg:"成功添加进购物车"});
          });
      }else{
          pool.query("UPDATE vancl_shopping_cart SET count=? WHERE pid=? AND uid=? AND size=? ",[count,pid,uid,size],(err,result)=>{
          if(err)throw err;
          // console.log(result);
          if(result.affectedRows>0){
               res.send({code:1,msg:"成功添加进购物车"})
          }else{
              res.send({code:-1,msg:`失败`});
          }
         
      })
  
      }
  });
})

//得到购物车
router.get("/getCarts",(req,res)=>{
    var uid=req.session.uid;
    console.log(uid);
    var sql="SELECT c.pid,c.uid,c.count,c.size,p.price,p.title,p.color,p.img FROM vancl_product_details p,vancl_shopping_cart c WHERE p.pid=c.pid AND c.uid= ?";
    uid=parseInt(uid);
    pool.query(sql,[uid],(err,result)=>{
        if(err)throw err;
        if(result.length>0){
             res.send({code:1,msg:"查询成功",data:result})
        }else{
            res.send({code:-1,msg:`您还没有购买任何商品!点我<router-link to="/products">去购物</router-link>`});
        }
       
    })
  })
  /*
  //更新购物车
  router.get("/updateCart",(req,res)=>{
    var pid=req.query.pid;
    var count=req.query.count;
    var size=req.query.size;
    var uid=req.session.uid;
    var sql="UPDATE vancl_shopping_cart SET count=?,size=? WHERE pid=? and uid=?"
    pool.query(sql,[count,size,pid,uid],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"修改成功"});
        }else{
            res.send({code:-1,msg:"更新失败"});
        }
    })
  })
  //删除购物车
  router.get("/deleteCart",(req,res)=>{
    var pid=req.query.pid;
    var uid=req.session.uid;
    var size=req.query.size;
    var sql="DELETE FROM vancl_shopping_cart  WHERE pid=? AND uid=? AND size=?";
    // 3.json
    pool.query(sql,[pid,uid,size],(err,result)=>{
        if(err)throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"});
        }else{
            res.send({code:-1,msg:"删除失败"});
        }
    })
  })*/
module.exports=router;