--------------------------------------------------------
--  DDL for Sequence SEQ_ACCOUNTID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_ACCOUNTID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_APPLICANTID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_APPLICANTID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_COMPANYID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_COMPANYID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_DEPARTMENTID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_DEPARTMENTID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_INTERVIEWID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_INTERVIEWID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_POSITIONID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_POSITIONID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_REQUIREMENTID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_REQUIREMENTID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_SCHEDULEID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SCHEDULEID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Sequence SEQ_SKILLID
--------------------------------------------------------

   CREATE SEQUENCE  "SEQ_SKILLID"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL;
--------------------------------------------------------
--  DDL for Table ACCOUNT
--------------------------------------------------------

  CREATE TABLE "ACCOUNT" ("ACCOUNTID" NUMBER, "USERNAME" VARCHAR2(20), "PASSWORD" VARCHAR2(50), "ROLE" VARCHAR2(20));
--------------------------------------------------------
--  DDL for Table APPLICANT
--------------------------------------------------------

  CREATE TABLE "APPLICANT" ("APPLICANTNO" NUMBER, "APPLICANTNAME" VARCHAR2(30), "CITIZENID" VARCHAR2(12), "DATEOFBIRTH" DATE, "GENDER" NUMBER, "ADDRESS" VARCHAR2(60), "PHONENUMBER" VARCHAR2(10), "GMAIL" VARCHAR2(30), "ACCOUNTID" NUMBER);
--------------------------------------------------------
--  DDL for Table COMPANY
--------------------------------------------------------

  CREATE TABLE "COMPANY" ("COMPANYNO" NUMBER, "COMPANYNAME" VARCHAR2(50), "ADDRESS" VARCHAR2(60), "HOTLINE" VARCHAR2(10), "GMAIL" VARCHAR2(30), "STARTDATE" DATE, "ACCOUNTID" NUMBER);
--------------------------------------------------------
--  DDL for Table DEPARTMENT
--------------------------------------------------------

  CREATE TABLE "DEPARTMENT" ("DEPARTMENTNO" NUMBER, "DEPARTMENTNAME" VARCHAR2(30));
--------------------------------------------------------
--  DDL for Table EVALUATE_APL
--------------------------------------------------------

  CREATE TABLE "EVALUATE_APL" ("COMPANYNO" NUMBER, "APPLICANTNO" NUMBER, "INTERVIEWSCHEDULENO" NUMBER, "MARK_APL" NUMBER, "COMMENT_APL" VARCHAR2(2000));
--------------------------------------------------------
--  DDL for Table EVALUATE_CO
--------------------------------------------------------

  CREATE TABLE "EVALUATE_CO" ("COMPANYNO" NUMBER, "APPLICANTNO" NUMBER, "INTERVIEWSCHEDULENO" NUMBER, "MARK_CO" NUMBER, "COMMENT_CO" VARCHAR2(2000));
--------------------------------------------------------
--  DDL for Table HAVE
--------------------------------------------------------

  CREATE TABLE "HAVE" ("SKILLNO" NUMBER, "APPLICANTNO" NUMBER, "LEVEL_APL" NUMBER, "YEARSOFEXPERIENCE" NUMBER);
--------------------------------------------------------
--  DDL for Table INTERVIEWER
--------------------------------------------------------

  CREATE TABLE "INTERVIEWER" ("INTERVIEWERNO" NUMBER, "INTERVIEWERNAME" VARCHAR2(30), "PHONENUMBER" VARCHAR2(10), "GMAIL" VARCHAR2(30), "COMPANYNO" NUMBER, "ACCOUNTID" NUMBER);
--------------------------------------------------------
--  DDL for Table INTERVIEW_SCHEDULE
--------------------------------------------------------

  CREATE TABLE "INTERVIEW_SCHEDULE" ("INTERVIEWSCHEDULENO" NUMBER, "STARTTIME" DATE, "ENDTIME" DATE, "LOCATION" VARCHAR2(60), "STATUS" NUMBER, "SLOT" NUMBER, "INTERVIEWERNO" NUMBER);
--------------------------------------------------------
--  DDL for Table POSITION
--------------------------------------------------------

  CREATE TABLE "POSITION" ("POSITIONNO" NUMBER, "POSITIONNAME" VARCHAR2(30));
--------------------------------------------------------
--  DDL for Table RECRUIT
--------------------------------------------------------

  CREATE TABLE "RECRUIT" ("COMPANYNO" NUMBER, "DEPARTMENTNO" NUMBER, "POSITIONNO" NUMBER, "NUMBEROFPERSONNEL" NUMBER);
--------------------------------------------------------
--  DDL for Table REGISTER
--------------------------------------------------------

  CREATE TABLE "REGISTER" ("INTERVIEWSCHEDULENO" NUMBER, "APPLICANTNO" NUMBER, "DEPARTMENTNO" NUMBER, "POSITIONNO" NUMBER, "STATUS" NUMBER);
--------------------------------------------------------
--  DDL for Table REQUIRE
--------------------------------------------------------

  CREATE TABLE "REQUIRE" ("POSITIONNO" NUMBER, "REQUIREMENTNO" NUMBER, "LEVEL_RE" NUMBER, "YEARSOFEXPERIENCE" NUMBER);
--------------------------------------------------------
--  DDL for Table REQUIREMENT
--------------------------------------------------------

  CREATE TABLE "REQUIREMENT" ("REQUIREMENTNO" NUMBER, "REQUIREMENTNAME" VARCHAR2(50));
--------------------------------------------------------
--  DDL for Table SKILL
--------------------------------------------------------

  CREATE TABLE "SKILL" ("SKILLNO" NUMBER, "SKILLNAME" VARCHAR2(50));
REM INSERTING into ACCOUNT

--------------------------------------------------------
--  Constraints for Table ACCOUNT
--------------------------------------------------------

  ALTER TABLE "ACCOUNT" MODIFY ("ACCOUNTID" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT" MODIFY ("USERNAME" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT" MODIFY ("PASSWORD" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT" MODIFY ("ROLE" NOT NULL ENABLE);
  ALTER TABLE "ACCOUNT" ADD UNIQUE ("USERNAME") USING INDEX  ENABLE;
  ALTER TABLE "ACCOUNT" ADD CONSTRAINT "PK_ACC" PRIMARY KEY ("ACCOUNTID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table APPLICANT
--------------------------------------------------------

  ALTER TABLE "APPLICANT" MODIFY ("APPLICANTNO" NOT NULL ENABLE);
  ALTER TABLE "APPLICANT" ADD CHECK (gender BETWEEN 0 AND 1) ENABLE;
  ALTER TABLE "APPLICANT" ADD UNIQUE ("CITIZENID") USING INDEX  ENABLE;
  ALTER TABLE "APPLICANT" ADD UNIQUE ("GMAIL") USING INDEX  ENABLE;
  ALTER TABLE "APPLICANT" ADD CONSTRAINT "PK_APPLICANT" PRIMARY KEY ("APPLICANTNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table COMPANY
--------------------------------------------------------

  ALTER TABLE "COMPANY" MODIFY ("COMPANYNO" NOT NULL ENABLE);
  ALTER TABLE "COMPANY" MODIFY ("COMPANYNAME" NOT NULL ENABLE);
  ALTER TABLE "COMPANY" ADD UNIQUE ("COMPANYNAME") USING INDEX  ENABLE;
  ALTER TABLE "COMPANY" ADD CONSTRAINT "PK_COMPANY" PRIMARY KEY ("COMPANYNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table DEPARTMENT
--------------------------------------------------------

  ALTER TABLE "DEPARTMENT" MODIFY ("DEPARTMENTNO" NOT NULL ENABLE);
  ALTER TABLE "DEPARTMENT" MODIFY ("DEPARTMENTNAME" NOT NULL ENABLE);
  ALTER TABLE "DEPARTMENT" ADD UNIQUE ("DEPARTMENTNAME") USING INDEX  ENABLE;
  ALTER TABLE "DEPARTMENT" ADD CONSTRAINT "PK_DEPARTMENT" PRIMARY KEY ("DEPARTMENTNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVALUATE_APL
--------------------------------------------------------

  ALTER TABLE "EVALUATE_APL" MODIFY ("COMPANYNO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_APL" MODIFY ("APPLICANTNO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_APL" MODIFY ("INTERVIEWSCHEDULENO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_APL" ADD CHECK (mark_apl BETWEEN 1 AND 5) ENABLE;
  ALTER TABLE "EVALUATE_APL" ADD CONSTRAINT "PK_EVALUATE_APL" PRIMARY KEY ("COMPANYNO", "APPLICANTNO", "INTERVIEWSCHEDULENO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table EVALUATE_CO
--------------------------------------------------------

  ALTER TABLE "EVALUATE_CO" MODIFY ("COMPANYNO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_CO" MODIFY ("APPLICANTNO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_CO" MODIFY ("INTERVIEWSCHEDULENO" NOT NULL ENABLE);
  ALTER TABLE "EVALUATE_CO" ADD CHECK (mark_co BETWEEN 1 AND 5) ENABLE;
  ALTER TABLE "EVALUATE_CO" ADD CONSTRAINT "PK_EVALUATE_CO" PRIMARY KEY ("COMPANYNO", "APPLICANTNO", "INTERVIEWSCHEDULENO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table HAVE
--------------------------------------------------------

  ALTER TABLE "HAVE" MODIFY ("SKILLNO" NOT NULL ENABLE);
  ALTER TABLE "HAVE" MODIFY ("APPLICANTNO" NOT NULL ENABLE);
  ALTER TABLE "HAVE" ADD CHECK (level_apl BETWEEN 1 AND 6) ENABLE;
  ALTER TABLE "HAVE" ADD CONSTRAINT "PK_HAVE" PRIMARY KEY ("SKILLNO", "APPLICANTNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table INTERVIEWER
--------------------------------------------------------

  ALTER TABLE "INTERVIEWER" MODIFY ("INTERVIEWERNO" NOT NULL ENABLE);
  ALTER TABLE "INTERVIEWER" MODIFY ("INTERVIEWERNAME" NOT NULL ENABLE);
  ALTER TABLE "INTERVIEWER" ADD CONSTRAINT "PK_INTERVIEWER" PRIMARY KEY ("INTERVIEWERNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table INTERVIEW_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "INTERVIEW_SCHEDULE" MODIFY ("INTERVIEWSCHEDULENO" NOT NULL ENABLE);
  ALTER TABLE "INTERVIEW_SCHEDULE" ADD CHECK (status BETWEEN 0 AND 2) ENABLE;
  ALTER TABLE "INTERVIEW_SCHEDULE" ADD CONSTRAINT "PK_INTERVIEW_SCHEDULE" PRIMARY KEY ("INTERVIEWSCHEDULENO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table POSITION
--------------------------------------------------------

  ALTER TABLE "POSITION" MODIFY ("POSITIONNO" NOT NULL ENABLE);
  ALTER TABLE "POSITION" MODIFY ("POSITIONNAME" NOT NULL ENABLE);
  ALTER TABLE "POSITION" ADD UNIQUE ("POSITIONNAME") USING INDEX  ENABLE;
  ALTER TABLE "POSITION" ADD CONSTRAINT "PK_POSITION" PRIMARY KEY ("POSITIONNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table RECRUIT
--------------------------------------------------------

  ALTER TABLE "RECRUIT" MODIFY ("COMPANYNO" NOT NULL ENABLE);
  ALTER TABLE "RECRUIT" MODIFY ("DEPARTMENTNO" NOT NULL ENABLE);
  ALTER TABLE "RECRUIT" MODIFY ("POSITIONNO" NOT NULL ENABLE);
  ALTER TABLE "RECRUIT" ADD CONSTRAINT "PK_RECRUIT" PRIMARY KEY ("COMPANYNO", "DEPARTMENTNO", "POSITIONNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REGISTER
--------------------------------------------------------

  ALTER TABLE "REGISTER" MODIFY ("INTERVIEWSCHEDULENO" NOT NULL ENABLE);
  ALTER TABLE "REGISTER" MODIFY ("APPLICANTNO" NOT NULL ENABLE);
  ALTER TABLE "REGISTER" MODIFY ("DEPARTMENTNO" NOT NULL ENABLE);
  ALTER TABLE "REGISTER" MODIFY ("POSITIONNO" NOT NULL ENABLE);
  ALTER TABLE "REGISTER" ADD CHECK (status BETWEEN 0 AND 4) ENABLE;
  ALTER TABLE "REGISTER" ADD CONSTRAINT "PK_REGISTER" PRIMARY KEY ("INTERVIEWSCHEDULENO", "APPLICANTNO", "DEPARTMENTNO", "POSITIONNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REQUIRE
--------------------------------------------------------

  ALTER TABLE "REQUIRE" MODIFY ("POSITIONNO" NOT NULL ENABLE);
  ALTER TABLE "REQUIRE" MODIFY ("REQUIREMENTNO" NOT NULL ENABLE);
  ALTER TABLE "REQUIRE" ADD CHECK (level_Re BETWEEN 1 AND 6) ENABLE;
  ALTER TABLE "REQUIRE" ADD CONSTRAINT "PK_REQUIRE" PRIMARY KEY ("POSITIONNO", "REQUIREMENTNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table REQUIREMENT
--------------------------------------------------------

  ALTER TABLE "REQUIREMENT" MODIFY ("REQUIREMENTNO" NOT NULL ENABLE);
  ALTER TABLE "REQUIREMENT" MODIFY ("REQUIREMENTNAME" NOT NULL ENABLE);
  ALTER TABLE "REQUIREMENT" ADD UNIQUE ("REQUIREMENTNAME") USING INDEX  ENABLE;
  ALTER TABLE "REQUIREMENT" ADD CONSTRAINT "PK_REQUIREMENT" PRIMARY KEY ("REQUIREMENTNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table SKILL
--------------------------------------------------------

  ALTER TABLE "SKILL" MODIFY ("SKILLNO" NOT NULL ENABLE);
  ALTER TABLE "SKILL" MODIFY ("SKILLNAME" NOT NULL ENABLE);
  ALTER TABLE "SKILL" ADD UNIQUE ("SKILLNAME") USING INDEX  ENABLE;
  ALTER TABLE "SKILL" ADD CONSTRAINT "PK_SKILL" PRIMARY KEY ("SKILLNO") USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table APPLICANT
--------------------------------------------------------

  ALTER TABLE "APPLICANT" ADD CONSTRAINT "FK_APPLICANT_ACCOUNT" FOREIGN KEY ("ACCOUNTID") REFERENCES "ACCOUNT" ("ACCOUNTID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table COMPANY
--------------------------------------------------------

  ALTER TABLE "COMPANY" ADD CONSTRAINT "FK_COMPANY_ACCOUNT" FOREIGN KEY ("ACCOUNTID") REFERENCES "ACCOUNT" ("ACCOUNTID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVALUATE_APL
--------------------------------------------------------

  ALTER TABLE "EVALUATE_APL" ADD CONSTRAINT "FK1_EVALUATE_APL" FOREIGN KEY ("COMPANYNO") REFERENCES "COMPANY" ("COMPANYNO") ENABLE;
  ALTER TABLE "EVALUATE_APL" ADD CONSTRAINT "FK2_EVALUATE_APL" FOREIGN KEY ("APPLICANTNO") REFERENCES "APPLICANT" ("APPLICANTNO") ENABLE;
  ALTER TABLE "EVALUATE_APL" ADD CONSTRAINT "FK3_EVALUATE_APL" FOREIGN KEY ("INTERVIEWSCHEDULENO") REFERENCES "INTERVIEW_SCHEDULE" ("INTERVIEWSCHEDULENO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EVALUATE_CO
--------------------------------------------------------

  ALTER TABLE "EVALUATE_CO" ADD CONSTRAINT "FK1_EVALUATE_CO" FOREIGN KEY ("COMPANYNO") REFERENCES "COMPANY" ("COMPANYNO") ENABLE;
  ALTER TABLE "EVALUATE_CO" ADD CONSTRAINT "FK2_EVALUATE_CO" FOREIGN KEY ("APPLICANTNO") REFERENCES "APPLICANT" ("APPLICANTNO") ENABLE;
  ALTER TABLE "EVALUATE_CO" ADD CONSTRAINT "FK3_EVALUATE_CO" FOREIGN KEY ("INTERVIEWSCHEDULENO") REFERENCES "INTERVIEW_SCHEDULE" ("INTERVIEWSCHEDULENO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table HAVE
--------------------------------------------------------

  ALTER TABLE "HAVE" ADD CONSTRAINT "FK1_HAVE" FOREIGN KEY ("SKILLNO") REFERENCES "SKILL" ("SKILLNO") ENABLE;
  ALTER TABLE "HAVE" ADD CONSTRAINT "FK2_HAVE" FOREIGN KEY ("APPLICANTNO") REFERENCES "APPLICANT" ("APPLICANTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INTERVIEWER
--------------------------------------------------------

  ALTER TABLE "INTERVIEWER" ADD CONSTRAINT "FK_INTERVIEWER" FOREIGN KEY ("COMPANYNO") REFERENCES "COMPANY" ("COMPANYNO") ENABLE;
  ALTER TABLE "INTERVIEWER" ADD CONSTRAINT "FK_INTERVIEWER_ACCOUNT" FOREIGN KEY ("ACCOUNTID") REFERENCES "ACCOUNT" ("ACCOUNTID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table INTERVIEW_SCHEDULE
--------------------------------------------------------

  ALTER TABLE "INTERVIEW_SCHEDULE" ADD CONSTRAINT "FK_INTERVIEW_SCHEDULE" FOREIGN KEY ("INTERVIEWERNO") REFERENCES "INTERVIEWER" ("INTERVIEWERNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RECRUIT
--------------------------------------------------------

  ALTER TABLE "RECRUIT" ADD CONSTRAINT "FK1_RECRUIT" FOREIGN KEY ("COMPANYNO") REFERENCES "COMPANY" ("COMPANYNO") ENABLE;
  ALTER TABLE "RECRUIT" ADD CONSTRAINT "FK2_RECRUIT" FOREIGN KEY ("DEPARTMENTNO") REFERENCES "DEPARTMENT" ("DEPARTMENTNO") ENABLE;
  ALTER TABLE "RECRUIT" ADD CONSTRAINT "FK3_RECRUIT" FOREIGN KEY ("POSITIONNO") REFERENCES "POSITION" ("POSITIONNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REGISTER
--------------------------------------------------------

  ALTER TABLE "REGISTER" ADD CONSTRAINT "FK1_REGISTER" FOREIGN KEY ("INTERVIEWSCHEDULENO") REFERENCES "INTERVIEW_SCHEDULE" ("INTERVIEWSCHEDULENO") ENABLE;
  ALTER TABLE "REGISTER" ADD CONSTRAINT "FK2_REGISTER" FOREIGN KEY ("APPLICANTNO") REFERENCES "APPLICANT" ("APPLICANTNO") ENABLE;
  ALTER TABLE "REGISTER" ADD CONSTRAINT "FK3_REGISTER" FOREIGN KEY ("POSITIONNO") REFERENCES "POSITION" ("POSITIONNO") ENABLE;
  ALTER TABLE "REGISTER" ADD CONSTRAINT "FK4_REGISTER" FOREIGN KEY ("DEPARTMENTNO") REFERENCES "DEPARTMENT" ("DEPARTMENTNO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REQUIRE
--------------------------------------------------------

  ALTER TABLE "REQUIRE" ADD CONSTRAINT "FK1_REQUIRE" FOREIGN KEY ("POSITIONNO") REFERENCES "POSITION" ("POSITIONNO") ENABLE;
  ALTER TABLE "REQUIRE" ADD CONSTRAINT "FK2_REQUIRE" FOREIGN KEY ("REQUIREMENTNO") REFERENCES "REQUIREMENT" ("REQUIREMENTNO") ENABLE;

Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (1,'samsung','samsungcongty123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (2,'intel','intelcongty123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (3,'cocacola','cocacola123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (4,'petrolimex','petrolimex123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (5,'viettel','viettel123','Công ty');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (6,'fpt','fptcongty123','Công ty');

Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (7,'tranvan','vana123','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (8,'tranvbao','vanbao123','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (9,'nguyenmcong','cong1234','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (10,'luuqanh','quocanh1234','Nhà tuyển dụng');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (11,'tranmdang','dang1234','Nhà tuyển dụng');

Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (12,'thaohong','thaohong123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (13,'thanhphat','thanhphat123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (14,'hoailinh','hoailinh123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (15,'anhkiet','anhkiet123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (16,'mynhung','mynhung123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (17,'phuonglinh','phuonglinh123','Ứng viên');
Insert into ACCOUNT (ACCOUNTID,USERNAME,PASSWORD,ROLE) values (18,'quoctrung','quoctrung123','Ứng viên');
REM INSERTING into APPLICANT
SET DEFINE OFF;
Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (4,'Nguyễn Thị Thảo Hồng','079202001436',to_date('11-MAR-98','DD-MON-RR'),0,'227 Nguyễn Thị Minh Khai','0275784426','thaohongnt2001@gmail.com',12);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (3,'Nguyễn Thành Phát','079202067492',to_date('07-SEP-01','DD-MON-RR'),1,'11/6/8 Trương Công Định','0387518022','thanhphatnguyen2001@gmail.com',13);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (1,'Nguyễn Hoài Linh','079202009176',to_date('23-APR-02','DD-MON-RR'),1,'68/23 Đồng Đen','070786884','linhhoainguyen2002@gmail.com',14);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (2,'Nguyễn Anh Kiệt','079202005713',to_date('21-JUL-02','DD-MON-RR'),1,'76/3 Nguyễn Trãi','0787264822','nguyenanhkiet2002@gmail.com',15);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (6,'Trần Thị Mỹ Nhung','080202009171',to_date('25-SEP-99','DD-MON-RR'),0,'89 Nguyễn Văn Cừ','0163787333','nhungtranthimy@gmail.com',16);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (5,'Vũ Thị Phương Linh','079202008648',to_date('16-JUN-01','DD-MON-RR'),0,'61 Đống Đa','0909666371','vtplinh2k1@gmail.com',17);

Insert into APPLICANT (APPLICANTNO,APPLICANTNAME,CITIZENID,DATEOFBIRTH,GENDER,ADDRESS,PHONENUMBER,GMAIL,ACCOUNTID) values (7,'Trần Quốc Trung','077202009679',to_date('11-NOV-00','DD-MON-RR'),1,'22/6 Nguyễn Bá Tòng','0193882563','trungquoctran@gmail.com',18);
REM INSERTING into COMPANY
SET DEFINE OFF;
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (1,'SamSung','Quận 1','2839157310','samsung@gmai.com.vn',to_date('30-JAN-07','DD-MON-RR'),1);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (2,'Intel','Phú Nhuận','8437363000','Intel@gmai.com.vn',to_date('21-FEB-06','DD-MON-RR'),2);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (3,'Cocacola','Hải Phòng','0500233891','Cocacola@gmai.com.vn',to_date('14-JUN-96','DD-MON-RR'),3);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (4,'Petrolimex','Hà Nội','1900363003','Petrolimex@gmai.com.vn',to_date('22-JUN-05','DD-MON-RR'),4);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (5,'Viettel','Hà Nội','18008098','Viettel@gmai.com.vn',to_date('01-JUN-89','DD-MON-RR'),5);
Insert into COMPANY (COMPANYNO,COMPANYNAME,ADDRESS,HOTLINE,GMAIL,STARTDATE,ACCOUNTID) values (6,'FPT','TP HCM','0962636481','fpt@gmai.com.vn',to_date('03-JUN-89','DD-MON-RR'),6);

REM INSERTING into DEPARTMENT
SET DEFINE OFF;
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (1,'Phòng nhân sự');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (2,'Phòng kế toán');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (3,'Quản lý dự án');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (4,'Bảo vệ');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (5,'Kế toán thuế');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (6,'Phòng hành chính');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (7,'Phong Marketing');
REM INSERTING into EVALUATE_APL
SET DEFINE OFF;
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (21,22,41,5,'Ứng viên trung thực');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (21,23,43,4,'Ứng viên chưa có nhiều kinh nghiệm');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,22,42,4,'Ứng viên hơi lúng túng');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,24,42,5,'Ứng viên có thực lực');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,25,43,5,'Kỹ năng chuyên môn cao');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,24,44,3,'Không chuẩn bị chu đáo');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,25,42,3,'Thiếu kinh nghiệm chuyên môn');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,26,41,3,'Còn nhiều thiếu sót');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,29,65,5,'Kỹ năng giao tiếp tốt');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,30,66,5,'Kỹ năng giao tiếp kém');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,31,67,5,'Thụ động trong trả lời câu hỏi');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,27,70,2,'Kỹ năng giao tiếp kém, thụ động');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,28,71,2,'Kỹ năng giao tiếp tốt');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,29,75,2,'Kỹ năng giao tiếp kém, thụ động');

Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (26,25,75,4,'Có nhiều trải nghiệm');
Insert into EVALUATE_APL (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (26,26,76,4,'Kinh nghiệm làm việc phong phú');

SET DEFINE OFF;
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (21,22,41,5,'Công ty đón tiếp chu đón');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (21,23,43,4,'Cơ sở vật chất tốt');

Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,22,42,4,'Công ty có nhiều tiện nghi');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,24,42,5,'Công ty có nhiều khu vực giải trí');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (22,25,43,5,'Lương thưởng tốt');

Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,24,44,3,'Câu hỏi công ty còn chưa thực tế');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,25,42,3,'Nhiều khu vực công ty còn sơ sài');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (23,26,41,4,'Công ty có nhiều phòng ban ');

Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,29,65,5,'Công ty đẹp');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,30,66,5,'Thuận lợi cho việc di chuyển');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (24,31,67,5,'Công ty có hỗ trợ làm việc tại nhá');

Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,27,70,2,'Công ty tiếp đón còn kém');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,28,71,2,'Không có hướng dẫn rõ ràng về công việc');
Insert into EVALUATE_CO(COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_APL,COMMENT_APL) values (25,29,75,2,'Thông tin tuyển dụng còn chưa thực tế');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (26,25,75,4,'Công ty uy tín');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (27,26,65,3,'Công ty hỏi đúng trọng tâm công việc nhưng còn hơi sơ sài');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (28,25,65,5,'Thông tin công việc đầy đủ');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (29,30,67,5,'Công ty uy tín, đáng để làm việc');

Insert into EVALUATE_CO (COMPANYNO,APPLICANTNO,INTERVIEWSCHEDULENO,MARK_CO,COMMENT_CO) values (30,25,42,4,'Tuyệt vời');
REM INSERTING into HAVE
SET DEFINE OFF;
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,4,5,3);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,3,4,5);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (2,2,3,3);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (3,4,2,1);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (4,5,5,8);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (5,1,1,1);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (1,1,3,5);
Insert into HAVE (SKILLNO,APPLICANTNO,LEVEL_APL,YEARSOFEXPERIENCE) values (21,1,3,4);
REM INSERTING into INTERVIEWER
SET DEFINE OFF;
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (1,'Trần Văn An','0378009008','tranvanan@gmai.com.vn',1,7);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (2,'Trần Văn Bảo','0378989238','tranvanbao@gmai.com.vn',2,8);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (3,'Nguyễn Minh Công','0378011108','nguyenminhcong@gmai.com.vn',3,9);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (4,'Lưu Quốc Anh','0378123097','luuquocanh@gmai.com.vn',4,10);
Insert into INTERVIEWER (INTERVIEWERNO,INTERVIEWERNAME,PHONENUMBER,GMAIL,COMPANYNO,ACCOUNTID) values (5,'Trần Minh Đăng','0374568088','tranminhdang@gmai.com.vn',5,11);
REM INSERTING into INTERVIEW_SCHEDULE
SET DEFINE OFF;
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (1,to_date('13-JAN-21','DD-MON-RR'),to_date('15-JAN-21','DD-MON-RR'),'71 Đinh Tiên Hoàng',0,15,1);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (2,to_date('13-FEB-21','DD-MON-RR'),to_date('16-FEB-21','DD-MON-RR'),'65/6 Hà Tôn Quyền',1,17,2);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (3,to_date('26-JAN-21','DD-MON-RR'),to_date('29-JAN-21','DD-MON-RR'),'15 Nguyễn Tri Phương',0,18,2);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (4,to_date('13-JAN-21','DD-MON-RR'),to_date('14-JAN-21','DD-MON-RR'),'72 Ho Tung Mau',0,19,4);
Insert into INTERVIEW_SCHEDULE (INTERVIEWSCHEDULENO,STARTTIME,ENDTIME,LOCATION,STATUS,SLOT,INTERVIEWERNO) values (5,to_date('21-MAR-21','DD-MON-RR'),to_date('24-MAR-21','DD-MON-RR'),'79/5/1 Nguyen Thai Hoc',0,20,5);
REM INSERTING into POSITION
SET DEFINE OFF;
Insert into POSITION (POSITIONNO,POSITIONNAME) values (1,'Quản lý phòng nhân sự');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (2,'Quản lý phòng kế toán');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (3,'Truong ban bao ve');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (4,'Editor');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (5,'Nhân viên vệ sinh');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (6,'Trưởng phòng hành chính');
Insert into POSITION (POSITIONNO,POSITIONNAME) values (7,'Trưởng phòng Marketing');
REM INSERTING into RECRUIT
SET DEFINE OFF;
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (1,1,5,3);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (1,6,6,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (2,2,3,0);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (2,2,4,2);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (4,4,3,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (4,7,7,1);
Insert into RECRUIT (COMPANYNO,DEPARTMENTNO,POSITIONNO,NUMBEROFPERSONNEL) values (5,5,2,1);
REM INSERTING into REGISTER
SET DEFINE OFF;
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,1,1,5,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,3,1,5,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (1,5,1,5,3);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (2,2,2,3,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (2,3,2,4,4);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,1,2,4,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,3,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,4,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (3,5,2,3,1);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (4,2,4,3,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (4,3,4,3,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (5,2,5,2,0);
Insert into REGISTER (INTERVIEWSCHEDULENO,APPLICANTNO,DEPARTMENTNO,POSITIONNO,STATUS) values (5,5,5,2,0);
REM INSERTING into REQUIRE
SET DEFINE OFF;
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (1,3,2,null);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (2,1,5,4);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (5,4,6,null);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (4,5,3,2);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (3,2,4,1);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (6,5,5,4);
Insert into REQUIRE (POSITIONNO,REQUIREMENTNO,LEVEL_RE,YEARSOFEXPERIENCE) values (7,5,5,6);
REM INSERTING into REQUIREMENT
SET DEFINE OFF;
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (1,'Kế toán');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (2,'Quản lý dự án');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (3,'Ngoại ngữ');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (4,'Tin học văn phong');
Insert into REQUIREMENT (REQUIREMENTNO,REQUIREMENTNAME) values (5,'Lãnh đạo');
REM INSERTING into SKILL
SET DEFINE OFF;
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Ngoại ngữ');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Tin học văn phòng');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Reporting');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Quản lý dự án');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Researching');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Tiếp thu kiến thức mới nhanh');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Hoạt động nhóm tốt');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Có khả năng lãnh đạo');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Làm việc nhóm tốt');
Insert into SKILL (SKILLNO,SKILLNAME) values (seq_skillID.nextval,'Có khả năng tự học cao');

--------------------------------------------------------
--  DDL for Trigger STATUS_REGISTER
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "trigger_status_register" 
BEFORE UPDATE
ON REGISTER
FOR EACH ROW
DECLARE
    slg int := 0;
    companyNo_v company.companyNo%TYPE;
    SlotInItvs NUMBER := 0;
    startTime_v interview_schedule.startTime%TYPE;
BEGIN
    select i.companyNo into companyNo_v
    from interview_schedule intv join interviewer i on intv.interviewerNo = i.interviewerNo
    where intv.interviewScheduleNo = :OLD.interviewScheduleNo;
    select numberofpersonnel into slg
    from recruit 
    WHERE positionNo = :OLD.positionNo and departmentNo = :OLD.departmentNo and companyno = companyNo_v;

    ------Nhan vao lam
    if :NEW.status = 4
    then
        if slg > 0
        then
            update recruit 
            set numberofpersonnel = numberofpersonnel - 1
            where companyno = companyNo_v and departmentNo = :OLD.departmentNO and positionNo = :OLD.positionNo;
        else
            RAISE_APPLICATION_ERROR(-20000, 'Da nhan du so luong');
        end if;
     end if;

    -------Khong tham gia 
    IF :NEW.status = 3 THEN
        INSERT INTO EVALUATE_APL VALUES (companyNo_v, :OLD.APPLICANTNO, :OLD.interviewScheduleNo, 1, 'Khong tham gia');
    END IF;

    --------Huy dang ky
    IF :NEW.status = 1 
    THEN 
        SELECT Slot INTO SlotInItvs
        FROM INTERVIEW_SCHEDULE
        WHERE interviewScheduleNo = :OLD.interviewScheduleNo;

    -- BAT DAU CAP NHAT
        IF SlotInItvs >= 20 THEN
            Raise_Application_Error(-20011, 'MOT LICH CHI CO 20 UNG VIEN DUOC DANG KY');
        ELSE 
            select startTime into startTime_v
            from INTERVIEW_SCHEDULE
            WHERE interviewScheduleNo = :OLD.interviewScheduleNo;
            
            IF TO_DATE(startTime_v,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy') > 1
            THEN
                UPDATE INTERVIEW_SCHEDULE S
                SET slot = slot + 1
                WHERE S.interviewScheduleNo = :OLD.interviewScheduleNo;
            ELSE
                RAISE_APPLICATION_ERROR(-20000, 'UNG VIEN CHI CO THE HUY LICH TRUOC 1 NGAY');
            END IF;
        END IF;
    END IF;
END;
ALTER TRIGGER "trigger_status_register" ENABLE;



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

--------------------------------------------------------
--  DDL for Trigger INTERVIEW_SLOT
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "INTERVIEW_SLOT" 
BEFORE INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN    
    IF (:NEW.slot > 20)
    THEN
        RAISE_APPLICATION_ERROR(-20000, 'MOT LICH CHI CO TOI DA 20 UNG VIEN');
    END IF;
END;
ALTER TRIGGER "INTERVIEW_SLOT" ENABLE;
/*========================================================= 
	TRIGGER 11: DIEM UY TIN NHO HON 3 => UNG VIEN CHI CO THE DK 3 LICH PHONG VAN
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
        RAISE_APPLICATION_ERROR(-20000, 'DIEM UY TIN NHO HON 3 KHONG THE DANG KY THEM');
	end if;
end;
/*========================================================= 
	TRIGGER 12:HUY LICH PHONG VAN TRE NHAT 1 NGAY
===========================================================*/
CREATE OR REPLACE TRIGGER Cancel_Schedule
BEFORE UPDATE
ON REGISTER
FOR EACH ROW
DECLARE 
	ID INTERVIEW_SCHEDULE.interviewerNo%TYPE;
BEGIN
	IF :NEW.STATUS = 1
	THEN
    		SELECT (ISC.interviewerNo) into ID
		FROM INTERVIEW_SCHEDULE ISC
		WHERE ISC.interviewScheduleNo = :OLD.interviewScheduleNo
                AND (( TO_DATE(ISC.startTime,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy')) <= 1);

		IF  (ID is null)
    		THEN
        		RAISE_APPLICATION_ERROR(-20000, 'UNG VIEN CHI CO THE HUY LICH TRUOC 1 NGAY');
		END IF;
	END IF;
END;

/*========================================================= 
	TRIGGER 13: TAI 1 THOI DIEM UNG VIEN KHONG THE DK PHONG VAN TAI NHIEU CONG TY
===========================================================*/
create OR replace trigger RegistInterview_CheckDate
Before insert 
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
                        where applicantNo_n = existed.applicantNo
                        and ((them.startTime >= existed.startTime and them.startTime <= existed.endTime) 
                        or (them.startTime < existed.startTime and them.endTime >= existed.startTime))
                        and them.companyNo <> existed.companyNo)
            then 1
            else 0 
        end into flag
    from dual;

    if flag = 1
    then
        RAISE_APPLICATION_ERROR(-20000, 'Ung vien khong the dang ky lich phong van cho nhieu cong ty tai mot thoi diem');
    end if;
end;

--------------------------------------------------------
--  DDL for Trigger TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE" 
BEFORE INSERT 
ON INTERVIEW_SCHEDULE
for each row
DECLARE
    flag number(1);
    SlotInItvs NUMBER := 0;
BEGIN
        SELECT CASE 
            WHEN EXISTS ( SELECT * FROM INTERVIEW_SCHEDULE
                          WHERE InterviewerNo = :NEW.InterviewerNo 
                                AND :NEW.interviewScheduleNo <> interviewScheduleNo
                                AND ( :NEW.STARTTIME >= STARTTIME AND :NEW.STARTTIME <= ENDTIME) 
                                OR  ( :NEW.STARTTIME < STARTTIME AND :NEW.ENDTIME >= STARTTIME))
            THEN 1
            ELSE 0 
        END INTO flag FROM dual;
        IF FLAG = 1
        THEN
            Raise_Application_Error(-20011, 'BAN DA CO LICH NGAY HOM DO ROI');
        END IF;


END;
ALTER TRIGGER "TRIGGER_SCHEDULE_NOTSAME_INTERVIEWSCHEDULE" ENABLE;

/*========================================================= 
        TRIGGER: KHI DANG KY
    	DIEU KIEN: CAP NHAT LAI SLOT TRONG INTERVIEW_SCHEDULE
===========================================================*/
CREATE OR REPLACE TRIGGER trigger_minus_regis_slot 
BEFORE INSERT
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


/*=======================================================================================================================================================*/
/*									PROCEDURE									                                                                         */
/*=======================================================================================================================================================*/



/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: ACCOUNT						                    */
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: COMPANY						                    */
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

CREATE OR REPLACE PROCEDURE proc_update_comp(companyNo_old COMPANY.companyno%TYPE,
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
    WHERE companyNo = companyNo_old;
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: DEPARTMENT					                    */
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_dep( departmentName_new department.departmentname%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO DEPARTMENT(departmentNo, departmentName) 
        VALUES(seq_departmentid.nextval,departmentName_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_dep(departmentName_old department.departmentname%TYPE,
                                                departmentName_update department.departmentname%TYPE)
AS
BEGIN
    UPDATE DEPARTMENT
    SET departmentName= departmentName_update
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: HAVE						                        */
/*==============================================================*/

--------------------------------------------------------
--  DDL for Procedure PROC_DELETE_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_HAVE" (skillName_in SKILL.skillName%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE)
AS
    skillNo_in SKILL.skillno%TYPE;
BEGIN
        select skillNo into skillNo_in
        from skill
        where skillname = skillname_in;

        DELETE HAVE 
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        COMMIT;
END;
--------------------------------------------------------
--  DDL for Procedure PROC_INSERT_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_HAVE" (skillName_new SKILL.skillName%TYPE,
                                            applicantNo_new HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
    skillNo_new skill.skillno%type;
    flag number(1);
BEGIN
    select case 
        when exists (select * from skill where skillname = skillname_new)
        then 1
        else 0
    end into flag
    from dual;

    if flag =  0
    Then 
        proc_insert_skill(skillname_new);

        Select skillno into skillno_new 
        From skill where skillname = skillname_new;

        Insert into have values (skillno_new, applicantno_new, level_apl_new, yearsOfExperience_new);
    Else
        Select skillno into skillno_new 
        From skill where skillname = skillname_new;

        Insert into have values (skillno_new, applicantno_new, level_apl_new, yearsOfExperience_new);
    End if;
    COMMIT;
END;

--------------------------------------------------------
--  DDL for Procedure PROC_UPDATE_HAVE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_HAVE" (skillName_new SKILL.skillName%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
    skillNo_new SKILL.skillno%TYPE;
BEGIN
        select skillNo into skillNo_new
        from skill
        where skillname = skillname_new;

        UPDATE HAVE 
        SET level_apl = level_apl_new, yearsOfExperience = yearsOfExperience_new
        WHERE skillNo = skillNo_new and applicantNo = applicantNo_in;

        COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: REGISTER						                    */
/*==============================================================*/


---------------------- INSERT--------------------------
CREATE OR REPLACE PROCEDURE proc_insert_register(interviewScheduleNo_new REGISTER.interviewScheduleNo%TYPE,
                                                 applicantNo_new REGISTER.applicantNo%TYPE,
                                                 departmentNo_new REGISTER.departmentNo%TYPE,
                                                 positionNo_new REGISTER.positionNo%TYPE,
                                                 status_new REGISTER.status%TYPE)
AS
BEGIN
        INSERT INTO REGISTER
        VALUES(interviewScheduleNo_new, applicantNo_new, departmentNo_new, positionNo_new, status_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                                 applicantNo_in REGISTER.applicantNo%TYPE,
                                                 departmentNo_in REGISTER.departmentNo%TYPE,
                                                 positionNo_in REGISTER.positionNo%TYPE,
                                                 status_new REGISTER.status%TYPE)
AS
BEGIN
        UPDATE REGISTER
        SET status = status_new
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in and departmentNo = departmentNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                                 departmentNo_in REGISTER.departmentNo%TYPE,
                                                 applicantNo_in REGISTER.applicantNo%TYPE,
                                                 positionNo_in REGISTER.positionNo%TYPE)
AS
BEGIN
        DELETE REGISTER
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and departmentNo = departmentNo_in and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: EVALUATE_CO					                    */
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
        VALUES(companyNo_new, applicantNo_new, scheduleNo_new, mark_co_new, comment_co_new);
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
        SET interviewScheduleNo = scheduleNo_new, mark_co = mark_co_new, comment_co = comment_co_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_evaluate_co(companyNo_in EVALUATE_CO.companyNo%TYPE,
                                                    applicantNo_in EVALUATE_CO.applicantNo%TYPE,
                                                    interviewScheduleNo_in EVALUATE_CO.interviewScheduleNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_CO
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in and interviewScheduleNo = interviewScheduleNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: EVALUATE_APL					                    */
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
                                            applicantNo_in EVALUATE_APL.applicantNo%TYPE,
                                            interviewScheduleNo_in EVALUATE_APL.interviewscheduleno%TYPE)
AS
BEGIN
        DELETE EVALUATE_APL
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in and interviewscheduleno = interviewScheduleNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;
/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: POSITION      					                */
/*==============================================================*/
---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_position( PosName_New POSITION.PositionName%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO POSITION(PositionNo, PositionName) 
        VALUES(seq_positionid.nextval,PosName_New);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
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
/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: RECRUIT						                    */
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_recruit(CompanyNo_New Recruit.companyNo%TYPE,
                                                DepartNo_New Recruit.departmentNo%TYPE,
                                                PosNo_New Recruit.positionNo%TYPE,
                                                NoOfPerson Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
    INSERT INTO RECRUIT(companyNo, departmentNo, positionNo, numberofpersonnel)
    VALUES (CompanyNo_New, DepartNo_New, PosNo_New, NoOfPerson);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;



---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_recruit(Company_No Recruit.companyNo%TYPE,
                                                Depart_No Recruit.departmentNo%TYPE,
                                                Pos_No Recruit.positionNo%TYPE)
IS
BEGIN    
    -- XOA DU LIEU
    DELETE FROM RECRUIT
    WHERE DepartmentNo = Depart_No AND PositionNo = Pos_No AND companyNo = Company_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Du lieu khonng ton tai');
    COMMIT;
END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_recruit(CompanyNo_Old Recruit.companyNo%TYPE,
                                                DepartNo_Old RECRUIT.departmentNo%TYPE,
                                                PosNo_Old RECRUIT.positionNo%TYPE,
                                                DepartNo_Update RECRUIT.departmentNo%TYPE,
                                                PosNo_Update RECRUIT.positionNo%TYPE,
                                                NoOfPerson_Update Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
   UPDATE RECRUIT
   SET departmentNo = DepartNo_Update, positionNo = PosNo_Update, NumberOfPersonnel = NoOfPerson_Update
   WHERE CompanyNo = CompanyNo_Old AND departmentNo = DepartNo_Old AND positionNo = PosNo_Old;
   DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: REQUIREMENT					                    */
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

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: REQUIRE						                    */
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

/*==============================================================*/
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: INTERVIEWER 					                    */
/*==============================================================*/

-------------------------INSERT----------------------------------
CREATE OR REPLACE PROCEDURE proc_insert_interviewer(v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
	IF v_companyNo = 0
	THEN
		INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, null, v_accountID);
	ELSE	
		INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, v_companyNo, v_accountID);
	END IF;
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: INTERVIEW_SCHEDULE				                */
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_interview_schedule( v_startTime interview_schedule.starttime%type,
                                                            v_endTime interview_schedule.endtime%type,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,v_startTime, v_endTime , v_location , v_status , v_slot, v_interviewerNo);
    COMMIT;
END;

-------------------------UPDATE----------------------------
CREATE OR REPLACE PROCEDURE proc_update_interview_schedule( v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE,
                                                            v_startTime interview_schedule.starttime%type,
                                                            v_endTime interview_schedule.endtime%type,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    UPDATE INTERVIEW_SCHEDULE
    SET startTime = v_startTime,
        endTime = v_endTime,
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: APPLICANT						                    */
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
                                                    v_dateOfBirth APPLICANT.dateOfBirth%TYPE,
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
        dateOfBirth = v_dateOfBirth,
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
/*      PROCEDURE: THEM XOA SUA                                 */
/*      BANG: SKILL						*/
/*==============================================================*/

-------------------------INSERT----------------------------------

  CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_SKILL" (v_skillName SKILL.skillName%TYPE)
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
CREATE OR REPLACE PROCEDURE proc_delete_skill(v_skillNo SKILL.skillNo%TYPE)
AS
BEGIN
    DELETE FROM SKILL
    WHERE skillNo = v_skillNo;
    COMMIT;
END;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_DEPARTMENT_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in RECRUIT.DEPARTMENTNO%TYPE)
AS
BEGIN
    DELETE FROM RECRUIT
    WHERE companyNo = companyNo_in and departmentno = departmentNo_in;

    DELETE FROM REGISTER
    WHERE departmentno = departmentNo_in and interviewscheduleNo in (select its.interviewScheduleNo
									from interview_schedule its join interviewer i 
										on its.interviewerNo = i.interviewerNo
									where i.companyNo =  companyNo_in);
    COMMIT;
END;


CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_DEPARTMENT_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentName_new DEPARTMENT.DEPARTMENTNAME%TYPE,
                                            positionName_new POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    departmentNo_new department.departmentNo%TYPE;
    positionNo_new position.positionNo%TYPE;
    flag_department number(1);
    flag_position number(1);
BEGIN
   select case 
        when exists (select * from department where departmentname = departmentName_new)
        then 1
        else 0
    end into flag_department
    from dual;

    if flag_department =  0
    Then 
        proc_insert_dep(departmentName_new);

        Select departmentNo into departmentNo_new
        From department where departmentname = departmentname_new;
    Else
        Select departmentNo into departmentNo_new
        From department where departmentname = departmentname_new;
    End if;
    
    select case 
        when exists (select * from position where positionname = positionName_new)
        then 1
        else 0
    end into flag_position
    from dual;

    if flag_position =  0
    Then 
        proc_insert_position(positionName_new);

        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    Else
        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    End if;
    
    Insert into recruit values (companyNo_in, departmentNo_new, positionNo_new, numberOfPersonnel_new);  
    COMMIT;
END;


CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_INSERT_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_new POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    positionNo_new position.positionNo%TYPE;
    flag_position number(1);
BEGIN
    select case 
        when exists (select * from position where positionname = positionName_new)
        then 1
        else 0
    end into flag_position
    from dual;

    if flag_position =  0
    Then 
        proc_insert_position(positionName_new);

        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    Else
        Select positionNo into positionNo_new
        From position where positionname = positionname_new;
    End if;
    
    Insert into recruit values (companyNo_in, departmentNo_in, positionNo_new, numberOfPersonnel_new);  
    COMMIT;
END;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_DELETE_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_in POSITION.POSITIONNAME%TYPE)
AS
    positionNo_in position.positionNo%TYPE;
BEGIN
    Select positionNo into positionNo_in
    From position where positionname = positionname_in;

    DELETE FROM RECRUIT 
    WHERE companyno = companyNo_in and departmentNo = departmentNo_in and positionNo = positionNo_in;
    COMMIT;
END;

CREATE OR REPLACE NONEDITIONABLE PROCEDURE "PROC_UPDATE_POSITION_OF_RECRUIT" (companyNo_in RECRUIT.COMPANYNO%TYPE,
                                            departmentNo_in DEPARTMENT.DEPARTMENTNO%TYPE,
                                            positionName_in POSITION.POSITIONNAME%TYPE,
                                            numberOfPersonnel_new recruit.numberofpersonnel%TYPE)
AS
    positionNo_in position.positionNo%TYPE;
BEGIN
    Select positionNo into positionNo_in
    From position where positionname = positionname_in;

    UPDATE RECRUIT 
    SET numberOfPersonnel = numberOfPersonnel_new
    WHERE companyno = companyNo_in and departmentNo = departmentNo_in and positionNo = positionNo_in;
    COMMIT;
END;

