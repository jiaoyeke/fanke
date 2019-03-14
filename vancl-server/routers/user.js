const express=require('express');
var router=express.Router();
const pool=require('../pool.js');
//登录路由
router.post('/login',function(req,res){
	var obj=req.body;
	var uname=obj.uname;
	var upwd=obj.upwd;
	// console.log(req.body);
	pool.query('SELECT * FROM vancl_user WHERE uname=? AND upwd=?',[uname,upwd],function(err,result){
		if(err)throw err;
		if(result.length>0){
			var uid=result[0].uid;
			req.session.uname=uname;
			req.session.uid=uid;
			console.log("login success",req.session);
			res.send({code:1,msg:"登陆成功",uid:uid,uname:uname})
		}else{
			res.send({code:-1,msg:"用户名或密码错误"});	
		}
	});  
});
router.get('/islogin',function(req,res){
	console.log(req.session);
	if(req.session.uid){
		res.send({code:"ok"});
	}else{
		res.send({code:"fail"})
	}
});

///检测邮箱是否存在
router.get('/check_email',function(req,res){
	var email=req.query.email;
	console.log(email);
	pool.query('SELECT * FROM vancl_user WHERE email= ?',email,function(err,result){
		if(err)throw err;
		if(result.length==0){
			res.send({code:1,msg:"通过"});
		}else{
			res.send({code:-1,msg:"该邮箱已经被占用"});
		}
	});
});

//检测用户名是否存在
router.get('/check_uname',function(req,res){
	var uname=req.query.uname;
	pool.query('SELECT * FROM vancl_user WHERE uname=?',uname,function(err,result){
		if(err) throw err;
		if(result.length==0){
			res.send({code:1,msg:"通过"});
		}else{
			res.send({code:-1,msg:"该用户名已经被占用"});
		}
	});
});

//注册路由
router.post('/reg',function(req,res){
	// console.log(123456);
	var email=req.body.email;
	var uname=req.body.uname;
	var upwd=req.body.upwd;
	pool.query('INSERT INTO vancl_user(uid,uname,upwd,email) VALUES(NULL,?,?,?)',[uname,upwd,email],function(err,result){
		if(err)throw err;
		if(result.affectedRows>0){
			res.send({code:1,msg:'注册成功'});
		}else{
			res.send({code:-1,msg:'注册失败'});
		}
	});
});
//退出登录
router.get("/signout",(req,res)=>{
	req.session.uid=undefined;
	req.session.uname=undefined;
	res.end();
  })
module.exports=router;