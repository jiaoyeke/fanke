const express=require('express');
const cors=require("cors");
const session=require("express-session");
const cookieParser=require("cookie-parser");
const bodyParser=require('body-parser');
const userRouter=require('./routers/user.js');
const indexRouter=require('./routers/index.js');
const productsRouter=require("./routers/products.js");
const detailsRouter=require("./routers/details");
const cartRouter=require("./routers/cart");

var app=express();
app.listen(3000,function(){
	console.log('服务器创建成功');
});

app.use(bodyParser.urlencoded({
	extended:false
}));
app.use(cors({
	origin:"http://localhost:8080",
	credentials:true,//要求客户端必须携带cookie
	// allowHeaders:["content-type","Authorization"],
	// methods:["GET","HEAD","PUT","PATCH","POST","DELETE"]  
}))
app.use(cookieParser('sessiontest'))
app.use(session({
	secret:"sessiontest",
	resave:false,
	saveUninitialized:true,
	cookie:{
		maxAge:1000*60*60*24
	}
}))
app.use(express.static('public'));
app.use('/user',userRouter);
app.use("/index",indexRouter);
app.use("/products",productsRouter);
app.use("/details",detailsRouter);
app.use("/cart",cartRouter);


