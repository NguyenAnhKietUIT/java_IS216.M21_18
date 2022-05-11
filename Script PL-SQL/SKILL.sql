--Tao bang SKILL va khoa chinh
create table SKILL (
	skillNo NUMBER NOT NULL,
  	skillName VARCHAR2(50) NOT NULL UNIQUE
);

ALTER TABLE SKILL ADD CONSTRAINT PK_SKILL PRIMARY KEY (skillNo);

CREATE SEQUENCE seq_skillid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

--12. Bang SKILL
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Ngoai ngu');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Tin hoc van phong');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Reporting');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Quan ly du an');
INSERT INTO SKILL VALUES (seq_skillid.nextval,'Researching');