--Tao bang DEPARTMENT va khoa chinh
CREATE TABLE DEPARTMENT
(
	departmentNo NUMBER NOT NULL,
	departmentName VARCHAR2(30) NOT NULL UNIQUE,
);
ALTER TABLE DEPARTMENT ADD CONSTRAINT PK_DEPARTMENT PRIMARY KEY (departmentNo);

--Du lieu
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (1,'Phòng nhân sự');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (2,'Phòng kế toán');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (3,'Quản lý dự án');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (4,'Bảo vệ');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (5,'Kế toán thuế');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (6,'Phòng hành chính');
Insert into DEPARTMENT (DEPARTMENTNO,DEPARTMENTNAME,DESCRIBE) values (7,'Phong Marketing');