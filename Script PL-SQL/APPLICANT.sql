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

INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Hoai Linh', '079202009176', TO_DATE('23/04/2002','dd/mm/yyyy'), 1, '68/23 Dong Den', '070786884','linhhoainguyen2002@gmail.com',11);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Anh Kiet', '079202005713', TO_DATE('21/07/2002','dd/mm/yyyy'), 1, '76/3 Nguyen Trai', '0787264822','nguyenanhkiet2002@gmail.com',12);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Thanh Phat', '079202067492', TO_DATE('7/9/2001','dd/mm/yyyy'), 1, '11/6/8 Truong Cong Dinh', '0387518022','thanhphatnguyen2001@gmail.com',13);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Nguyen Thi Thao Hong', '079202001436', TO_DATE('11/3/1998','dd/mm/yyyy'), 0, '227 Nguyen Thi Minh Khai', '0275784426','thaohongnt2001@gmail.com',14);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Vu Thi Phuong Linh', '079202008648', TO_DATE('16/6/2001','dd/mm/yyyy'), 0, '61 Dong Da', '0909666371','vtplinh2k1@gmail.com',15);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Tran Thi My Nhung', '080202009171', TO_DATE('25/9/1999','dd/mm/yyyy'), 0, '89 Nguyen Van Cu', '0163787333','nhungtranthimy@gmail.com',16);
INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,'Tran Quoc Trung', '077202009679', TO_DATE('11/11/2000','dd/mm/yyyy'), 1, '22/6 Nguyen Ba Tong', '0193882563','trungquoctran@gmail.com',17);

ALTER TABLE APPLICANT ADD CONSTRAINT FK_APPLICANT_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);