--Tao bang REQUIREMENT va khoa chinh
create table REQUIREMENT (
	requirementNo NUMBER NOT NULL,
  	requirementName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE REQUIREMENT ADD CONSTRAINT PK_REQUIREMENT PRIMARY KEY (requirementNo);

CREATE SEQUENCE seq_requirementid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--7. Bang REQUIREMENT
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Ke toan');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Quan ly du an');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Ngoai ngu');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Tin hoc van phong');
INSERT INTO REQUIREMENT VALUES (seq_requirementid.nextval,'Lanh dao');