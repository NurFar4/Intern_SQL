DROP TABLE Department CASCADE CONSTRAINTS;
DROP TABLE Staff CASCADE CONSTRAINTS;
DROP TABLE Doctor CASCADE CONSTRAINTS;
DROP TABLE Nurse CASCADE CONSTRAINTS;
DROP TABLE Patient CASCADE CONSTRAINTS;
DROP TABLE Consultation CASCADE CONSTRAINTS;
DROP TABLE Facility CASCADE CONSTRAINTS;
DROP TABLE Service CASCADE CONSTRAINTS;
DROP TABLE Medicine CASCADE CONSTRAINTS;
DROP TABLE Report CASCADE CONSTRAINTS;
DROP TABLE Medicine_Distribution CASCADE CONSTRAINTS;
DROP TABLE Ward CASCADE CONSTRAINTS;
DROP TABLE Bed CASCADE CONSTRAINTS;
DROP TABLE Admission CASCADE CONSTRAINTS;
DROP TABLE Bill CASCADE CONSTRAINTS;
-- DROP TABLE Insurance CASCADE CONSTRAINTS;

create table Department(
    department_id char(5) not null,
    department_name varchar(20),
    department_description varchar2(50),
    constraint department_id_pk primary key(department_id)
);

create table Staff(
    staff_id char(5) not null,
    staff_fname varchar2(15),
    staff_lname varchar2(15),
    staff_ssn varchar2(14),
    staff_dob date,
    staff_gender varchar2(6),
    staff_phoneNo varchar2(12),
    staff_email varchar2(30),
    staff_hireDate date,
    staff_position varchar2(20),
    staff_addressLine varchar2(40),
    staff_city varchar2(20),
    staff_postcode number(5),
    staff_state varchar2(20),
    staff_country varchar2(15),
    staff_salary decimal(8,2),
    department_id char(5),
    constraint department_id_fk foreign key(department_id) references Department(department_id),
    constraint staff_id_pk primary key (staff_id),
    check(staff_gender in ('Male', 'Female'))
);

create table Doctor(
    doctor_specialty varchar2(20), 
    doctor_qualification varchar2(20),
    staff_id char(5) not null,
    constraint doctor_id_fk foreign key(staff_id) references Staff(staff_id)
);

create table Nurse(
    nursing_specialty varchar2(20),
    level_Of_Nursing varchar2(17),
    staff_id char(5) not null,
    constraint nurse_id_fk foreign key(staff_id) references Staff(staff_id)
);

create table Patient(
    patient_id char(5) not null,
    patient_fname varchar2(15),
    patient_lname varchar2(15),
    patient_ssn varchar2(14),
    patient_dob date,
    patient_gender varchar2(6),
    patient_phoneNo varchar2(12),
    patient_email varchar2(30),
    patient_addressLine varchar2(40),
    patient_city varchar2(20),
    patient_postcode number(5),
    patient_state varchar2(20),
    patient_country varchar2(15),
    staff_id char(5) not null,
    constraint staff_id_fk foreign key(staff_id) references Staff(staff_id),
    constraint patient_id_pk primary key (patient_id),
    check(patient_gender in ('Male', 'Female'))
);

create table Consultation(
    consultation_id char(5) not null,
    consultation_datetime timestamp,
    staff_id char(5) not null,
    patient_id char(5) not null,
    constraint staffs_id_fk foreign key(staff_id) references Staff(staff_id),
    constraint patient_id_fk foreign key(patient_id) references Patient(patient_id),
    constraint consultation_id_pk primary key (consultation_id)
);

create table Facility(
    facility_id char(5) not null,
    facility_name varchar2(20),
    facility_description varchar2(50),
    facility_quantity number(3),
    facility_floor number(2),
    constraint facility_id_pk primary key (facility_id)
);

create table Service(
    service_id char(6) not null,
    service_name varchar2(20),
    service_description varchar2(55),
    service_charge decimal(5,2),
    facility_id char(5) not null unique,
    constraint facility_id_fk foreign key(facility_id) references Facility(facility_id),
    constraint service_id_pk primary key (service_id)
);

create table Medicine(
    medicine_id char(5) not null,
    medicine_name varchar2(20),
    medicine_description varchar2(52),
    medicine_manufacturer varchar2(15),
    medicine_dosage varchar2(20),
    quantityInStock number(4),
    medicine_Unitprice decimal(5,2),
    constraint medicine_id_pk primary key (medicine_id)
);

create table Report(
    report_id char(5) not null,
    consultation_id char(5) not null unique,
    service_id char(6),
    medical_disease varchar2(25),
    constraint consultation_id_fk foreign key(consultation_id) references Consultation(consultation_id),
    constraint service_id_fk foreign key(service_id) references Service(service_id),
    constraint report_id_pk primary key (report_id)
);

create table Medicine_Distribution(
    medicine_id char(5) not null,
    report_id char(5) not null,
    patMed_quantity number(2),
    constraint medicine_id_fk foreign key(medicine_id) references Medicine(medicine_id),
    constraint report_id_fk foreign key(report_id) references Report(report_id),
    constraint mdID_mID_rID_pk primary key (medicine_id, report_id)
);

create table Ward(
    ward_id char(5) not null,
    ward_type varchar2(20),
    numOfBed_per_ward number(2),
    available_Bed_Num number(2),
    ward_Floor number(2),
    constraint ward_id_pk primary key (ward_id)
);

create table Bed(
    bed_Number number(3) not null,
    bed_Type varchar2(30),
    ward_id char(5) not null,
    constraint ward_id_fk foreign key(ward_id) references Ward(ward_id),
    constraint bed_Number_pk primary key (bed_Number)
);

create table Admission(
    admission_id char(6) not null,
    admission_datetime timestamp,
    discharge_datetime timestamp,
    admission_fee decimal(6,2),
    bed_Number number(3) not null unique,
    patient_id char(5) not null,
    constraint bed_Number_fk foreign key(bed_Number) references Bed(bed_Number),
    constraint patient1_id_fk foreign key(patient_id) references Patient(patient_id),
    constraint admission_id_pk primary key (admission_id)
);

create table Bill(
    bill_id char(5) not null,
    bill_date date,
    bill_TotalAmount decimal(8,2),
    insurance varchar2(35),
    report_id char(5) not null unique,
    admission_id char(6) not null unique,
    patient_id char(5) not null unique,
    constraint reports_id_fk foreign key(report_id) references Report(report_id),
    constraint admissions_fk foreign key(admission_id) references Admission(admission_id),
    constraint patient2_id_fk foreign key(patient_id) references Patient(patient_id),
    constraint bill_id_pk primary key (bill_id)
);

Insert into Department values('D1001','Nursing','Provide better patient care');
Insert into Department values('D1002','Pharmacy','Responsible for managing drugs');
Insert into Department values('D1003','Medical','Provide treatment based on the disease of patient');
Insert into Department values('D1004','Financial','In charge the overall finances of hospital');
Insert into Department values('D1005','Admission','Manage the stuff of hospital admission');

Insert into Staff values('S1001','Ying Qian','Kang','900224-08-3434',to_date('02/24/1990','MM/DD/YYYY'),'Female','0124567833','yqian@gmail.com',to_date('12/31/2020','MM/DD/YYYY'),'Nurse','26, Taman Baru', 'Parit Buntar', 34200, 'Perak', 'Malaysia', 4500.00, 'D1001');
Insert into Staff values('S1002','Steven','Cheong','850314-08-0988',to_date('03/14/1985','MM/DD/YYYY'),'Male','0116787412','stevenc@gmail.com',to_date('01/08/2019','MM/DD/YYYY'),'Pharmacist','27, Tanjung Bunga', 'Parit Buntar', 34200, 'Perak', 'Malaysia', 6200.00, 'D1002');
Insert into Staff values('S1003','Wen Lui','Law','890924-14-7114',to_date('09/24/1989','MM/DD/YYYY'),'Male','0164786231','wxuan@gmail.com',to_date('01/12/2018','MM/DD/YYYY'),'Doctor','27, Taman Bayu Perdana', 'Klang', 42000, 'Selangor', 'Malaysia', 24000.00, 'D1003');
Insert into Staff values('S1004','Pei Wen','Peng','901204-01-0313',to_date('12/04/1990','MM/DD/YYYY'),'Female','0175476345','pwen@gmail.com',to_date('01/24/2019','MM/DD/YYYY'),'Doctor','25, Jalan Setia Tropika 4/5', 'Johor Bahru', 81200, 'Johor', 'Malaysia', 26000.00, 'D1003');
Insert into Staff values('S1005','Wen Qi','Looi','880526-02-4114',to_date('05/26/1988','MM/DD/YYYY'),'Female','0127368932','wqi@gmail.com',to_date('01/24/2018','MM/DD/YYYY'),'Finance Staff','5, Taman Selasih', 'Kulim', 09000, 'Kedah', 'Malaysia', 3500.00, 'D1004');
Insert into Staff values('S1006','Daniel','Tan','870104-05-1122',to_date('01/04/1987','MM/DD/YYYY'),'Male','0187635468','dtan@gmail.com',to_date('01/28/2019','MM/DD/YYYY'),'Doctor','Jalan TS 2/2i, Taman Semarak', 'Nilai', 71800, 'Negeri Sembilan', 'Malaysia', 23000.00, 'D1003');
Insert into Staff values('S1007','Mun Yi','Lee','891016-14-0477',to_date('10/16/1989','MM/DD/YYYY'),'Female','0194539078','Munyi@gmail.com',to_date('01/29/2019','MM/DD/YYYY'),'Nurse','Jalan Puteri 1/4, Bandar Puteri', 'Puchong', 47100, 'Selangor', 'Malaysia', 3800.00, 'D1001');
Insert into Staff values('S1008','Ivan','Liew','920626-14-5673',to_date('06/26/1992','MM/DD/YYYY'),'Male','0139564832','Ivanliew@gmail.com',to_date('01/29/2018','MM/DD/YYYY'),'Nurse','No.5A Jalan 14/20 Seksyen 14', 'Petaling Jaya', 47400, 'Selangor', 'Malaysia', 3400.00, 'D1001');
Insert into Staff values('S1009','Joanne','Chuah','910726-14-4345',to_date('07/26/1991','MM/DD/YYYY'),'Female','0178675653','joannec@gmail.com',to_date('02/01/2017','MM/DD/YYYY'),'Nurse','12A Jalan Ss 21/62 Damansara Utama','Petaling Jaya', 47400, 'Selangor', 'Malaysia', 3400.00, 'D1001');
Insert into Staff values('S1010','Xin Yuan','Yong','901123-07-1143',to_date('11/23/1990','MM/DD/YYYY'),'Female','0164878955','xinyuan@gmail.com',to_date('02/02/2019','MM/DD/YYYY'),'Pharmacist','2690 Kampung Teluk', 'Butterworth', 13800, 'Penang', 'Malaysia', 5200.00, 'D1002');
Insert into Staff values('S1011','Ivy','Chin','930123-01-5872',to_date('01/23/1993','MM/DD/YYYY'),'Female','0147987493','ivychin@gmail.com',to_date('02/02/2019','MM/DD/YYYY'),'Nurse','Jalan Laksamana 2, Taman Ungku', 'Johor Bahru', 81300, 'Johor', 'Malaysia', 6400.00, 'D1001');
Insert into Staff values('S1012','Wei Hang','Yew','920526-01-6768',to_date('05/26/1992','MM/DD/YYYY'),'Male','0173465834','weihangy@gmail.com',to_date('02/10/2018','MM/DD/YYYY'),'Admission Staff','Jalan Dataran 3/2, Taman Kempas', 'Johor Bahru', 81300, 'Johor', 'Malaysia', 3250.00, 'D1005');
Insert into Staff values('S1013','Wein Yong','Muck','941208-14-6765',to_date('12/08/1994','MM/DD/YYYY'),'Female','0182326435','weinyong@gmail.com',to_date('02/10/2017','MM/DD/YYYY'),'Admission Staff','No.33, Jalan Duku Taman Gembire', 'Klang', 42000, 'Selangor', 'Malaysia', 3300.00, 'D1005');
Insert into Staff values('S1014','Josephine','Kwan','880412-14-7879',to_date('04/12/1988','MM/DD/YYYY'),'Female','0175476345','josephinek@gmail.com',to_date('02/12/2017','MM/DD/YYYY'),'Doctor','Jalan Wawasan 3/7, Bandar Puchong', 'Puchong', 47160, 'Selangor', 'Malaysia', 32000.00, 'D1003');
Insert into Staff values('S1015','Alex','Khoo','891028-07-0434',to_date('10/28/1989','MM/DD/YYYY'),'Male','0167897990','alexkhoo@gmail.com',to_date('02/15/2019','MM/DD/YYYY'),'Doctor','No.229, Jalan Bayan Lepas ', 'Bayan Lepas', 11900, 'Pulau Pinang', 'Malaysia', 42000.00, 'D1003');

Insert into Doctor values('Neurology','MD','S1003');
Insert into Doctor values('Respiratory Medicine','MD','S1004');
Insert into Doctor values('Nephrology','MD','S1006');
Insert into Doctor values('Ophthalmology','MRAD','S1014');
Insert into Doctor values('Cardiology','MRCP','S1015');

Insert into Nurse values('Emergency','RN','S1001');
Insert into Nurse values('Dermatology','RN','S1007');
Insert into Nurse values('Haematology','RN','S1008');
Insert into Nurse values('Neuroscience','RN','S1009');
Insert into Nurse values('Critical Care','MSN','S1011');

Insert into Patient values('P1001', 'Joshua', 'Leong', '790106-08-4564', to_date('01/06/1979','MM/DD/YYYY'), 'Male', '0169459875', 'joshual@gmail.com', '16, Taman Siput', 'Parit Buntar', 34200, 'Perak', 'Malaysia', 'S1015');
Insert into Patient values('P1002', 'Emily', 'Teoh', '900423-05-8790', to_date('04/23/1990','MM/DD/YYYY'), 'Female', '0117678990', 'emilyteoh@gmail.com', '19-1, Taman Mawar', 'Bukit Kikir', 72200, 'Negeri Sembilan', 'Malaysia', 'S1004');
Insert into Patient values('P1003', 'Ashley', 'Den', '760626-14-6869', to_date('06/26/1976','MM/DD/YYYY'), 'Female', '0185765765', 'ashleyden@gmail.com', '90, Jalan Permai', 'Gelugor', 11700, 'Pulau Pinang', 'Malaysia', 'S1014');
Insert into Patient values('P1004', 'David', 'Ooi', '861027-08-7892', to_date('10/27/1986','MM/DD/YYYY'), 'Male', '0196876784', 'davidooi@gmail.com', '74, Jalan Kangsar', 'Kuala Kangsar', 30300, 'Perak', 'Malaysia', 'S1003');
Insert into Patient values('P1005', 'Aaron', 'Liew', '950607-08-3423', to_date('06/07/1995','MM/DD/YYYY'), 'Male', '0116767832', 'aaronliew@gmail.com', '20-26, Jalan Ali Pitchay', 'Ipoh', 30250, 'Perak', 'Malaysia', 'S1006');

Insert into Consultation values('C1001', to_timestamp('02/19/2021 10:40:00', 'MM/DD/YYYY HH24:MI:SS'), 'S1015', 'P1001');
Insert into Consultation values('C1002', to_timestamp('02/22/2021 13:30:00', 'MM/DD/YYYY HH24:MI:SS'), 'S1004', 'P1002');
Insert into Consultation values('C1003', to_timestamp('02/23/2021 11:15:00', 'MM/DD/YYYY HH24:MI:SS'), 'S1014', 'P1003');
Insert into Consultation values('C1004', to_timestamp('02/26/2021 14:30:00', 'MM/DD/YYYY HH24:MI:SS'), 'S1003', 'P1004');
Insert into Consultation values('C1005', to_timestamp('03/01/2021 15:45:00', 'MM/DD/YYYY HH24:MI:SS'), 'S1006', 'P1005');

Insert into Facility values('F1001', 'CT Scanner', 'To make CT scan', 15, 1);
Insert into Facility values('F1002', 'ECG Machine', 'To record any electrical activity within the heart', 15, 2);
Insert into Facility values('F1003', 'Opthalmoscope', 'To examine the lens for signs of a cataract', 20, 3);
Insert into Facility values('F1004', 'Incentive Spirometer', 'To recover our lung after lung surgery', 30, 4);
Insert into Facility values('F1005', 'X-ray Machine', 'To make x-ray scan', 15, 1);

Insert into Service values('SE1001', 'CT Scan', 'To see inside the body more details.', 900.00, 'F1001');
Insert into Service values('SE1002', 'ECG Service', 'A procedure to probe for any abnormalities of heart.', 400.00, 'F1002');
Insert into Service values('SE1003', 'Ophthalmic Service', 'To provide an eye health-care service.', 250.00, 'F1003');
Insert into Service values('SE1004', 'Spirometry', 'To measure the air, breathe out in one forced breath.', 150.00, 'F1004');
Insert into Service values('SE1005', 'X-ray Scanning', 'To see inside the body.', 80.00, 'F1005');

Insert into Medicine values('M1001', 'Allopurinol', 'Is used for renal impairment', 'Zyloprim', '100mg per tablet', 300, 20.00);
Insert into Medicine values('M1002', 'Inbrija', 'Is used for Parkinson’s disease', 'Accorda', '42mg per capsule', 200, 92.50);
Insert into Medicine values('M1003', 'Isoniazid', 'Is used for tuberculosis', 'Lexicare', '300mg per tablet', 250, 35.56);
Insert into Medicine values('M1004', 'Aspirin', 'Is used for heart attack', 'Wellona Pharma', '75mg per tablet', 250, 45.00);
Insert into Medicine values('M1005', 'Tobradex Eye Drops', 'To prevent eye inflammation after cataract surgery', 'Alcon', '5ml', 300, 22.00);

Insert into Report values('R1001', 'C1001', 'SE1002', 'Heart Attack');
Insert into Report values('R1002', 'C1002', 'SE1004', 'Tuberculosis');
Insert into Report values('R1003', 'C1003', 'SE1003', 'Cataract');
Insert into Report values('R1004', 'C1004', 'SE1001', 'Parkinson disease');
Insert into Report values('R1005', 'C1005', 'SE1001', 'Kidney Stones');

Insert into Medicine_Distribution values('M1001', 'R1005', 3);
Insert into Medicine_Distribution values('M1002', 'R1004', 2);
Insert into Medicine_Distribution values('M1003', 'R1002', 2);
Insert into Medicine_Distribution values('M1004', 'R1001', 5);
Insert into Medicine_Distribution values('M1005', 'R1003', 3);

Insert into Ward values('W1001', 'General Ward', 6, 2, 1);
Insert into Ward values('W1002', 'Semi-special Ward', 4, 3, 2);
Insert into Ward values('W1003', 'Special Ward', 1, 1, 3);
Insert into Ward values('W1004', 'Special Ward', 1, 1, 3);
Insert into Ward values('W1005', 'ICU Ward', 1, 0, 4);

Insert into Bed values(101, 'General Ward Bed', 'W1001');
Insert into Bed values(102, 'Semi-Automated Electric Bed', 'W1002');
Insert into Bed values(103, 'Semi-Automated Electric Bed', 'W1003');
Insert into Bed values(104, 'Cardiac Bed', 'W1004');
Insert into Bed values(105, 'ICU Bed', 'W1005');

Insert into Admission values('AD1001', to_timestamp('02/18/2021 10:45:15', 'MM/DD/YYYY HH24:MI:SS'), to_timestamp('03/02/2021 12:40:45', 'MM/DD/YYYY HH24:MI:SS'), 780.00, 104, 'P1001');
Insert into Admission values('AD1002', to_timestamp('02/21/2021 13:40:18', 'MM/DD/YYYY HH24:MI:SS'), to_timestamp('03/04/2021 14:35:30', 'MM/DD/YYYY HH24:MI:SS'), 480.00, 101, 'P1002');
Insert into Admission values('AD1003', to_timestamp('02/22/2021 15:25:10', 'MM/DD/YYYY HH24:MI:SS'), to_timestamp('03/01/2021 13:25:40', 'MM/DD/YYYY HH24:MI:SS'), 400.00, 102, 'P1003');
Insert into Admission values('AD1004', to_timestamp('02/25/2021 11:30:35', 'MM/DD/YYYY HH24:MI:SS'), to_timestamp('03/06/2021 14:30:25', 'MM/DD/YYYY HH24:MI:SS'), 2000.00, 105, 'P1004');
Insert into Admission values('AD1005', to_timestamp('02/28/2021 14:48:30', 'MM/DD/YYYY HH24:MI:SS'), to_timestamp('03/09/2021 15:00:00', 'MM/DD/YYYY HH24:MI:SS'), 500.00, 103, 'P1005');

Insert into Bill values('B1001', to_date('03/02/2021', 'MM/DD/YYYY'), 1315.00, 'AXA Medical Insurance', 'R1001', 'AD1001', 'P1001');
Insert into Bill values('B1002', to_date('03/04/2021', 'MM/DD/YYYY'), 701.12, 'Great Eastern Health Insurance', 'R1002', 'AD1002', 'P1002');
Insert into Bill values('B1003', to_date('03/01/2021', 'MM/DD/YYYY'), 694.00, 'Great Eastern Health Insurance', 'R1003', 'AD1003', 'P1003');
Insert into Bill values('B1004', to_date('03/06/2021', 'MM/DD/YYYY'), 3362.50, 'Null', 'R1004', 'AD1004', 'P1004');
Insert into Bill values('B1005', to_date('03/09/2021', 'MM/DD/YYYY'), 1460.00, 'Null', 'R1005', 'AD1005', 'P1005');

-- Insert into Insurance values('B1001', 'AXA Medical Insurance', '0321708282');
-- Insert into Insurance values('B1002', 'Great Eastern Health Insurance', '1300130088');
-- Insert into Insurance values('B1003', 'Great Eastern Health Insurance', '1300130088');
-- Insert into Insurance values('B1004', 'Allianz Medical Insurance', '0376283600');
-- Insert into Insurance values('B1005', 'AXA Medical Insurance', '0321708282');