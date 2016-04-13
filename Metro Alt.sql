Use MetroAlt 
--1--
Create table Bus_Service
(
BusServiceKey int identity(1,1) primary key,
BusServiceName nvarchar(255) not null,
BusServiceDescription varchar (5000)
);

--2--
Create table Maintenance
(
MaintenanceKey int identity(1,1) Primary Key,
BusKey int not null,
MainenanceDate Date default GetDate(),
Constraint FK_Bus Foreign Key(MaintenanceKey) References Bus_Service (BusServiceKey)
);

--3--
Create table MaintenanceDetail
(
MaintenanceDetailKey int identity(1,1),
Maintenancekey int not null,
EmployeeKey int not null,
BusServiceKey int not null,
MaintenanceNotes nvarchar (255)
);

--4--
Alter Table MaintenanceDetail
add constraint PK_MaintenanceDetail Primary Key (MaintenanceDetailKey);

--5-a--
Alter Table MaintenanceDetail
add constraint FK_MaintenanceDetail Foreign Key(MaintenanceKey) References Maintenance(MaintenanceKey);

--5-a---
Alter Table MaintenanceDetail
add constraint FK_MaintenanceEmployee Foreign Key(EmployeeKey) References Employee(EmployeeKey);

--6---
Alter Table MaintenanceDetail
add constraint FK_MaintenanceBus Foreign Key(BusServiceKey) References Bus_Service (BusServiceKey);
--7---
Alter Table BusType
Add BusTypeAccessible BIT;

--8---
Alter Table Employee
Add constraint unique_email unique (EmployeeEamil);