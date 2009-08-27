/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2009/8/27 11:08:50                           */
/*==============================================================*/


drop table if exists icdb.Account;

drop table if exists icdb.BackOrder;

drop table if exists icdb.BackOrderHasMateriel;

drop table if exists icdb.Bank;

drop table if exists icdb.CargoSpace;

drop table if exists icdb.Customer;

drop table if exists icdb.CustomerOrder;

drop table if exists icdb.CustomerOrderHasMateriel;

drop table if exists icdb.Department;

drop table if exists icdb.Employee;

drop table if exists icdb.Job;

drop table if exists icdb.Materiel;

drop table if exists icdb.Person;

drop table if exists icdb.PurchaseOrder;

drop table if exists icdb.PurchaseOrderHasMateriel;

drop table if exists icdb.Stock;

drop table if exists icdb.StockInCheckOrder;

drop table if exists icdb.StockInCredence;

drop table if exists icdb.StockInHasMateriel;

drop table if exists icdb.StockInOrder;

drop table if exists icdb.StockOutCheckOrder;

drop table if exists icdb.StockOutCredence;

drop table if exists icdb.StockOutHasMateriel;

drop table if exists icdb.StockOutOrder;

drop table if exists icdb.Storehouse;

drop table if exists icdb.Struct;

drop table if exists icdb.Supplier;

drop table if exists icdb.TryForStockInOrder;

drop table if exists icdb.Unit;

drop table if exists icdb.UnitType;

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
   accountName          VARCHAR(45),
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
   stockInCheckOrderCode VARCHAR(45),
   primary key (backOrderCode)
);

/*==============================================================*/
/* Table: BackOrderHasMateriel                                  */
/*==============================================================*/
create table icdb.BackOrderHasMateriel
(
   backOrderCode        VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   primary key (backOrderCode, materielCode)
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
   personCode           VARCHAR(45) not null,
   Customer             VARCHAR(45) not null,
   primary key (personCode)
);

/*==============================================================*/
/* Table: CustomerOrder                                         */
/*==============================================================*/
create table icdb.CustomerOrder
(
   customerOrderCode    VARCHAR(45) not null,
   personCode           VARCHAR(45),
   customerOrderPayType char(10),
   customerOrderPayer   char(10),
   customerOrderPayee   char(10),
   customerOrderIsPass  char(10),
   customerOrderState   char(10),
   primary key (customerOrderCode)
);

/*==============================================================*/
/* Table: CustomerOrderHasMateriel                              */
/*==============================================================*/
create table icdb.CustomerOrderHasMateriel
(
   customerOrderCode    VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   primary key (customerOrderCode, materielCode)
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
   personCode           VARCHAR(45) not null,
   employeeCode         VARCHAR(45) not null,
   jobCode              VARCHAR(45),
   isEnabled            INT,
   jsonField            VARCHAR(3000),
   primary key (personCode)
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
   materielIOType       VARCHAR(45),
   unitCodeSpecification VARCHAR(45),
   unitCodeType         VARCHAR(45),
   unitCodeSort         VARCHAR(45),
   unitCodeUnit         VARCHAR(45),
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
/* Table: PurchaseOrder                                         */
/*==============================================================*/
create table icdb.PurchaseOrder
(
   purchaseOrderCode    VARCHAR(45) not null,
   personCode           VARCHAR(45),
   customerOrderCode    VARCHAR(45),
   primary key (purchaseOrderCode)
);

/*==============================================================*/
/* Table: PurchaseOrderHasMateriel                              */
/*==============================================================*/
create table icdb.PurchaseOrderHasMateriel
(
   purchaseOrderCode    VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   supplierCode         VARCHAR(100),
   primary key (purchaseOrderCode, materielCode)
);

/*==============================================================*/
/* Table: Stock                                                 */
/*==============================================================*/
create table icdb.Stock
(
   stockCode            VARCHAR(50) not null,
   cargoSpaceCode       VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   stockPrice           DECIMAL,
   stockAmount          VARCHAR(45),
   jsonField            VARCHAR(3000),
   primary key (stockCode, cargoSpaceCode, materielCode)
);

/*==============================================================*/
/* Table: StockInCheckOrder                                     */
/*==============================================================*/
create table icdb.StockInCheckOrder
(
   stockInCheckOrderCode VARCHAR(45) not null,
   stockInCredenceCode  VARCHAR(45),
   primary key (stockInCheckOrderCode)
);

/*==============================================================*/
/* Table: StockInCredence                                       */
/*==============================================================*/
create table icdb.StockInCredence
(
   stockInCredenceCode  VARCHAR(45) not null,
   tryForStockInOrderCode VARCHAR(45),
   primary key (stockInCredenceCode)
);

/*==============================================================*/
/* Table: StockInHasMateriel                                    */
/*==============================================================*/
create table icdb.StockInHasMateriel
(
   stockInCode          VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   primary key (stockInCode, materielCode)
);

/*==============================================================*/
/* Table: StockInOrder                                          */
/*==============================================================*/
create table icdb.StockInOrder
(
   stockInCode          VARCHAR(45) not null,
   stockInCredenceCode  VARCHAR(45),
   primary key (stockInCode)
);

/*==============================================================*/
/* Table: StockOutCheckOrder                                    */
/*==============================================================*/
create table icdb.StockOutCheckOrder
(
   stockOutCheckOrderCode VARCHAR(45) not null,
   primary key (stockOutCheckOrderCode)
);

/*==============================================================*/
/* Table: StockOutCredence                                      */
/*==============================================================*/
create table icdb.StockOutCredence
(
   stockOutCredenceCode VARCHAR(45) not null,
   primary key (stockOutCredenceCode)
);

/*==============================================================*/
/* Table: StockOutHasMateriel                                   */
/*==============================================================*/
create table icdb.StockOutHasMateriel
(
   stockOutCode         VARCHAR(45) not null,
   materielCode         VARCHAR(45) not null,
   primary key (stockOutCode, materielCode)
);

/*==============================================================*/
/* Table: StockOutOrder                                         */
/*==============================================================*/
create table icdb.StockOutOrder
(
   stockOutCode         VARCHAR(45) not null,
   primary key (stockOutCode)
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
/* Table: TryForStockInOrder                                    */
/*==============================================================*/
create table icdb.TryForStockInOrder
(
   tryForStockInOrderCode VARCHAR(45) not null,
   purchaseOrderCode    VARCHAR(45),
   primary key (tryForStockInOrderCode)
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

alter table icdb.Account add constraint fk_Account_Bank1 foreign key (bankCode)
      references icdb.Bank (bankCode);

alter table icdb.Account add constraint fk_Account_People1 foreign key (personCode)
      references icdb.Person (personCode);

alter table icdb.Account add constraint fk_Account_Supplier foreign key (supplierCode)
      references icdb.Supplier (supplierCode);

alter table icdb.BackOrder add constraint fk_BackOrder_StockInCheckOrder foreign key (stockInCheckOrderCode)
      references icdb.StockInCheckOrder (stockInCheckOrderCode);

alter table icdb.BackOrderHasMateriel add constraint fk_BackOrderHasMateriel_BackOrder foreign key (backOrderCode)
      references icdb.BackOrder (backOrderCode);

alter table icdb.BackOrderHasMateriel add constraint fk_BackOrderHasMateriel_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.CargoSpace add constraint fk_CargoSpace_Storehouse1 foreign key (storehouseCode)
      references icdb.Storehouse (storehouseCode);

alter table icdb.Customer add constraint fk_Customer_Person foreign key (personCode)
      references icdb.Person (personCode);

alter table icdb.CustomerOrder add constraint fk_CustomerOrder_Customer foreign key (personCode)
      references icdb.Customer (personCode);

alter table icdb.CustomerOrderHasMateriel add constraint fk_CustomerOrder_has_Materiel_CustomerOrder foreign key (customerOrderCode)
      references icdb.CustomerOrder (customerOrderCode);

alter table icdb.CustomerOrderHasMateriel add constraint fk_CustomerOrder_has_Materiel_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.Department add constraint fk_Department_Struct1 foreign key (structCode)
      references icdb.Struct (structCode);

alter table icdb.Employee add constraint fk_Employee_Job1 foreign key (jobCode)
      references icdb.Job (jobCode);

alter table icdb.Employee add constraint fk_Employee_Person foreign key (personCode)
      references icdb.Person (personCode);

alter table icdb.Job add constraint fk_Job_Department1 foreign key (departmentCode)
      references icdb.Department (departmentCode);

alter table icdb.Materiel add constraint fk_Materiel_Unit1 foreign key (unitCodeSpecification)
      references icdb.Unit (unitCode);

alter table icdb.Materiel add constraint fk_Materiel_Unit2 foreign key (unitCodeType)
      references icdb.Unit (unitCode);

alter table icdb.Materiel add constraint fk_Materiel_Unit3 foreign key (unitCodeSort)
      references icdb.Unit (unitCode);

alter table icdb.Materiel add constraint fk_Materiel_Unit4 foreign key (unitCodeUnit)
      references icdb.Unit (unitCode);

alter table icdb.PurchaseOrder add constraint fk_PurchaseOrder_CustomerOrder foreign key (customerOrderCode)
      references icdb.CustomerOrder (customerOrderCode);

alter table icdb.PurchaseOrder add constraint fk_PurchaseOrder_Employee foreign key (personCode)
      references icdb.Employee (personCode);

alter table icdb.PurchaseOrderHasMateriel add constraint fk_PurchaseOrderHasMateriel_Supplier foreign key (supplierCode)
      references icdb.Supplier (supplierCode);

alter table icdb.PurchaseOrderHasMateriel add constraint fk_PurchaseOrder_has_Materiel_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.PurchaseOrderHasMateriel add constraint fk_PurchaseOrder_has_Materiel_PurchaseOrder foreign key (purchaseOrderCode)
      references icdb.PurchaseOrder (purchaseOrderCode);

alter table icdb.Stock add constraint fk_Stock_CargoSpace foreign key (cargoSpaceCode)
      references icdb.CargoSpace (cargoSpaceCode);

alter table icdb.Stock add constraint fk_Stock_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.StockInCheckOrder add constraint fk_StockInCheckOrder_StockInCredence foreign key (stockInCredenceCode)
      references icdb.StockInCredence (stockInCredenceCode);

alter table icdb.StockInCredence add constraint fk_StockInCredence_TryForStockInOrder foreign key (tryForStockInOrderCode)
      references icdb.TryForStockInOrder (tryForStockInOrderCode);

alter table icdb.StockInHasMateriel add constraint fk_StockInHasMateriel_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.StockInHasMateriel add constraint fk_StockInHasMateriel_StockIn foreign key (stockInCode)
      references icdb.StockInOrder (stockInCode);

alter table icdb.StockInOrder add constraint fk_StockInOrder_StockInCredence foreign key (stockInCredenceCode)
      references icdb.StockInCredence (stockInCredenceCode);

alter table icdb.StockOutHasMateriel add constraint fk_StockOutHasMateriel_Materiel foreign key (materielCode)
      references icdb.Materiel (materielCode);

alter table icdb.StockOutHasMateriel add constraint fk_StockOutHasMateriel_StockOut foreign key (stockOutCode)
      references icdb.StockOutOrder (stockOutCode);

alter table icdb.Storehouse add constraint fk_Storehouse_Employee1 foreign key (employeeCode)
      references icdb.Employee (employeeCode);

alter table icdb.TryForStockInOrder add constraint fk_TryForStockInOrder_PurchaseOrder foreign key (purchaseOrderCode)
      references icdb.PurchaseOrder (purchaseOrderCode);

alter table icdb.Unit add constraint fk_Unit_UnitType foreign key (unitTypeCode)
      references icdb.UnitType (unitTypeCode);

