CREATE DATABASE [HospitalManagementSystem]

CREATE TABLE Department (
    Department_ID INT IDENTITY(1,1) PRIMARY KEY,
    Department_Name VARCHAR(255) NOT NULL
);

select * from Department

INSERT INTO Department ( Department_Name) VALUES
( 'ENT'),
( 'Medical Services'),
( 'Dermatology'),
( 'Pharmacy'),
( 'Radiology'),
('Laboratory'),
( 'Patient Services'),
('Opthomology'),
( 'Human Resources'),
( 'Facilities Management');



--drop table Disease
--drop table Department
--drop table Patient
truncate table Department


CREATE TABLE Ward (
    Room_ID INT IDENTITY(200,1) PRIMARY KEY,
    Bed_Number INT,
    Ward_Type VARCHAR(255),
    Floor_Number INT,
    );

INSERT INTO Ward (Bed_Number, Ward_Type, Floor_Number)
VALUES
(301, 'General', 3),
(302, 'Private', 3),
(303, 'ICU', 3),
(401, 'Pediatrics', 4),
(402, 'Audiology', 4),
(403, 'Allergy', 4),
(501, 'Voice and Laryngology', 5),
(502, 'Sleep Medicine', 5),
(503, 'Rhinology', 5),
(504, 'Head and Neck Surgery', 5);

select * from Ward
drop table Ward

CREATE TABLE Patient (
    Patient_ID INT IDENTITY(100,1) PRIMARY KEY,
	Room_ID INT,
    Patient_Name VARCHAR(255),
    Patient_Address VARCHAR(255),
    Patient_Phonenumber bigint
	FOREIGN KEY (Room_ID) REFERENCES Ward(Room_ID)
);

insert into Patient (Room_ID,Patient_Name,Patient_Address,Patient_Phonenumber)
values
(200,'John Doe', '123 Main St', 5551234567),
(201,'Jane Smith', '456 Elm St', 5559876543),
    (202,'Alice Johnson', '789 Oak St', 5553456789),
    (203,'Bob Wilson', '321 Pine St', 5558765432),
    (204,'Eva Davis', '654 Birch St', 5552345678),
    (205,'Mike Brown', '987 Maple St', 5557654321),
    (206,'Sara Lee', '234 Cedar St', 5554323456),
    (207,'Chris Evans', '567 Redwood St', 5556543210),
    (208,'Linda White', '876 Spruce St', 5551234321),
	(209,'Tom Baker', '109 Fir St', 5559876543);

	
	select * from Patient

	--drop table ward
	--drop table Patient



	truncate table Patient

	

CREATE TABLE Disease (
    Disease_ID INT IDENTITY(11,1) PRIMARY KEY,
    Department_ID INT,
    Disease_Name VARCHAR(255),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Disease (Department_ID, Disease_Name) VALUES
(1, 'Ear Infection'),
(1, 'Sinusitis'),
(1, 'Tonsillitis'),
(1, 'Hearing Loss'),
(1, 'Nasal Allergy'),
(1, 'Laryngitis'),
(1, 'Vertigo'),
(1, 'Throat Cancer'),
(1, 'Ear Wax Blockage'),
(1, 'Nasal Polyps');

select * from Disease

CREATE TABLE Employee (
    Employee_ID INT IDENTITY(21,1) PRIMARY KEY,
    Department_ID INT,
    Employee_FirstName VARCHAR(255),
    Employee_LastName VARCHAR(255),
    Employee_PhoneNumber VARCHAR(15),
    Employee_Email VARCHAR(255),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);


INSERT INTO Employee (Department_ID, Employee_FirstName, Employee_LastName, Employee_PhoneNumber, Employee_Email)
VALUES
(1, 'John', 'Doe', '555-123-4567', 'john.doe@example.com'),
(1, 'Jane', 'Smith', '555-987-6543', 'jane.smith@example.com'),
(1, 'David', 'Johnson', '555-456-7890', 'david.johnson@example.com'),
(1, 'Emily', 'Wilson', '555-789-1234', 'emily.wilson@example.com'),
(1, 'Michael', 'Brown', '555-234-5678', 'michael.brown@example.com'),
(1, 'Sarah', 'Anderson', '555-876-5432', 'sarah.anderson@example.com'),
(1, 'Robert', 'Miller', '555-345-6789', 'robert.miller@example.com'),
(1, 'Jennifer', 'Taylor', '555-654-3210', 'jennifer.taylor@example.com'),
(1, 'William', 'Jones', '555-432-1098', 'william.jones@example.com'),
(1, 'Laura', 'Davis', '555-210-9876', 'laura.davis@example.com');

select * from Employee

CREATE TABLE Doctor (
    D_Employee_ID INT PRIMARY KEY,
    Doctor_Specialty VARCHAR(255), 
	Admission_Date DATE,
    FOREIGN KEY (D_Employee_ID) REFERENCES Employee(Employee_ID)
);

drop table Doctor

INSERT INTO Doctor (D_Employee_ID,Doctor_Specialty, Admission_Date)
VALUES
(21,'Otology', '2023-01-15'),
(22,'Rhinology', '2023-02-20'),
(23,'Laryngology', '2023-03-10'),
(24,'Head and Neck Surgery', '2023-04-05');


select * from Doctor


CREATE TABLE PatientDiseaseHistory (
    Patient_Record_Number INT IDENTITY(1000,1) PRIMARY KEY,
    Patient_ID INT,
    Disease_ID INT,
    Admission_Reason VARCHAR(255),
    Admission_Date DATE,
    Primary_Doctor_Name VARCHAR(255),
    Discharge_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Disease_ID) REFERENCES Disease(Disease_ID)
);

INSERT INTO PatientDiseaseHistory (Patient_ID, Disease_ID, Admission_Reason, Admission_Date, Primary_Doctor_Name, Discharge_Date)
VALUES
  (100, 11, 'Ear Infection', '2023-01-01', 'John Doe', '2023-01-10'),
  (101, 12, 'Sinusitis', '2023-02-05', 'Jane Smith', '2023-02-15'),
  (102, 13, 'Tonsillitis', '2023-03-10', 'David Johnson', '2023-03-20'),
  (103, 14, 'Hearing Loss', '2023-04-15', 'Emily Wilson', '2023-04-25'),
  (104, 15, 'Nasal Allergy', '2023-05-20', 'John Doe', '2023-05-30'),
  (105, 16, 'Laryngitis', '2023-06-25', 'Jane Smith', '2023-07-05'),
  (106, 17, 'Vertigo', '2023-07-30', 'David Johnson', '2023-08-10'),
  (107, 18, 'Throat Cancer', '2023-09-05', 'Emily Wilson', '2023-09-15'),
  (108, 19, 'Ear Wax Blockage', '2023-10-10', 'John Doe', '2023-10-20'),
  (109, 20, 'Nasal Polyps', '2023-11-15', 'Jane Smith', '2023-11-25');

  select * from PatientDiseaseHistory
  select * from  Patient

  -- Create Dispensary Table
CREATE TABLE Dispensary (
    Item_ID INT IDENTITY(2000,1) PRIMARY KEY,
    Last_Stock_Up_Date DATE,
    Quantity INT,
    Department_ID INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);

INSERT INTO Dispensary (Last_Stock_Up_Date, Quantity, Department_ID)
VALUES
  ('2023-01-01', 10, 1),
  ('2023-02-05', 5, 1),
  ('2023-03-10', 15, 1),
  ('2023-04-15', 20, 1),
  ('2023-05-20', 10, 1),
  ('2023-06-25', 5, 1),
  ('2023-07-30', 10, 1),
  ('2023-09-05', 5, 1),
  ('2023-10-10', 21, 1),
  ('2023-11-15', 22, 1);

	  select * from Dispensary;

  CREATE TABLE Item_Type (
    Item_type_number INT IDENTITY(30,1) PRIMARY KEY,
    Item_Name VARCHAR(255));

INSERT INTO Item_Type (Item_Name)
VALUES
  ('Bandages'),
  ('Painkillers'),
  ('Antibiotics'),
  ('Surgical Gloves'),
  ('Thermometers'),
  ('Gauze Pads'),
  ('Syringes'),
  ('Medical Tape'),
  ('Scissors'),
  ('Cotton Swabs');

    select * from Item_Type;

	CREATE TABLE Nurse (
    N_Employee_ID INT PRIMARY KEY,
    Nurse_Floor INT,
);

INSERT INTO Nurse (N_Employee_ID, Nurse_Floor)
VALUES
  (25, 1),
  (26, 2),
  (27, 3),
  (28, 4);
  
  select * from Nurse;

  CREATE TABLE Accountant (
   A_Employee_ID INT PRIMARY KEY,
   A_Status VARCHAR(255));

   INSERT INTO Accountant (A_Employee_ID, A_Status)
VALUES
  (29, 'Active'),
  (30, 'Inactive');

  select * from Accountant;

  -- Create Billing_Details Table
CREATE TABLE Billing_Details (
    Billing_ID INT IDENTITY(50,1) PRIMARY KEY,
    Patient_ID INT,
    A_Employee_ID INT,
    Transaction_Details VARCHAR(255),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (A_Employee_ID) REFERENCES Accountant(A_Employee_ID)
);	

INSERT INTO Billing_Details (Patient_ID, A_Employee_ID, Transaction_Details)
VALUES
  (100, 29, 'Consultation for Ear Infection'),
  (101, 29, 'Prescription for Sinusitis Medication'),
  (102, 29, 'Hospital Room Charge for Tonsillitis'),
  (103, 29, 'Lab Test Fee for Hearing Loss Evaluation'),
  (104, 29, 'Surgery Cost for Nasal Allergy Treatment'),
  (105, 29, 'Rental Fee for Laryngitis Equipment'),
  (106, 29, 'X-Ray Examination Fee for Vertigo Diagnosis'),
  (107, 29, 'Physical Therapy Charge for Throat Cancer Patient'),
  (108, 29, 'Emergency Room Fee for Ear Wax Blockage'),
  (109, 29, 'Ambulance Service Charge for Nasal Polyps Emergency');

  select * from Billing_Details;

  -- Create Appointment Table
CREATE TABLE Appointment (
    Appointment_ID INT IDENTITY(60,1) PRIMARY KEY,
    Patient_ID INT,
    D_Employee_ID INT,
    Start_Date_Time DATETIME,
    End_Date_Time DATETIME,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (D_Employee_ID) REFERENCES Doctor(D_Employee_ID)
);

INSERT INTO Appointment (Patient_ID, D_Employee_ID, Start_Date_Time, End_Date_Time)
VALUES
  (100, 21, '2023-01-01 10:00:00', '2023-01-01 11:00:00'),
  (101, 22, '2023-02-05 14:30:00', '2023-02-05 15:30:00'),
  (102, 23, '2023-03-10 09:45:00', '2023-03-10 10:45:00'),
  (103, 24, '2023-04-15 11:15:00', '2023-04-15 12:15:00'),
  (104, 21, '2023-05-20 13:00:00', '2023-05-20 14:00:00'),
  (105, 22, '2023-06-25 16:30:00', '2023-06-25 17:30:00'),
  (106, 23, '2023-07-30 08:00:00', '2023-07-30 09:00:00'),
  (107, 24, '2023-09-05 12:45:00', '2023-09-05 13:45:00'),
  (108, 21, '2023-10-10 15:15:00', '2023-10-10 16:15:00'),
  (109, 22, '2023-11-15 17:45:00', '2023-11-15 18:45:00');

  select * from Appointment;

  CREATE TABLE Payroll (
    Payroll_ID INT IDENTITY(70,1) PRIMARY KEY,
    Employee_ID INT,
    A_Employee_ID INT,
    Net_Salary DECIMAL(10, 2),
    Account_Number VARCHAR(20),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (A_Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Payroll (Employee_ID, A_Employee_ID, Net_Salary, Account_Number)
VALUES
  (21, 29, 5000.00, '123456789'),
  (22, 29, 6000.00, '234567890'),
  (23, 29, 5500.00, '345678901'),
  (24, 29, 7000.00, '456789012'),
  (25, 29, 6500.00, '567890123'),
  (26, 29, 7500.00, '678901234'),
  (27, 29, 8000.00, '789012345'),
  (28, 29, 7200.00, '890123456'),
  (29, 29, 6800.00, '901234567'),
  (30, 29, 8500.00, '012345678');

  select * from Payroll;

  -- Create EmployeeDispensaryUtilized Table
CREATE TABLE EmployeeDispensaryUtilized (
    Utilized_ID INT IDENTITY(4000,1) PRIMARY KEY,
    Employee_ID INT,
    Item_ID INT,
    Utilized_Date DATE,
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
    FOREIGN KEY (Item_ID) REFERENCES Dispensary(Item_ID)
);

INSERT INTO EmployeeDispensaryUtilized (Employee_ID, Item_ID, Utilized_Date)
VALUES
  (21, 2001, '2023-01-01'),
  (22, 2002, '2023-02-05'),
  (23, 2003, '2023-03-10'),
  (24, 2001, '2023-04-15'),
  (25, 2005, '2023-05-20'),
  (26, 2006, '2023-06-25'),
  (27, 2009, '2023-07-30'),
  (28, 2008, '2023-09-05'),
  (27, 2009, '2023-10-10'),
  (26, 2000, '2023-11-15');

  select * from EmployeeDispensaryUtilized;

  CREATE TABLE NurseWardAssignment (
    Assignment_ID INT IDENTITY(7000,1) PRIMARY KEY,
    N_Employee_ID INT,
    Room_ID INT,
    Assignment_Date DATE,
    FOREIGN KEY (N_Employee_ID) REFERENCES Nurse(N_Employee_ID),
    FOREIGN KEY (Room_ID) REFERENCES Ward(Room_ID)
);

INSERT INTO NurseWardAssignment (N_Employee_ID, Room_ID, Assignment_Date)
VALUES
  (25, 200, '2023-01-01'),
  (26, 201, '2023-02-05'),
  (27, 202, '2023-03-10'),
  (28, 203, '2023-04-15'),
  (25, 204, '2023-05-20'),
  (26, 205, '2023-06-25'),
  (27, 206, '2023-07-30'),
  (28, 207, '2023-09-05'),
  (27, 208, '2023-10-10'),
  (25, 209, '2023-11-15');

  select * from NurseWardAssignment;

  --Procedure 1: Retrieve Patient Information by Room ID
--Input Parameters: Room ID
--Output: Patient information for the specified Room ID

  CREATE PROCEDURE GetPatientsByRoomID
    @InputRoomID INT
AS
BEGIN
    SELECT P.Patient_ID, P.Patient_Name, P.Patient_Address_Encrypted, P.Patient_Phonenumber_Encrypted, W.Ward_Type
    FROM Patient AS P
    INNER JOIN Ward AS W ON P.Room_ID = W.Room_ID
    WHERE P.Room_ID = @InputRoomID;
END;

--Output
EXEC GetPatientsByRoomID @InputRoomID = 201;

drop procedure GetPatientsByRoomID


--Procedure 2: Calculate Total Salary Expense
--Output: Total salary expense for a specific department

CREATE PROCEDURE CalculateTotalSalaryExpense
    @InputDepartmentID INT,
    @OutputTotalSalary DECIMAL(10, 2) OUTPUT
AS
BEGIN
    SELECT @OutputTotalSalary = SUM(P.Net_Salary)
    FROM Payroll AS P
    INNER JOIN Employee AS E ON P.Employee_ID = E.Employee_ID
    WHERE E.Department_ID = @InputDepartmentID;

    IF @OutputTotalSalary IS NULL
        SET @OutputTotalSalary = 0;
END;

--Output
DECLARE @TotalSalary DECIMAL(10, 2);
EXEC CalculateTotalSalaryExpense @InputDepartmentID = 1, @OutputTotalSalary = @TotalSalary OUTPUT;
PRINT 'Total Salary Expense: ' + CONVERT(VARCHAR, @TotalSalary);


--Procedure 3: Get Doctor Appointments
--Input Parameters: Doctor Employee ID, Start Date, End Date
--Output: Appointments for the specified doctor within the date range

CREATE PROCEDURE GetDoctorAppointments
    @InputDoctorEmployeeID INT,
    @InputStartDate DATE,
    @InputEndDate DATE
AS
BEGIN
    SELECT A.Appointment_ID, A.Patient_ID, P.Patient_Name, A.Start_Date_Time, A.End_Date_Time
    FROM Appointment AS A
    INNER JOIN Patient AS P ON A.Patient_ID = P.Patient_ID
    WHERE A.D_Employee_ID = @InputDoctorEmployeeID
      AND A.Start_Date_Time BETWEEN @InputStartDate AND @InputEndDate;
END;

--Output
EXEC GetDoctorAppointments @InputDoctorEmployeeID = 21, @InputStartDate = '2023-01-01', @InputEndDate = '2023-12-31';


--Procedure 4 : GetAvailableBedsByWardType:
--This procedure returns the count of available beds for a specific ward type.

CREATE PROCEDURE GetAvailableBedsByWardType
    @WardType VARCHAR(255)
AS
BEGIN
    SELECT Ward_Type, COUNT(*) AS AvailableBeds
    FROM Ward
    WHERE Ward_Type = @WardType
    GROUP BY Ward_Type;
END;

--Output:
EXEC GetAvailableBedsByWardType 'General';


--View 1: PatientDetailsView
--This view provides information about patients along with their assigned rooms and diseases.

CREATE VIEW PatientDetailsView AS
SELECT
    P.Patient_ID,
    P.Patient_Name,
    P.Patient_Address_Encrypted,
    P.Patient_Phonenumber_Encrypted,
    W.Room_ID,
    W.Bed_Number,
    W.Ward_Type,
    W.Floor_Number,
    DH.Disease_Name
FROM
    Patient P
JOIN Ward W ON P.Room_ID = W.Room_ID
LEFT JOIN PatientDiseaseHistory PDH ON P.Patient_ID = PDH.Patient_ID
LEFT JOIN Disease DH ON PDH.Disease_ID = DH.Disease_ID;

drop view WardOccupancyView

--Output
SELECT * FROM PatientDetailsView;


--View 2: WardOccupancyView
--This view provides information about the occupancy status of each ward.

CREATE VIEW WardOccupancyView AS
SELECT
    W.Room_ID,
    W.Bed_Number,
    W.Ward_Type,
    W.Floor_Number,
    P.Patient_Name,
    P.Patient_Address_Encrypted,
    P.Patient_Phonenumber_Encrypted
FROM
    Ward W
LEFT JOIN Patient P ON W.Room_ID = P.Room_ID;

--Output
SELECT * FROM WardOccupancyView;


--View 3: NurseAssignmentView
--This view provides information about nurse assignments and their respective wards.

CREATE VIEW NurseAssignmentView AS
SELECT
    NW.Assignment_ID,
    N.Nurse_Floor,
    E.Employee_FirstName + ' ' + E.Employee_LastName AS Nurse_Name,
    W.Room_ID,
    W.Ward_Type,
    W.Floor_Number,
    NW.Assignment_Date
FROM
    NurseWardAssignment NW
JOIN Nurse N ON NW.N_Employee_ID = N.N_Employee_ID
JOIN Employee E ON NW.N_Employee_ID = E.Employee_ID
JOIN Ward W ON NW.Room_ID = W.Room_ID;

--Output
SELECT * FROM NurseAssignmentView;



-- Create a DML trigger for notifying when a patient is admitted or discharged
CREATE TRIGGER PatientAdmissionDischargeTrigger
ON PatientDiseaseHistory
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        -- Patient Admission Notification
        PRINT 'Patient Admitted. Notify ENT department.';
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        -- Patient Discharge Notification
        PRINT 'Patient Discharged. Perform discharge procedures.';
    END
END;


--Test Case
INSERT INTO PatientDiseaseHistory (Patient_ID, Disease_ID, Admission_Reason, Admission_Date, Primary_Doctor_Name)
VALUES (109, 11, 'Test Admission', '2023-12-01', 'Test Doctor');

SELECT * FROM PatientDiseaseHistory;



-- 1. Check constraint for ensuring valid Net_Salary values in Payroll table
ALTER TABLE Payroll
ADD CONSTRAINT CHK_ValidNetSalary CHECK (Net_Salary >= 0);

-- 2. Check constraint for ensuring positive Quantity in Dispensary table
ALTER TABLE Dispensary
ADD CONSTRAINT CHK_PositiveQuantity CHECK (Quantity > 0);

-- 3. Check constraint for ensuring valid Nurse_Floor values in Nurse table
ALTER TABLE Nurse
ADD CONSTRAINT CHK_ValidNurseFloor CHECK (Nurse_Floor > 0 AND Nurse_Floor < 6);



--the UDF-1 IsValidPhoneNumberFormat takes the Employee_PhoneNumber as a parameter and returns a bit (1 or 0) indicating whether the phone number is in a valid format. 
--The computed column IsValidPhoneFormat is added to the Employee table, and its value is calculated based on the UDF.
CREATE FUNCTION dbo.IsValidPhoneNumberFormat(@PhoneNumber VARCHAR(15))
RETURNS BIT
AS
BEGIN
    DECLARE @ValidFormat BIT = 0;

    IF @PhoneNumber LIKE '___-___-____'
        SET @ValidFormat = 1;

    RETURN @ValidFormat;
END;

-- Step 2: Add a computed column to the Employee table
ALTER TABLE Employee
ADD IsValidPhoneFormat AS dbo.IsValidPhoneNumberFormat(Employee_PhoneNumber);

-- Select data from the Employee table to see the computed column
SELECT Employee_ID, Department_ID, Employee_FirstName, Employee_LastName, Employee_PhoneNumber, IsValidPhoneFormat
FROM Employee;


--the UDF-2 CalculateHospitalStayDuration takes the Admission_Date and Discharge_Date as parameters and returns the duration of the hospital stay in days.
--The computed column HospitalStayDuration is added to the PatientDiseaseHistory table, and its value is calculated based on the UDF.
CREATE FUNCTION dbo.CalculateHospitalStayDuration(@AdmissionDate DATE, @DischargeDate DATE)
RETURNS INT
AS
BEGIN
    DECLARE @StayDuration INT;

    SET @StayDuration = DATEDIFF(DAY, @AdmissionDate, @DischargeDate);

    RETURN @StayDuration;
END;

-- Step 2: Add a computed column to the PatientDiseaseHistory table
ALTER TABLE PatientDiseaseHistory
ADD HospitalStayDuration AS dbo.CalculateHospitalStayDuration(Admission_Date, Discharge_Date);

-- Select data from the PatientDiseaseHistory table to see the computed column
SELECT Patient_Record_Number, Patient_ID, Disease_ID, Admission_Reason, Admission_Date, Primary_Doctor_Name, Discharge_Date, HospitalStayDuration
FROM PatientDiseaseHistory;

--Non-Clustered Index
CREATE NONCLUSTERED INDEX IX_Patient_Patient_ID ON Patient(Patient_ID);

CREATE NONCLUSTERED INDEX IX_Employee_Department_ID ON Employee(Department_ID);

CREATE NONCLUSTERED INDEX IX_PatientDiseaseHistory_Disease_ID ON PatientDiseaseHistory(Disease_ID);

CREATE NONCLUSTERED INDEX IX_Appointment_D_Employee_ID ON Appointment (D_Employee_ID);


--Column Data Encryption (encrypting and decrypting the Patient_Address column in the Patient table)

-- Create a symmetric key
CREATE SYMMETRIC KEY SymmetricKey_HMS
WITH ALGORITHM = AES_256
ENCRYPTION BY PASSWORD = 'HMS';


-- Alter the Patient table to encrypt columns
ALTER TABLE Patient
ADD Patient_Address_Encrypted VARBINARY(MAX) NULL;

ALTER TABLE Patient
ADD Patient_Phonenumber_Encrypted VARBINARY(MAX) NULL;

alter table patient
drop column Patient_Phonenumber_Encrypted

-- Update existing data with encrypted values
OPEN SYMMETRIC KEY SymmetricKey_HMS
DECRYPTION BY PASSWORD = 'HMS';

UPDATE Patient
SET Patient_Address_Encrypted = ENCRYPTBYKEY(KEY_GUID('SymmetricKey_HMS'), CONVERT(VARBINARY(MAX), Patient_Address));

UPDATE Patient
SET Patient_Phonenumber_Encrypted = ENCRYPTBYKEY(KEY_GUID('SymmetricKey_HMS'), CONVERT(VARBINARY(MAX), Patient_Phonenumber));

-- Drop the original unencrypted columns if you want
ALTER TABLE Patient
DROP COLUMN Patient_Address;

ALTER TABLE Patient
DROP COLUMN Patient_Phonenumber;

select * from patient

--Decryption
-- Open the symmetric key for decryption
OPEN SYMMETRIC KEY SymmetricKey_HMS
DECRYPTION BY PASSWORD = 'HMS';

-- Select and decrypt data
SELECT 
    Patient_ID,
    Patient_Name,
    CONVERT(VARCHAR(255), DECRYPTBYKEY(Patient_Address_Encrypted)) AS Patient_Address
FROM Patient;

SELECT 
    Patient_ID,
    Patient_Name,
    CONVERT(INTEGER, DECRYPTBYKEY(Patient_Phonenumber_Encrypted)) AS Patient_Phonenumber
FROM Patient;







