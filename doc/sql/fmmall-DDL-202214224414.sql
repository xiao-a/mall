DROP TABLE IF EXISTS users;
CREATE TABLE users(
    user_id INT NOT NULL AUTO_INCREMENT  COMMENT '用户编号' ,
    user_name VARCHAR(255)    COMMENT '用户姓名' ,
    password VARCHAR(255)    COMMENT '密码' ,
    nick_name VARCHAR(255)    COMMENT '昵称' ,
    real_name VARCHAR(255)    COMMENT '真实姓名' ,
    user_img VARCHAR(900)    COMMENT '头像' ,
    user_mobile VARCHAR(255)    COMMENT '手机号' ,
    user_email VARCHAR(255)    COMMENT '邮箱' ,
    user_sex CHAR(255)    COMMENT '性别' ,
    user_birth DATETIME    COMMENT '生日' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    PRIMARY KEY (user_id)
)  COMMENT = '用户表';

DROP TABLE IF EXISTS user_addr;
CREATE TABLE user_addr(
    addr_id INT NOT NULL AUTO_INCREMENT  COMMENT '地址编号' ,
    receiver_name VARCHAR(255)    COMMENT '收货人姓名' ,
    receiver_mobile VARCHAR(255)    COMMENT '收货人手机号' ,
    province VARCHAR(255)    COMMENT '省份' ,
    city VARCHAR(255)    COMMENT '城市' ,
    area VARCHAR(255)    COMMENT '区县' ,
    post_code VARCHAR(255)    COMMENT '区县' ,
    status INT    COMMENT '状态：1=正常；0=无效' ,
    common_addr INT    COMMENT '是否默认地址1=是；0=否' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    PRIMARY KEY (addr_id)
)  COMMENT = '用户地址';

DROP TABLE IF EXISTS user_login_history;
CREATE TABLE user_login_history(
    id INT NOT NULL AUTO_INCREMENT  COMMENT 'id' ,
    area VARCHAR(255)    COMMENT '地区' ,
    country VARCHAR(255)    COMMENT '国家' ,
    user_id INT    COMMENT '用户编号' ,
    ip VARCHAR(255)    COMMENT 'ip' ,
    login_time DATETIME    COMMENT '时间' ,
    PRIMARY KEY (id)
)  COMMENT = '登录历史表';

DROP TABLE IF EXISTS index_img;
CREATE TABLE index_img(
    img_id INT NOT NULL AUTO_INCREMENT  COMMENT '轮播图编号' ,
    img_url VARCHAR(255)    COMMENT '轮播图URL' ,
    img_bg_color VARCHAR(255)    COMMENT '商品背景色' ,
    product_id INT    COMMENT '商品编号' ,
    category_id INT    COMMENT '商品分类编号' ,
    index_type INT    COMMENT '轮播图类型' ,
    sort INT    COMMENT '轮播图展示顺序' ,
    status INT    COMMENT '状态：1=正常；0=下线' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    PRIMARY KEY (img_id)
)  COMMENT = '轮播图';

DROP TABLE IF EXISTS category;
CREATE TABLE category(
    category_id INT NOT NULL AUTO_INCREMENT  COMMENT '分类编号' ,
    category_name VARCHAR(255)    COMMENT '分类名称' ,
    category_level INT    COMMENT '分类层级' ,
    parent_id INT    COMMENT '父级ID' ,
    category_icon VARCHAR(255)    COMMENT '图标' ,
    category_slogan VARCHAR(255)    COMMENT '口号' ,
    category_pic VARCHAR(255)    COMMENT '分类图' ,
    category_bg_color VARCHAR(255)    COMMENT '背景颜色' ,
    PRIMARY KEY (category_id)
)  COMMENT = '商品分类';

DROP TABLE IF EXISTS product;
CREATE TABLE product(
    product_id INT NOT NULL AUTO_INCREMENT  COMMENT '商品主键' ,
    product_name VARCHAR(255)    COMMENT '商品名称' ,
    category_id INT    COMMENT '分类id' ,
    root_category_id INT    COMMENT '一级分类id' ,
    sold_num INT    COMMENT '销量' ,
    product_status INT    COMMENT '状态1=正常；-1=删除；0下架' ,
    content VARCHAR(255)    COMMENT '商品内容' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    PRIMARY KEY (product_id)
)  COMMENT = '商品';

DROP TABLE IF EXISTS product_img;
CREATE TABLE product_img(
    product_img_id INT NOT NULL AUTO_INCREMENT  COMMENT '商品图片ID' ,
    product_id INT    COMMENT '商品编号' ,
    sort INT    COMMENT '序号' ,
    PRIMARY KEY (product_img_id)
)  COMMENT = '商品图片';

DROP TABLE IF EXISTS product_sku;
CREATE TABLE product_sku(
    sku_id INT NOT NULL AUTO_INCREMENT  COMMENT 'sku_id' ,
    product_id INT NOT NULL   COMMENT 'product_id' ,
    sku_name VARCHAR(255)    COMMENT 'sku名称' ,
    sku_img VARCHAR(255)    COMMENT 'sku图片' ,
    untitled VARCHAR(255)    COMMENT '属性' ,
    original_price DECIMAL(24,2)    COMMENT '原价' ,
    sell_price DECIMAL(24,2)    COMMENT '销售价格' ,
    discounts DECIMAL(24,2)    COMMENT '折扣力度' ,
    stock INT    COMMENT '库存' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    status INT    COMMENT 'sku状态（1=启用；0=禁用；-1删除）' ,
    PRIMARY KEY (sku_id,product_id)
)  COMMENT = '商品规格';

DROP TABLE IF EXISTS product_params;
CREATE TABLE product_params(
    param_id INT NOT NULL AUTO_INCREMENT  COMMENT '商品参数id' ,
    product_id INT    COMMENT '商品id' ,
    product_place VARCHAR(255)    COMMENT '产地' ,
    foot_period VARCHAR(255)    COMMENT '保质期' ,
    brand VARCHAR(255)    COMMENT '品牌名' ,
    factory_name VARCHAR(255)    COMMENT '生产厂名' ,
    factory_address VARCHAR(255)    COMMENT '生产厂址' ,
    packaging_method VARCHAR(255)    COMMENT '包装方式' ,
    weight VARCHAR(255)    COMMENT '规格重量' ,
    storage_method VARCHAR(255)    COMMENT '存储方式' ,
    eat_method VARCHAR(255)    COMMENT '食用方式' ,
    create_time DATETIME    COMMENT '创建时间' ,
    update_time DATETIME    COMMENT '修改时间' ,
    PRIMARY KEY (param_id)
)  COMMENT = '商品规格';

DROP TABLE IF EXISTS shopping_cart;
CREATE TABLE shopping_cart(
    cart_id INT NOT NULL AUTO_INCREMENT  COMMENT '购物车编号' ,
    product_id INT    COMMENT '商品编号' ,
    sku_id INT    COMMENT 'SKU编号' ,
    user_id INT    COMMENT '用户编号' ,
    cart_num INT    COMMENT '购物车商品数量' ,
    cart_time DATETIME    COMMENT '添加购物车时间' ,
    product_price DECIMAL(24,2)    COMMENT '添加购物车时商品价格' ,
    PRIMARY KEY (cart_id)
)  COMMENT = '购物车';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
    order_id INT NOT NULL AUTO_INCREMENT  COMMENT '订单ID' ,
    user_id INT    COMMENT '用户ID' ,
    untitled VARCHAR(255)    COMMENT '产品名称' ,
    receiver_name VARCHAR(255)    COMMENT '接收人快照' ,
    receiver_address VARCHAR(255)    COMMENT '收货地址快照' ,
    total_amount DECIMAL(24,2)    COMMENT '订单总价格' ,
    actual_amount DECIMAL(24,2)    COMMENT '实际支付价格' ,
    pay_type INT    COMMENT '支付方式' ,
    order_remark VARCHAR(255)    COMMENT '订单备注' ,
    order_status INT    COMMENT '订单状态1=待付款；2=待发货；3=待收货；4=待评价；5=已完成；6=已关闭' ,
    delivery_type VARCHAR(255)    COMMENT '配送方式' ,
    delivery_flow_id VARCHAR(255)    COMMENT '物流单号' ,
    order_freight DECIMAL(24,2)    COMMENT '订单运费' ,
    delete_status INT    COMMENT '逻辑删除状态' ,
    create_time DATETIME    COMMENT '创建时间（成交时间）' ,
    update_time DATETIME    COMMENT '更新时间' ,
    pay_time DATETIME    COMMENT '付款时间' ,
    delivery_time DATETIME    COMMENT '发货时间' ,
    finish_time DATETIME    COMMENT '完成时间' ,
    cancel_time DATETIME    COMMENT '取消时间' ,
    close_type INT    COMMENT '订单关闭类型1=超时未支付；2=退款关闭；4=买家取消；15=已通过货到付款交易' ,
    PRIMARY KEY (order_id)
)  COMMENT = '订单';

DROP TABLE IF EXISTS order_item;
CREATE TABLE order_item(
    item_id INT NOT NULL AUTO_INCREMENT  COMMENT '订单项ID' ,
    order_id INT    COMMENT '订单ID' ,
    product_id INT    COMMENT '商品ID' ,
    product_name VARCHAR(255)    COMMENT '商品图片' ,
    sku_id INT    COMMENT 'SKUId' ,
    sku_name VARCHAR(255)    COMMENT 'sku名称' ,
    product_price DECIMAL(24,2)    COMMENT '商品价格' ,
    buy_counts INT    COMMENT '购买数量' ,
    total_amount DECIMAL(24,2)    COMMENT '购买总金额' ,
    basket_date DATETIME    COMMENT '加入购物车时间' ,
    buy_time DATETIME    COMMENT '购买时间' ,
    is_comment INT    COMMENT '评论状态：0=未评价；1=已评价' ,
    PRIMARY KEY (item_id)
)  COMMENT = '订单项/快照';

DROP TABLE IF EXISTS product_comments;
CREATE TABLE product_comments(
    comment_id INT NOT NULL AUTO_INCREMENT  COMMENT '评价ID' ,
    product_id INT    COMMENT '商品id' ,
    product_name VARCHAR(255)    COMMENT '商品名称' ,
    order_item_id INT    COMMENT '订单项（商品快照id）' ,
    user_id INT    COMMENT '评论用户Id' ,
    is_anonymous INT    COMMENT '是否匿名（1：是；0：否）' ,
    comment_type INT    COMMENT '评价类型（1：好评 0中评 -1差评）' ,
    comment_level INT    COMMENT '评价等级' ,
    comment_content VARCHAR(255)    COMMENT '评价内容' ,
    comment_imgs VARCHAR(255)    COMMENT '评价晒图JSON' ,
    comment_time DATETIME    COMMENT '评价时间' ,
    reply_status INT    COMMENT '是否回复（0=未回复，1=已回复）' ,
    reply_content VARCHAR(255)    COMMENT '回复内容' ,
    reply_time DATETIME    COMMENT '回复时间' ,
    is_show INT    COMMENT '是否显示（1=是；0=否）' ,
    PRIMARY KEY (comment_id)
)  COMMENT = '商品评价';

