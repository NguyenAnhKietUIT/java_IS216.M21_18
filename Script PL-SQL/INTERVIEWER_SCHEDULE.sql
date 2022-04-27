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

INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('15/01/2021','dd/mm/yyyy') , '71 Dinh Tien Hoang' , 0 , 20, 1);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/02/2021','dd/mm/yyyy'), TO_DATE('16/02/2021','dd/mm/yyyy') , '65/6 Ha Ton Quyen' , 1 , 18, 2);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('26/01/2021','dd/mm/yyyy'), TO_DATE('29/01/2021','dd/mm/yyyy') , '15 Nguyen Tri Phuong' , 0 , 20, 2);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('14/01/2021','dd/mm/yyyy') , '72 Ho Tung Mau' , 0 , 20, 4);
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('21/03/2021','dd/mm/yyyy'), TO_DATE('24/03/2021','dd/mm/yyyy') , '79/5/1 Nguyen Thai Hoc' , 0 , 20, 5);


ALTER TABLE INTERVIEW_SCHEDULE ADD CONSTRAINT FK_INTERVIEW_SCHEDULE FOREIGN KEY (interviewerNo) REFERENCES INTERVIEWER (interviewerNo);
