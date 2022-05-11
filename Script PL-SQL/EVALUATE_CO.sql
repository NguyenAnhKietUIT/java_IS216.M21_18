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


ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo);
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK3_EVALUATE_CO FOREIGN KEY (interviewScheduleNo) REFERENCES INTERVIEW_SCHEDULE (interviewScheduleNo);
