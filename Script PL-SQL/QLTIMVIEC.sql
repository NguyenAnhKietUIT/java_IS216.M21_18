/*=======================================================================================================================================================*/
/*									TABLE										 */
/*=======================================================================================================================================================*/
--Tao bang POSITION va khoa chinh
create table POSITION(
	positionNo NUMBER NOT NULL,
  	positionName VARCHAR2(30) NOT NULL UNIQUE
);
ALTER TABLE POSITION ADD CONSTRAINT PK_POSITION PRIMARY KEY (positionNo);

CREATE SEQUENCE seq_positionid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang REQUIREMENT va khoa chinh
create table REQUIREMENT (
	requirementNo NUMBER NOT NULL,
  	requirementName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE REQUIREMENT ADD CONSTRAINT PK_REQUIREMENT PRIMARY KEY (requirementNo);

CREATE SEQUENCE seq_requirementid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang REQUIRE va khoa chinh
create table REQUIRE (
	positionNo NUMBER NOT NULL,
  	requirementNo NUMBER NOT NULL,
	level_Re NUMBER,
	yearsOfExperience NUMBER,
	CHECK (level_Re BETWEEN 1 AND 6)
		 --1: Kem,
		 --2: Yeu,
		 --3: Trung binh,
		 --4: Kha,
		 --5: Gioi,
		 --6: Chuyen sau
);
ALTER TABLE REQUIRE ADD CONSTRAINT PK_REQUIRE PRIMARY KEY (positionNo, requirementNo);

--Tao bang SKILL va khoa chinh
create table SKILL (
	skillNo NUMBER NOT NULL,
  	skillName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE SKILL ADD CONSTRAINT PK_SKILL PRIMARY KEY (skillNo);

CREATE SEQUENCE seq_skillid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang RECRUIT va khoa chinh
create table RECRUIT (
	departmentNo NUMBER NOT NULL,
  	positionNo NUMBER NOT NULL,
  	numberOfPersonnel NUMBER
);
ALTER TABLE RECRUIT ADD CONSTRAINT PK_RECRUIT PRIMARY KEY (departmentNo, positionNo);

--Tao bang APPLICANT va khoa chinh
CREATE TABLE APPLICANT
(
	applicantNo NUMBER NOT NULL,
	applicantName VARCHAR2(30),
	citizenID VARCHAR2(12) UNIQUE,
	dateOfBirth DATE,
	gender NUMBER,
	address VARCHAR2(60),
	phoneNumber VARCHAR2(10),
	gmail VARCHAR2(30) UNIQUE,
    accountID NUMBER,
	CHECK (gender BETWEEN 0 AND 1) 
		--0 : Nam 
		--1 : Nu
);
ALTER TABLE APPLICANT ADD CONSTRAINT PK_APPLICANT PRIMARY KEY (applicantNo);

CREATE SEQUENCE seq_applicantid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang HAVE va khoa chinh
CREATE TABLE HAVE
(
	skillNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	level_apl NUMBER,
	yearsOfExperience NUMBER,
	CHECK (level_apl BETWEEN 1 AND 6)
		 --1: Kem,
		 --2: Yeu,
		 --3: Trung binh,
		 --4: Kha,
		 --5: Gioi,
		 --6: Chuyen sau
);
ALTER TABLE HAVE ADD CONSTRAINT PK_HAVE PRIMARY KEY (skillNo, applicantNo);

--Tao bang REGISTER va khoa chinh
CREATE TABLE REGISTER
(
	interviewScheduleNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	positionNo NUMBER NOT NULL,
	status NUMBER,
	CHECK (status BETWEEN 0 AND 4)
		-- 0: Da dang ky
		-- 1: Da huy dang ky
		-- 2: Da hoan thanh
		-- 3: Khong tham gia
		-- 4: Da duoc nhan vao lam
);
ALTER TABLE REGISTER ADD CONSTRAINT PK_REGISTER PRIMARY KEY (interviewScheduleNo, applicantNo, positionNo);

--Tao bang EVALUATE_APL va khoa chinh
CREATE TABLE EVALUATE_APL
(
	companyNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
    interviewScheduleNo NUMBER,
	mark_apl NUMBER,
	comment_apl VARCHAR2(2000),
	CHECK (mark_apl BETWEEN 1 AND 5)
		 --1: Rat te,
		 --2: Khong hai long,
		 --3: Binh thuong,
		 --4: Hai long,
		 --5: Rat hai long
);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT PK_EVALUATE_APL PRIMARY KEY (companyNo, applicantNo, interviewScheduleNo);

--Tao bang EVALUATE_CO va khoa chinh
CREATE TABLE EVALUATE_CO
(
	companyNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
    interviewScheduleNo NUMBER,
	mark_co NUMBER,
	comment_co VARCHAR2(2000),
	CHECK (mark_co BETWEEN 1 AND 5)
		 --1: Rat te,
		 --2: Khong hai long,
		 --3: Binh thuong,
		 --4: Hai long,
		 --5: Rat hai long
);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT PK_EVALUATE_CO PRIMARY KEY (companyNo, applicantNo,interviewScheduleNo);

--Tao bang BELONG va khoa chinh
CREATE TABLE BELONG
(
	departmentNo NUMBER NOT NULL,
	companyNo NUMBER NOT NULL
);
ALTER TABLE BELONG ADD CONSTRAINT PK_BELONG PRIMARY KEY (departmentNo, companyNo);

--Tao bang COMPANY va khoa chinh
CREATE TABLE COMPANY
(
	companyNo NUMBER NOT NULL,
	companyName VARCHAR2(50) NOT NULL UNIQUE,
	address VARCHAR2(60),
	hotline VARCHAR2(10),
	gmail VARCHAR2(30),
	startDate DATE,
    accountID NUMBER
);
ALTER TABLE COMPANY ADD CONSTRAINT PK_COMPANY PRIMARY KEY (companyNo);
CREATE SEQUENCE seq_companyid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--Tao bang DEPARTMENT va khoa chinh
CREATE TABLE DEPARTMENT
(
	departmentNo NUMBER NOT NULL,
	departmentName VARCHAR2(30) NOT NULL UNIQUE,
	describe VARCHAR2(2000)
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (departmentNo);

CREATE SEQUENCE seq_departmentid
MINVALUE 1
START WITH 1
INCREMENT BY 1;
--Tao bang INTERVIEWER va khoa chinh
CREATE TABLE INTERVIEWER
(
	interviewerNo NUMBER NOT NULL,
	interviewerName VARCHAR2(30) NOT NULL,
	phoneNumber VARCHAR2(10),
	gmail VARCHAR2(30),
	companyNo NUMBER,
    accountID NUMBER
);

ALTER TABLE INTERVIEWER ADD CONSTRAINT PK_INTERVIEWER PRIMARY KEY (interviewerNo);

CREATE SEQUENCE seq_interviewid
MINVALUE 1
START WITH 1
INCREMENT BY 1;


--Tao bang INTERVIEW_SCHEDULE va khoa chinh
CREATE TABLE INTERVIEW_SCHEDULE
(
	interviewScheduleNo NUMBER NOT NULL,
	startTime DATE,
	endTime DATE,
	location  VARCHAR2(60),
	status NUMBER,
	slot NUMBER,
	interviewerNo NUMBER,
	CHECK (status BETWEEN 0 AND 2)
		-- 0: Chua hoan thanh
		-- 1: Da hoan thanh
		-- 2: Da dat so luong toi da
);
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT PK_INTERVIEW_SCHEDULE PRIMARY KEY (interviewScheduleNo);

CREATE SEQUENCE seq_scheduleid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

-- Tao bang ACCOUNT
CREATE TABLE ACCOUNT (
	accountID	NUMBER NOT NULL,
	userName	VARCHAR2(20) NOT NULL UNIQUE,
	password	VARCHAR2(50) NOT NULL,
	role	 	VARCHAR2(20) NOT NULL        
);
ALTER TABLE ACCOUNT ADD CONSTRAINT PK_ACC PRIMARY KEY (AccountID);

CREATE SEQUENCE seq_accountid
MINVALUE 1
START WITH 1
INCREMENT BY 1;




/*=======================================================================================================================================================*/
/*									DATA	 									 */
/*=======================================================================================================================================================*/



--1. Bang ACCOUNT
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'samsung','s123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'intel','i123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'cocacola','c123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'petrolimex','p123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'viettel','v123','Cong ty');	
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranva','a123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranvb','b123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'nguyenmc','c123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'luuqa','a1234','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranmd','d123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'thaohong','thaohong123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'thanhphat','thanhphat123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'hoailinh','hoailinh123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'anhkiet','anhkiet123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'mynhung','mynhung123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'phuonglinh','phuonglinh123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'quoctrung','quoctrung123','Ung vien');

--2. Bang COMPANY
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'SamSung', 'Quan 1', '2839157310','samsung@gmai.com.vn', TO_DATE('30/01/2007','dd/mm/yyyy'),1);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Intel', 'Phu Nhuan', '8437363000','Intel@gmai.com.vn', TO_DATE('21/02/2006','dd/mm/yyyy'),2);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Cocacola', 'Hai Phong', '0500233891','Cocacola@gmai.com.vn', TO_DATE('14/6/1996','dd/mm/yyyy'),3);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Petrolimex', 'Ha Noi', '1900363003','Petrolimex@gmai.com.vn', TO_DATE('22/6/2005','dd/mm/yyyy'),4);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Viettel', 'Ha Noi', '18008098','Viettel@gmai.com.vn', TO_DATE('1/6/1989','dd/mm/yyyy'),5);

--3. Bang DEPARTMENT
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Phong nhan su', NULL);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Phong ke toan', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Quan ly du an', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Bao ve', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Ke toan thue', NUll);

--4. Bang BELONG
INSERT INTO BELONG VALUES (1, 1);
INSERT INTO BELONG VALUES (2, 2);
INSERT INTO BELONG VALUES (3, 3);
INSERT INTO BELONG VALUES (4, 4);
INSERT INTO BELONG VALUES (5, 5);

--5. Bang POSITION
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong nhan su');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong ke toan');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Truong ban bao ve');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Editor');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Nhan vien ve sinh');

--6. Bang RECRUIT
INSERT INTO RECRUIT VALUES (1, 5, 5);
INSERT INTO RECRUIT VALUES (2, 3, 1);
INSERT INTO RECRUIT VALUES (4, 3, 1);
INSERT INTO RECRUIT VALUES (2, 4, 3);
INSERT INTO RECRUIT VALUES (5, 2, 1);

--7. Bang REQUIREMENT
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Ke toan');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Quan ly du an');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Ngoai ngu');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Tin hoc van phong');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Lanh dao');

--8. Bang REQUIRE
INSERT INTO REQUIRE VALUES (1, 3, 2, NULL);
INSERT INTO REQUIRE VALUES (2, 1, 5, 4);
INSERT INTO REQUIRE VALUES (5, 4, 6, NULL);
INSERT INTO REQUIRE VALUES (4, 5, 3, 2);
INSERT INTO REQUIRE VALUES (3, 2, 4, 1);

--9. Bang INTERVIEWER
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Van A', '0378009008' , 'tranvana@gmai.com.vn', 1,6);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Van B', '0378989238', 'tranvanb@gmai.com.vn', 2,7);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Nguyen Minh C', '0378011108', 'nguyenminhc@gmai.com.vn', 3,8);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Luu Quoc A', '0378123097', 'luuquoca@gmai.com.vn', 4,9);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Minh D', '0374568088', 'tranminhd@gmai.com.vn', 5,10);


--10. Bang INTERVIEW_SCHEDULE
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('15/01/2021','dd/mm/yyyy') , '71 Dinh Tien Hoang' , 0 , 20, 1);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/02/2021','dd/mm/yyyy'), TO_DATE('16/02/2021','dd/mm/yyyy') , '65/6 Ha Ton Quyen' , 1 , 20, 2);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('26/01/2021','dd/mm/yyyy'), TO_DATE('29/01/2021','dd/mm/yyyy') , '15 Nguyen Tri Phuong' , 0 , 20, 2);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('14/01/2021','dd/mm/yyyy') , '72 Ho Tung Mau' , 0 , 20, 4);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('21/03/2021','dd/mm/yyyy'), TO_DATE('24/03/2021','dd/mm/yyyy') , '79/5/1 Nguyen Thai Hoc' , 0 , 20, 5);


--11. Bang APPLICANT
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Hoai Linh', '079202009176', TO_DATE('23/04/2002','dd/mm/yyyy'), 1, '68/23 Dong Den', '070786884','linhhoainguyen2002@gmail.com',11);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Anh Kiet', '079202005713', TO_DATE('21/07/2002','dd/mm/yyyy'), 1, '76/3 Nguyen Trai', '0787264822','nguyenanhkiet2002@gmail.com',12);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Thanh Phat', '079202067492', TO_DATE('7/9/2001','dd/mm/yyyy'), 1, '11/6/8 Truong Cong Dinh', '0387518022','thanhphatnguyen2001@gmail.com',13);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Thi Thao Hong', '079202001436', TO_DATE('11/3/1998','dd/mm/yyyy'), 0, '227 Nguyen Thi Minh Khai', '0275784426','thaohongnt2001@gmail.com',14);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Vu Thi Phuong Linh', '079202008648', TO_DATE('16/6/2001','dd/mm/yyyy'), 0, '61 Dong Da', '0909666371','vtplinh2k1@gmail.com',15);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Tran Thi My Nhung', '080202009171', TO_DATE('25/9/1999','dd/mm/yyyy'), 0, '89 Nguyen Van Cu', '0163787333','nhungtranthimy@gmail.com',16);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Tran Quoc Trung', '077202009679', TO_DATE('11/11/2000','dd/mm/yyyy'), 1, '22/6 Nguyen Ba Tong', '0193882563','trungquoctran@gmail.com',17);


--12. Bang SKILL
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Ngoai ngu');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Tin hoc van phong');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Reporting');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Quan ly du an');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Researching');

--13. Bang HAVE
INSERT INTO HAVE VALUES (1, 3, 4, 5);
INSERT INTO HAVE VALUES (2, 2, 3, 3);
INSERT INTO HAVE VALUES (3, 4, 2, 1);
INSERT INTO HAVE VALUES (4, 5, 5, 8);
INSERT INTO HAVE VALUES (5, 1, 1, 1);

--14. Bang REGISTER
INSERT INTO REGISTER VALUES (1, 1, 2, 0);
INSERT INTO REGISTER VALUES (1, 3, 3, 1);
INSERT INTO REGISTER VALUES (1, 5, 1, 0);
INSERT INTO REGISTER VALUES (2, 2, 5, 0);
INSERT INTO REGISTER VALUES (2, 3, 4, 0);
INSERT INTO REGISTER VALUES (3, 1, 4, 0);
INSERT INTO REGISTER VALUES (3, 3, 1, 1);
INSERT INTO REGISTER VALUES (3, 4, 2, 0);
INSERT INTO REGISTER VALUES (3, 5, 5, 1);
INSERT INTO REGISTER VALUES (4, 2, 3, 0);
INSERT INTO REGISTER VALUES (4, 3, 1, 0);
INSERT INTO REGISTER VALUES (5, 2, 2, 0);
INSERT INTO REGISTER VALUES (5, 5, 3, 0);

--15. Bang EVALUATE_APL
INSERT INTO EVALUATE_APL VALUES (1, 1, 1, 5, 'Ung vien rat trung thuc');
INSERT INTO EVALUATE_APL VALUES (1, 5, 1, 5, 'Ung vien rat dung gio');
INSERT INTO EVALUATE_APL VALUES (2, 1, 3, 4, 'Ung vien chua co nhieu kinh nghiem');
INSERT INTO EVALUATE_APL VALUES (2, 2, 2, 4, 'Ung vien hoi lung tung');
INSERT INTO EVALUATE_APL VALUES (2, 3, 2, 5, 'Ung vien co thuc luc');
INSERT INTO EVALUATE_APL VALUES (2, 4, 3, 5, 'Ky nang chuyen mon cao');
INSERT INTO EVALUATE_APL VALUES (4, 2, 4, 3, 'Khong chuan bi chu dao');
INSERT INTO EVALUATE_APL VALUES (4, 3, 4, 5, 'Ky nang giao tiep tot');
INSERT INTO EVALUATE_APL VALUES (5, 2, 5, 2, 'Ky nang giao tiep kem, thu dong');
INSERT INTO EVALUATE_APL VALUES (5, 5, 5, 4, 'Co nhieu trai nghiem');

--16. Bang EVALUATE_CO
INSERT INTO EVALUATE_CO VALUES (1, 1, 1, 5, 'Cong ty co co so vat chat tot');
INSERT INTO EVALUATE_CO VALUES (1, 5, 1, 4, 'Cong ty uy tin');
INSERT INTO EVALUATE_CO VALUES (2, 1, 3, 4, 'Moi truong than thien');
INSERT INTO EVALUATE_CO VALUES (2, 2, 2, 4, 'Cong ty don tiep chu dao');
INSERT INTO EVALUATE_CO VALUES (2, 3, 2, 4, 'Cong ty uy tin');
INSERT INTO EVALUATE_CO VALUES (2, 4, 3, 5, 'Cong ty cung cap day du thong tin ve cong viec');
INSERT INTO EVALUATE_CO VALUES (4, 2, 4, 3, 'Cong ty hoi dung trong tam cong viec');
INSERT INTO EVALUATE_CO VALUES (4, 3, 4, 5, 'Cong tu ut tin, rat dang de lam viec');
INSERT INTO EVALUATE_CO VALUES (5, 2, 5, 2, 'Cong ty thieu chuyen nghiep, phong van so sai');
INSERT INTO EVALUATE_CO VALUES (5, 5, 5, 4, 'Tuyet voi');


/*=======================================================================================================================================================*/
/*									FOREIGN KEY	 								 */
/*=======================================================================================================================================================*/


--Bang REQUIRE
ALTER TABLE REQUIRE ADD CONSTRAINT FK1_REQUIRE FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo);
ALTER TABLE REQUIRE ADD CONSTRAINT FK2_REQUIRE FOREIGN KEY (requirementNo) REFERENCES REQUIREMENT(requirementNo);


--Bang HAVE
ALTER TABLE HAVE ADD CONSTRAINT FK1_HAVE FOREIGN KEY (skillNo) REFERENCES SKILL(skillNo);
ALTER TABLE HAVE ADD CONSTRAINT FK2_HAVE FOREIGN KEY (applicantNo) REFERENCES APPLICANT(applicantNo);


--Bang RECRUIT
ALTER TABLE RECRUIT ADD CONSTRAINT FK1_RECRUIT FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT(departmentNo);
ALTER TABLE RECRUIT ADD CONSTRAINT FK2_RECRUIT FOREIGN KEY (positionNo) REFERENCES POSITION(positionNo);


--Bang REGISTER
ALTER TABLE REGISTER ADD CONSTRAINT FK1_REGISTER FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK2_REGISTER FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK3_REGISTER FOREIGN KEY (positionNo) REFERENCES POSITION (positionNo);


--Bang EVALUATE_APL
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK1_EVALUATE_APL FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK2_EVALUATE_APL FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK3_EVALUATE_APL FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);



--Bang EVALUATE_CO
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK3_EVALUATE_CO FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);



--Bang BELONG
ALTER TABLE BELONG ADD CONSTRAINT FK1_BELONG FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT (departmentNo);
ALTER TABLE BELONG ADD CONSTRAINT FK2_BELONG FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);


--Bang INTERVIEWER
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);

--Bang INTERVIEW_SCHEDULE
ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT FK_INTERVIEW_SCHEDULE FOREIGN KEY (interviewerNo) REFERENCES INTERVIEWER (interviewerNo);


-- Bang COMPANY
ALTER TABLE COMPANY ADD CONSTRAINT FK_COMPANY_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);


-- BANG APPLICANT
ALTER TABLE APPLICANT ADD CONSTRAINT FK_APPLICANT_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);
    

/*=======================================================================================================================================================*/
/*									TRIGGER									 	 */
/*=======================================================================================================================================================*/



/*========================================================= 
	TRIGGER QD8: THOI GIAN KET THUC > THOI GIAN BAT DAU
===========================================================*/

CREATE OR REPLACE TRIGGER trigger_interview_time_interviewshcedule
AFTER INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN
	IF ((:NEW.ENDTIME - :NEW.STARTTIME)/365 < 0) THEN
        Raise_Application_Error(-20011, 'THOI GIAN KET THUC KHONG THE BE HON THOI GIAN BAT DAU');
    END IF;
END;

/*========================================================= 
	TRIGGER 10: SO luong ung vi??n toi da duoc dang ky phong van (slot) trong mot buoi kh??ng qu?? 20 nguoi.
===========================================================*/
CREATE OR REPLACE TRIGGER interview_slot 
BEFORE INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN    
    IF (:NEW.slot > 20)
    THEN
        RAISE_APPLICATION_ERROR(-20000, N'B?N ?ANG NH?P HO?C C?P NH?T D? LI?U KH?”NG H?P L?');
    END IF;
END;

/*========================================================= 
	TRIGGER 11: DIEM UY T??N NHO HON 3 THI UNG VI??N CHI C?“ THE DK TOI DA 3 LICH PHONG VAN
===========================================================*/
create OR replace trigger RegistInterview_CheckPoint
before insert
on register
for each row
declare
    diemTB float;
    slg int;
begin		
    select avg(e.mark_apl) into diemTB
    from EVALUATE_APL e
    where e.applicantNo = :NEW.applicantNo;

	select count(r.interviewScheduleNo) into slg
	from REGISTER r
	where r.applicantNo = :NEW.applicantNo
	and r.status = 0; --phieu phong van da dang ky

	if diemTB < 3 and slg >= 3
    then
        RAISE_APPLICATION_ERROR(-20000, N'?I?M UY T??N KH?”NG ?? ?? ??NG K?? TH??M');
	end if;
end;

/*========================================================= 
	TRIGGER 12:HUY LICH PHONG VAN TRE NHAT 1 NG?€Y
===========================================================*/
CREATE OR REPLACE TRIGGER Cancel_Schedule
BEFORE DELETE
ON REGISTER
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE 
    ID INTERVIEW_SCHEDULE.interviewerNo%TYPE;
BEGIN
    SELECT (ISC.interviewerNo) into ID
				FROM INTERVIEW_SCHEDULE ISC
				WHERE ISC.interviewScheduleNo = :OLD.interviewScheduleNo
                AND (( TO_DATE(ISC.startTime,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy')) <= 1);
	IF  (ID is null)
    THEN
        RAISE_APPLICATION_ERROR(-20000, N'?ng vi??n ch? c?? th? h?y l?ch ??ng k?? ph?ng v?n tr? nh?t l?  1 ng? y tr??c khi b?t ??u bu?i ph?ng v?n');
	END IF;
END;


/*========================================================= 
	TRIGGER 13: TAI 1 THOI DIEM UNG VIEN KH?”NG THE DK PHONG VAN TAI NHIEU C?”NG TY
===========================================================*/
create OR replace  trigger RegistInterview_CheckDate
after insert 
on register
for each row
declare
    interviewScheduleNo_n register.interviewscheduleno%TYPE;
    applicantNo_n register.applicantno%TYPE;
    flag number(1);
begin
    interviewScheduleNo_n := :NEW.interviewScheduleNo;
    applicantNo_n := :NEW.APPLICANTNO;
    
    select case
            when exists (select *
                        from (select is_i.startTime, is_i.endTime, i_i.companyNo
                                from INTERVIEW_SCHEDULE is_i join interviewer i_i on is_i.interviewerNo = i_i.interviewerNo
                                where is_i.interviewScheduleNo = interviewScheduleNo_n) them,
                            (select r_e.*, is_e.startTime, is_e.endTime, i_e.companyNo
                            from (register r_e join INTERVIEW_SCHEDULE is_e on r_e.interviewScheduleNo = is_e.interviewScheduleNo) join interviewer i_e on is_e.interviewerNo = i_e.interviewerNo) existed
                        where applicantNo_n = existed.applicantNo and
                        ((them.startTime >= existed.startTime and them.startTime <= existed.endTime) or (them.startTime < existed.startTime and them.endTime >= existed.startTime))
                        and them.companyNo <> existed.companyNo)
            then 1
            else 0 
        end into flag
    from dual;

    if flag = 1
    then
        RAISE_APPLICATION_ERROR(-20000, N'Ung vien khong the dang ky lich phong van cho nhieu cong ty tai mot thoi diem');
    end if;
end;


/*========================================================= 
	TRIGGER: THEM LICH
   	 DIEU KIEN: NHA TUYEN DUNG KHONG THE THEM LICH TRUNG LICH CU
===========================================================*/
CREATE OR REPLACE TRIGGER trigger_schedule_notSame_interviewschedule
BEFORE INSERT 
ON INTERVIEW_SCHEDULE
FOR EACH ROW
DECLARE
    ITVS INTERVIEW_SCHEDULE%ROWTYPE;
BEGIN
        SELECT * INTO ITVS
        FROM INTERVIEW_SCHEDULE
        WHERE InterviewerNo = :NEW.InterviewerNo;
        IF (:NEW.InterviewerNo = ITVS.InterviewerNo 
                AND   :NEW.interviewScheduleNo <> ITVS.interviewScheduleNo
                AND ( :NEW.STARTTIME >= ITVS.STARTTIME AND :NEW.STARTTIME <= ITVS.ENDTIME) 
                OR  ( :NEW.STARTTIME < ITVS.STARTTIME AND :NEW.ENDTIME >= ITVS.STARTTIME))
        THEN
            Raise_Application_Error(-20011, 'BAN DA CO LICH NGAY HOM DO ROI');
        END IF;
END;
-- khong the tao duoc
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('14/01/2021','dd/mm/yyyy') , '72 Ho Tung Mau' , 1 , 20, 4);
SELECT * FROM INTERVIEW_SCHEDULE;
/*========================================================= 
        TRIGGER: KHI DANG KY
    	DIEU KIEN: CAP NHAT LAI SLOT TRONG INTERVIEW_SCHEDULE
===========================================================*/
CREATE OR REPLACE TRIGGER trigger_minus_regis_slot 
AFTER INSERT 
ON REGISTER
FOR EACH ROW
DECLARE
    SlotInItvs NUMBER := 0;
BEGIN
    -- TIM SO SLOT DANG CO TRONG LICH PHONG VAN
    SELECT Slot INTO SlotInItvs
    FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = :NEW.interviewScheduleNo AND :NEW.status = 0;
    
    -- BAT DAU CAP NHAT
    IF(SlotInItvs <= 0) THEN
        Raise_Application_Error(-20011, 'LICH DA QUA SO LUOT SO DANG KY');
    ELSE
        UPDATE INTERVIEW_SCHEDULE S
        SET slot = slot - 1
        WHERE S.interviewScheduleNo = :NEW.interviewScheduleNo;
    END IF;
END;

/*========================================================= 
        TRIGGER: KHI HUY DANG KY
    	DIEU KIEN: CAP NHAT LAI SLOT TRONG INTERVIEW_SCHEDULE
===========================================================*/

CREATE OR REPLACE TRIGGER trigger_add_regis_slot 
AFTER DELETE
ON REGISTER
FOR EACH ROW
DECLARE
    SlotInItvs NUMBER := 0;
BEGIN
    -- TIM SO SLOT DANG CO TRONG LICH PHONG VAN
    SELECT Slot INTO SlotInItvs
    FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = :OLD.interviewScheduleNo;
    
    -- BAT DAU CAP NHAT
    IF(SlotInItvs >= 20) THEN
        Raise_Application_Error(-20011, 'MOT LICH CHI CO 20 UNG VIEN DUOC DANG KY');
    ELSE
        UPDATE INTERVIEW_SCHEDULE S
        SET slot = slot + 1
        WHERE S.interviewScheduleNo = :OLD.interviewScheduleNo;
    END IF;
END;

update register 
set status = 1
where interviewScheduleNo = 1 and applicantNo = 1 and positionNo = 2; 
select * from evaluate_apl;
select * from interview_schedule;
/*========================================================= 
        TRIGGER: KHI NHA TUYEN DUNG XAC NHAN ??NG VIEN V?€O L?€M 
    	DIEU KIEN: CAP NHAT LAI SO LUONG UNG VIEN CAN TUYEN CUA CONG TY
===========================================================*/
CREATE OR REPLACE TRIGGER confirmApplicant
AFTER UPDATE
ON REGISTER
FOR EACH ROW
BEGIN
    UPDATE POSITION P SET NUMBEROFPERSONNEL = NUMBEROFPERSONNEL - 1 WHERE :NEW.STATUS = 4 AND P.POSITIONNO = :OLD.POSITIONNO;
END;

/*========================================================= 
        TRIGGER: KHI SUA THUOC TINH SO LUONG UNG VIEN CAN TUYEN CHO VI TRI ,NEU TON TAI UNG VIEN DANG KY PHONG VAN CHO VI TRI DO 
    	DIEU KIEN: KHONG CAP NHAT LAI SO LUONG UNG VIEN CAN TUYEN CUA CONG TY BANG 0
===========================================================*/
CREATE OR REPLACE TRIGGER fix
AFTER UPDATE
ON POSITION
FOR EACH ROW
DECLARE 
v_NUMBEROFPERSONNEL NUMBER;
BEGIN
    SELECT COUNT(APPLICANTNO) INTO v_NUMBEROFPERSONNEL
    FROM REGISTER
    WHERE STATUS = 0
    GROUP BY POSITIONNO
    HAVING POSITIONNO = :OLD.POSITIONNO;
    
    IF (:NEW.NUMBEROFPERSONNEL = 0 AND v_NUMBEROFPERSONNEL > 0) THEN
        ROLLBACK;
    END IF;
END;

create or replace TRIGGER notEngaged
AFTER UPDATE
ON REGISTER
FOR EACH ROW
declare
    companyNo_new COMPANY.COMPANYNO%TYPE;
BEGIN
    IF :NEW.status = 1 THEN
        select i.companyNo into companyNo_new
        from interview_Schedule its join interviewer i on its.interviewerNo = i.interviewerNo
        where its.interviewScheduleNo = :NEW.interviewScheduleNo;
        
        INSERT INTO EVALUATE_APL VALUES (seq_scheduleid.nextval, companyNo_new, :NEW.APPLICANTNO, 1, 'Khong tham gia');
    END IF;
END;

/*=======================================================================================================================================================*/
/*									PROCEDURE									 */
/*=======================================================================================================================================================*/



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: ACCOUNT						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_account( userName_new ACCOUNT.username%TYPE,
                                             password_new ACCOUNT.password%TYPE,
                                             role_new ACCOUNT.role%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO ACCOUNT(accountID, userName,password,role) 
        VALUES(seq_accountid.nextval,userName_new,password_new,role_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_account(userName_OLD IN ACCOUNT.username%TYPE,
                                                userName_update IN ACCOUNT.username%TYPE,
                                                password_update ACCOUNT.password%TYPE,
                                                role_update ACCOUNT.role%TYPE)
AS
BEGIN
    UPDATE ACCOUNT
    SET userName = userName_update, password = password_update, role =role_update
    WHERE userName=userName_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_account(userName_dlt IN ACCOUNT.username%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(accountID) INTO NumberOfEffect
    FROM Account
    WHERE userName = userName_dlt;
    -- XOA DU LIEU
    DELETE FROM Account
    WHERE userName = userName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: COMPANY						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_comp(companyName_new COMPANY.companyname%TYPE,
                                             address_new  company.address%TYPE,
                                             hotline_new company.hotline%TYPE,
                                             gmail_new COMPANY.gmail%TYPE,
                                             startDate_new COMPANY.startdate%TYPE,
                                             accountID_new company.accountid%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO COMPANY(companyNo,companyName,address,hotline,gmail,startDate,accountID) 
        VALUES(seq_companyid.nextval,companyName_new,address_new,hotline_new,gmail_new,startDate_new,accountID_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_comp(companyName_old COMPANY.companyname%TYPE,
                                             companyName_update COMPANY.companyname%TYPE,
                                             address_update  company.address%TYPE,
                                             hotline_update company.hotline%TYPE,
                                             gmail_update COMPANY.gmail%TYPE,
                                             startDate_update COMPANY.startdate%TYPE,
                                             accountID_update company.accountid%TYPE)
AS
BEGIN
    UPDATE COMPANY
    SET companyName = companyName_update, address = address_update, hotline =hotline_update,gmail=gmail_update,startDate=startDate_update,accountID=accountID_update
    WHERE companyName = companyName_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_comp(companyName_dlt IN COMPANY.companyname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(companyNo) INTO NumberOfEffect
    FROM COMPANY
    WHERE companyName = companyName_dlt;
    -- XOA DU LIEU
    DELETE FROM COMPANY
    WHERE companyName = companyName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: DEPARTMENT					*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_dep( departmentName_new department.departmentname%TYPE,
                                             describe_new department.describe%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO DEPARTMENT(departmentNo, departmentName,describe) 
        VALUES(seq_departmentid.nextval,departmentName_new,describe_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_dep(departmentName_old department.departmentname%TYPE,
                                                departmentName_update department.departmentname%TYPE,
                                                describe_update department.describe%TYPE)
AS
BEGIN
    UPDATE DEPARTMENT
    SET departmentName= departmentName_update, describe = describe_update
    WHERE departmentName=departmentName_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_dep(departmentName_dlt IN department.departmentname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(departmentNo) INTO NumberOfEffect
    FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;
    -- XOA DU LIEU
    DELETE FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: BELONG						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_belong( departmentNo_new BELONG.departmentno%TYPE,
                                                companyNo_new BELONG.companyNo%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO BELONG(departmentNo, companyNo) 
        VALUES(departmentNo_new,companyNo_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_belong(departmentNo_old belong.departmentno%TYPE,
                                                departmentNo_update belong.departmentno%TYPE,
                                                companyNo_update belong.companyno%TYPE)
AS
BEGIN
    UPDATE BELONG
    SET departmentNo= departmentNo_update, companyNo = companyNo_update
    WHERE departmentNo=departmentNo_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_dep(departmentNo_dlt IN belong.departmentno%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(departmentNo) INTO NumberOfEffect
    FROM BELONG
    WHERE departmentNo = departmentNo_dlt;
    -- XOA DU LIEU
    DELETE FROM BELONG
    WHERE departmentNo = departmentNo_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;




/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: HAVE						*/
/*==============================================================*/

---------------------- INSERT--------------------------
CREATE OR REPLACE PROCEDURE proc_insert_have(skillNo_new HAVE.skillNo%TYPE,
                                            applicantNo_new HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
BEGIN
        INSERT INTO HAVE 
        VALUES(skillNo_new, applicantNo_new, level_apl_new, yearsOfExperience_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

---------------------UPDATE---------------------------
CREATE OR REPLACE PROCEDURE proc_update_have(skillNo_in HAVE.skillNo%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
BEGIN
        UPDATE HAVE 
        SET level_apl = level_apl_new, yearsOfExperience = yearsOfExperience_new
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_have(skillNo_in HAVE.skillNo%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE)
AS
BEGIN
        DELETE HAVE 
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REGISTER						*/
/*==============================================================*/


---------------------- INSERT--------------------------
CREATE OR REPLACE PROCEDURE proc_insert_register(interviewScheduleNo_new REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_new REGISTER.applicantNo%TYPE,
                                             positionNo_new REGISTER.positionNo%TYPE,
                                             status_new REGISTER.status%TYPE)
AS
BEGIN
        INSERT INTO REGISTER
        VALUES(interviewScheduleNo_new, applicantNo_new, positionNo_new, status_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_in REGISTER.applicantNo%TYPE,
                                             positionNo_in REGISTER.positionNo%TYPE,
                                             status_new REGISTER.status%TYPE)
AS
BEGIN
        UPDATE REGISTER
        SET status = status_new
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_in REGISTER.applicantNo%TYPE,
                                             positionNo_in REGISTER.positionNo%TYPE)
AS
BEGIN
        DELETE REGISTER
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: EVALUATE_CO					*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_evaluate_co(companyNo_new EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_new EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_CO
        VALUES(companyNo_new, applicantNo_new scheduleNo_new, mark_co_new, comment_co_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_evaluate_co(companyNo_in EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_in EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        UPDATE EVALUATE_CO
        SET interviewScheduleNo = scheduleNo_new,mark_co = mark_co_new, comment_co = comment_co_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_evaluate_co(companyNo_in EVALUATE_CO.companyNo%TYPE,
                                                    applicantNo_in EVALUATE_CO.applicantNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_CO
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: EVALUATE_APL					*/
/*==============================================================*/

---------------------- INSERT-------------------------

CREATE OR REPLACE PROCEDURE proc_insert_evaluate_apl(companyNo_new EVALUATE_APL.companyNo%TYPE,
                                            	     applicantNo_new EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_APL
        VALUES(companyNo_new, applicantNo_new, scheduleNo_new, mark_apl_new, comment_apl_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_evaluate_apl(companyNo_in EVALUATE_APL.companyNo%TYPE,
                                                     applicantNo_in EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        UPDATE EVALUATE_APL
        SET interviewScheduleNo = scheduleNo_new, mark_apl = mark_apl_new, comment_apl = comment_apl_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_evaluate_apl(companyNo_in EVALUATE_APL.companyNo%TYPE,
                                            applicantNo_in EVALUATE_APL.applicantNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_APL
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: POSITION      					*/
/*==============================================================*/
---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_position( PosName_New POSITION.PositionName%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO POSITION(PositionNo, PositionName) 
        VALUES(seq_positionid.CURRVAL,PosName_New);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

BEGIN
proc_insert_position('Thiet ke database');
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_position(PosNo IN Position.PositionNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM POSITION
    WHERE positionNo = PosNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;

BEGIN
proc_delete_position(10);  
END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_position(PosNo_Old POSITION.PositionNo%TYPE,
                                            PosName_Update POSITION.PositionName%TYPE)
AS
BEGIN
    UPDATE POSITION 
    SET PositionName = PosName_Update
    WHERE PositionNo = PosNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Ma vi tri khong ton tai');
END;

BEGIN proc_update_pos(5,'Thiet ke database'); END;

SELECT * FROM POSITION;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: RECRUIT						*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_recruit(DepartNo_New Recruit.departmentNo%TYPE,
                                                PosNo_New Recruit.positionNo%TYPE,
                                                NoOfPerson Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
    INSERT INTO RECRUIT(departmentNo, positionNo, numberofpersonnel)
    VALUES (DepartNo_New, PosNo_New, NoOfPerson);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;

BEGIN proc_insert_recruit(5,2,2); END;


---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_recruit(Depart_No Recruit.departmentNo%TYPE,
                                                Pos_No Recruit.positionNo%TYPE)
IS
BEGIN    
    -- XOA DU LIEU
    DELETE FROM RECRUIT
    WHERE DepartmentNo = Depart_No AND PositionNo = Pos_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Du lieu khonng ton tai');
    COMMIT;
END;

BEGIN proc_delete_recruit(5,2); END;
---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_recruit(DepartNo_Old RECRUIT.departmentNo%TYPE,
                                                PosNo_Old RECRUIT.positionNo%TYPE,
                                                DepartNo_Update RECRUIT.departmentNo%TYPE,
                                                PosNo_Update RECRUIT.positionNo%TYPE,
                                                NoOfPerson_Update Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
   UPDATE RECRUIT
   SET departmentNo = DepartNo_Update, positionNo = PosNo_Update, NumberOfPersonnel = NoOfPerson_Update
   WHERE departmentNo = DepartNo_Old AND positionNo = PosNo_Old;
   DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

BEGIN proc_update_recruit(2,5,5,2,5); END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REQUIREMENT					*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_requirement(requirement_Name REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    INSERT INTO REQUIREMENT(requirementNo,requirementName)
    VALUES(seq_requirementid.NEXTVAL,requirement_Name);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;

BEGIN 
    proc_insert_requirement('Biet su dung Oracle'); 
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_requirement(requirement_No REQUIREMENT.requirementNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM REQUIREMENT
    WHERE requirementNo = requirement_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN 
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai');
    COMMIT;
END;

BEGIN proc_delete_requirement(); END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_requirement(requirementNo_Old REQUIREMENT.requirementNo%TYPE,
                                                    requirementName_Update REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    UPDATE REQUIREMENT
    SET requirementName = requirementName_Update 
    WHERE requirementNo = requirementNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;

BEGIN
proc_update_requirement();
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REQUIRE						*/
/*==============================================================*/
---------------------INSERT-----------------------------
CREATE OR REPLACE PROCEDURE proc_insert_require(posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE,
                                                level_require REQUIRE.level_re%TYPE,
                                                YearExperience REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN
    INSERT INTO REQUIRE (positionNo, requirementNo, level_re, yearsOfExperience)
    VALUES(posNo, requireNo, level_require, YearExperience);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;


BEGIN
    proc_insert_require();
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_require(posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE)
IS
BEGIN
    DELETE FROM REQUIRE
    WHERE positionNo = posNo AND requirementNo = requireNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_require(posNo_Old REQUIRE.positionNo%TYPE,
                                                requireNo_Old REQUIRE.requirementNo%TYPE,
                                                posNo_Update REQUIRE.positionNo%TYPE,
                                                requireNo_Update REQUIRE.requirementNo%TYPE,
                                                level_Update REQUIRE.level_re%TYPE,
                                                Year_Update REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN
    
    UPDATE REQUIRE
    SET positionNo = posNo_Update, requirementNo = requireNo_Update, level_re = level_Update, 
        yearsOfExperience = Year_Update
    WHERE positionNo = posNo_Old AND requirementNo = requireNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;

BEGIN
    proc_update_require();
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: INTERVIEWER 					*/
/*==============================================================*/

-------------------------INSERT----------------------------------
CREATE OR REPLACE PROCEDURE proc_insert_interviewer(v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, v_companyNo, v_accountID);
    COMMIT;
END;

----------------------------UPDATE-----------------------------
CREATE OR REPLACE PROCEDURE proc_update_interviewer(v_interviewerNo INTERVIEWER.interviewerNo%TYPE,
                                                    v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
    UPDATE INTERVIEWER
    SET interviewerName = v_interviewerName,
        phoneNumber = v_phoneNumber,
        gmail = v_gmail,
        companyNo = v_companyNo,
        accountID = v_accountID
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;

---------------------------DELETE--------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_interviewer(v_interviewerNo INTERVIEWER.interviewerNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEWER
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: INTERVIEW_SCHEDULE				*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_interview_schedule( v_startTime VARCHAR2,
                                                            v_endTime VARCHAR2,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE(v_startTime,'dd/mm/yyyy'), TO_DATE(v_endTime,'dd/mm/yyyy') , v_location , v_status , v_slot, v_interviewerNo);
    COMMIT;
END;

-------------------------UPDATE----------------------------
CREATE OR REPLACE PROCEDURE proc_update_interview_schedule( v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE,
                                                            v_startTime VARCHAR2,
                                                            v_endTime VARCHAR2,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    UPDATE INTERVIEW_SCHEDULE
    SET startTime = TO_DATE(v_startTime,'dd/mm/yyyy'),
        endTime = TO_DATE(v_endTime,'dd/mm/yyyy'),
        location = v_location,
        status = v_status,
        slot = v_slot,
        interviewerNo = v_interviewerNo
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;

---------------------------DELETE------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_interview_schedule(v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: APPLICANT						*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_applicant(  v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth VARCHAR2,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,v_applicantName, v_citizenID , TO_DATE(v_dateOfBirth,'dd/mm/yyyy'), v_gender , v_address, v_PHONENUMBER, v_gmail, v_accountID);
    COMMIT;
END;

-----------------------UPDATE------------------------------------
CREATE OR REPLACE PROCEDURE proc_update_applicant(  v_applicantNo APPLICANT.applicantNo%TYPE,
                                                    v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth VARCHAR2,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    UPDATE APPLICANT
    SET applicantName = v_applicantName,
        citizenID = v_citizenID,
        dateOfBirth = TO_DATE(v_dateOfBirth,'dd/mm/yyyy'),
        gender = v_gender,
        address = v_address,
        PHONENUMBER = v_PHONENUMBER,
        gmail = v_gmail,
        accountID = v_accountID
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;

---------------------------DELETE----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_applicant(v_applicantNo APPLICANT.applicantNo%TYPE)
AS
BEGIN
    DELETE FROM APPLICANT
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: SKILL						*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_skill(v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    INSERT INTO SKILL VALUES (seq_skillid.nextval, v_skillName);
    COMMIT;
END;

------------------------UPDATE------------------------------------
CREATE OR REPLACE PROCEDURE proc_update_skill(v_skillNo SKILL.skillNo%TYPE, v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    UPDATE SKILL
    SET skillName = v_skillName
    WHERE skillNo = v_skillNo;
    COMMIT;
END;

-------------------------DELETE--------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_skillt(v_skillNo SKILL.skillNo%TYPE)
AS
BEGIN
    DELETE FROM SKILL
    WHERE skillNo = v_skillNo;
    COMMIT;
END;


/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin cong ty		   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Company (name_co company.companyname%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName, address, startDate FROM COMPANY WHERE companyName = name_co;
    v_companyNo company.companyno%type;
    v_companyName company.companyName%type;
    v_address company.address%type;
    v_startDate company.startDate%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName, v_address, v_startDate;
        EXIT WHEN c_company%NOTFOUND;
        
        DBMS_OUTPUT.PUT('Ma cong ty: ' || v_companyNo ||'. Ten cong ty: ' || v_companyName || '. Dia chi: ' || v_address || 
                                '. Ngay thanh lap: ' || v_startDate);
                                
        DECLARE
        CURSOR c_position IS SELECT P.positionNo, P.positionName, P.numberOfPersonnel, AVG(E.mark_co)
                                FROM BELONG B JOIN DEPARTMENT D ON B.departmentNo = D.departmentNo
                                                JOIN RECRUIT R ON D.departmentNo = R.departmentNo
                                                JOIN POSITION P ON R.positionNo = P.positionNo
                                                JOIN EVALUATE_CO E ON B.companyNo = E.companyNo
                                WHERE B.companyNo = v_companyNo
                                GROUP BY P.positionNo, P.positionName, P.numberOfPersonnel;
                                
        v_positionNo POSITION.positionNo%type;
        v_positionName POSITION.positionName%type;
        v_numberOfPersonnel POSITION.numberOfPersonnel%type;
        v_avg float;
        
        BEGIN
            OPEN c_position;
            LOOP
                FETCH c_position INTO v_positionNo, v_positionName, v_numberOfPersonnel, v_avg;
                EXIT WHEN c_position%NOTFOUND;
                
                IF c_position%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('. Ma vi tri: ' || v_positionNo || '. Ten vi tri: ' || v_positionName || 
                    '. So luong can:' || v_numberOfPersonnel || '. Diem trung binh: ' || v_avg);
                END IF;
            END LOOP;
            CLOSE c_position;
        END;
    END LOOP;
    CLOSE c_company;
END;


/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin ung vien		   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Applicant (name_apl APPLICANT.applicantName%type)
AS
    v_apl APPLICANT%ROWTYPE;
BEGIN
    SELECT * INTO v_apl
    FROM APPLICANT
    WHERE applicantName = name_apl;
    
    DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_apl.applicantNo || '. Ten ung vien: ' || v_apl.applicantName ||
                            '. CCCD: ' || v_apl.citizenid || '. Ngay sinh: ' || v_apl.dateofbirth || '. Gioi tinh: ' ||
                            v_apl.gender || '. Dia chi: ' || v_apl.address || '. SDT: ' || v_apl.phonenumber || 
                            '. Gmail: ' || v_apl.gmail || '. So tai khoan: ' || v_apl.accountid);
END;



/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin nha tuyen dung	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Interviewer (name_interviewer INTERVIEWER.interviewerName%type)
AS
    CURSOR c_interviewer IS SELECT  I.interviewerNo, I.interviewerName, I.phoneNumber, I.gmail, C.companyName 
                            FROM INTERVIEWER I JOIN COMPANY C ON I.companyNo = C.companyNo
                            WHERE I.interviewerName =  name_interviewer;
    v_interviewerNo INTERVIEWER.interviewerNo%type;
    v_interviewerName INTERVIEWER.interviewerName%type;
    v_phoneNumber INTERVIEWER.phoneNumber%type;
    v_gmail INTERVIEWER.gmail%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_interviewer;
    LOOP
        FETCH c_interviewer INTO v_interviewerNo, v_interviewerName, v_phoneNumber, v_gmail, v_companyName;
        EXIT WHEN c_interviewer%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma nha tuyen dung: ' || v_interviewerNo || '. Ten nha tuyen dung: ' || v_interviewerName ||
                                '. SDT: ' || v_phoneNumber || '. Gmail: ' || v_gmail || '. Ten cong ty: ' || v_companyName);
    END LOOP;
    CLOSE c_interviewer;
END;

/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin danh gia cong ty	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Evaluate_Company (name_co COMPANY.companyName%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName FROM COMPANY WHERE companyName = name_co;
    v_companyNo COMPANY.companyNo%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName;
        EXIT WHEN c_company%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Ten cong ty: ' || v_companyName);
        
        DECLARE
        CURSOR c_evaluate IS SELECT mark_co, comment_co, applicantNo FROM EVALUATE_CO WHERE companyNo = v_companyNo;
        v_mark_co EVALUATE_CO.mark_co%type;
        v_comment_co EVALUATE_CO.comment_co%type;
        v_applicantNo EVALUATE_CO.applicantNo%type;
        
        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_co, v_comment_co, v_applicantNo;
            EXIT WHEN c_evaluate%NOTFOUND;
            
            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Diem danh gia: ' || v_mark_co || '. Ghi chu: ' ||
                                        v_comment_co);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_company;
END;

/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin danh gia ung vien	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Evaluate_Applicant (name_apl APPLICANT.applicantName%type)
AS
    CURSOR c_applicant IS SELECT applicantNo, applicantName FROM APPLICANT WHERE applicantName = name_apl;
    v_applicantNo APPLICANT.applicantNo%type;
    v_applicantName APPLICANT.applicantName%type;
BEGIN
    OPEN c_applicant;
    LOOP
        FETCH c_applicant INTO v_applicantNo, v_applicantName;
        EXIT WHEN c_applicant%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Ten ung vien: ' || v_applicantName);
        
        DECLARE
        CURSOR c_evaluate IS SELECT mark_apl, comment_apl, companyNo FROM EVALUATE_APL WHERE applicantNo = v_applicantNo;
        v_mark_apl EVALUATE_APL.mark_apl%type;
        v_comment_apl EVALUATE_APL.comment_apl%type;
        v_companyNo EVALUATE_APL.companyNo%type;
        
        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_apl, v_comment_apl, v_companyNo;
            EXIT WHEN c_evaluate%NOTFOUND;
            
            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Diem danh gia: ' || v_mark_apl || '. Ghi chu: ' ||
                                        v_comment_apl);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_applicant;
END;



/*=========================================================*/
/*	PROCEDURRE: TRA CUU CAC PHONG BAN CONG TY 	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE pro_belong_company(companyNo_IN IN company.companyno%TYPE)
AS 
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM COMPANY WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);
        
        DECLARE
            -- Khoi tao con tro thu hai luu ma va ten phong ban 
            -- Dieu kien: Ma cong ty cua phong ban duoc luu boi con tro 2 phai bang ma cong ty cua con tro o tren
            CURSOR C_DEPARTMENT IS SELECT D.DepartmentNo, D.DepartmentName
                                   FROM COMPANY C JOIN BELONG B ON C.CompanyNo = B.CompanyNo
                                                  JOIN DEPARTMENT D ON B.DepartmentNo = D.DepartmentNo
                                   WHERE C.CompanyNo = Company_No;
            Depart_No DEPARTMENT.DepartmentNo%TYPE;
            Depart_Name DEPARTMENT.DepartmentName%TYPE;
        BEGIN
            OPEN C_DEPARTMENT;
            LOOP 
                FETCH C_DEPARTMENT INTO Depart_No, Depart_Name;
                EXIT WHEN C_DEPARTMENT%NOTFOUND;
                
                IF C_DEPARTMENT%FOUND THEN
                    
                    DBMS_OUTPUT.PUT_LINE('Ma phong ban: ' || Depart_No);
                    DBMS_OUTPUT.PUT_LINE('Ten phong ban: ' || Depart_Name);
                
                END IF;
            END LOOP;
            CLOSE C_DEPARTMENT;
        END;
        
    END LOOP;
    CLOSE C_COMPANY;
    
END;

/*=================================================================*/
/*	PROCEDURRE: TRA CUU CONG VIEC CONG TY DANG DANG TUYEN 	   */
===================================================================*/

CREATE OR REPLACE PROCEDURE proc_company_recruit (companyNo_IN IN company.companyno%TYPE)
AS
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM Company WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);
        
        DECLARE
            -- Khoi tao con tro luu du lieu ten cong viec va ma cong viec can tuyen
            -- Dieu kien: Ma cong ty tuyen cong viec do bang ma cua con tro o tren
            CURSOR C_POS IS SELECT P.PositionNo, P.PositionName 
                            FROM DEPARTMENT D JOIN BELONG B ON D.departmentNo = B.departmentNo 
                                  JOIN COMPANY C ON B.companyNo = C.companyNo
                                  JOIN RECRUIT R ON R.departmentNo = D.departmentNo
                                  JOIN POSITION P ON P.positionNo = R.positionNo
                            WHERE C.CompanyNo = Company_No; 
            Pos_No Position.PositionNo%TYPE;
            Pos_name Position.PositionName%TYPE;
        BEGIN                           
            OPEN C_POS;
            LOOP
                FETCH C_POS INTO Pos_No, Pos_Name;
                EXIT WHEN C_POS%NOTFOUND;

                IF C_POS%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma cong viec dang tuyen: ' || Pos_No);
                    DBMS_OUTPUT.PUT_LINE('Ten cong viec dang tuyen: ' || Pos_Name);
                END IF;
            END LOOP;
            CLOSE C_POS;
        END;
        
    END LOOP;
    CLOSE C_COMPANY;
END;

/*=================================================================*/
/*	PROCEDURRE: TRA CUU KY NANG UNG VIEN 	   		   */
===================================================================*/

CREATE OR REPLACE PROCEDURE proc_applicant_skill (ApplicantNo_In applicant.applicantno%TYPE)
AS
    -- Khoi tao con tro luu du lieu ma ung vien voi ma ung vien = ma ung vien truyen vao
    CURSOR C_APPLICANT IS SELECT ApplicantNo FROM APPLICANT WHERE ApplicantNo = ApplicantNo_In;
    Applicant_No APPLICANT.ApplicantNo%TYPE;
BEGIN
    OPEN C_APPLICANT;
    LOOP
        FETCH C_APPLICANT INTO Applicant_No;
        EXIT WHEN C_APPLICANT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || Applicant_No);
        
        DECLARE
            -- Khoi tao con tro luu du lieu cac ki nang cua ung vien
            -- Dieu kien: ma ung vien co ki nang nay phai bang ma ung vien duoc luu boi con tro o tren
            CURSOR C_SKILL IS SELECT S.SkillNo, S.SkillName
                              FROM APPLICANT A JOIN HAVE H ON A.ApplicantNo = H.ApplicantNo
                                               JOIN SKILL S ON H.SkillNo = S.SkillNo
                              WHERE A.ApplicantNo = Applicant_No;
            Skill_No SKILL.SkillNo%TYPE;
            Skill_Name SKILL.SkillName%TYPE;
        BEGIN
            OPEN C_SKILL;
            LOOP
                FETCH C_SKILL INTO Skill_No, Skill_Name;
                EXIT WHEN C_SKILL%NOTFOUND;
                
                IF C_SKILL%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma ky nang: ' || Skill_No);
                    DBMS_OUTPUT.PUT_LINE('Ky nang cua ung vien: ' || Skill_Name);
                END IF;
            END LOOP;
            CLOSE C_SKILL;
        END;
    END LOOP;
    CLOSE C_APPLICANT;
END;