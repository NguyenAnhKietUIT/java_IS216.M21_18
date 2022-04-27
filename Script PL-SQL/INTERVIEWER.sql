CREATE TABLE INTERVIEWER
(
	interviewerNo NUMBER NOT NULL,
	interviewerName VARCHAR2(30) NOT NULL,
	phoneNumber VARCHAR2(10),
	gmail VARCHAR2(30),
	companyNo NUMBER,
    accountID NUMBER
);

ALTER TABLE INTERVIEWER ADD CONSTRAINT PK_INTERVIEWER PRIMARY KEY (interviewerNo);

CREATE SEQUENCE seq_interviewid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Van A', '0378009008' , 'tranvana@gmai.com.vn', 1,6);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Van B', '0378989238', 'tranvanb@gmai.com.vn', 2,7);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Nguyen Minh C', '0378011108', 'nguyenminhc@gmai.com.vn', 3,8);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Luu Quoc A', '0378123097', 'luuquoca@gmai.com.vn', 4,9);
INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval,'Tran Minh D', '0374568088', 'tranminhd@gmai.com.vn', 5,10);

ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER FOREIGN KEY (companyNo) REFERENCES COMPANY (companyNo);
ALTER TABLE INTERVIEWER ADD CONSTRAINT FK_INTERVIEWER_ACCOUNT FOREIGN KEY (accountID) REFERENCES ACCOUNT (accountID);