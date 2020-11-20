CREATE DATABASE VehicleInsurance;
USE VehicleInsurance;

CREATE TABLE T11_INCIDENT
(
T11_Incident_Id VARCHAR(20) NOT NULL ,
T11_Incident_Type VARCHAR(30) NULL ,
T11_Incident_Date DATE NOT NULL ,
T11_Description VARCHAR(100) NULL ,
CONSTRAINT XPKINCIDENT_17 PRIMARY KEY (T11_Incident_Id)
);

CREATE UNIQUE INDEX XPKINCIDENT_17 ON T11_INCIDENT
(T11_Incident_Id ASC);

CREATE TABLE T11_CUSTOMER
(
T11_Cust_Id VARCHAR(20) NOT NULL ,
T11_Cust_FName VARCHAR(10) NOT NULL ,
T11_Cust_LName VARCHAR(10) NOT NULL ,
T11_Cust_DOB DATE NOT NULL ,
T11_Cust_Gender CHAR(2) NOT NULL ,
T11_Cust_Address VARCHAR(20) NOT NULL ,
T11_Cust_MOB_Number INTEGER NOT NULL ,
T11_Cust_Email VARCHAR(20) NULL ,
T11_Cust_Passport_Number VARCHAR(20) NULL ,
T11_Cust_Marital_Status CHAR(8) NULL ,
T11_Cust_PPS_Number INTEGER NULL ,
CONSTRAINT XPKCUSTOMER_1 PRIMARY KEY (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCUSTOMER_1 ON T11_CUSTOMER
(T11_Cust_Id ASC);

CREATE TABLE T11_INCIDENT_REPORT
( 
T11_Incident_Report_Id VARCHAR(20) NOT NULL ,
T11_Incident_Type CHAR(10) NULL , 
T11_Incident_Inspector VARCHAR(20) NULL , 
T11_Incident_Cost INTEGER NULL , 
T11_Incident_Report_Description VARCHAR(100) NULL , 
T11_Incident_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id VARCHAR(20) NOT NULL , 
CONSTRAINT XPKINCIDENT_REPORT_18 PRIMARY KEY (T11_Incident_Report_Id,T11_Incident_Id,T11_Cust_Id),
CONSTRAINT R_83 FOREIGN KEY (T11_Incident_Id) REFERENCES T11_INCIDENT (T11_Incident_Id),
CONSTRAINT R_86 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);
CREATE UNIQUE INDEX XPKINCIDENT_REPORT_18 ON T11_INCIDENT_REPORT (T11_Incident_Report_Id ASC,T11_Incident_Id ASC,T11_Cust_Id ASC);



CREATE TABLE T11_INSURANCE_COMPANY
(
T11_Company_Name	VARCHAR(20) NOT NULL ,
T11_Company_Address	VARCHAR(20) NULL ,
T11_Company_Contact_Number INTEGER NULL ,
T11_Company_Fax	INTEGER NULL ,
T11_Company_Email	VARCHAR(20) NULL ,
T11_Company_Website	VARCHAR(20) NULL ,
T11_Company_Location	VARCHAR(20) NULL ,
T11_Company_Department_Name VARCHAR(20) NULL , 
T11_Company_Office_Name VARCHAR(20) NULL ,
CONSTRAINT XPKINSURANCE_COMPANY_15 PRIMARY KEY
(T11_Company_Name)
);


CREATE UNIQUE INDEX XPKINSURANCE_COMPANY_15 ON T11_INSURANCE_COMPANY
(T11_Company_Name ASC);

CREATE TABLE T11_DEPARTMENT (
T11_Department_Name	VARCHAR(20) NOT NULL , 
T11_Department_ID CHAR(18) NOT NULL , 
T11_Department_Staff CHAR(18) NULL , 
T11_Department_Offices CHAR(18) NULL , 
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKDEPARTMENT PRIMARY KEY(T11_Department_Name,T11_Company_Name),
CONSTRAINT R_56 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKDEPARTMENT ON T11_DEPARTMENT
(T11_Department_Name ASC,T11_Company_Name ASC);

CREATE TABLE T11_VEHICLE_SERVICE (
T11_Department_Name	VARCHAR(20) NOT NULL , 
T11_Vehicle_Service_Company_Name VARCHAR(20) NOT NULL , 
T11_Vehicle_Service_Address VARCHAR(20) NULL , 
T11_Vehicle_Service_Contact VARCHAR(20) NULL ,
T11_Vehicle_Service_Incharge VARCHAR(20) NULL , 
T11_Vehicle_Service_Type VARCHAR(20) NULL ,
-- Department_Id VARCHAR(20) NOT NULL , 
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKVEHICLE_SERVICE PRIMARY KEY (T11_Vehicle_Service_Company_Name,T11_Department_Name),
CONSTRAINT R_50 FOREIGN KEY (T11_Department_Name, T11_Company_Name) REFERENCES T11_DEPARTMENT (T11_Department_Name, T11_Company_Name)
);

CREATE UNIQUE INDEX XPKVEHICLE_SERVICE ON T11_VEHICLE_SERVICE
(T11_Vehicle_Service_Company_Name ASC,T11_Department_Name ASC);

CREATE TABLE T11_VEHICLE (
T11_Vehicle_Id VARCHAR(20) NOT NULL , 
T11_Policy_Id VARCHAR(20) NULL ,
T11_Dependent_NOK_Id VARCHAR(20) NULL , 
T11_Vehicle_Registration_Number VARCHAR(20) NOT NULL , 
T11_Vehicle_Value INTEGER NULL ,
T11_Vehicle_Type VARCHAR(20) NOT NULL , 
T11_Vehicle_Size INTEGER NULL , 
T11_Vehicle_Number_Of_Seat INTEGER NULL , 
T11_Vehicle_Manufacturer VARCHAR(20) NULL , 
T11_Vehicle_Engine_Number INTEGER NULL , 
T11_Vehicle_Chasis_Number INTEGER NULL , 
T11_Vehicle_Number VARCHAR(20) NULL , 
T11_Vehicle_Model_Number VARCHAR(20) NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKVEHICLE_6 PRIMARY KEY (T11_Vehicle_Id,T11_Cust_Id),
CONSTRAINT R_92 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKVEHICLE_6 ON T11_VEHICLE(T11_Vehicle_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_PREMIUM_PAYMENT (
T11_Premium_Payment_Id VARCHAR(20) NOT NULL , 
T11_Policy_Number VARCHAR(20) NOT NULL , 
T11_Premium_Payment_Amount INTEGER NOT NULL , 
T11_Premium_Payment_Schedule DATE NOT NULL , 
T11_Receipt_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKPREMIUM_PAYMENT_5 PRIMARY KEY(T11_Premium_Payment_Id,T11_Cust_Id),
CONSTRAINT R_85 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);
CREATE UNIQUE INDEX XPKPREMIUM_PAYMENT_5 ON T11_PREMIUM_PAYMENT
(T11_Premium_Payment_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_RECEIPT (
T11_Receipt_Id VARCHAR(20) NOT NULL , 
T11_Time_rec DATE NOT NULL ,
T11_Cost INTEGER NOT NULL ,
T11_Premium_Payment_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT  XPKRECEIPT_21 PRIMARY KEY(T11_Receipt_Id,T11_Premium_Payment_Id,T11_Cust_Id),
CONSTRAINT R_84 FOREIGN KEY (T11_Premium_Payment_Id, T11_Cust_Id) REFERENCES T11_PREMIUM_PAYMENT(T11_Premium_Payment_Id, T11_Cust_Id)
);
CREATE UNIQUE INDEX XPKRECEIPT_21 ON T11_RECEIPT
(T11_Receipt_Id ASC,T11_Premium_Payment_Id ASC,T11_Cust_Id ASC);


CREATE TABLE T11_APPLICATION (
T11_Application_Id VARCHAR(20) NOT NULL , 
T11_Vehicle_Id	VARCHAR(20) NOT NULL ,
T11_Application_Status CHAR(8) NOT NULL , 
T11_Coverage VARCHAR(50) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKAPPLICATION_2 PRIMARY KEY (T11_Application_Id,T11_Cust_Id), 
CONSTRAINT R_93 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER(T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKAPPLICATION_2 ON T11_APPLICATION
(T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_INSURANCE_POLICY (
T11_Agreement_id VARCHAR(20) NOT NULL , 
T11_Department_Name VARCHAR(20) NULL , 
T11_Policy_Number VARCHAR(20) NULL , 
T11_Start_Date	DATE NULL ,
T11_Expiry_Date DATE NULL , 
T11_Term_Condition_Description VARCHAR(100) NULL , 
T11_Application_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKINSURANCE_POLICY_4 PRIMARY KEY(T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_95 FOREIGN KEY (T11_Application_Id, T11_Cust_Id) REFERENCES T11_APPLICATION (T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4 ON T11_INSURANCE_POLICY
(T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);


CREATE TABLE T11_POLICY_RENEWABLE(
T11_Policy_Renewable_Id VARCHAR(20) NOT NULL ,
T11_Date_Of_Renewal	DATE NOT NULL ,
T11_Type_Of_Renewal	CHAR(15) NOT NULL ,
T11_Agreement_id VARCHAR(20) NOT NULL ,
T11_Application_Id VARCHAR(20) NOT NULL ,
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKPOLICY_RENEWABLE_16 PRIMARY KEY(T11_Policy_Renewable_Id,T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_101 FOREIGN KEY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKPOLICY_RENEWABLE_16 ON T11_POLICY_RENEWABLE
(T11_Policy_Renewable_Id ASC,T11_Agreement_id ASC,T11_Application_Id
ASC,T11_Cust_Id ASC);


CREATE TABLE T11_MEMBERSHIP
(
T11_Membership_Id VARCHAR(20) NOT NULL ,
T11_Membership_Type	CHAR(15) NOT NULL ,
T11_Organisation_Contact VARCHAR(20) NULL ,
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKMEMBERSHIP_12 PRIMARY KEY (T11_Membership_Id,T11_Cust_Id),
CONSTRAINT R_91 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKMEMBERSHIP_12 ON T11_MEMBERSHIP
(T11_Membership_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_QU0TE (
T11_Quote_Id VARCHAR(20) NOT NULL ,
T11_Issue_Date	DATE NOT NULL ,
T11_Valid_From_Date	DATE NOT NULL ,
T11_Valid_Till_Date	DATE NOT NULL ,
T11_Description	VARCHAR(100) NULL ,
T11_Product_Id	VARCHAR(20) NOT NULL ,
T11_Coverage_Level	VARCHAR(20) NOT NULL ,
T11_Application_Id	VARCHAR(20) NOT NULL ,
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKQU0TE_3 PRIMARY KEY (T11_Quote_Id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_94 FOREIGN KEY (T11_Application_Id, T11_Cust_Id) REFERENCES T11_APPLICATION (T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKQU0TE_3 ON T11_QU0TE
(T11_Quote_Id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_STAFF
(
T11_Staff_Id VARCHAR(20) NOT NULL ,
T11_Staff_Fname	VARCHAR(10) NULL ,
T11_Staff_LName	VARCHAR(10) NULL ,
T11_Staff_Adress VARCHAR(20) NULL ,
T11_Staff_Contact INTEGER NULL ,
T11_Staff_Gender CHAR(2) NULL ,
T11_Staff_Marital_Status CHAR(8) NULL ,
T11_Staff_Nationality CHAR(15) NULL ,
T11_Staff_Qualification VARCHAR(20) NULL ,
T11_Staff_Allowance	INTEGER NULL ,
T11_Staff_PPS_Number INTEGER NULL ,
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKSTAFF_9 PRIMARY KEY (T11_Staff_Id,T11_Company_Name),
CONSTRAINT R_105 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKSTAFF_9 ON T11_STAFF
(T11_Staff_Id ASC,T11_Company_Name ASC);

CREATE TABLE T11_NOK
(
T11_Nok_Id	VARCHAR(20) NOT NULL ,
T11_Nok_Name VARCHAR(20) NULL ,
T11_Nok_Address	VARCHAR(20) NULL ,
T11_Nok_Phone_Number INTEGER NULL ,
T11_Nok_Gender CHAR(2) NULL ,
T11_Nok_Marital_Status CHAR(8) NULL ,
T11_Agreement_id VARCHAR(20) NOT NULL ,
T11_Application_Id VARCHAR(20) NOT NULL ,
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKNOK_14 PRIMARY KEY (T11_Nok_Id,T11_Agreement_id,T11_Application_Id,T11_Cust_Id),
CONSTRAINT R_99 FOREIGN KEY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKNOK_14 ON T11_NOK
(T11_Nok_Id ASC,T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_PRODUCT
(
T11_Product_Price INTEGER NULL ,
T11_Product_Type CHAR(15) NULL ,
T11_Product_Number VARCHAR(20) NOT NULL ,
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKPRODUCT_20 PRIMARY KEY (T11_Product_Number,T11_Company_Name),
CONSTRAINT R_107 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKPRODUCT_20 ON T11_PRODUCT
(T11_Product_Number ASC,T11_Company_Name ASC);

CREATE TABLE T11_OFFICE
(
T11_Office_Name	VARCHAR(20) NOT NULL ,
T11_Office_Leader VARCHAR(20) NOT NULL ,
T11_Contact_Information VARCHAR(20) NOT NULL ,
T11_Address	VARCHAR(20) NOT NULL ,
T11_Admin_Cost INTEGER NULL ,
T11_Staff VARCHAR(50) NULL ,
T11_Department_Name VARCHAR(20) NOT NULL ,
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKOFFICE_11 PRIMARY KEY (T11_Office_Name,T11_Department_Name,T11_Company_Name),
CONSTRAINT R_104 FOREIGN KEY (T11_Department_Name, T11_Company_Name) REFERENCES T11_DEPARTMENT (T11_Department_Name, T11_Company_Name)
);

CREATE UNIQUE INDEX XPKOFFICE_11 ON T11_OFFICE
(T11_Office_Name ASC,T11_Department_Name ASC,T11_Company_Name ASC);

CREATE TABLE T11_COVERAGE
(
T11_Coverage_Id	VARCHAR(20) NOT NULL ,
T11_Coverage_Amount	INTEGER NOT NULL ,
T11_Coverage_Type	CHAR(10) NOT NULL ,
T11_Coverage_Level	CHAR(15) NOT NULL ,
T11_Product_Id	VARCHAR(20) NOT NULL ,
T11_Coverage_Description VARCHAR(100) NULL ,
T11_Covearge_Terms VARCHAR(50) NULL ,
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKCOVERAGE_19 PRIMARY KEY(T11_Coverage_Id,T11_Company_Name),
CONSTRAINT R_102 FOREIGN KEY (T11_Company_Name) REFERENCES T11_INSURANCE_COMPANY (T11_Company_Name)
);

CREATE UNIQUE INDEX XPKCOVERAGE_19 ON T11_COVERAGE
(T11_Coverage_Id ASC,T11_Company_Name ASC);



CREATE TABLE T11_INSURANCE_POLICY_COVERAGE
(
T11_Agreement_id VARCHAR(20) NOT NULL ,
T11_Application_Id VARCHAR(20) NOT NULL ,
T11_Cust_Id	VARCHAR(20) NOT NULL ,
T11_Coverage_Id	VARCHAR(20) NOT NULL ,
T11_Company_Name VARCHAR(20) NOT NULL ,
CONSTRAINT XPKINSURANCE_POLICY_4_COVERAGE PRIMARY KEY (T11_Agreement_id,T11_Application_Id,T11_Cust_Id,T11_Coverage_Id,T11_Company_Name),
CONSTRAINT R_97 FOREIGN KEY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id) REFERENCES T11_INSURANCE_POLICY (T11_Agreement_id, T11_Application_Id, T11_Cust_Id),
CONSTRAINT R_98 FOREIGN KEY (T11_Coverage_Id, T11_Company_Name) REFERENCES T11_COVERAGE (T11_Coverage_Id, T11_Company_Name)
);

CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4_COVERAGE ON T11_INSURANCE_POLICY_COVERAGE
(T11_Agreement_id ASC,T11_Application_Id ASC,T11_Cust_Id ASC,T11_Coverage_Id ASC,T11_Company_Name ASC);

CREATE TABLE T11_CLAIM
(
T11_Claim_Id VARCHAR(20) NOT NULL ,
T11_Agreement_Id VARCHAR(20) NOT NULL ,
T11_Claim_Amount INTEGER NOT NULL ,
T11_Incident_Id	VARCHAR(20) NOT NULL ,
T11_Damage_Type	VARCHAR(20) NOT NULL ,
T11_Date_Of_Claim DATE NOT NULL , 
T11_Claim_Status CHAR(10) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKCLAIM_7 PRIMARY KEY (T11_Claim_Id,T11_Cust_Id), 
CONSTRAINT R_88 FOREIGN KEY (T11_Cust_Id) REFERENCES T11_CUSTOMER (T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCLAIM_7 ON T11_CLAIM
(T11_Claim_Id ASC,T11_Cust_Id ASC);

CREATE TABLE T11_CLAIM_SETTLEMENT (
T11_Claim_Settlement_Id VARCHAR(20) NOT NULL , 
T11_Vehicle_Id VARCHAR(20) NOT NULL ,
T11_Date_Settled DATE NOT NULL , 
T11_Amount_Paid INTEGER NOT NULL , 
T11_Coverage_Id VARCHAR(20) NOT NULL , 
T11_Claim_Id VARCHAR(20) NOT NULL , 
T11_Cust_Id	VARCHAR(20) NOT NULL ,
CONSTRAINT XPKCLAIM_SETTLEMENT_8 PRIMARY KEY (T11_Claim_Settlement_Id,T11_Claim_Id,T11_Cust_Id),
CONSTRAINT R_90 FOREIGN KEY (T11_Claim_Id, T11_Cust_Id) REFERENCES T11_CLAIM (T11_Claim_Id, T11_Cust_Id)
);

CREATE UNIQUE INDEX XPKCLAIM_SETTLEMENT_8 ON T11_CLAIM_SETTLEMENT
(T11_Claim_Settlement_Id ASC,T11_Claim_Id ASC,T11_Cust_Id ASC);