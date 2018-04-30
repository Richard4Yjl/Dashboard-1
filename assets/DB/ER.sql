/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2018/4/29 2:30:38                            */
/*==============================================================*/


drop table if exists Comment����;

drop table if exists Customer�˿�;

drop table if exists Desk����;

drop table if exists Disk��Ʒ;

drop table if exists Order����;

drop table if exists Restaurant;

drop table if exists Sale���ۼ�¼;

/*==============================================================*/
/* Table: Comment����                                             */
/*==============================================================*/
create table Comment����
(
   CommentId            integer not null,
   CustomerId           varchar(256),
   DiskId               integer,
   Description          varchar(256),
   Level                varchar(8),
   primary key (CommentId)
);

/*==============================================================*/
/* Table: Customer�˿�                                            */
/*==============================================================*/
create table Customer�˿�
(
   CustomerId           varchar(256) not null,
   NickName             varchar(64),
   primary key (CustomerId)
);

/*==============================================================*/
/* Table: Desk����                                                */
/*==============================================================*/
create table Desk����
(
   "DeskId
   RestaurantId   INTEGER    <fk>" integer not null,
   RestaurantId         integer,
   DeskLink             varchar(256),
   primary key ("DeskId
   RestaurantId   INTEGER    <fk>")
);

/*==============================================================*/
/* Table: Disk��Ʒ                                                */
/*==============================================================*/
create table Disk��Ʒ
(
   DiskId               integer not null,
   RestaurantId         integer,
   CreationDate         integer,
   DiskName             varchar(64),
   Price                float,
   ImageId              integer,
   Flavor               varchar(32),
   Category             varchar(32),
   FavorableRate        float,
   CommentNum           integer,
   Description          varchar(256),
   primary key (DiskId)
);

/*==============================================================*/
/* Table: Order����                                               */
/*==============================================================*/
create table Order����
(
   OrderId              integer not null,
   "DeskId
   RestaurantId   INTEGER    <fk>" integer,
   CustomerId           varchar(256),
   RestaurantId         integer,
   DeskId               integer,
   OrderDate            datetime,
   TotalPrices          float,
   DiskNum              integer,
   Tableware            varchar(4),
   State                varchar(2),
   primary key (OrderId)
);

/*==============================================================*/
/* Table: Restaurant                                            */
/*==============================================================*/
create table Restaurant
(
   RestaurantId         integer not null,
   ManagerNumber        varchar(16),
   ManagerPassword      char(32),
   RestaurantName       varchar(64),
   Description          varchar(256),
   ImageId              varchar(256),
   RestaurantNumber     varchar(16),
   primary key (RestaurantId)
);

/*==============================================================*/
/* Table: Sale���ۼ�¼                                              */
/*==============================================================*/
create table Sale���ۼ�¼
(
   SalesId              integer not null,
   RestaurantId         integer,
   OrderId              integer,
   DiskId               integer,
   primary key (SalesId)
);

alter table Comment���� add constraint FK_Reference_8 foreign key (DiskId)
      references Disk��Ʒ (DiskId) on delete restrict on update restrict;

alter table Comment���� add constraint FK_Reference_9 foreign key (CustomerId)
      references Customer�˿� (CustomerId) on delete restrict on update restrict;

alter table Desk���� add constraint FK_Reference_1 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Order���� add constraint FK_Reference_2 foreign key ("DeskId
RestaurantId   INTEGER    <fk>")
      references Desk���� ("DeskId
  RestaurantId   INTEGER    <fk>") on delete restrict on update restrict;

alter table Order���� add constraint FK_Reference_3 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Order���� add constraint FK_Reference_4 foreign key (CustomerId)
      references Customer�˿� (CustomerId) on delete restrict on update restrict;

alter table Sale���ۼ�¼ add constraint FK_Reference_5 foreign key (RestaurantId)
      references Restaurant (RestaurantId) on delete restrict on update restrict;

alter table Sale���ۼ�¼ add constraint FK_Reference_6 foreign key (OrderId)
      references Order���� (OrderId) on delete restrict on update restrict;

alter table Sale���ۼ�¼ add constraint FK_Reference_7 foreign key (DiskId)
      references Disk��Ʒ (DiskId) on delete restrict on update restrict;

