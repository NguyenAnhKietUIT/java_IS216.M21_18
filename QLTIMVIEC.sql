﻿CREATE DATABASE QLTIMVIEC
GO

USE QLTIMVIEC
GO

--Tao bang POSITION va khoa chinh
create table POSITION (
	positionNo TINYINT IDENTITY(1,1) NOT NULL,
  	positionName NVARCHAR(30) NOT NULL UNIQUE,
  	numberOfPersonnel TINYINT
)
ALTER TABLE POSITION ADD CONSTRAINT PK_POSITION PRIMARY KEY (positionNo)
GO

--Tao bang REQUIREMENT va khoa chinh
create table REQUIREMENT (
	requirementNo TINYINT IDENTITY(1,1) NOT NULL,
  	requirementName NVARCHAR(50) NOT NULL UNIQUE,
  	yearsOfExperience TINYINT
)
ALTER TABLE REQUIREMENT ADD CONSTRAINT PK_REQUIREMENT PRIMARY KEY (requirementNo)
GO

--Tao bang REQUIRE va khoa chinh
create table REQUIRE (
	positionNo TINYINT NOT NULL,
  	requirementNo TINYINT NOT NULL
)
ALTER TABLE REQUIRE ADD CONSTRAINT PK_REQUIRE PRIMARY KEY (positionNo, requirementNo)
GO

--Tao bang SKILL va khoa chinh
create table SKILL (
	skillNo TINYINT IDENTITY(1,1) NOT NULL,
  	skillName NVARCHAR(50) NOT NULL UNIQUE,
  	applicantNo TINYINT,
  	level TINYINT,
  	yearsOfExperience TINYINT,
  	
  	CHECK (level BETWEEN 1 AND 5)
)
ALTER TABLE SKILL ADD CONSTRAINT PK_SKILL PRIMARY KEY (skillNo)
GO

--Tao bang RECRUIT va khoa chinh
create table RECRUIT (
	departmentNo TINYINT NOT NULL,
  	positionNo TINYINT NOT NULL
)
ALTER TABLE RECRUIT ADD CONSTRAINT PK_RECRUIT PRIMARY KEY (departmentNo, positionNo)
GO

--Tao bang APPLICANT va khoa chinh
CREATE TABLE APPLICANT
(
	applicantNo TINYINT IDENTITY(1,1) NOT NULL,
	applicantName NVARCHAR(30),
	citizenID VARCHAR(12) UNIQUE,
	dateOfBirth SMALLDATETIME,
	gender TINYINT,
	address NVARCHAR(60),
	phoneNumber VARCHAR(10),
	gmail VARCHAR(30) UNIQUE
)
ALTER TABLE APPLICANT ADD CONSTRAINT PK_APPLICANT PRIMARY KEY (applicantNo)
GO

--Tao bang REGISTER va khoa chinh
CREATE TABLE REGISTER
(
	interviewScheduleNo TINYINT NOT NULL,
	applicantNo TINYINT NOT NULL,
	status TINYINT
)
ALTER TABLE REGISTER ADD CONSTRAINT PK_REGISTER PRIMARY KEY (interviewScheduleNo, applicantNo)
GO

--Tao bang EVALUATE_APL va khoa chinh
CREATE TABLE EVALUATE_APL
(
	companyNo TINYINT NOT NULL,
	applicantNo TINYINT NOT NULL,
	point TINYINT,
	comment NVARCHAR(2000)
)
ALTER TABLE EVALUATE_APL ADD CONSTRAINT PK_EVALUATE_APL PRIMARY KEY (companyNo, applicantNo)
GO

--Tao bang EVALUATE_CO va khoa chinh
CREATE TABLE EVALUATE_CO
(
	companyNo TINYINT NOT NULL,
	applicantNo TINYINT NOT NULL,
	point TINYINT,
	comment NVARCHAR(2000)
)
ALTER TABLE EVALUATE_CO ADD CONSTRAINT PK_EVALUATE_CO PRIMARY KEY (companyNo, applicantNo)
GO

--Tao bang BELONG va khoa chinh
CREATE TABLE BELONG
(
	departmentNo TINYINT NOT NULL,
	companyNo TINYINT NOT NULL
)
ALTER TABLE BELONG ADD CONSTRAINT PK_BELONG PRIMARY KEY (departmentNo, companyNo)
GO

--Tao bang COMPANY va khoa chinh
CREATE TABLE COMPANY
(
	companyNo TINYINT IDENTITY(1,1) NOT NULL,
	companyName NVARCHAR(50) NOT NULL UNIQUE,
	address NVARCHAR(60),
	hotline CHAR(10),
	gmail VARCHAR(30),
	startDate smalldatetime 
)
ALTER TABLE COMPANY ADD CONSTRAINT PK_COMPANY PRIMARY KEY (companyNo)
GO
 
--Tao bang DEPARTMENT va khoa chinh
CREATE TABLE DEPARTMENT
(
	departmentNo TINYINT IDENTITY(1,1) NOT NULL,
	departmentName NVARCHAR(30) NOT NULL UNIQUE,
	describe NVARCHAR(2000)
)
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (departmentNo)
GO

--Tao bang INTERVIEWER va khoa chinh
CREATE TABLE INTERVIEWER
(
	interviewerNo TINYINT IDENTITY(1,1) NOT NULL,
	interviewerName NVARCHAR(30) NOT NULL,
	phoneNumber CHAR(10),
	gmail VARCHAR(30),
	companyNo TINYINT
)
ALTER TABLE INTERVIEWER ADD CONSTRAINT PK_INTERVIEWER PRIMARY KEY (interviewerNo)
GO

--Tao bang INTERVIEW_SCHEDULE va khoa chinh
CREATE TABLE INTERVIEW_SCHEDULE
(
	interviewScheduleNo TINYINT IDENTITY(1,1) NOT NULL,
	startTime smalldatetime, 
	endTime smalldatetime,
	location  NVARCHAR(60),
	status TINYINT,
	slot TINYINT,
	interviewerNo TINYINT
)
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT PK_INTERVIEW_SCHEDULE PRIMARY KEY (interviewScheduleNo)
GO


--Nhap lieu
SET DATEFORMAT DMY
--1. Bang COMPANY
INSERT INTO COMPANY VALUES (N'SamSung', N'Quận 1', '2839157310','samsung@gmai.com.vn', '30/1/2007')
INSERT INTO COMPANY VALUES (N'Intel', N'Phú Nhuận', '8437363000','Intel@gmai.com.vn', '21/2/2006')
INSERT INTO COMPANY VALUES (N'Cocacola', N'Hải Phòng', '0500233891','Cocacola@gmai.com.vn', '14/6/1996')
INSERT INTO COMPANY VALUES (N'Petrolimex', N'Hà Nội', '1900363003','Petrolimex@gmai.com.vn', '22/6/2005')
INSERT INTO COMPANY VALUES (N'Viettel', N'Hà Nội', '18008098','Viettel@gmai.com.vn', '1/6/1989')

--2. Bang DEPARTMENT
INSERT INTO DEPARTMENT VALUES (N'Phòng nhân sự', NULL)
INSERT INTO DEPARTMENT VALUES (N'Phòng kế toán', NUll)
INSERT INTO DEPARTMENT VALUES (N'Quản lý dự án', NUll) 
INSERT INTO DEPARTMENT VALUES (N'Bảo vệ', NUll)
INSERT INTO DEPARTMENT VALUES (N'Kế toán thuế', NUll)

--3. Bang BELONG
INSERT INTO BELONG VALUES (1, 1)
INSERT INTO BELONG VALUES (2, 2)
INSERT INTO BELONG VALUES (3, 3)
INSERT INTO BELONG VALUES (4, 4)
INSERT INTO BELONG VALUES (5, 5)
GO

--4. Bang POSITION
INSERT INTO POSITION VALUES (N'Quản lý phòng nhân sự', 1)
INSERT INTO POSITION VALUES (N'Quản lý phòng kế toán', 1)
INSERT INTO POSITION VALUES (N'Trưởng ban bảo vệ', 1)
INSERT INTO POSITION VALUES (N'Editor', 3)
INSERT INTO POSITION VALUES (N'Nhân viên vệ sinh', 5)
GO

--5. Bang RECRUIT
INSERT INTO RECRUIT VALUES (1, 5)
INSERT INTO RECRUIT VALUES (2, 3)
INSERT INTO RECRUIT VALUES (4, 3)
INSERT INTO RECRUIT VALUES (2, 4)
INSERT INTO RECRUIT VALUES (5, 2)
GO

--6. Bang REQUIREMENT
INSERT INTO REQUIREMENT VALUES (N'Kế toán', 5)
INSERT INTO REQUIREMENT VALUES (N'Quản lý dự án', 7)
INSERT INTO REQUIREMENT VALUES (N'Ngoại ngữ', 4)
INSERT INTO REQUIREMENT VALUES (N'Tin học văn phòng', 3)
INSERT INTO REQUIREMENT VALUES (N'Lãnh đạo', 6)
GO

--7. Bang REQUIRE
INSERT INTO REQUIRE VALUES (1, 3)
INSERT INTO REQUIRE VALUES (2, 3)
INSERT INTO REQUIRE VALUES (2, 5)
INSERT INTO REQUIRE VALUES (1, 4)
INSERT INTO REQUIRE VALUES (3, 4)
GO

--8. Bang INTERVIEWER
INSERT INTO INTERVIEWER VALUES (N'Trần Văn A', '0378009008' , 'tranvana@gmai.com.vn', 1)
INSERT INTO INTERVIEWER VALUES (N'Trần Văn B', '0378989238', 'tranvanb@gmai.com.vn', 2)
INSERT INTO INTERVIEWER VALUES (N'Nguyễn Minh C', '0378011108', 'nguyenminhc@gmai.com.vn', 3)
INSERT INTO INTERVIEWER VALUES (N'Lưu Quốc A', '0378123097', 'luuquoca@gmai.com.vn', 4)
INSERT INTO INTERVIEWER VALUES (N'Trần Minh D', '0374568088', 'tranminhd@gmai.com.vn', 5)
GO

--9. Bang INTERVIEW_SCHEDULE
INSERT INTO INTERVIEW_SCHEDULE VALUES ('13/1/2021', ' 15/1/2021' , N'71 Đinh Tiên Hoàng' , 0 , 20, 1)
INSERT INTO INTERVIEW_SCHEDULE VALUES ('13/2/2021', ' 19/2/2021' , N'65/6 Hà Tôn Quyền' , 1 , 18, 2)
INSERT INTO INTERVIEW_SCHEDULE VALUES ('26/1/2021', ' 5/2/2021' , N'15 Nguyễn Tri Phương' , 0 , 50, 2)
INSERT INTO INTERVIEW_SCHEDULE VALUES ('13/1/2021', ' 19/1/2021' , N'72 Hồ Tùng Mậu' , 0 , 21, 4)
INSERT INTO INTERVIEW_SCHEDULE VALUES ('21/3/2021', ' 5/4/2021' , N'79/5/1 Nguyễn Thái Học' , 0 , 30, 5)
GO

--10. Bang APPLICANT
INSERT INTO APPLICANT VALUES (N'Nguyễn Hoài Linh', '079202009176', '23/4/2002', 1, N'68/23 Đồng Đen', '070786884','linhhoainguyen2002@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Anh Kiệt', '079202005713', '21/7/2002', 1, N'76/3 Nguyễn Trãi', '0787264822','nguyenanhkiet2002@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Thành Phát', '079202067492', '7/9/2001', 1, N'11/6/8 Trương CÔng Định', '0387518022','thanhphatnguyen2001@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Thị Thảo Hồng', '079202001436', '11/3/1998', 0, N'227 Nguyễn Thị Minh Khai', '0275784426','thaohongnt2001@gmail.com')
INSERT INTO APPLICANT VALUES (N'Vũ Thị Phương Linh', '079202008648', '16/6/2001', 0, N'61 Đống Đa', '0909666371','vtplinh2k1@gmail.com')
INSERT INTO APPLICANT VALUES (N'Trần Thị Mỹ Nhung', '080202009171', '25/9/1999', 0, N'89 Nguyễn Văn Cừ', '0163787333','nhungtranthimy@gmail.com')
INSERT INTO APPLICANT VALUES (N'Trần Quốc Trung', '077202009679', '11/11/2000', 1, N'22/6 Nguyễn Bá Tòng', '0193882563','trungquoctran@gmail.com')
GO

--11. Bang SKILL
INSERT INTO SKILL VALUES (N'Ngoại ngữ', 3, 4, 5)
INSERT INTO SKILL VALUES (N'Tin học văn phòng', 2, 3, 3)
INSERT INTO SKILL VALUES (N'Reporting', 4, 2, 1)
INSERT INTO SKILL VALUES (N'Quản lý dự án', 5, 5, 8)
INSERT INTO SKILL VALUES (N'Researching', 1, 1, 1)
GO

--12. Bang REGISTER
INSERT INTO REGISTER VALUES (1, 1, 0)
INSERT INTO REGISTER VALUES (1, 3, 1)
INSERT INTO REGISTER VALUES (1, 5, 0)
INSERT INTO REGISTER VALUES (2, 2, 0)
INSERT INTO REGISTER VALUES (2, 3, 0)
INSERT INTO REGISTER VALUES (3, 1, 0)
INSERT INTO REGISTER VALUES (3, 3, 1)
INSERT INTO REGISTER VALUES (3, 4, 0)
INSERT INTO REGISTER VALUES (3, 5, 1)
INSERT INTO REGISTER VALUES (4, 2, 0)
INSERT INTO REGISTER VALUES (4, 3, 0)
INSERT INTO REGISTER VALUES (5, 2, 0)
INSERT INTO REGISTER VALUES (5, 5, 0)
GO

--13. Bang EVALUATE_APL
INSERT INTO EVALUATE_APL VALUES (1, 1, 5, N'Ứng viên rất trung thực')
INSERT INTO EVALUATE_APL VALUES (1, 5, 5, N'Ứng viên đến đúng giờ')
INSERT INTO EVALUATE_APL VALUES (2, 2, 4, N'Ứng viên chưa có nhiều kinh nghiệm')
INSERT INTO EVALUATE_APL VALUES (2, 3, 4, N'Ứng viên hơi lúng túng')
INSERT INTO EVALUATE_APL VALUES (3, 1, 5, N'Ứng viên có thực lực')
INSERT INTO EVALUATE_APL VALUES (3, 4, 5, N'Kỹ năng chuyên môn cao')
INSERT INTO EVALUATE_APL VALUES (4, 2, 3, N'Không chuẩn bị chu đáo')
INSERT INTO EVALUATE_APL VALUES (4, 3, 5, N'Kỹ năng giao tiếp tốt')
INSERT INTO EVALUATE_APL VALUES (5, 2, 2, N'Kỹ năng giao tiếp kém, thụ động')
INSERT INTO EVALUATE_APL VALUES (5, 5, 4, N'Có nhiều trải nghiệm')
GO

--14. Bang EVALUATE_CO
INSERT INTO EVALUATE_CO VALUES (1, 1, 5, N'Công ty có cơ sở vật chất tốt')
INSERT INTO EVALUATE_CO VALUES (1, 5, 4, N'Công ty uy tín')
INSERT INTO EVALUATE_CO VALUES (2, 2, 4, N'Môi trường thân thiện')
INSERT INTO EVALUATE_CO VALUES (2, 3, 4, N'Công ty đón tiếp chu đáo')
INSERT INTO EVALUATE_CO VALUES (3, 1, 4, N'Công ty uy tín')
INSERT INTO EVALUATE_CO VALUES (3, 4, 5, N'Công ty cung cấp đầy đủ thông tin về công việc')
INSERT INTO EVALUATE_CO VALUES (4, 2, 3, N'Công ty không hỏi đúng trọng tâm công việc')
INSERT INTO EVALUATE_CO VALUES (4, 3, 5, N'Công ty uy tín, rất đáng để làm việc')
INSERT INTO EVALUATE_CO VALUES (5, 2, 2, N'Công ty thiếu chuyên nghiệp, phỏng vấn xơ xài')
INSERT INTO EVALUATE_CO VALUES (5, 5, 4, N'Tuyệt vời')
GO

--Tao khoa ngoai
--Bang REQUIRE
ALTER TABLE REQUIRE ADD CONSTRAINT FK1_REQUIRE FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo)
ALTER TABLE REQUIRE ADD CONSTRAINT FK2_REQUIRE FOREIGN KEY (requirementNo) REFERENCES REQUIREMENT(requirementNo)
GO

--Bang SKILL
ALTER TABLE SKILL ADD CONSTRAINT FK_SKILL FOREIGN KEY (applicantNo) REFERENCES APPLICANT(applicantNo)
GO

--Bang RECRUIT
ALTER TABLE RECRUIT ADD CONSTRAINT FK1_RECRUIT FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT(departmentNo)
ALTER TABLE RECRUIT ADD CONSTRAINT FK2_RECRUIT FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo)
GO

--Bang REGISTER
ALTER TABLE REGISTER ADD CONSTRAINT FK1_REGISTER FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo)
ALTER TABLE REGISTER ADD CONSTRAINT FK2_REGISTER FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo)
GO

--Bang EVALUATE_APL
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK1_EVALUATE_APL FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK2_EVALUATE_APL FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo)
GO

--Bang EVALUATE_CO
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo)
GO

--Bang BELONG
ALTER TABLE BELONG ADD CONSTRAINT FK1_BELONG FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT (departmentNo)
ALTER TABLE BELONG ADD CONSTRAINT FK2_BELONG FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
GO

--Bang INTERVIEWER
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
GO

--Bang INTERVIEW_SCHEDULE
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT FK_INTERVIEW_SCHEDULE FOREIGN KEY (interviewerNo) REFERENCES INTERVIEWER (interviewerNo)
GO

SELECT * FROM APPLICANT
SELECT * FROM BELONG
SELECT * FROM COMPANY
SELECT * FROM DEPARTMENT
SELECT * FROM EVALUATE_APL
SELECT * FROM EVALUATE_CO
SELECT * FROM INTERVIEWER
SELECT * FROM INTERVIEW_SCHEDULE
SELECT * FROM POSITION
SELECT * FROM RECRUIT
SELECT * FROM REGISTER
SELECT * FROM REQUIRE
SELECT * FROM REQUIREMENT
SELECT * FROM SKILL
