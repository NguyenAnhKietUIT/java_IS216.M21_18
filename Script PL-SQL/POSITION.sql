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

--5. Bang POSITION
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong nhan su');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Quan ly phong ke toan');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Truong ban bao ve');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Editor');
INSERT INTO POSITION VALUES (seq_positionid.nextval,'Nhan vien ve sinh');