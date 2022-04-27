CREATE TABLE ACCOUNT (
	accountID	NUMBER NOT NULL,
	userName	VARCHAR2(20) NOT NULL UNIQUE,
	password	VARCHAR2(50) NOT NULL,
	role	 	VARCHAR2(20) NOT NULL
);
ALTER TABLE ACCOUNT ADD CONSTRAINT PK_ACC PRIMARY KEY (AccountID);

CREATE SEQUENCE seq_accountid
MINVALUE 1
START WITH 1
INCREMENT BY 1;

INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'samsung','s123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'intel','i123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'cocacola','c123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'petrolimex','p123','Cong ty');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'viettel','v123','Cong ty');	
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranva','a123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranvb','b123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'nguyenmc','c123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'luuqa','a1234','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'tranmd','d123','Nha tuyen dung');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'thaohong','thaohong123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'thanhphat','thanhphat123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'hoailinh','hoailinh123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'anhkiet','anhkiet123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'mynhung','mynhung123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'phuonglinh','phuonglinh123','Ung vien');
INSERT INTO ACCOUNT VALUES(seq_accountid.nextval,'quoctrung','quoctrung123','Ung vien');