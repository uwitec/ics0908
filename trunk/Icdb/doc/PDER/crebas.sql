/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2009/8/31 20:55:02                           */
/*==============================================================*/


drop table if exists icdb.Account;

drop table if exists icdb.BackOrder;

drop table if exists icdb.BackOrderHasMateriel;

drop table if exists icdb.Bank;

drop table if exists icdb.CargoSpace;

drop table if exists icdb.Customer;

drop table if exists icdb.Department;

drop table if exists icdb.Employee;

drop table if exists icdb.Job;

drop table if exists icdb.Materiel;

drop table if exists icdb.Person;

drop table if exists icdb.Stock;

drop table if exists StockInCheckMateriel;

drop table if exists icdb.StockInCheckOrder;

drop table if exists icdb.StockOutHasMateriel;

drop table if exists icdb.StockOutOrder;

drop table if exists icdb.Storehouse;

drop table if exists icdb.Struct;

drop table if exists icdb.Supplier;

drop table if exists TransferOrder;

drop table if exists TransferOrderHasMateriel;

drop table if exists icdb.Unit;

drop table if exists icdb.UnitType;

drop table if exists wasMateriel;

drop table if exists wastage;

/*==============================================================*/
/* User: icdb                                                   */
/*==============================================================*/
create user icdb;

/*==============================================================*/
/* Table: Account                                               */
/*==============================================================*/
create table icdb.Account
(
   accountCode          VARCHAR(45) not null,
   accountNumber        VARCHAR(45),
   accountType          VARCHAR(45),
   personCode           VARCHAR(45),
   bankCode             INT,
   isEnabled            INT,
   supplierCode         VARCHAR(100),
   jsonField            VARCHAR(3000),
   primary key (accountCode)
);

/*==============================================================*/
/* Table: BackOrder                                             */
/*==============================================================*/
create table icdb.BackOrder
(
   backOrderCode        VARCHAR(45) not null,
   stockOutOrderCode    VARCHAR(45),
   stockOutDate         datetime,
   stockOutOptionor     VARCHAR(45),
   stockOutState        int,
   stockPersion         VARCHAR(45),
   primary key (backOrderCode)
);

/*==============================================================*/
/* Table: BackOrderHasMateriel                                  */
/*==============================================================*/
create table icdb.BackOrderHasMateriel
(
   退货单号                 VARCHAR(45) not null,
   物料编码                 VARCHAR(45) not null,
   materelCount         decimal,
   materelPirce         decimal,
   primary key (退货单号, 物料编码)
);

/*==============================================================*/
/* Table: Bank                                                  */
/*==============================================================*/
create table icdb.Bank
(
   bankCode             INT not null,
   bankName             VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (bankCode)
);

/*==============================================================*/
/* Table: CargoSpace                                            */
/*==============================================================*/
create table icdb.CargoSpace
(
   cargoSpaceCode       VARCHAR(45) not null,
   cargoSpaceName       VARCHAR(45),
   cargoSpaceAddress    VARCHAR(45),
   storehouseCode       VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (cargoSpaceCode)
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table icdb.Customer
(
   customerCode         VARCHAR(45) not null,
   primary key (customerCode)
);

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table icdb.Department
(
   departmentCode       VARCHAR(45) not null,
   departmentName       VARCHAR(45),
   structCode           VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (departmentCode)
);

/*==============================================================*/
/* Table: Employee                                              */
/*==============================================================*/
create table icdb.Employee
(
   employeeCode         VARCHAR(45) not null,
   personCode           VARCHAR(45) not null,
   jobCode              VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (employeeCode)
);

/*==============================================================*/
/* Table: Job                                                   */
/*==============================================================*/
create table icdb.Job
(
   jobCode              VARCHAR(45) not null,
   jobName              VARCHAR(45),
   departmentCode       VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (jobCode)
);

/*==============================================================*/
/* Table: Materiel                                              */
/*==============================================================*/
create table icdb.Materiel
(
   materielCode         VARCHAR(45) not null,
   materielName         VARCHAR(45),
   materielMadeIn       VARCHAR(45),
   materielPrice        VARCHAR(45),
   materielMaxStore     VARCHAR(45),
   materielMinStore     VARCHAR(45),
   materielSpell        VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (materielCode)
);

/*==============================================================*/
/* Table: Person                                                */
/*==============================================================*/
create table icdb.Person
(
   personCode           VARCHAR(45) not null,
   personName           VARCHAR(45),
   personPhone          VARCHAR(45),
   personEmail          VARCHAR(45),
   personSex            VARCHAR(45),
   personPhoto          VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (personCode)
);

/*==============================================================*/
/* Table: Stock                                                 */
/*==============================================================*/
create table icdb.Stock
(
   cargoSpaceCode       VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   stockPrice           DECIMAL,
   stockAmount          VARCHAR(45),
   jsonField            VARCHAR(3000),
   primary key (cargoSpaceCode, materielCode)
);

/*==============================================================*/
/* Table: StockInCheckMateriel                                  */
/*==============================================================*/
create table StockInCheckMateriel
(
   materielCode         VARCHAR(45) not null,
   supplierCode         VARCHAR(100) not null,
   cargoSpaceCode       VARCHAR(45) not null,
   stockInCode          VARCHAR(45) not null,
   amountPercent        decimal,
   qualityPercent       decimal,
   checkTime            bigint,
   packagePercent       decimal,
   errorStockPercent    decimal,
   checkNote            varchar(400),
   checkAmount          int,
   checkRemark          varchar(400),
   lastAmount           int,
   stockInType          int,
   primary key (materielCode, supplierCode, cargoSpaceCode, stockInCode)
);

/*==============================================================*/
/* Table: StockInCheckOrder                                     */
/*==============================================================*/
create table icdb.StockInCheckOrder
(
   stockInCode          VARCHAR(45) not null,
   stockInDate          datetime,
   employeeCode         VARCHAR(45),
   checkMessage         VARCHAR(450),
   checkResult          int,
   orderNumber          VARCHAR(45),
   checkRemark          VARCHAR(450),
   sendTime             datetime,
   arriveTime           datetime,
   checkTime            datetime,
   stockInType          VARCHAR(45),
   stockInState         int,
   stockInStateType     int,
   stockInGM            VARCHAR(45),
   stockInExGM          VARCHAR(45),
   stockInExDate        datetime,
   stockInExMessage     VARCHAR(450),
   stockInWill          VARCHAR(45),
   primary key (stockInCode)
);

/*==============================================================*/
/* Table: StockOutHasMateriel                                   */
/*==============================================================*/
create table icdb.StockOutHasMateriel
(
   cargoSpaceCode       VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   stockOutOrderCode    VARCHAR(45) not null,
   stockOutAmount       int,
   stockOutPrice        decimal,
   typeIsOk             int,
   amountIsOk           int,
   specificationIsOk    int,
   primary key (cargoSpaceCode, materielCode, stockOutOrderCode)
);

/*==============================================================*/
/* Table: StockOutOrder                                         */
/*==============================================================*/
create table icdb.StockOutOrder
(
   stockOutOrderCode    VARCHAR(45) not null,
   customerCode         VARCHAR(45),
   stockOutState        int,
   stockOutDealWith     VARCHAR(45),
   stockOutDealMessage  VARCHAR(45),
   stockOutDealDate     datetime,
   stockOutDealState    int,
   stockOutManager      VARCHAR(45),
   stockOutDate         datetime,
   stockOutDestination  VARCHAR(400),
   stockOutChecker      VARCHAR(45),
   stockOutCheckState   int,
   stockOutCheckDate    datetime,
   stockOutMessage      VARCHAR(45),
   stockOutStateType    int,
   stockOrtherMoney     VARCHAR(45),
   stockOrtherMessage   VARCHAR(400),
   stockOutWillDate     datetime,
   stockOutWith         VARCHAR(45),
   stockOutWithState    int,
   primary key (stockOutOrderCode)
);

/*==============================================================*/
/* Table: Storehouse                                            */
/*==============================================================*/
create table icdb.Storehouse
(
   storehouseCode       VARCHAR(45) not null,
   storehouseName       VARCHAR(45),
   storehouseAddress    VARCHAR(45),
   storehouseDefaultCargo VARCHAR(45),
   employeeCode         VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (storehouseCode)
);

/*==============================================================*/
/* Table: Struct                                                */
/*==============================================================*/
create table icdb.Struct
(
   structCode           VARCHAR(45) not null,
   structName           VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (structCode)
);

/*==============================================================*/
/* Table: Supplier                                              */
/*==============================================================*/
create table icdb.Supplier
(
   supplierCode         VARCHAR(100) not null,
   supplierName         VARCHAR(45),
   supplierAddress      VARCHAR(45),
   supplierPhone        VARCHAR(45),
   supplierFax          VARCHAR(45),
   supplierZipCode      VARCHAR(45),
   supplierTaxFileNumber VARCHAR(45),
   supplierRemark       VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (supplierCode)
);

/*==============================================================*/
/* Table: TransferOrder                                         */
/*==============================================================*/
create table TransferOrder
(
   transferOrderCode    varchar(45) not null,
   transferOrderTime    bigint,
   transferOrderType    int,
   transferOrderCredence varchar(45),
   transferOrderChecker varchar(45),
   transferOrderPerson  varchar(45),
   primary key (transferOrderCode)
);

/*==============================================================*/
/* Table: TransferOrderHasMateriel                              */
/*==============================================================*/
create table TransferOrderHasMateriel
(
   transferOrderCode    varchar(45) not null,
   newcargoSpaceCode    VARCHAR(45) not null,
   cargoSpaceCode       VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   primary key (transferOrderCode, newcargoSpaceCode, cargoSpaceCode, materielCode)
);

/*==============================================================*/
/* Table: Unit                                                  */
/*==============================================================*/
create table icdb.Unit
(
   unitCode             VARCHAR(45) not null,
   unitName             VARCHAR(45),
   isEnabled            INT,
   unitTypeCode         INT,
   jsonField            VARCHAR(3000),
   primary key (unitCode)
);

/*==============================================================*/
/* Table: UnitType                                              */
/*==============================================================*/
create table icdb.UnitType
(
   unitTypeCode         INT not null,
   unitTypeName         VARCHAR(45),
   unitTypeRemark       VARCHAR(200),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (unitTypeCode)
);

/*==============================================================*/
/* Table: wasMateriel                                           */
/*==============================================================*/
create table wasMateriel
(
   materielCode         VARCHAR(45),
   wasCode              VARCHAR(45),
   wasNumber            int,
   wasMoney             decimal,
   wasCause             VARCHAR(500)
);

/*==============================================================*/
/* Table: wastage                                               */
/*==============================================================*/
create table wastage
(
   wasCode              varchar(45) not null,
   wasType              int,
   wasTime              bigint,
   operator             varchar(45),
   primary key (wasCode)
);

alter table icdb.Account add constraint fk_Account_Bank1 foreign key (bankCode)
      references icdb.Bank (bankCode);

alter table icdb.Account add constraint fk_Account_People1 foreign key (personCode)
      references icdb.Person (personCode);

alter table icdb.Account add constraint fk_Account_Supplier foreign key (supplierCode)
      references icdb.Supplier (supplierCode);

alter table icdb.BackOrder add constraint FK_Reference_25 foreign key (stockOutOrderCode)
      references icdb.StockOutOrder (stockOutOrderCode) on delete restrict on update restrict;

alter table icdb.BackOrderHasMateriel add constraint fk_BackOrderHasMateriel_BackOrder foreign key (退货单号)
      references icdb.BackOrder (backOrderCode);

alter table icdb.BackOrderHasMateriel add constraint fk_BackOrderHasMateriel_Materiel foreign key (物料编码)
      references icdb.Materiel (materielCode);

alter table icdb.CargoSpace add constraint fk_CargoSpace_Storehouse1 foreign key (storehouseCode)
      references icdb.Storehouse (storehouseCode);

alter table icdb.Department add constraint fk_Department_Struct1 foreign key (structCode)
      references icdb.Struct (structCode);

alter table icdb.Employee add constraint fk_Employee_Job1 foreign key (jobCode)
      references icdb.Job (jobCode);

alter table icdb.Employee add constraint fk_Employee_Person foreign key (personCode)
      references icdb.Person (personCode);

alter table icdb.Job add constraint fk_Job_Department1 foreign key (departmentCode)
      references icdb.Department (departmentCode);

alter table icdb.Stock add constraint fk_Stock_CargoSpace foreign key (cargoSpaceCode)
      references icdb.CargoSpace (cargoSpaceCode);

alter table icdb.Stock add constraint fk_Stock_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table StockInCheckMateriel add constraint FK_Reference_26 foreign key (materielCode)
      references icdb.Materiel (materielCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_27 foreign key (supplierCode)
      references icdb.Supplier (supplierCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_28 foreign key (cargoSpaceCode)
      references icdb.CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_29 foreign key (stockInCode)
      references icdb.StockInCheckOrder (stockInCode) on delete restrict on update restrict;

alter table icdb.StockInCheckOrder add constraint FK_Reference_36 foreign key (employeeCode)
      references icdb.Employee (employeeCode) on delete restrict on update restrict;

alter table icdb.StockOutHasMateriel add constraint FK_Reference_50 foreign key (cargoSpaceCode, materielCode)
      references icdb.Stock (cargoSpaceCode, materielCode) on delete restrict on update restrict;

alter table icdb.StockOutHasMateriel add constraint FK_Reference_54 foreign key (stockOutOrderCode)
      references icdb.StockOutOrder (stockOutOrderCode) on delete restrict on update restrict;

alter table icdb.StockOutOrder add constraint FK_Reference_37 foreign key (customerCode)
      references icdb.Customer (customerCode) on delete restrict on update restrict;

alter table icdb.Storehouse add constraint fk_Storehouse_Employee1 foreign key (employeeCode)
      references icdb.Employee (employeeCode);

alter table TransferOrderHasMateriel add constraint FK_Reference_49 foreign key (transferOrderCode)
      references TransferOrder (transferOrderCode) on delete restrict on update restrict;

alter table TransferOrderHasMateriel add constraint FK_Reference_51 foreign key (cargoSpaceCode, materielCode)
      references icdb.Stock (cargoSpaceCode, materielCode) on delete restrict on update restrict;

alter table TransferOrderHasMateriel add constraint FK_Reference_52 foreign key (newcargoSpaceCode)
      references icdb.CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table icdb.Unit add constraint fk_Unit_UnitType foreign key (unitTypeCode)
      references icdb.UnitType (unitTypeCode);

alter table wasMateriel add constraint FK_Reference_44 foreign key (materielCode)
      references icdb.Materiel (materielCode) on delete restrict on update restrict;

alter table wasMateriel add constraint FK_Reference_45 foreign key (wasCode)
      references wastage (wasCode) on delete restrict on update restrict;

