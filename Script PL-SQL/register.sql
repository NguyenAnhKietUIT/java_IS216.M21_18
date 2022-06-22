--Tao bang REGISTER 
CREATE TABLE REGISTER
(
	interviewScheduleNo NUMBER NOT NULL,
	applicantNo NUMBER NOT NULL,
	departmentNo NUMBER NOT NULL,
	positionNo NUMBER NOT NULL,
	status NUMBER,
	CHECK (status BETWEEN 0 AND 4)
		-- 0: Da dang ky
		-- 1: Da huy dang ky
		-- 2: Da hoan thanh
		-- 3: Khong tham gia
		-- 4: Da duoc nhan vao lam
);

--Khoa chinh
ALTER TABLE REGISTER ADD CONSTRAINT PK_REGISTER PRIMARY KEY (interviewScheduleNo, applicantNo, departmentNo, positionNo);

--Khoa ngoai
ALTER TABLE REGISTER ADD CONSTRAINT FK1_REGISTER FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK2_REGISTER FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK3_REGISTER FOREIGN KEY (positionNo) REFERENCES POSITION (positionNo);
ALTER TABLE REGISTER ADD CONSTRAINT FK4_REGISTER FOREIGN KEY (departmentNo) REFERENCES DEPARTMENT (departmentNo);

--Du lieu
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
