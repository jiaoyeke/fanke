const express=require("express");
const router=express.Router();
const pool=require('../pool');
router.get("/",(req,res)=>{
  var kwords=decodeURIComponent(req.query.kwords);
  console.log(kwords);
  var output={
    pno:0,
    pageSize:12,
    count:0,
    pageCount:0,
    products:[]
  }
  if(req.query.pno!==undefined){
    output.pno=parseInt(req.query.pno);
  }  
  if(req.query.kwords!=undefined){
    // console.log(kwords);
    kwords=kwords.split(" ");
    kwords.forEach(function(elem,i,arr){
      arr[i]=`%${elem}%`;
    })
    var arr=[];
    for(var kw of kwords){
      arr.push(` title like ?`)
    }
    var where=" where "+arr.join(" and ");
    var sql="select * from vancl_product_details"+where;
    console.log(sql);
    pool.query(sql,kwords,(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        var count=result.length
        output.count=count;
        output.pageCount=Math.ceil(count/output.pageSize);
        var starti=output.pno*output.pageSize;
        output.products=result.slice(starti,starti+output.pageSize);
        res.send({code:1,data:output});
      }else{
        res.send({code:-1,msg:"该商品暂未上线，敬请期待"});
      }
    })
  }else{
    pool.query("select *  from vancl_product_details",(err,result)=>{
      if(err) throw err;
      if(result.length>0){
        var count=result.length
        output.count=count;
        output.pageCount=Math.ceil(count/output.pageSize);
        var starti=output.pno*output.pageSize;
        output.products=result.slice(starti,starti+output.pageSize);
        res.send({code:1,data:output});
      }
    })
  }
    
})
//收藏商品

/****我的收藏 */
 //取
 router.get("/getCollect",(req,res)=>{
  var uid=req.session.uid;
  pool.query("SELECT p.pid,p.title,p.img FROM vancl_product_details p,vancl_collect c WHERE p.pid=c.pid AND c.uid=?",uid,(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result});
    }else{
      res.send({code:-1,msg:"您的收藏夹还未添加任何商品哦^_^"});
    }
  })
})
//存
router.get("/addCollect",(req,res)=>{
  var pid=parseInt(req.query.pid);
  if(!req.session.uid){
    res.send({code:-1,msg:"请先登录"});
    return;
  }
  var uid=req.session.uid;
  pool.query("SELECT * FROM vancl_collect WHERE uid=?  AND pid=?",[uid,pid],(err,result)=>{
    if(err) throw err;
    if(result.length==0){
      pool.query("INSERT INTO vancl_collect VALUES(NULL,?,?)",[uid,pid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"成功添加至收藏夹"});
      })
    }else{
        res.send({code:-1,msg:"您已经收藏该商品"});
    }
    
  })
})
//删
router.get("/deleteCollect",(req,res)=>{
  var pid=parseInt(req.query.pid);
  var uid=req.session.uid;
  pool.query("DELETE  FROM vancl_collect WHERE uid=?  AND pid=?",[uid,pid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
        res.send({code:1,msg:"已删除"});
    }else{
        res.send({code:-1,msg:"服务器出错了"});
    }
    
  })
})

module.exports=router;