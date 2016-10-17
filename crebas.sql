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

alter table 检修信息 add constraint FK_Relationship_4 foreign key ()
      references 设备维修 on delete restrict on update restrict;

alter table 检修信息 add constraint FK_Relationship_6 foreign key (设备编号)
      references 设备信息 (设备编号) on delete restrict on update restrict;

alter table 设备信息 add constraint FK_Relationship_1 foreign key (保养类_设备类型)
      references 保养类别 (设备类型) on delete restrict on update restrict;

alter table 设备信息 add constraint FK_Relationship_3 foreign key ()
      references 检修信息 on delete restrict on update restrict;

alter table 设备耗材 add constraint FK_Relationship_5 foreign key ()
      references 设备维修 on delete restrict on update restrict;

