create table POSITION(
	positionNo NUMBER NOT NULL,
  	positionName VARCHAR2(30) NOT NULL UNIQUE,
  	numberOfPersonnel NUMBER
);
ALTER TABLE POSITION ADD CONSTRAINT PK_POSITION PRIMARY KEY (positionNo);

CREATE SEQUENCE seq_positionid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong nhan su', 1);
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong ke toan', 1);
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Truong ban bao ve', 1);
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Editor', 3);
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Nhan vien ve sinh', 5);