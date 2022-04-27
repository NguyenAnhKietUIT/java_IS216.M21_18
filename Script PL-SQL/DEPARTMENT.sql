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

INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Phong nhan su', NULL);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Phong ke toan', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Quan ly du an', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Bao ve', NUll);
INSERT INTO DEPARTMENT VALUES (seq_departmentid.nextval,'Ke toan thue', NUll);