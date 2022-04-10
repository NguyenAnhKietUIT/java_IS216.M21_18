CREATE TABLE COMPANY
(
	companyNo TINYINT IDENTITY(1,1) NOT NULL,
	companyName NVARCHAR(50) NOT NULL UNIQUE,
	address NVARCHAR(60),
	hotline CHAR(10),
	gmail VARCHAR(30),
	startDate smalldatetime 
)
ALTER TABLE COMPANY ADD CONSTRAINT PK_COMPANY PRIMARY KEY (companyNo)
GO

INSERT INTO COMPANY VALUES (N'SamSung', N'Quận 1', '2839157310','samsung@gmai.com.vn', '30/1/2007')
INSERT INTO COMPANY VALUES (N'Intel', N'Phú Nhuận', '8437363000','Intel@gmai.com.vn', '21/2/2006')
INSERT INTO COMPANY VALUES (N'Cocacola', N'Hải Phòng', '0500233891','Cocacola@gmai.com.vn', '14/6/1996')
INSERT INTO COMPANY VALUES (N'Petrolimex', N'Hà Nội', '1900363003','Petrolimex@gmai.com.vn', '22/6/2005')
INSERT INTO COMPANY VALUES (N'Viettel', N'Hà Nội', '18008098','Viettel@gmai.com.vn', '1/6/1989')
GO