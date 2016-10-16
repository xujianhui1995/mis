一、	数据ER图
(http://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=宠物&step_word=&hs=0&pn=2&spn=0&di=117019049950&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&istype=0&ie=utf-8&oe=utf-8&in=&cl=2&lm=-1&st=undefined&cs=1474139545%2C1219393896&os=3154226450%2C1456139853&simid=0%2C0&adpicid=0&ln=1975&fr=&fmq=1476630608844_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=&height=&face=undefined&ist=&jit=&cg=&bdtype=0&oriquery=&objurl=http%3A%2F%2Fh.hiphotos.baidu.com%2Fzhidao%2Fpic%2Fitem%2F0eb30f2442a7d9334f268ca9a84bd11372f00159.jpg&fromurl=ippr_z2C%24qAzdH3FAzdH3Fzit1w5_z%26e3Bkwt17_z%26e3Bv54AzdH3Fq7jfpt5gAzdH3F88880l8ldambn089bcl_z%26e3Bip4s&gsm=0&rpstart=0&rpnum=0)
 
二、	SQL语句
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/16 21:08:55                          */
/*==============================================================*/


drop table if exists 保养类别;

drop table if exists 保养项目;

drop table if exists 检修信息;

drop table if exists 设备信息;

drop table if exists 设备维修;

drop table if exists 设备耗材;

/*==============================================================*/
/* Table: 保养类别                                                  */
/*==============================================================*/
create table 保养类别
(
   设备类型                 varchar(10) not null,
   保养类型                 varchar(10) not null,
   primary key (设备类型)
);

/*==============================================================*/
/* Table: 保养项目                                                  */
/*==============================================================*/
create table 保养项目
(
   保养类_设备类型             varchar(10),
   设备类型                 varchar(10) not null,
   保养项目                 varchar(100) not null
);

/*==============================================================*/
/* Table: 检修信息                                                  */
/*==============================================================*/
create table 检修信息
(
   设备编号                 varchar(10),
   设备编号1                varchar(10) not null,
   检修编号                 varchar(10) not null,
   检修时间                 date not null,
   下次检修时间               date not null,
   检修状态                 varchar(10) not null,
   检修人员                 varchar(10) not null
);

/*==============================================================*/
/* Table: 设备信息                                                  */
/*==============================================================*/
create table 设备信息
(
   设备编号                 varchar(10) not null,
   保养类_设备类型             varchar(10),
   设备类型                 varchar(10) not null,
   primary key (设备编号)
);

/*==============================================================*/
/* Table: 设备维修                                                  */
/*==============================================================*/
create table 设备维修
(
   检修编号                 varchar(10) not null,
   维修编号                 varchar(10) not null,
   维修内容                 varchar(20) not null
);

/*==============================================================*/
/* Table: 设备耗材                                                  */
/*==============================================================*/
create table 设备耗材
(
   维修编号                 varchar(10) not null,
   维修耗材                 varchar(10) not null
);

alter table 保养项目 add constraint FK_Relationship_2 foreign key (保养类_设备类型)
      references 保养类别 (设备类型) on delete restrict on update restrict;

alter table 检修信息 add constraint FK_Relationship_6 foreign key (设备编号)
      references 设备信息 (设备编号) on delete restrict on update restrict;

alter table 设备信息 add constraint FK_Relationship_1 foreign key (保养类_设备类型)
      references 保养类别 (设备类型) on delete restrict on update restrict;

三、	数据库实现查询
1.根据当前时间预警所有该检修的设备
	SELECT 设备信息.设备编号,设备信息.设备类型,检修信息.下次检修时间 FROM sb.检修信息,sb.设备信息 where  设备信息.设备编号=检修信息.设备编号 and date(下次检修时间)=curdate()-1;
	 
2.根据设备编号，查询出设备检修报告（包括历史检修情况和材料消耗情况）
SELECT * FROM 检修信息,设备维修,设备耗材 where 检修信息.检修编号=设备维修.检修编号 and 设备维修.维修编号=设备耗材.维修编号;
 


