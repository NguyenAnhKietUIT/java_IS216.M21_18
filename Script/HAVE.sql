CREATE TABLE HAVE
(
	skillNo TINYINT NOT NULL,
	applicantNo TINYINT NOT NULL,
	level TINYINT,
	yearsOfExperience TINYINT,

	CHECK (level BETWEEN 1 AND 6)
)
ALTER TABLE HAVE ADD CONSTRAINT PK_HAVE PRIMARY KEY (skillNo, applicantNo)
GO

INSERT INTO HAVE VALUES (1, 3, 4, 5)
INSERT INTO HAVE VALUES (2, 2, 3, 3)
INSERT INTO HAVE VALUES (3, 4, 2, 1)
INSERT INTO HAVE VALUES (4, 5, 5, 8)
INSERT INTO HAVE VALUES (5, 1, 1, 1)
GO

ALTER TABLE HAVE ADD CONSTRAINT FK1_HAVE FOREIGN KEY (skillNo) REFERENCES SKILL(skillNo)
ALTER TABLE HAVE ADD CONSTRAINT FK2_HAVE FOREIGN KEY (applicantNo) REFERENCES APPLICANT(applicantNo)
GO