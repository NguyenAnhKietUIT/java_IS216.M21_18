CREATE TABLE EVALUATE_CO
(
	companyNo TINYINT NOT NULL,
	applicantNo TINYINT NOT NULL,
	point TINYINT,
	comment NVARCHAR(2000)
)
ALTER TABLE EVALUATE_CO ADD CONSTRAINT PK_EVALUATE_CO PRIMARY KEY (companyNo, applicantNo)
GO

INSERT INTO EVALUATE_CO VALUES (1, 1, 5, N'Công ty có cơ sở vật chất tốt')
INSERT INTO EVALUATE_CO VALUES (1, 5, 4, N'Công ty uy tín')
INSERT INTO EVALUATE_CO VALUES (2, 2, 4, N'Môi trường thân thiện')
INSERT INTO EVALUATE_CO VALUES (2, 3, 4, N'Công ty đón tiếp chu đáo')
INSERT INTO EVALUATE_CO VALUES (3, 1, 4, N'Công ty uy tín')
INSERT INTO EVALUATE_CO VALUES (3, 4, 5, N'Công ty cung cấp đầy đủ thông tin về công việc')
INSERT INTO EVALUATE_CO VALUES (4, 2, 3, N'Công ty không hỏi đúng trọng tâm công việc')
INSERT INTO EVALUATE_CO VALUES (4, 3, 5, N'Công ty uy tín, rất đáng để làm việc')
INSERT INTO EVALUATE_CO VALUES (5, 2, 2, N'Công ty thiếu chuyên nghiệp, phỏng vấn xơ xài')
INSERT INTO EVALUATE_CO VALUES (5, 5, 4, N'Tuyệt vời')
GO

ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK1_EVALUATE_CO FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo)
ALTER TABLE EVALUATE_CO ADD CONSTRAINT FK2_EVALUATE_CO FOREIGN KEY (applicantNo) REFERENCES APPLICANT (applicantNo)
GO