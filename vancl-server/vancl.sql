SET NAMES UTF8;
DROP DATABASE IF EXISTS vancl;
CREATE DATABASE  vancl CHARSET=UTF8;
USE vancl;
#用户信息表
CREATE TABLE vancl_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32),
	upwd VARCHAR(32),
	email VARCHAR(64),
	phone VARCHAR(16),
 	avatar VARCHAR(128),
	gender TINYINT DEFAULT 1
);

INSERT INTO vancl_user VALUES(NULL,'zhangmanman','123456','zhangmanman@qq.com','13843284925',null,'0');
INSERT INTO vancl_user VALUES(NULL,'lianliuchao','123456','lianliuchao@qq.com','13843284925',null,'1');
INSERT INTO vancl_user VALUES(NULL,'ningco','123456','ningco@qq.com','13843284925',null,'1');

/**收货地址表**/
CREATE TABLE vancl_receiver_address(
	aid INT PRIMARY KEY,
	user_id INT,
	receiver VARCHAR(16),
	province VARCHAR(16),
	city VARCHAR(16),
	county VARCHAR(16),
	address VARCHAR(128),
	cellphone VARCHAR(16),
	fixedphone VARCHAR(16),
	postcode CHAR(6),
	tag VARCHAR(16),
	is_default TINYINT 
);

/*购物车条目**/
CREATE TABLE vancl_shopping_cart(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	pid INT,
	size VARCHAR(2),
	count INT
);
INSERT INTO vancl_shopping_cart VALUES(NULL,1,1,"L",2);
INSERT INTO vancl_shopping_cart VALUES(NULL,1,2,"L",3);
INSERT INTO vancl_shopping_cart VALUES(NULL,1,3,"L",9);

/***用户订单列表详情****/
CREATE TABLE vancl_order_detail(
	did INT,
	order_id INT,
	product_id INT,
	count INT
);
/*******用户收藏表********/
CREATE TABLE vancl_collect(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	uid INT,
	pid INT
);
INSERT INTO vancl_collect VALUES(NULL,1,1);
INSERT INTO vancl_collect VALUES(NULL,1,2);
INSERT INTO vancl_collect VALUES(NULL,1,3);

/****首页轮播广告商品****/
CREATE TABLE vancl_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)#点击图片要跳转
);
INSERT INTO vancl_index_carousel VALUES(NULL,'/img/carousel/banner1.png','轮播商品1','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner2.png','轮播商品2','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner3.png','轮播商品3','product_details.html?lid=2'),
																				(NULL,'/img/carousel/banner4.png','轮播商品4','product_details.html?lid=2');
/**************导航栏****************/
CREATE TABLE vancl_index_nav(
	name VARCHAR(16),
	url VARCHAR(64),
	title	VARCHAR(32)
);
INSERT INTO vancl_index_nav VALUES('商品首页','/index.html','商品首页'),
	('T恤',"/index.html",'多种多样的T恤'),
	('衬衫',"/index.html",'多种多样的衬衫'),
	('C9',"/index.html","多种多样的C9"),
	('麻',"/index.html","多种多样的麻"),
	('鞋',"/index.html","多种多样的鞋"),
	('水柔棉',"/index.html","多种多样的水柔棉"),
	('裤装',"/index.html","多种多样的裤子"),
	('外套',"/index.html","多种多样的外套"),
	('私人订制',"/index.html","私人订制");


/*************首页商品列表******************/
CREATE TABLE vancl_index_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(64),
    pic VARCHAR(128),
    href VARCHAR(128)
);
INSERT INTO vancl_index_product VALUES(NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_01.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_02.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_03.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f1/f1_04.jpg","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_01.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_02.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 欧美风格","img/floor/f2/f2_03.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 女装特卖","img/floor/f2/f2_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_01.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_02.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_03.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 冬季新品","img/floor/f3/f3_04.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_01.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_02.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_03.png","products.html"),
                                       (NULL,"0.8折起 BUBUBOSFLFJA 型男必备","img/floor/f4/f4_04.png","products.html");
/*************商品列表-图片-***************/
CREATE TABLE vancl_product_pic(
	pic_id INT PRIMARY KEY AUTO_INCREMENT,
	lid INT,
	sm VARCHAR(128),
	md VARCHAR(128),
	lg VARCHAR(128)
);  
INSERT INTO vancl_product_pic VALUES(NULL,1,'img/product/sm/6375443-1j201710131550493576.jpg','img/product/md/6375443-1j201710131550493576.jpg','img/product/lg/6375443-1j201710131550493576.jpg'),
(NULL,1,"img/product/sm/6375443-2201710131550493576.jpg","img/product/md/6375443-2201710131550493576.jpg","img/product/lg/6375443-2201710131550493576.jpg"),
(NULL,1,"img/product/sm/6375443-5201611021701149855.jpg","img/product/md/6375443-5201611021701149855.jpg","img/product/lg/6375443-5201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-6201611021701149855.jpg","img/product/md/6375443-6201611021701149855.jpg","img/product/lg/6375443-6201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-7201611021701149855.jpg","img/product/md/6375443-7201611021701149855.jpg","img/product/lg/6375443-7201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-8201611021701149855.jpg","img/product/md/6375443-8201611021701149855.jpg","img/product/lg/6375443-8201611021701149855.jpg"),
(NULL,1,"img/product/sm/6375443-9201611021701149855.jpg","img/product/md/6375443-9201611021701149855.jpg","img/product/lg/6375443-9201611021701149855.jpg"),
(NULL,2,"img/product/sm/6375218-1j201710130915288969.jpg","img/product/md/6375218-1j201710130915288969.jpg","img/product/lg/6375218-1j201710130915288969.jpg"),
(NULL,2,"img/product/sm/6375218-2201710130915288969.jpg","img/product/md/6375218-2201710130915288969.jpg","img/product/lg/6375218-2201710130915288969.jpg"),
(NULL,2,"img/product/sm/6375218-03201610261056430813.jpg","img/product/md/6375218-03201610261056430813.jpg","img/product/lg/6375218-03201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-04201610261056430813.jpg","img/product/md/6375218-04201610261056430813.jpg","img/product/lg/6375218-04201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-05201610261056430813.jpg","img/product/md/6375218-05201610261056430813.jpg","img/product/lg/6375218-05201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-06201610261056430813.jpg","img/product/md/6375218-06201610261056430813.jpg","img/product/lg/6375218-06201610261056430813.jpg"),
(NULL,2,"img/product/sm/6375218-07201610261056430813.jpg","img/product/md/6375218-07201610261056430813.jpg","img/product/lg/6375218-07201610261056430813.jpg"),
(NULL,3,"img/product/sm/6375445-1j201710130915289125.jpg","img/product/md/6375445-1j201710130915289125.jpg","img/product/lg/6375445-1j201710130915289125.jpg"),
(NULL,3,"img/product/sm/6375445-2201710130915289125.jpg","img/product/md/6375445-2201710130915289125.jpg","img/product/lg/6375445-2201710130915289125.jpg"),
(NULL,3,"img/product/sm/6375445-03201611021648501258.jpg","img/product/md/6375445-03201611021648501258.jpg","img/product/lg/6375445-03201611021648501258.jpg"),
(NULL,3,"img/product/sm/6375445-05201611021648501258.jpg","img/product/md/6375445-05201611021648501258.jpg","img/product/lg/6375445-05201611021648501258.jpg"),
(NULL,3,"img/product/sm/6375445-06201611021648501258.jpg","img/product/md/6375445-06201611021648501258.jpg","img/product/lg/6375445-06201611021648501258.jpg"),
(NULL,3,"img/product/sm/6375445-07201611021648501258.jpg","img/product/md/6375445-07201611021648501258.jpg","img/product/lg/6375445-07201611021648501258.jpg"),
(NULL,4,"img/product/sm/6375450-1j201710130915288969.jpg","img/product/md/6375450-1j201710130915288969.jpg","img/product/lg/6375450-1j201710130915288969.jpg"),
(NULL,4,"img/product/sm/6375450-2201710130915288969.jpg","img/product/md/6375450-2201710130915288969.jpg","img/product/lg/6375450-2201710130915288969.jpg"),
(NULL,4,"img/product/sm/6375450-5201611021658200166.jpg","img/product/md/6375450-5201611021658200166.jpg","img/product/lg/6375450-5201611021658200166.jpg"),
(NULL,5,"img/product/sm/6375451-1j201710130915290844.jpg","img/product/md/6375451-1j201710130915290844.jpg","img/product/lg/6375451-1j201710130915290844.jpg"),
(NULL,5,"img/product/sm/6375451-2201710130915290844.jpg","img/product/md/6375451-2201710130915290844.jpg","img/product/lg/6375451-2201710130915290844.jpg"),
(NULL,5,"img/product/sm/6375451-5201611021629151001.jpg","img/product/md/6375451-5201611021629151001.jpg","img/product/lg/6375451-5201611021629151001.jpg"),
(NULL,5,"img/product/sm/6375451-6201611021629151001.jpg","img/product/md/6375451-6201611021629151001.jpg","img/product/lg/6375451-6201611021629151001.jpg"),
(NULL,5,"img/product/sm/6375451-7201611021629151001.jpg","img/product/md/6375451-7201611021629151001.jpg","img/product/lg/6375451-7201611021629151001.jpg"),
(NULL,6,"img/product/sm/6379027-1j201711101839399639.jpg","img/product/md/6379027-1j201711101839399639.jpg","img/product/lg/6379027-1j201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-5201711101839399639.jpg","img/product/md/6379027-5201711101839399639.jpg","img/product/lg/6379027-5201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-6201711101839399639.jpg","img/product/md/6379027-6201711101839399639.jpg","img/product/lg/6379027-6201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-7201711101839399639.jpg","img/product/md/6379027-7201711101839399639.jpg","img/product/lg/6379027-7201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-8201711101839399639.jpg","img/product/md/6379027-8201711101839399639.jpg","img/product/lg/6379027-8201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-10201711101839399639.jpg","img/product/md/6379027-10201711101839399639.jpg","img/product/lg/6379027-10201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-11201711101839399639.jpg","img/product/md/6379027-11201711101839399639.jpg","img/product/lg/6379027-11201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-12201711101839399639.jpg","img/product/md/6379027-12201711101839399639.jpg","img/product/lg/6379027-12201711101839399639.jpg"),
(NULL,6,"img/product/sm/6379027-13201711101839399639.jpg","img/product/md/6379027-13201711101839399639.jpg","img/product/lg/6379027-13201711101839399639.jpg"),
(NULL,7,"img/product/sm/6375214-1j201709151925388161.jpg","img/product/md/6375214-1j201709151925388161.jpg","img/product/lg/6375214-1j201709151925388161.jpg"),
(NULL,7,"img/product/sm/6375214-2201709151925388161.jpg","img/product/md/6375214-2201709151925388161.jpg","img/product/lg/6375214-2201709151925388161.jpg"),
(NULL,7,"img/product/sm/6375214-03201610261055283620.jpg","img/product/md/6375214-03201610261055283620.jpg","img/product/lg/6375214-03201610261055283620.jpg"),
(NULL,7,"img/product/sm/6375214-04201610261055283620.jpg","img/product/md/6375214-04201610261055283620.jpg","img/product/lg/6375214-04201610261055283620.jpg"),
(NULL,7,"img/product/sm/6375214-05201610261055283620.jpg","img/product/md/6375214-05201610261055283620.jpg","img/product/lg/6375214-05201610261055283620.jpg"),
(NULL,8,"img/product/sm/6378284-1j201711031613492136.jpg","img/product/md/6378284-1j201711031613492136.jpg","img/product/lg/6378284-1j201711031613492136.jpg"),
(NULL,8,"img/product/sm/6378284-2201711031613492136.jpg","img/product/md/6378284-2201711031613492136.jpg","img/product/lg/6378284-2201711031613492136.jpg"),
(NULL,8,"img/product/sm/6378284-5201710251032410198.jpg","img/product/md/6378284-5201710251032410198.jpg","img/product/lg/6378284-5201710251032410198.jpg"),
(NULL,8,"img/product/sm/6378284-6201710251032410198.jpg","img/product/md/6378284-6201710251032410198.jpg","img/product/lg/6378284-6201710251032410198.jpg"),
(NULL,8,"img/product/sm/6378284-7201710251032460200.jpg","img/product/md/6378284-7201710251032460200.jpg","img/product/lg/6378284-7201710251032460200.jpg"),
(NULL,8,"img/product/sm/6378284-10201710251032410198.jpg","img/product/md/6378284-10201710251032410198.jpg","img/product/lg/6378284-10201710251032410198.jpg"),
(NULL,9,"img/product/sm/6375443-2201710131550493576.jpg","img/product/md/6375443-2201710131550493576.jpg","img/product/lg/6375443-2201710131550493576.jpg"),
(NULL,9,"img/product/sm/6375443-5201611021701149855.jpg","img/product/md/6375443-5201611021701149855.jpg","img/product/lg/6375443-5201611021701149855.jpg"),
(NULL,9,"img/product/sm/6375443-6201611021701149855.jpg","img/product/md/6375443-6201611021701149855.jpg","img/product/lg/6375443-6201611021701149855.jpg"),
(NULL,9,"img/product/sm/6375443-7201611021701149855.jpg","img/product/md/6375443-7201611021701149855.jpg","img/product/lg/6375443-7201611021701149855.jpg"),
(NULL,9,"img/product/sm/6375443-8201611021701149855.jpg","img/product/md/6375443-8201611021701149855.jpg","img/product/lg/6375443-8201611021701149855.jpg"),
(NULL,9,"img/product/sm/6375443-9201611021701149855.jpg","img/product/md/6375443-9201611021701149855.jpg","img/product/lg/6375443-9201611021701149855.jpg"),

(NULL,10,"img/product/sm/6379027-1j201711101839399639.jpg","img/product/md/6379027-1j201711101839399639.jpg","img/product/lg/6379027-1j201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-5201711101839399639.jpg","img/product/md/6379027-5201711101839399639.jpg","img/product/lg/6379027-5201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-6201711101839399639.jpg","img/product/md/6379027-6201711101839399639.jpg","img/product/lg/6379027-6201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-7201711101839399639.jpg","img/product/md/6379027-7201711101839399639.jpg","img/product/lg/6379027-7201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-8201711101839399639.jpg","img/product/md/6379027-8201711101839399639.jpg","img/product/lg/6379027-8201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-10201711101839399639.jpg","img/product/md/6379027-10201711101839399639.jpg","img/product/lg/6379027-10201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-11201711101839399639.jpg","img/product/md/6379027-11201711101839399639.jpg","img/product/lg/6379027-11201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-12201711101839399639.jpg","img/product/md/6379027-12201711101839399639.jpg","img/product/lg/6379027-12201711101839399639.jpg"),
(NULL,10,"img/product/sm/6379027-13201711101839399639.jpg","img/product/md/6379027-13201711101839399639.jpg","img/product/lg/6379027-13201711101839399639.jpg"),

(NULL,11,"img/product/sm/6375440-1j201709151926140815.jpg","img/product/md/6375440-1j201709151926140815.jpg","img/product/lg/6375440-1j201709151926140815.jpg"),
(NULL,11,"img/product/sm/6375440-2201709151926140815.jpg","img/product/md/6375440-2201709151926140815.jpg","img/product/lg/6375440-2201709151926140815.jpg"),
(NULL,11,"img/product/sm/6375440-03201611031245212350.jpg","img/product/md/6375440-03201611031245212350.jpg","img/product/lg/6375440-03201611031245212350.jpg"),
(NULL,12,"img/product/sm/6375443-2201710131550493576.jpg","img/product/md/6375443-2201710131550493576.jpg","img/product/lg/6375443-2201710131550493576.jpg"),
(NULL,12,"img/product/sm/6375443-5201611021701149855.jpg","img/product/md/6375443-5201611021701149855.jpg","img/product/lg/6375443-5201611021701149855.jpg"),
(NULL,12,"img/product/sm/6375443-6201611021701149855.jpg","img/product/md/6375443-6201611021701149855.jpg","img/product/lg/6375443-6201611021701149855.jpg"),
(NULL,12,"img/product/sm/6375443-7201611021701149855.jpg","img/product/md/6375443-7201611021701149855.jpg","img/product/lg/6375443-7201611021701149855.jpg"),
(NULL,12,"img/product/sm/6375443-8201611021701149855.jpg","img/product/md/6375443-8201611021701149855.jpg","img/product/lg/6375443-8201611021701149855.jpg"),
(NULL,12,"img/product/sm/6375443-9201611021701149855.jpg","img/product/md/6375443-9201611021701149855.jpg","img/product/lg/6375443-9201611021701149855.jpg"),
(NULL,13,"img/product/sm/6377996-1j201710121408227197.jpg","img/product/md/6377996-1j201710121408227197.jpg","img/product/lg/6377996-1j201710121408227197.jpg"),
(NULL,13,"img/product/sm/6377996-5201710121434427010.jpg","img/product/md/6377996-5201710121434427010.jpg","img/product/lg/6377996-5201710121434427010.jpg"),
(NULL,13,"img/product/sm/6377996-6201710121434457010.jpg","img/product/md/6377996-6201710121434457010.jpg","img/product/lg/6377996-6201710121434457010.jpg"),
(NULL,13,"img/product/sm/6377996-7201710121434457010.jpg","img/product/md/6377996-7201710121434457010.jpg","img/product/lg/6377996-7201710121434457010.jpg"),
(NULL,13,"img/product/sm/6377996-9201710121434457010.jpg","img/product/md/6377996-9201710121434457010.jpg","img/product/lg/6377996-9201710121434457010.jpg"),
(NULL,13,"img/product/sm/6377996-10201710121434427010.jpg","img/product/md/6377996-10201710121434427010.jpg","img/product/lg/6377996-10201710121434427010.jpg"),
(NULL,14,"img/product/sm/6377998-1j201710121408227822.jpg","img/product/md/6377998-1j201710121408227822.jpg","img/product/lg/6377998-1j201710121408227822.jpg"),
(NULL,14,"img/product/sm/6377998-5201710121435374361.jpg","img/product/md/6377998-5201710121435374361.jpg","img/product/lg/6377998-5201710121435374361.jpg"),
(NULL,14,"img/product/sm/6377998-6201710121435374361.jpg","img/product/md/6377998-6201710121435374361.jpg","img/product/lg/6377998-6201710121435374361.jpg"),

(NULL,15,"img/product/sm/6378855-2201711031614008077.jpg","img/product/md/6378855-2201711031614008077.jpg","img/product/lg/6378855-2201711031614008077.jpg"),
(NULL,15,"img/product/sm/6378855-1j201711031614008077.jpg","img/product/md/6378855-1j201711031614008077.jpg","img/product/lg/6378855-1j201711031614008077.jpg"),
(NULL,15,"img/product/sm/6378855-5201710251038410241.jpg","img/product/md/6378855-5201710251038410241.jpg","img/product/lg/6378855-5201710251038410241.jpg"),

(NULL,16,"img/product/sm/6378855-2201711031614008077.jpg","img/product/md/6378855-2201711031614008077.jpg","img/product/lg/6378855-2201711031614008077.jpg"),
(NULL,16,"img/product/sm/6378855-1j201711031614008077.jpg","img/product/md/6378855-1j201711031614008077.jpg","img/product/lg/6378855-1j201711031614008077.jpg"),
(NULL,16,"img/product/sm/6378855-5201710251038410241.jpg","img/product/md/6378855-5201710251038410241.jpg","img/product/lg/6378855-5201710251038410241.jpg"),

(NULL,17,"img/product/sm/6375445-2201710130915289125.jpg","img/product/md/6375445-2201710130915289125.jpg","img/product/lg/6375445-2201710130915289125.jpg"),
(NULL,17,"img/product/sm/6375445-1j201710130915289125.jpg","img/product/md/6375445-1j201710130915289125.jpg","img/product/lg/6375445-1j201710130915289125.jpg"),
(NULL,17,"img/product/sm/6375445-03201611021648501258.jpg","img/product/md/6375445-03201611021648501258.jpg","img/product/lg/6375445-03201611021648501258.jpg"),
(NULL,17,"img/product/sm/6375445-05201611021648501258.jpg","img/product/md/6375445-05201611021648501258.jpg","img/product/lg/6375445-05201611021648501258.jpg"),
(NULL,17,"img/product/sm/6375445-06201611021648501258.jpg","img/product/md/6375445-06201611021648501258.jpg","img/product/lg/6375445-06201611021648501258.jpg"),
(NULL,17,"img/product/sm/6375445-07201611021648501258.jpg","img/product/md/6375445-07201611021648501258.jpg","img/product/lg/6375445-07201611021648501258.jpg"),
(NULL,18,"img/product/sm/6375450-2201710130915288969.jpg","img/product/md/6375450-2201710130915288969.jpg","img/product/lg/6375450-2201710130915288969.jpg"),
(NULL,18,"img/product/sm/6375450-1j201710130915288969.jpg","img/product/md/6375450-1j201710130915288969.jpg","img/product/lg/6375450-1j201710130915288969.jpg"),
(NULL,18,"img/product/sm/6375450-5201611021658200166.jpg","img/product/md/6375450-5201611021658200166.jpg","img/product/lg/6375450-5201611021658200166.jpg"),

(NULL,19,"img/product/sm/6379027-8201711101839399639.jpg","img/product/md/6379027-8201711101839399639.jpg","img/product/lg/6379027-8201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-1j201711101839399639.jpg","img/product/md/6379027-1j201711101839399639.jpg","img/product/lg/6379027-1j201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-5201711101839399639.jpg","img/product/md/6379027-5201711101839399639.jpg","img/product/lg/6379027-5201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-6201711101839399639.jpg","img/product/md/6379027-6201711101839399639.jpg","img/product/lg/6379027-6201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-7201711101839399639.jpg","img/product/md/6379027-7201711101839399639.jpg","img/product/lg/6379027-7201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-10201711101839399639.jpg","img/product/md/6379027-10201711101839399639.jpg","img/product/lg/6379027-10201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-11201711101839399639.jpg","img/product/md/6379027-11201711101839399639.jpg","img/product/lg/6379027-11201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-12201711101839399639.jpg","img/product/md/6379027-12201711101839399639.jpg","img/product/lg/6379027-12201711101839399639.jpg"),
(NULL,19,"img/product/sm/6379027-13201711101839399639.jpg","img/product/md/6379027-13201711101839399639.jpg","img/product/lg/6379027-13201711101839399639.jpg"),

(NULL,20,"img/product/sm/6375440-03201611031245212350.jpg","img/product/md/6375440-03201611031245212350.jpg","img/product/lg/6375440-03201611031245212350.jpg"),
(NULL,20,"img/product/sm/6375440-1j201709151926140815.jpg","img/product/md/6375440-1j201709151926140815.jpg","img/product/lg/6375440-1j201709151926140815.jpg"),
(NULL,20,"img/product/sm/6375440-2201709151926140815.jpg","img/product/md/6375440-2201709151926140815.jpg","img/product/lg/6375440-2201709151926140815.jpg"),
(NULL,21 ,"img/product/sm/6375451-2201710130915290844.jpg","img/product/md/6375451-2201710130915290844.jpg","img/product/lg/6375451-2201710130915290844.jpg"),
(NULL,21,"img/product/sm/6375451-1j201710130915290844.jpg","img/product/md/6375451-1j201710130915290844.jpg","img/product/lg/6375451-1j201710130915290844.jpg"),
(NULL,21,"img/product/sm/6375451-5201611021629151001.jpg","img/product/md/6375451-5201611021629151001.jpg","img/product/lg/6375451-5201611021629151001.jpg"),
(NULL,21,"img/product/sm/6375451-6201611021629151001.jpg","img/product/md/6375451-6201611021629151001.jpg","img/product/lg/6375451-6201611021629151001.jpg"),
(NULL,21,"img/product/sm/6375451-7201611021629151001.jpg","img/product/md/6375451-7201611021629151001.jpg","img/product/lg/6375451-7201611021629151001.jpg"),

(NULL,22,"img/product/sm/6375214-2201709151925388161.jpg","img/product/md/6375214-2201709151925388161.jpg","img/product/lg/6375214-2201709151925388161.jpg"),
(NULL,22,"img/product/sm/6375214-1j201709151925388161.jpg","img/product/md/6375214-1j201709151925388161.jpg","img/product/lg/6375214-1j201709151925388161.jpg"),
(NULL,22,"img/product/sm/6375214-03201610261055283620.jpg","img/product/md/6375214-03201610261055283620.jpg","img/product/lg/6375214-03201610261055283620.jpg"),
(NULL,22,"img/product/sm/6375214-04201610261055283620.jpg","img/product/md/6375214-04201610261055283620.jpg","img/product/lg/6375214-04201610261055283620.jpg"),
(NULL,22,"img/product/sm/6375214-05201610261055283620.jpg","img/product/md/6375214-05201610261055283620.jpg","img/product/lg/6375214-05201610261055283620.jpg"),



#cou
(NULL,23,"img/product/sm/6378284-10201710251032410198.jpg","img/product/md/6378284-10201710251032410198.jpg","img/product/lg/6378284-10201710251032410198.jpg"),
(NULL,23,"img/product/sm/6378284-1j201711031613492136.jpg","img/product/md/6378284-1j201711031613492136.jpg","img/product/lg/6378284-1j201711031613492136.jpg"),
(NULL,23,"img/product/sm/6378284-2201711031613492136.jpg","img/product/md/6378284-2201711031613492136.jpg","img/product/lg/6378284-2201711031613492136.jpg"),
(NULL,23,"img/product/sm/6378284-5201710251032410198.jpg","img/product/md/6378284-5201710251032410198.jpg","img/product/lg/6378284-5201710251032410198.jpg"),
(NULL,23,"img/product/sm/6378284-6201710251032410198.jpg","img/product/md/6378284-6201710251032410198.jpg","img/product/lg/6378284-6201710251032410198.jpg"),
(NULL,23,"img/product/sm/6378284-7201710251032460200.jpg","img/product/md/6378284-7201710251032460200.jpg","img/product/lg/6378284-7201710251032460200.jpg"),
(NULL,24,"img/product/sm/6375443-8201611021701149855.jpg","img/product/md/6375443-8201611021701149855.jpg","img/product/lg/6375443-8201611021701149855.jpg"),
(NULL,24,"img/product/sm/6375443-2201710131550493576.jpg","img/product/md/6375443-2201710131550493576.jpg","img/product/lg/6375443-2201710131550493576.jpg"),
(NULL,24,"img/product/sm/6375443-5201611021701149855.jpg","img/product/md/6375443-5201611021701149855.jpg","img/product/lg/6375443-5201611021701149855.jpg"),
(NULL,24,"img/product/sm/6375443-6201611021701149855.jpg","img/product/md/6375443-6201611021701149855.jpg","img/product/lg/6375443-6201611021701149855.jpg"),
(NULL,24,"img/product/sm/6375443-7201611021701149855.jpg","img/product/md/6375443-7201611021701149855.jpg","img/product/lg/6375443-7201611021701149855.jpg"),
(NULL,24,"img/product/sm/6375443-9201611021701149855.jpg","img/product/md/6375443-9201611021701149855.jpg","img/product/lg/6375443-9201611021701149855.jpg"),

(NULL,25,"img/product/sm/6379027-12201711101839399639.jpg","img/product/md/6379027-12201711101839399639.jpg","img/product/lg/6379027-12201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-1j201711101839399639.jpg","img/product/md/6379027-1j201711101839399639.jpg","img/product/lg/6379027-1j201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-5201711101839399639.jpg","img/product/md/6379027-5201711101839399639.jpg","img/product/lg/6379027-5201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-6201711101839399639.jpg","img/product/md/6379027-6201711101839399639.jpg","img/product/lg/6379027-6201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-7201711101839399639.jpg","img/product/md/6379027-7201711101839399639.jpg","img/product/lg/6379027-7201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-8201711101839399639.jpg","img/product/md/6379027-8201711101839399639.jpg","img/product/lg/6379027-8201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-10201711101839399639.jpg","img/product/md/6379027-10201711101839399639.jpg","img/product/lg/6379027-10201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-11201711101839399639.jpg","img/product/md/6379027-11201711101839399639.jpg","img/product/lg/6379027-11201711101839399639.jpg"),
(NULL,25,"img/product/sm/6379027-13201711101839399639.jpg","img/product/md/6379027-13201711101839399639.jpg","img/product/lg/6379027-13201711101839399639.jpg");
/****************商品库存表*********************/
CREATE TABLE vancl_product_details(
	cid INT PRIMARY KEY AUTO_INCREMENT,
	pid INT ,
	family_id INT,
	title VARCHAR(128),
	img VARCHAR(128),
	price DECIMAL(10,2),
	promise VARCHAR(64),
	color VARCHAR(128),
	size VARCHAR(128),
	shelf_time BIGINT(20),
	sold_count INT,
	is_onsale TINYINT(1)
);
INSERT INTO vancl_product_details VALUES(NULL,1,1,"羊毛大衣 手工面料 圆领 女",'img/product/md/6375443-1j201710131550493576.jpg',169.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色","S|M|L","2018-11-16",1000,1),
(NULL,2,1,"羊毛大衣 手工面料 圆领 女","img/product/md/6375218-1j201710130915288969.jpg",169.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",1000,1),
(NULL,3,2,"羊毛大衣 手工面料 圆领 女","img/product/md/6375445-1j201710130915289125.jpg",269.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|L","2018-11-16",1000,1),
(NULL,4,2,"羊毛大衣 手工面料 圆领 女","img/product/md/6375450-1j201710130915288969.jpg",269.00,"*退货补运费 *30天无忧退货 *48小时快速退款","红色","S|M|L","2018-11-16",1000,1),
(NULL,5,2,"羊毛大衣 手工面料 圆领 女","img/product/md/6375451-1j201710130915290844.jpg",269.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色","S|M|L|XL","2018-11-16",1000,1),
(NULL,6,2,"羊毛大衣 手工面料 圆领 女","img/product/md/6379027-1j201711101839399639.jpg",269.00,"*退货补运费 *30天无忧退货 *48小时快速退款","卡其色","S|M","2018-11-16",1000,1),
(NULL,7,3,"羊毛大衣 手工面料 男","img/product/md/6375214-1j201709151925388161.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色","S|M","2018-11-16",1000,1),
(NULL,8,11,"男士大衣  男","img/product/md/6378284-1j201711031613492136.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","XS|S|M|L|XL","2018-11-16",1000,1),
(NULL,9,6,"女士羊毛大衣 ","img/product/md/6375443-6201611021701149855.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","浅蓝色","S|M|XL","2018-11-16",1000,1),
(NULL,10,6,"女士羊毛大衣 ","img/product/md/6379027-6201711101839399639.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","棕色","S|M|XL","2018-11-16",1000,1),

(NULL,11,3,"男士西装 短款  男","img/product/md/6375440-1j201709151926140815.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M","2018-11-16",1000,1),
(NULL,12,12,"蓝色女大衣","img/product/md/6375443-7201611021701149855.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","蓝色","XS|S|M|L|XL","2018-11-16",1000,1),

(NULL,13,4,"男士羽绒服  男","img/product/md/6377996-5201710121434427010.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|XL","2018-11-16",1000,1),
(NULL,14,4,"男士羽绒服  男","img/product/md/6377998-1j201710121408227822.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","军绿色","S|M|XL","2018-11-16",1000,1),

(NULL,15,5,"男士大衣  男","img/product/md/6378284-2201711031613492136.jpg",969.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","M|XL","2018-11-16",1000,1),
(NULL,16,10,"男士西装  男","img/product/md/6378855-1j201711031614008077.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深灰色","S|M|XL","2018-11-16",1000,1),

(NULL,17,7,"女士羊毛大衣 ","img/product/md/6375445-05201611021648501258.jpg",969.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M|XL","2018-11-16",1000,1),
(NULL,18,7,"女士羊毛大衣 ","img/product/md/6375450-2201710130915288969.jpg",669.00,"*退货补运费 *30天无忧退货 *48小时快速退款","红色","XS|S|M|L|XL","2018-11-16",1000,1),

(NULL,19,8,"女士羊毛大衣 ","img/product/md/6379027-8201711101839399639.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","棕色","S|M|L|XL","2018-11-16",1000,1),

(NULL,20,9,"男士西装 短款  男","img/product/md/6375440-03201611031245212350.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","S|M","2018-11-16",1000,1),

(NULL,21,13,"羊毛大衣 手工面料 圆领 女","img/product/md/6375451-2201710130915290844.jpg",269.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色","S|M|L|XL","2018-11-16",1000,1),

(NULL,22,4,"羊毛大衣 手工面料 男","img/product/md/6375214-2201709151925388161.jpg",369.00,"*退货补运费 *30天无忧退货 *48小时快速退款","深蓝色","S|M","2018-11-16",1000,1),

(NULL,23,10,"男士大衣  男","img/product/md/6378284-10201710251032410198.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","黑色","XS|S|M|L|XL","2018-11-16",1000,1),
(NULL,24,8,"女士羊毛大衣 ","img/product/md/6375443-8201611021701149855.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","浅蓝色","S|M|XL","2018-11-16",1000,1),
(NULL,25,13,"女士羊毛大衣 ","img/product/md/6379027-12201711101839399639.jpg",569.00,"*退货补运费 *30天无忧退货 *48小时快速退款","棕色","S|M|XL","2018-11-16",1000,1);