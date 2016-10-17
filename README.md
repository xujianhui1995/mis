一、	数据ER图

![Image text](https://github.com/xujianhui1995/mis/blob/master/img/1.png)
 
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
	
![Image text](https://github.com/xujianhui1995/mis/blob/master/img/2.png)
	 
2.根据设备编号，查询出设备检修报告（包括历史检修情况和材料消耗情况）
SELECT * FROM 检修信息,设备维修,设备耗材 where 检修信息.检修编号=设备维修.检修编号 and 设备维修.维修编号=设备耗材.维修编号;

![Image text](https://github.com/xujianhui1995/mis/blob/master/img/3.png)

Axure原型地址：http://asuqpm.axshare.com


