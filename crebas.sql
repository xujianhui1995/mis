/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/10/16 21:08:55                          */
/*==============================================================*/


drop table if exists �������;

drop table if exists ������Ŀ;

drop table if exists ������Ϣ;

drop table if exists �豸��Ϣ;

drop table if exists �豸ά��;

drop table if exists �豸�Ĳ�;

/*==============================================================*/
/* Table: �������                                                  */
/*==============================================================*/
create table �������
(
   �豸����                 varchar(10) not null,
   ��������                 varchar(10) not null,
   primary key (�豸����)
);

/*==============================================================*/
/* Table: ������Ŀ                                                  */
/*==============================================================*/
create table ������Ŀ
(
   ������_�豸����             varchar(10),
   �豸����                 varchar(10) not null,
   ������Ŀ                 varchar(100) not null
);

/*==============================================================*/
/* Table: ������Ϣ                                                  */
/*==============================================================*/
create table ������Ϣ
(
   �豸���                 varchar(10),
   �豸���1                varchar(10) not null,
   ���ޱ��                 varchar(10) not null,
   ����ʱ��                 date not null,
   �´μ���ʱ��               date not null,
   ����״̬                 varchar(10) not null,
   ������Ա                 varchar(10) not null
);

/*==============================================================*/
/* Table: �豸��Ϣ                                                  */
/*==============================================================*/
create table �豸��Ϣ
(
   �豸���                 varchar(10) not null,
   ������_�豸����             varchar(10),
   �豸����                 varchar(10) not null,
   primary key (�豸���)
);

/*==============================================================*/
/* Table: �豸ά��                                                  */
/*==============================================================*/
create table �豸ά��
(
   ���ޱ��                 varchar(10) not null,
   ά�ޱ��                 varchar(10) not null,
   ά������                 varchar(20) not null
);

/*==============================================================*/
/* Table: �豸�Ĳ�                                                  */
/*==============================================================*/
create table �豸�Ĳ�
(
   ά�ޱ��                 varchar(10) not null,
   ά�޺Ĳ�                 varchar(10) not null
);

alter table ������Ŀ add constraint FK_Relationship_2 foreign key (������_�豸����)
      references ������� (�豸����) on delete restrict on update restrict;

alter table ������Ϣ add constraint FK_Relationship_4 foreign key ()
      references �豸ά�� on delete restrict on update restrict;

alter table ������Ϣ add constraint FK_Relationship_6 foreign key (�豸���)
      references �豸��Ϣ (�豸���) on delete restrict on update restrict;

alter table �豸��Ϣ add constraint FK_Relationship_1 foreign key (������_�豸����)
      references ������� (�豸����) on delete restrict on update restrict;

alter table �豸��Ϣ add constraint FK_Relationship_3 foreign key ()
      references ������Ϣ on delete restrict on update restrict;

alter table �豸�Ĳ� add constraint FK_Relationship_5 foreign key ()
      references �豸ά�� on delete restrict on update restrict;

