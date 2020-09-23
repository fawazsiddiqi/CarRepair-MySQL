CREATE TABLE Employee(
  Emp_ID    VARCHAR(20) NOT NULL,
  Emp_Name  VARCHAR(20) NULL,
  CONSTRAINT EmpPrimary PRIMARY KEY (Emp_ID)
);

CREATE TABLE Customer(
  Cust_ID   VARCHAR(20) NOT NULL,
  Cust_Name VARCHAR(20) NULL,
  Cust_Addr VARCHAR(50) NULL,
  Cust_Num  VARCHAR(30) NULL,
 CONSTRAINT CustPrimary PRIMARY KEY (Cust_ID)
);

CREATE TABLE Repair(
  Repair_ID   VARCHAR(20) NOT NULL,
  Description VARCHAR(20) NULL,
  TimeTaken   INTEGER     NULL,
  RepairCost  INTEGER     NULL,
  CONSTRAINT RepPrimary PRIMARY KEY (Repair_ID)
);

CREATE TABLE Parts(
  Part_ID       VARCHAR(20) NOT NULL,
  PartFactory   VARCHAR(20) NULL,
  PartSupplier  VARCHAR(20) NULL,
  PartType      VARCHAR(20) NULL,
  PartPrice     INTEGER     NULL ,
  CONSTRAINT PartPrimary PRIMARY KEY (Part_ID)
);

CREATE TABLE SkillType(
  SkillID          VARCHAR(20) NOT NULL,
  SkillDescription VARCHAR(70) NULL,
  SkillCar         VARCHAR(70) NULL,
  CONSTRAINT SkillTypePrimary PRIMARY KEY (SkillID)
);

CREATE TABLE CarOwner(
  Car_ID    VARCHAR(20) NOT NULL,
  Cust_ID   VARCHAR(20) NOT NULL,
  Car_Make  VARCHAR(50) NULL,
  Car_Model VARCHAR(30) NULL,
  Car_Year  INTEGER     NULL,
  Car_Regis VARCHAR(50) NULL,
 CONSTRAINT CarPrimary PRIMARY KEY (Car_ID),
 CONSTRAINT CarOwnerFk FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID)
);

CREATE TABLE Job(
  JobID     VARCHAR(20) NOT NULL,
  RepairID  VARCHAR(20) NOT NULL,
  Emp_ID    VARCHAR(20) NOT NULL,
  CarID     VARCHAR(20) NOT NULL,
  JobPart   VARCHAR(20) NULL,
  JobDate   DATE        NULL,
  CONSTRAINT JobID PRIMARY KEY (JobID),
  CONSTRAINT RepairJob FOREIGN KEY (RepairID) REFERENCES Repair(Repair_ID),
  CONSTRAINT EmpJob FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
  CONSTRAINT CarJob FOREIGN KEY (CarID) REFERENCES CarOwner(Car_ID),
  CONSTRAINT PartFK FOREIGN KEY (JobPart) REFERENCES Parts(Part_ID)
);

CREATE TABLE HasSkill(
  HSkillID  VARCHAR(20) NOT NULL,
  HSkillEmp VARCHAR(20) NOT NULL,
  HSkill    VARCHAR(20) NOT NULL,
  HSExp     INTEGER     NULL,
  CONSTRAINT HSPrimary PRIMARY KEY (HSkillID),
  CONSTRAINT HasSkillEmp FOREIGN KEY (HSkillEmp) REFERENCES Employee(Emp_ID),
  CONSTRAINT HasSkillSkill FOREIGN KEY (HSkill) REFERENCES SkillType(SkillID)
);

CREATE TABLE Salary(
  Emp_ID    VARCHAR(20) NOT NULL,
  Salary INTEGER,
  CONSTRAINT EmpPrimary PRIMARY KEY (Emp_ID),
  CONSTRAINT SalEmp FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID)
);



INSERT INTO Employee VALUES ('A0001', 'John');
INSERT INTO Employee VALUES ('A0002', 'Ali');
INSERT INTO Employee VALUES ('A0003', 'Kevin');
INSERT INTO Employee VALUES ('A0004', 'Jeff');
INSERT INTO Employee VALUES ('A0005', 'Carl');

INSERT INTO Customer VALUES ('C0001', 'Scott', 'Baker Street', '5453896');
INSERT INTO Customer VALUES ('C0002', 'Ali', '5th Avenue', '7865596');
INSERT INTO Customer VALUES ('C0003', 'Alison', 'Gaffers Street', '8981328');
INSERT INTO Customer VALUES ('C0004', 'Ned', 'Capetian Street', '9874561');
INSERT INTO Customer VALUES ('C0005', 'Khan', '10th Avenue', '5768231');
INSERT INTO Customer VALUES ('C0006', 'Michael', 'Vega Street', '3932351');
INSERT INTO Customer VALUES ('C0007', 'Jordan', '2nd Street', '3546871');
INSERT INTO Customer VALUES ('C0008', 'Jordan', 'Sunset Boulevard', '2512621');
INSERT INTO Customer VALUES ('C0009', 'Jackson', 'Melrose Avenue', '3212347');
INSERT INTO Customer VALUES ('C0010', 'Ahmed', '545 Street', '3613581');

INSERT INTO Repair VALUES ('R0001', 'Filter', 60, 100);
INSERT INTO Repair VALUES ('R0002', 'Radiator', 60, 300);
INSERT INTO Repair VALUES ('R0003', 'Tires', 20, 100);
INSERT INTO Repair VALUES ('R0004', 'Engine', 60, 700);
INSERT INTO Repair VALUES ('R0005', 'Tuning', 40, 50);
INSERT INTO Repair VALUES ('R0006', 'Audio System', 30, 100);
INSERT INTO Repair VALUES ('R0007', 'Axel', 60, 800);
INSERT INTO Repair VALUES ('R0008', 'Alignment', 30, 60);
INSERT INTO Repair VALUES ('R0009', 'Fan', 50, 70);
INSERT INTO Repair VALUES ('R0010', 'Oil', 20, 20);

INSERT INTO Parts VALUES ('P0001', 'Toyo', 'ADNOC', 'Tires', 1000);
INSERT INTO Parts VALUES ('P0002', 'BStone', 'BriStone', 'Tires', 1500);
INSERT INTO Parts VALUES ('P0003', 'Toyota', 'Futtaim', 'Axel', 5000);
INSERT INTO Parts VALUES ('P0004', 'Ford', 'Tayem', 'Axel', 6000);
INSERT INTO Parts VALUES ('P0005', 'GMC', 'Tayem', 'Axel', 5500);
INSERT INTO Parts VALUES ('P0006', 'Alpha', 'Masood', 'Axel', 3000);
INSERT INTO Parts VALUES ('P0007', 'Nissan', 'Masood', 'Axel', 4500);
INSERT INTO Parts VALUES ('P0008', 'Renault', 'Tayem', 'Axel', 3050);
INSERT INTO Parts VALUES ('P0009', 'BMW', 'Masood', 'Axel', 2500);
INSERT INTO Parts VALUES ('P0010', 'Mercedes', 'Masood', 'Axel', 6000);
INSERT INTO Parts VALUES ('P0011', 'Jeep', 'JeepSup', 'Axel', 3500);
INSERT INTO Parts VALUES ('P0012', 'CoolSys', 'AcDelco', 'Fan', 7000);
INSERT INTO Parts VALUES ('P0013', 'RadiAct', 'Razer', 'Radiator', 8000);
INSERT INTO Parts VALUES ('P0014', 'AcFilt', 'ACSup', 'Filter', 500);
INSERT INTO Parts VALUES ('P0015', 'EngTech', 'AcDelco', 'Engine Supplies', 6500);
INSERT INTO Parts VALUES ('P0016', 'Revolve', 'PistonTec', 'Engine Supplies', 7000);
INSERT INTO Parts VALUES ('P0017', 'SparkInc', 'Spark', 'Spark Plug', 7500);
INSERT INTO Parts VALUES ('P0018', 'EngTech', 'AcDelco', 'Engine Belt', 3000);
INSERT INTO Parts VALUES ('P0019', 'Ribbit', 'RibbitInc', 'Engine Ball Joint', 6500);
INSERT INTO Parts VALUES ('P0020', 'Bose', 'InCar', 'In car audio', 4000);

INSERT INTO SkillType VALUES ('S0001', 'Repair Brakes', 'Jeep');
INSERT INTO SkillType VALUES ('S0002', 'Replace Filter', 'Toyota');
INSERT INTO SkillType VALUES ('S0003', 'Repair Engine', 'Alfa');
INSERT INTO SkillType VALUES ('S0004', 'Fix Alignment', 'Nissan');
INSERT INTO SkillType VALUES ('S0005', 'Tires', 'GMC');
INSERT INTO SkillType VALUES ('S0006', 'Change Axel', 'BMW');
INSERT INTO SkillType VALUES ('S0007', 'Oil Change', 'Nissan');
INSERT INTO SkillType VALUES ('S0008', 'Coolant', 'Jeep');
INSERT INTO SkillType VALUES ('S0009', 'Wheel Align', 'Toyota');
INSERT INTO SkillType VALUES ('S0010', 'Audio Tuning', 'Nissan');

INSERT INTO CarOwner VALUES ('Ca001', 'C0001', 'Ford', 'Mustang', 2018, 'Ohio');
INSERT INTO CarOwner VALUES ('Ca002', 'C0001', 'Toyota', 'Camry', 2015, 'Arizona');
INSERT INTO CarOwner VALUES ('Ca003', 'C0002', 'Nissan', 'Pathfinder', 2015, 'LA');
INSERT INTO CarOwner VALUES ('Ca004', 'C0002', 'Jeep', 'Travesty', 2018, 'California');
INSERT INTO CarOwner VALUES ('Ca005', 'C0003', 'Ford', 'Raptor', 2017, 'California');
INSERT INTO CarOwner VALUES ('Ca006', 'C0004', 'Renault', 'Fluence', 2012, 'Arizona');
INSERT INTO CarOwner VALUES ('Ca007', 'C0005', 'Alpha', 'Romeo', 2014, 'LA');
INSERT INTO CarOwner VALUES ('Ca008', 'C0006', 'BMW', '358i', 2016, 'Florida');
INSERT INTO CarOwner VALUES ('Ca009', 'C0007', 'Mercedes', 'AMG', 2015, 'Texas');
INSERT INTO CarOwner VALUES ('Ca010', 'C0008', 'Nissan', 'Patrol', 2012, 'Washington');
INSERT INTO CarOwner VALUES ('Ca011', 'C0009', 'Ford', 'Explorer', 2013, 'New York');
INSERT INTO CarOwner VALUES ('Ca012', 'C0010', 'GMC', 'Acadia', 2014, 'Colorado');

INSERT INTO Job VALUES ('J0001','R0001','A0001','Ca001','P0001',STR_TO_DATE('01/10/10','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0002','R0002','A0002','Ca002','P0020',STR_TO_DATE('25/12/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0003','R0003','A0003','Ca003','P0015',STR_TO_DATE('10/05/17','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0004','R0001','A0001','Ca004','P0005',STR_TO_DATE('15/10/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0005','R0005','A0002','Ca003','P0003',STR_TO_DATE('15/09/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0006','R0006','A0003','Ca004','P0010',STR_TO_DATE('05/02/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0007','R0001','A0001','Ca007','P0011',STR_TO_DATE('15/05/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0008','R0008','A0004','Ca003','P0012',STR_TO_DATE('18/01/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0009','R0002','A0001','Ca009','P0008',STR_TO_DATE('01/05/17','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0010','R0010','A0002','Ca010','P0014',STR_TO_DATE('10/10/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0011','R0010','A0002','Ca010','P0006',STR_TO_DATE('25/07/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0012','R0010','A0002','Ca010','P0013',STR_TO_DATE('15/04/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0013','R0010','A0002','Ca010','P0019',STR_TO_DATE('15/04/18','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0014','R0002','A0005','Ca002','P0006',STR_TO_DATE('15/05/16','%d/%m/%Y'));
INSERT INTO Job VALUES ('J0015','R0001','A0001','Ca001','P0008',STR_TO_DATE('25/10/10','%d/%m/%Y'));

INSERT INTO HasSkill VALUES ('Hs001', 'A0001', 'S0002', 2);
INSERT INTO HasSkill VALUES ('Hs002', 'A0001', 'S0004', 5);
INSERT INTO HasSkill VALUES ('Hs003', 'A0002', 'S0006', 3);
INSERT INTO HasSkill VALUES ('Hs004', 'A0002', 'S0008', 9);
INSERT INTO HasSkill VALUES ('Hs005', 'A0003', 'S0010', 4);
INSERT INTO HasSkill VALUES ('Hs006', 'A0003', 'S0009', 8);
INSERT INTO HasSkill VALUES ('Hs007', 'A0004', 'S0001', 10);
INSERT INTO HasSkill VALUES ('Hs008', 'A0004', 'S0003', 2);
INSERT INTO HasSkill VALUES ('Hs009', 'A0005', 'S0005', 1);
INSERT INTO HasSkill VALUES ('Hs010', 'A0005', 'S0007', 7);

--Task1
SELECT Cust_ID, Car_Make, Car_Model, Car_Year, Car_Regis, JobID, Emp_ID, RepairID, CarID, JobDate
FROM CarOwner C INNER JOIN Job J ON C.Car_ID = J.CarID
WHERE CarID = 'Ca010';

--Task2
SELECT JobDate,
       WEEK(JobDate) AS Week,
       SUM(RepairCost) AS SumOfRepairCost
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
WHERE MONTH(JobDate)
GROUP BY JobDate;

--Task3
SELECT CarID,
       SUM(RepairCost) AS CostOfRepair
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID,
CarOwner CO INNER JOIN Customer C on CO.Cust_ID = C.Cust_ID
GROUP BY J.CarID
ORDER BY SUM(RepairCost) DESC LIMIT 1;

--Task4
SELECT CarID,
       COUNT(J.RepairID) AS NumberRepairs
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
GROUP BY CarID
ORDER BY COUNT(J.RepairID) DESC LIMIT 1;

--Task5
SELECT DISTINCT J.Emp_ID,
                MONTH(JobDate) AS Month,
                COUNT(E.Emp_ID) AS NumberOfRepairS
FROM Job J INNER JOIN Employee E on J.Emp_ID = E.Emp_ID
WHERE MONTH(JobDate) GROUP BY MONTH(JobDate), J.Emp_ID
ORDER BY MONTH(JobDate);

--Task6
SELECT E.Emp_ID,
       COUNT(J.Emp_ID)
FROM Job J INNER JOIN Employee E on J.Emp_ID = E.Emp_ID
GROUP BY E.Emp_ID
ORDER BY COUNT(J.Emp_ID) DESC LIMIT 1;

--Task7
SELECT DISTINCT J.Emp_ID , MONTH(JobDate) AS Month,
                SUM(RepairCost*0.1) AS Salary,
                COUNT(J.RepairID) AS NumberRepairs
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
WHERE MONTH(JobDate) GROUP BY MONTH(JobDate), J.Emp_ID
ORDER BY MONTH(JobDate), COUNT(J.RepairID) DESC;

--Task8
SELECT DISTINCT J.Emp_ID,
                SUM(RepairCost*0.15) AS Salary,
                COUNT(J.RepairID) AS NumberRepairs
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
GROUP BY J.Emp_ID
ORDER BY COUNT(J.RepairID) DESC LIMIT 3;


--Task9
INSERT INTO Salary
SELECT DISTINCT J.Emp_ID,
                SUM(RepairCost*0.15)
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
GROUP BY J.Emp_ID
ORDER BY COUNT(J.RepairID) DESC LIMIT 3;

INSERT INTO Salary
SELECT DISTINCT J.Emp_ID,
                SUM(RepairCost*0.1)
FROM Job J INNER JOIN Repair R ON J.RepairID = R.Repair_ID
WHERE NOT J.Emp_ID = 'A0001' AND NOT J.Emp_ID ='A0002' AND NOT J.Emp_ID = 'A0003'
GROUP BY J.Emp_ID
ORDER BY COUNT(J.RepairID) DESC;

ALTER TABLE Salary
ADD Percentage INTEGER;

UPDATE Salary
SET Percentage = 10
WHERE NOT Emp_ID = 'A0001' AND NOT Emp_ID ='A0002' AND NOT Emp_ID = 'A0003';

UPDATE Salary
SET Percentage = 15
WHERE Emp_ID = 'A0001' OR Emp_ID ='A0002' OR Emp_ID = 'A0003';

SELECT S.Emp_ID,
       COUNT(J.Emp_ID) AS Repairs,
       S.Percentage
FROM Job J INNER JOIN Employee E on J.Emp_ID = E.Emp_ID,
     Salary S INNER JOIN Employee E2 on S.Emp_ID = E2.Emp_ID
GROUP BY S.Emp_ID;