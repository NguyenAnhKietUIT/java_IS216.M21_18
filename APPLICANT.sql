CREATE TABLE APPLICANT
(
	applicantNo TINYINT IDENTITY(1,1) NOT NULL,
	applicantName NVARCHAR(30),
	citizenID VARCHAR(12) UNIQUE,
	dateOfBirth SMALLDATETIME,
	gender TINYINT,
	address NVARCHAR(60),
	phoneNumber VARCHAR(10),
	gmail VARCHAR(30) UNIQUE,

	CHECK (gender BETWEEN 0 AND 1) --0 : Nam - 1 : Nu
)
ALTER TABLE APPLICANT ADD CONSTRAINT PK_APPLICANT PRIMARY KEY (applicantNo)
GO

INSERT INTO APPLICANT VALUES (N'Nguyễn Hoài Linh', '079202009176', '23/4/2002', 1, N'68/23 Đồng Đen', '070786884','linhhoainguyen2002@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Anh Kiệt', '079202005713', '21/7/2002', 1, N'76/3 Nguyễn Trãi', '0787264822','nguyenanhkiet2002@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Thành Phát', '079202067492', '7/9/2001', 1, N'11/6/8 Trương Công Định', '0387518022','thanhphatnguyen2001@gmail.com')
INSERT INTO APPLICANT VALUES (N'Nguyễn Thị Thảo Hồng', '079202001436', '11/3/1998', 0, N'227 Nguyễn Thị Minh Khai', '0275784426','thaohongnt2001@gmail.com')
INSERT INTO APPLICANT VALUES (N'Vũ Thị Phương Linh', '079202008648', '16/6/2001', 0, N'61 Đống Đa', '0909666371','vtplinh2k1@gmail.com')
INSERT INTO APPLICANT VALUES (N'Trần Thị Mỹ Nhung', '080202009171', '25/9/1999', 0, N'89 Nguyễn Văn Cừ', '0163787333','nhungtranthimy@gmail.com')
INSERT INTO APPLICANT VALUES (N'Trần Quốc Trung', '077202009679', '11/11/2000', 1, N'22/6 Nguyễn Bá Tòng', '0193882563','trungquoctran@gmail.com')
GO
