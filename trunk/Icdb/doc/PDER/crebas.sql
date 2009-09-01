/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2009-09-01 15:18:03                          */
/*==============================================================*/


drop table if exists Account;

drop table if exists BackOrder;

drop table if exists BackOrderHasMateriel;

drop table if exists Bank;

drop table if exists CargoSpace;

drop table if exists CheckStock;

drop table if exists CheckStockList;

drop table if exists Customer;

drop table if exists Department;

drop table if exists Employee;

drop table if exists Job;

drop table if exists Materiel;

drop table if exists Person;

drop table if exists Stock;

drop table if exists StockInCheckMateriel;

drop table if exists StockInCheckOrder;

drop table if exists StockOutHasMateriel;

drop table if exists StockOutOrder;

drop table if exists Storehouse;

drop table if exists Struct;

drop table if exists Supplier;

drop table if exists TransferOrder;

drop table if exists TransferOrderHasMateriel;

drop table if exists Unit;

drop table if exists UnitType;

drop table if exists wasMateriel;

drop table if exists wastage;


/*==============================================================*/
/* Table: Account                                               */
/*==============================================================*/
create table Account
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
create table BackOrder
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
create table BackOrderHasMateriel
(
   backOrderCode        VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   materelCount         decimal,
   materelPirce         decimal,
   primary key (backOrderCode, materielCode)
);

/*==============================================================*/
/* Table: Bank                                                  */
/*==============================================================*/
create table Bank
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
create table CargoSpace
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
/* Table: CheckStock                                            */
/*==============================================================*/
create table CheckStock
(
   csCode               varchar(45) not null,
   storehouseCode       VARCHAR(45),
   csDate               datetime,
   csApprove            varchar(45),
   csApproveMessage     varchar(450),
   csApproveState       varchar(45),
   csCheckPerson        varchar(45),
   csOptionor           varchar(45),
   csState              int,
   csStartStock         int,
   primary key (csCode)
);

/*==============================================================*/
/* Table: CheckStockList                                        */
/*==============================================================*/
create table CheckStockList
(
   csCode               varchar(45),
   materielCode         VARCHAR(45),
   cargoSpaceCode       VARCHAR(45),
   csStartPrice         decimal,
   csStartNumber        decimal,
   csCheckPrice         decimal,
   csCheckNumber        decimal,
   csDiffMessage        VARCHAR(450),
   csRemark             VARCHAR(450),
   csGM                 VARCHAR(45)
);

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer
(
   customerCode         VARCHAR(45) not null,
   primary key (customerCode)
);

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department
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
create table Employee
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
create table Job
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
create table Materiel
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
create table Person
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
create table Stock
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
create table StockInCheckOrder
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
create table StockOutHasMateriel
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
create table StockOutOrder
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
create table Storehouse
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
create table Struct
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
create table Supplier
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
create table Unit
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
create table UnitType
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

alter table Account add constraint fk_Account_Bank1 foreign key (bankCode)
      references Bank (bankCode);

alter table Account add constraint fk_Account_People1 foreign key (personCode)
      references Person (personCode);

alter table Account add constraint fk_Account_Supplier foreign key (supplierCode)
      references Supplier (supplierCode);

alter table BackOrder add constraint FK_Reference_25 foreign key (stockOutOrderCode)
      references StockOutOrder (stockOutOrderCode) on delete restrict on update restrict;

alter table BackOrderHasMateriel add constraint FK_Reference_30 foreign key (backOrderCode)
      references BackOrder (backOrderCode) on delete restrict on update restrict;

alter table BackOrderHasMateriel add constraint FK_Reference_31 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table CargoSpace add constraint fk_CargoSpace_Storehouse1 foreign key (storehouseCode)
      references Storehouse (storehouseCode);

alter table CheckStock add constraint FK_Reference_35 foreign key (storehouseCode)
      references Storehouse (storehouseCode) on delete restrict on update restrict;

alter table CheckStockList add constraint FK_Reference_32 foreign key (csCode)
      references CheckStock (csCode) on delete restrict on update restrict;

alter table CheckStockList add constraint FK_Reference_33 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table CheckStockList add constraint FK_Reference_34 foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table Department add constraint fk_Department_Struct1 foreign key (structCode)
      references Struct (structCode);

alter table Employee add constraint fk_Employee_Job1 foreign key (jobCode)
      references Job (jobCode);

alter table Employee add constraint fk_Employee_Person foreign key (personCode)
      references Person (personCode);

alter table Job add constraint fk_Job_Department1 foreign key (departmentCode)
      references Department (departmentCode);

alter table Stock add constraint fk_Stock_CargoSpace foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode);

alter table Stock add constraint fk_Stock_Materiel foreign key (materielCode)
      references Materiel (materielCode);

alter table StockInCheckMateriel add constraint FK_Reference_26 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_27 foreign key (supplierCode)
      references Supplier (supplierCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_28 foreign key (cargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table StockInCheckMateriel add constraint FK_Reference_29 foreign key (stockInCode)
      references StockInCheckOrder (stockInCode) on delete restrict on update restrict;

alter table StockInCheckOrder add constraint FK_Reference_36 foreign key (employeeCode)
      references Employee (employeeCode) on delete restrict on update restrict;

alter table StockOutHasMateriel add constraint FK_Reference_50 foreign key (cargoSpaceCode, materielCode)
      references Stock (cargoSpaceCode, materielCode) on delete restrict on update restrict;

alter table StockOutHasMateriel add constraint FK_Reference_54 foreign key (stockOutOrderCode)
      references StockOutOrder (stockOutOrderCode) on delete restrict on update restrict;

alter table StockOutOrder add constraint FK_Reference_37 foreign key (customerCode)
      references Customer (customerCode) on delete restrict on update restrict;

alter table Storehouse add constraint fk_Storehouse_Employee1 foreign key (employeeCode)
      references Employee (employeeCode);

alter table TransferOrderHasMateriel add constraint FK_Reference_49 foreign key (transferOrderCode)
      references TransferOrder (transferOrderCode) on delete restrict on update restrict;

alter table TransferOrderHasMateriel add constraint FK_Reference_51 foreign key (cargoSpaceCode, materielCode)
      references Stock (cargoSpaceCode, materielCode) on delete restrict on update restrict;

alter table TransferOrderHasMateriel add constraint FK_Reference_52 foreign key (newcargoSpaceCode)
      references CargoSpace (cargoSpaceCode) on delete restrict on update restrict;

alter table Unit add constraint fk_Unit_UnitType foreign key (unitTypeCode)
      references UnitType (unitTypeCode);

alter table wasMateriel add constraint FK_Reference_44 foreign key (materielCode)
      references Materiel (materielCode) on delete restrict on update restrict;

alter table wasMateriel add constraint FK_Reference_45 foreign key (wasCode)
      references wastage (wasCode) on delete restrict on update restrict;

