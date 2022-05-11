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

--2. Bang COMPANY
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'SamSung', 'Quan 1', '2839157310','samsung@gmai.com.vn', TO_DATE('30/01/2007','dd/mm/yyyy'),1);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Intel', 'Phu Nhuan', '8437363000','Intel@gmai.com.vn', TO_DATE('21/02/2006','dd/mm/yyyy'),2);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Cocacola', 'Hai Phong', '0500233891','Cocacola@gmai.com.vn', TO_DATE('14/6/1996','dd/mm/yyyy'),3);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Petrolimex', 'Ha Noi', '1900363003','Petrolimex@gmai.com.vn', TO_DATE('22/6/2005','dd/mm/yyyy'),4);
INSERT INTO COMPANY VALUES (seq_companyid.nextval,'Viettel', 'Ha Noi', '18008098','Viettel@gmai.com.vn', TO_DATE('1/6/1989','dd/mm/yyyy'),5);

ALTER TABLE COMPANY ADD CONSTRAINT FK_COMPANY_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);