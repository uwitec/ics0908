/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2009-10-10 11:18:24                          */
/*==============================================================*/


--alter table BackOrderHasMateriel
--   drop primary key;

drop table if exists BackOrderHasMateriel;

drop table if exists TransferOrder;

drop table if exists wastage;

/*==============================================================*/
/* Table: BackOrderHasMateriel                                  */
/*==============================================================*/
create table BackOrderHasMateriel
(
   backOrderCode        VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   materelCount         decimal,
   materelPrice         decimal,
   cargoSpaceCode       VARCHAR(45) not null,
   primary key (backOrderCode, materielCode, cargoSpaceCode)
);

alter table Customer
   add customerName VARCHAR(45);

alter table Customer
   add customerAddress VARCHAR(45);

alter table Customer
   add customerPhone VARCHAR(45);

alter table Customer
   add customerZipCode VARCHAR(45);

alter table Customer
   add customerFax VARCHAR(45);

alter table Customer
   add customerRemark VARCHAR(45);

alter table Customer
   add isEnabled int;

alter table Customer
   add jsonField VARCHAR(3000);

/*==============================================================*/
/* Table: TransferOrder                                         */
/*==============================================================*/
create table TransferOrder
(
   transferOrderCode    varchar(45) not null,
   transferOrderTime    datetime,
   transferOrderType    int,
   transferOrderCredence varchar(45),
   transferOrderChecker varchar(45),
   transferOrderPerson  varchar(45),
   storehouseCode       varchar(45),
   primary key (transferOrderCode)
);

alter table TransferOrderHasMateriel
   add moveAmount decimal;

/*==============================================================*/
/* Table: priceChange                                           */
/*==============================================================*/
create table priceChange
(
   pchangeCode          VARCHAR(45) not null,
   pchangeDate          VARCHAR(45) not null,
   optionar             VARCHAR(45),
   pchangeMessage       VARCHAR(2000),
   jsonField            VARCHAR(3000),
   pchangeState         int,
   primary key (pchangeCode)
);

/*==============================================================*/
/* Table: priceChangeMateriel                                   */
/*==============================================================*/
create table priceChangeMateriel
(
   materielCode         VARCHAR(45) not null,
   pchangeCode          VARCHAR(45) not null,
   cargoSpaceCode       VARCHAR(45) not null,
   stockPriceOld        DECIMAL,
   stockPriceNew        DECIMAL,
   jsonField            VARCHAR(3000),
   primary key (materielCode, pchangeCode, cargoSpaceCode)
);

/*==============================================================*/
/* Table: wastage                                               */
/*==============================================================*/
create table wastage
(
   wasCode              varchar(45) not null,
   cargoSpaceCode       VARCHAR(45),
   wasType              int,
   wasTime              bigint,
   optionor             varchar(45),
   wasState             int,
   wasDoc               varchar(45),
   primary key (wasCode)
);

alter table BackOrderHasMateriel add constraint FK_Reference_30 foreign key (backOrderCode)
      references BackOrder (backOrderCode) on delete restrict on update restrict;

alter table BackOrderHasMateriel add constraint FK_Reference_31 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table BackOrderHasMateriel add constraint FK_Reference_40 foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table TransferOrderHasMateriel add constraint FK_Reference_49 foreign key (transferOrderCode)
      references TransferOrder (transferOrderCode) on delete restrict on update restrict;

alter table priceChangeMateriel add constraint FK_Reference_41 foreign key (pchangeCode)
      references priceChange (pchangeCode) on delete restrict on update restrict;

alter table priceChangeMateriel add constraint FK_Reference_42 foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table priceChangeMateriel add constraint FK_Reference_43 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table wasMateriel add constraint FK_Reference_38 foreign key (wasCode)
      references wastage (wasCode) on delete restrict on update restrict;

alter table wastage add constraint FK_Reference_39 foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

