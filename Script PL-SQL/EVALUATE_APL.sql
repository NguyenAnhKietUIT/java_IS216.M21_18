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

ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK1_EVALUATE_APL FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK2_EVALUATE_APL FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_APL ADD CONSTRAINT FK3_EVALUATE_APL FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);

