const express=require("express");
const router=express.Router();
const pool=require("../pool");

router.get("/",(req,res)=>{
  var pid=req.query.pid;
  var output={
    product:{/*详细信息*/},
    specs:[/*{规格},{规格},{规格}*/],
    pics:[/*{图片},{图片},{图片}*/],
  };
  //查询商品对象
  var sql="select * from vancl_product_details where pid=?";
  pool.query(sql,[pid],(err,result)=>{
    if(err) console.log(err);
    output.product=result[0];
    //查询规格列表
    var family_id=output.product.family_id;
    var sql="select cid,pid,color,size from vancl_product_details where family_id=?";
    pool.query(sql,[family_id],(err,result)=>{
      if(err) console.log(err);
      output.specs=result;
      //查询图片列表
      var sql="select * from vancl_product_pic where lid=?";
      pool.query(sql,[pid],(err,result)=>{
        if(err) console.log(err);
        output.pics=result;
        
        res.send(output);
      })
    });
  });
})
module.exports=router;