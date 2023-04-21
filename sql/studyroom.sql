update user set userPassword='123456' where userAccount='yccUp';

drop table if exists `soup`;
create table `soup`(
    id int primary key auto_increment,
    content varchar(200) not null
);

insert into `soup` values (null, '每一个不努力的日子都是对生命的辜负'), (null, '天行健，君子以自强不息'), (null, '让优秀成为一种习惯'), (null, '拥有梦想的人，从不做选择题，他们只做证明题'), (null, '当你停下来休息的时候，不要忘记别人还在奔跑'),
                          (null, '一分耕耘，一分收获'), (null, '城市慷慨亮整夜光，如同少年不惧岁月长'), (null, '
滚烫的青春骄傲的我们，还想倔强不留遗憾一份'), (null, '飞扬的少年最动人心，奔跑的时候像是穿过了光阴'), (null, '与理想平等交易，同喧嚣保持距离'), (null, '君子坐而论道，少年起而行之')
,(null, '在很糟糕的时候也别忘记了你身上那些闪光的地方'),(null, '人间骄阳刚好，风过林梢，彼时他们正当年少'),(null, '他日若遂凌云志，敢笑黄巢不丈夫'),(null, '半山腰总是最挤的，你得去山顶看看'),(null, '你一定要走，走到灯火通明'),(null, '只要来日可期，今天就值得欣喜'),(null, '理想的生活需要一点热爱和心动'),(null, '爱你的人 已星夜兼程走在来路'),(null, '愿自己坚定而柔软 自信且谦逊 阳光而透彻')
,(null, '挑战是生活的常态 但迈过去 就是欢喜顺遂'),(null, '快乐出现的时候，享受快乐'),(null, '愿此时平淡，若彼时灿烂'),(null, '知足且坚定，温柔且上进'),(null, '隐藏野心，悄悄发光'),(null, '落日弥漫的橘，天边透亮的星'),(null, '保持对生活的热爱把每一天都过得热气腾腾'),(null, '人活着就是在错的东西里找对的，寻找那些美好'),(null, '世间治愈的是愿意自渡的人');

drop table if exists `studyTime_tb`;
create table `studyTime_tb` (
    id int primary key auto_increment,
    userAccount varchar(50),
    startTime varchar(50),
    min DOUBLE comment '一段自习的时间，单位是分钟'
);

insert into studytime_tb values (null, 'yccUp2', '2023-04-20 21:56:26', 9.0), (null, 'yccUp3', '2023-04-20 22:56:26', 4.0), (null, 'yccUp3', '2023-04-20 23:56:26', 4.5);