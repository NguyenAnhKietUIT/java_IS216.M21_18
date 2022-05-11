/*=======================================================================================================================================================*/
/*									PROCEDURE									 */
/*=======================================================================================================================================================*/



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: ACCOUNT						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_account( userName_new ACCOUNT.username%TYPE,
                                             password_new ACCOUNT.password%TYPE,
                                             role_new ACCOUNT.role%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO ACCOUNT(accountID, userName,password,role) 
        VALUES(seq_accountid.nextval,userName_new,password_new,role_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_account(userName_OLD IN ACCOUNT.username%TYPE,
                                                userName_update IN ACCOUNT.username%TYPE,
                                                password_update ACCOUNT.password%TYPE,
                                                role_update ACCOUNT.role%TYPE)
AS
BEGIN
    UPDATE ACCOUNT
    SET userName = userName_update, password = password_update, role =role_update
    WHERE userName=userName_OLD;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_account(userName_dlt IN ACCOUNT.username%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(accountID) INTO NumberOfEffect
    FROM Account
    WHERE userName = userName_dlt;
    -- XOA DU LIEU
    DELETE FROM Account
    WHERE userName = userName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: COMPANY						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_comp(companyName_new COMPANY.companyname%TYPE,
                                             address_new  company.address%TYPE,
                                             hotline_new company.hotline%TYPE,
                                             gmail_new COMPANY.gmail%TYPE,
                                             startDate_new COMPANY.startdate%TYPE,
                                             accountID_new company.accountid%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO COMPANY(companyNo,companyName,address,hotline,gmail,startDate,accountID) 
        VALUES(seq_companyid.nextval,companyName_new,address_new,hotline_new,gmail_new,startDate_new,accountID_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_comp(companyName_old COMPANY.companyname%TYPE,
                                             companyName_update COMPANY.companyname%TYPE,
                                             address_update  company.address%TYPE,
                                             hotline_update company.hotline%TYPE,
                                             gmail_update COMPANY.gmail%TYPE,
                                             startDate_update COMPANY.startdate%TYPE,
                                             accountID_update company.accountid%TYPE)
AS
BEGIN
    UPDATE COMPANY
    SET companyName = companyName_update, address = address_update, hotline =hotline_update,gmail=gmail_update,startDate=startDate_update,accountID=accountID_update
    WHERE companyName = companyName_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_comp(companyName_dlt IN COMPANY.companyname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(companyNo) INTO NumberOfEffect
    FROM COMPANY
    WHERE companyName = companyName_dlt;
    -- XOA DU LIEU
    DELETE FROM COMPANY
    WHERE companyName = companyName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: DEPARTMENT					*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_dep( departmentName_new department.departmentname%TYPE,
                                             describe_new department.describe%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO DEPARTMENT(departmentNo, departmentName,describe) 
        VALUES(seq_departmentid.nextval,departmentName_new,describe_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;



---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_dep(departmentName_old department.departmentname%TYPE,
                                                departmentName_update department.departmentname%TYPE,
                                                describe_update department.describe%TYPE)
AS
BEGIN
    UPDATE DEPARTMENT
    SET departmentName= departmentName_update, describe = describe_update
    WHERE departmentName=departmentName_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_dep(departmentName_dlt IN department.departmentname%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(departmentNo) INTO NumberOfEffect
    FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;
    -- XOA DU LIEU
    DELETE FROM DEPARTMENT
    WHERE departmentName = departmentName_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: BELONG						*/
/*==============================================================*/

---------------------------INSERT---------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_belong( departmentNo_new BELONG.departmentno%TYPE,
                                                companyNo_new BELONG.companyNo%TYPE)                                             
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO BELONG(departmentNo, companyNo) 
        VALUES(departmentNo_new,companyNo_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------------UPDATE---------------------------------

CREATE OR REPLACE PROCEDURE proc_update_belong(departmentNo_old belong.departmentno%TYPE,
                                                departmentNo_update belong.departmentno%TYPE,
                                                companyNo_update belong.companyno%TYPE)
AS
BEGIN
    UPDATE BELONG
    SET departmentNo= departmentNo_update, companyNo = companyNo_update
    WHERE departmentNo=departmentNo_old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;


---------------------------DELETE---------------------------------

CREATE OR REPLACE PROCEDURE proc_delete_dep(departmentNo_dlt IN belong.departmentno%TYPE)
AS
    NumberOfEffect NUMBER:=0;
BEGIN
    -- DEM SO DONG ANH HUONG
    SELECT COUNT(departmentNo) INTO NumberOfEffect
    FROM BELONG
    WHERE departmentNo = departmentNo_dlt;
    -- XOA DU LIEU
    DELETE FROM BELONG
    WHERE departmentNo = departmentNo_dlt;
    
    -- THONG BAO
    IF(NumberOfEffect <> 0) THEN
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai!');
    END IF;
    COMMIT;
END;




/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: HAVE						*/
/*==============================================================*/

---------------------- INSERT--------------------------
CREATE OR REPLACE PROCEDURE proc_insert_have(skillNo_new HAVE.skillNo%TYPE,
                                            applicantNo_new HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
BEGIN
        INSERT INTO HAVE 
        VALUES(skillNo_new, applicantNo_new, level_apl_new, yearsOfExperience_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

---------------------UPDATE---------------------------
CREATE OR REPLACE PROCEDURE proc_update_have(skillNo_in HAVE.skillNo%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE,
                                             level_apl_new HAVE.level_apl%TYPE,
                                             yearsOfExperience_new HAVE.yearsOfExperience%TYPE)
AS
BEGIN
        UPDATE HAVE 
        SET level_apl = level_apl_new, yearsOfExperience = yearsOfExperience_new
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_have(skillNo_in HAVE.skillNo%TYPE,
                                            applicantNo_in HAVE.applicantNo%TYPE)
AS
BEGIN
        DELETE HAVE 
        WHERE skillNo = skillNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;



/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REGISTER						*/
/*==============================================================*/


---------------------- INSERT--------------------------
CREATE OR REPLACE PROCEDURE proc_insert_register(interviewScheduleNo_new REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_new REGISTER.applicantNo%TYPE,
                                             positionNo_new REGISTER.positionNo%TYPE,
                                             status_new REGISTER.status%TYPE)
AS
BEGIN
        INSERT INTO REGISTER
        VALUES(interviewScheduleNo_new, applicantNo_new, positionNo_new, status_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_in REGISTER.applicantNo%TYPE,
                                             positionNo_in REGISTER.positionNo%TYPE,
                                             status_new REGISTER.status%TYPE)
AS
BEGIN
        UPDATE REGISTER
        SET status = status_new
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_register(interviewScheduleNo_in REGISTER.interviewScheduleNo%TYPE,
                                            applicantNo_in REGISTER.applicantNo%TYPE,
                                             positionNo_in REGISTER.positionNo%TYPE)
AS
BEGIN
        DELETE REGISTER
        WHERE interviewScheduleNo = interviewScheduleNo_in and applicantNo = applicantNo_in
        and positionNo = positionNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: EVALUATE_CO					*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_evaluate_co(companyNo_new EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_new EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_CO
        VALUES(companyNo_new, applicantNo_new scheduleNo_new, mark_co_new, comment_co_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_evaluate_co(companyNo_in EVALUATE_CO.companyNo%TYPE,
                                            	    applicantNo_in EVALUATE_CO.applicantNo%TYPE,
						    scheduleNo_new  EVALUATE_CO.interviewScheduleNo%TYPE,
                                                    mark_co_new EVALUATE_CO.mark_co%TYPE,
                                                    comment_co_new EVALUATE_CO.comment_co%TYPE)
AS
BEGIN
        UPDATE EVALUATE_CO
        SET interviewScheduleNo = scheduleNo_new,mark_co = mark_co_new, comment_co = comment_co_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_evaluate_co(companyNo_in EVALUATE_CO.companyNo%TYPE,
                                                    applicantNo_in EVALUATE_CO.applicantNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_CO
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: EVALUATE_APL					*/
/*==============================================================*/

---------------------- INSERT-------------------------

CREATE OR REPLACE PROCEDURE proc_insert_evaluate_apl(companyNo_new EVALUATE_APL.companyNo%TYPE,
                                            	     applicantNo_new EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        INSERT INTO EVALUATE_APL
        VALUES(companyNo_new, applicantNo_new, scheduleNo_new, mark_apl_new, comment_apl_new);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_evaluate_apl(companyNo_in EVALUATE_APL.companyNo%TYPE,
                                                     applicantNo_in EVALUATE_APL.applicantNo%TYPE,
						     scheduleNo_new  EVALUATE_APL.interviewScheduleNo%TYPE,
                                                     mark_apl_new EVALUATE_APL.mark_apl%TYPE,
                                                     comment_apl_new EVALUATE_APL.comment_apl%TYPE)
AS
BEGIN
        UPDATE EVALUATE_APL
        SET interviewScheduleNo = scheduleNo_new, mark_apl = mark_apl_new, comment_apl = comment_apl_new
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Sua thanh cong!');
        COMMIT;
END;
---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_evaluate_apl(companyNo_in EVALUATE_APL.companyNo%TYPE,
                                            applicantNo_in EVALUATE_APL.applicantNo%TYPE)
AS
BEGIN
        DELETE EVALUATE_APL
        WHERE companyNo = companyNo_in and applicantNo = applicantNo_in;
        DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
        COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: POSITION      					*/
/*==============================================================*/
---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_position( PosName_New POSITION.PositionName%TYPE)
AS
BEGIN
        -- THEM DU LIEU MOI
        INSERT INTO POSITION(PositionNo, PositionName) 
        VALUES(seq_positionid.CURRVAL,PosName_New);
        DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
        COMMIT;
END;

BEGIN
proc_insert_position('Thiet ke database');
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_position(PosNo IN Position.PositionNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM POSITION
    WHERE positionNo = PosNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;

BEGIN
proc_delete_position(10);  
END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_position(PosNo_Old POSITION.PositionNo%TYPE,
                                            PosName_Update POSITION.PositionName%TYPE)
AS
BEGIN
    UPDATE POSITION 
    SET PositionName = PosName_Update
    WHERE PositionNo = PosNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Ma vi tri khong ton tai');
END;

BEGIN proc_update_pos(5,'Thiet ke database'); END;

SELECT * FROM POSITION;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: RECRUIT						*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_recruit(DepartNo_New Recruit.departmentNo%TYPE,
                                                PosNo_New Recruit.positionNo%TYPE,
                                                NoOfPerson Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
    INSERT INTO RECRUIT(departmentNo, positionNo, numberofpersonnel)
    VALUES (DepartNo_New, PosNo_New, NoOfPerson);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;

BEGIN proc_insert_recruit(5,2,2); END;


---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_recruit(Depart_No Recruit.departmentNo%TYPE,
                                                Pos_No Recruit.positionNo%TYPE)
IS
BEGIN    
    -- XOA DU LIEU
    DELETE FROM RECRUIT
    WHERE DepartmentNo = Depart_No AND PositionNo = Pos_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN
        DBMS_OUTPUT.PUT_LINE('Du lieu khonng ton tai');
    COMMIT;
END;

BEGIN proc_delete_recruit(5,2); END;
---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_recruit(DepartNo_Old RECRUIT.departmentNo%TYPE,
                                                PosNo_Old RECRUIT.positionNo%TYPE,
                                                DepartNo_Update RECRUIT.departmentNo%TYPE,
                                                PosNo_Update RECRUIT.positionNo%TYPE,
                                                NoOfPerson_Update Recruit.NumberOfPersonnel%TYPE)
IS
BEGIN
   UPDATE RECRUIT
   SET departmentNo = DepartNo_Update, positionNo = PosNo_Update, NumberOfPersonnel = NoOfPerson_Update
   WHERE departmentNo = DepartNo_Old AND positionNo = PosNo_Old;
   DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong');
END;

BEGIN proc_update_recruit(2,5,5,2,5); END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REQUIREMENT					*/
/*==============================================================*/

---------------------- INSERT-------------------------
CREATE OR REPLACE PROCEDURE proc_insert_requirement(requirement_Name REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    INSERT INTO REQUIREMENT(requirementNo,requirementName)
    VALUES(seq_requirementid.NEXTVAL,requirement_Name);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;

BEGIN 
    proc_insert_requirement('Biet su dung Oracle'); 
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_requirement(requirement_No REQUIREMENT.requirementNo%TYPE)
IS
BEGIN
    -- XOA DU LIEU
    DELETE FROM REQUIREMENT
    WHERE requirementNo = requirement_No;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong');
    EXCEPTION WHEN no_data_found
    THEN 
        DBMS_OUTPUT.PUT_LINE('Du lieu khong ton tai');
    COMMIT;
END;

BEGIN proc_delete_requirement(); END;

---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_requirement(requirementNo_Old REQUIREMENT.requirementNo%TYPE,
                                                    requirementName_Update REQUIREMENT.requirementName%TYPE)
IS
BEGIN
    UPDATE REQUIREMENT
    SET requirementName = requirementName_Update 
    WHERE requirementNo = requirementNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;

BEGIN
proc_update_requirement();
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: REQUIRE						*/
/*==============================================================*/
---------------------INSERT-----------------------------
CREATE OR REPLACE PROCEDURE proc_insert_require(posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE,
                                                level_require REQUIRE.level_re%TYPE,
                                                YearExperience REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN
    INSERT INTO REQUIRE (positionNo, requirementNo, level_re, yearsOfExperience)
    VALUES(posNo, requireNo, level_require, YearExperience);
    DBMS_OUTPUT.PUT_LINE('Them thanh cong!');
    COMMIT;
END;


BEGIN
    proc_insert_require();
END;

---------------------DELETE-----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_require(posNo REQUIRE.positionNo%TYPE,
                                                requireNo REQUIRE.requirementNo%TYPE)
IS
BEGIN
    DELETE FROM REQUIRE
    WHERE positionNo = posNo AND requirementNo = requireNo;
    DBMS_OUTPUT.PUT_LINE('Xoa thanh cong!');
    COMMIT;
END;


---------------------UPDATE--------------------------
CREATE OR REPLACE PROCEDURE proc_update_require(posNo_Old REQUIRE.positionNo%TYPE,
                                                requireNo_Old REQUIRE.requirementNo%TYPE,
                                                posNo_Update REQUIRE.positionNo%TYPE,
                                                requireNo_Update REQUIRE.requirementNo%TYPE,
                                                level_Update REQUIRE.level_re%TYPE,
                                                Year_Update REQUIRE.yearsOfExperience%TYPE)
IS
BEGIN
    
    UPDATE REQUIRE
    SET positionNo = posNo_Update, requirementNo = requireNo_Update, level_re = level_Update, 
        yearsOfExperience = Year_Update
    WHERE positionNo = posNo_Old AND requirementNo = requireNo_Old;
    DBMS_OUTPUT.PUT_LINE('Cap nhat thanh cong!');
    COMMIT;
END;

BEGIN
    proc_update_require();
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: INTERVIEWER 					*/
/*==============================================================*/

-------------------------INSERT----------------------------------
CREATE OR REPLACE PROCEDURE proc_insert_interviewer(v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEWER VALUES (seq_interviewid.nextval, v_interviewerName, v_phoneNumber, v_gmail, v_companyNo, v_accountID);
    COMMIT;
END;

----------------------------UPDATE-----------------------------
CREATE OR REPLACE PROCEDURE proc_update_interviewer(v_interviewerNo INTERVIEWER.interviewerNo%TYPE,
                                                    v_interviewerName INTERVIEWER.interviewerName%TYPE,
                                                    v_phoneNumber INTERVIEWER.phoneNumber%TYPE,
                                                    v_gmail INTERVIEWER.gmail%TYPE,
                                                    v_companyNo INTERVIEWER.companyNo%TYPE,
                                                    v_accountID INTERVIEWER.accountID%TYPE)
AS
BEGIN
    UPDATE INTERVIEWER
    SET interviewerName = v_interviewerName,
        phoneNumber = v_phoneNumber,
        gmail = v_gmail,
        companyNo = v_companyNo,
        accountID = v_accountID
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;

---------------------------DELETE--------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_interviewer(v_interviewerNo INTERVIEWER.interviewerNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEWER
    WHERE interviewerNo = v_interviewerNo;
    COMMIT;
END;

/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: INTERVIEW_SCHEDULE				*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_interview_schedule( v_startTime VARCHAR2,
                                                            v_endTime VARCHAR2,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE(v_startTime,'dd/mm/yyyy'), TO_DATE(v_endTime,'dd/mm/yyyy') , v_location , v_status , v_slot, v_interviewerNo);
    COMMIT;
END;

-------------------------UPDATE----------------------------
CREATE OR REPLACE PROCEDURE proc_update_interview_schedule( v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE,
                                                            v_startTime VARCHAR2,
                                                            v_endTime VARCHAR2,
                                                            v_location INTERVIEW_SCHEDULE.location%TYPE,
                                                            v_status INTERVIEW_SCHEDULE.status%TYPE,
                                                            v_slot INTERVIEW_SCHEDULE.slot%TYPE,
                                                            v_interviewerNo INTERVIEW_SCHEDULE.interviewerNo%TYPE)
AS
BEGIN
    UPDATE INTERVIEW_SCHEDULE
    SET startTime = TO_DATE(v_startTime,'dd/mm/yyyy'),
        endTime = TO_DATE(v_endTime,'dd/mm/yyyy'),
        location = v_location,
        status = v_status,
        slot = v_slot,
        interviewerNo = v_interviewerNo
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;

---------------------------DELETE------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_interview_schedule(v_interviewScheduleNo INTERVIEW_SCHEDULE.interviewScheduleNo%TYPE)
AS
BEGIN
    DELETE FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = v_interviewScheduleNo;
    COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: APPLICANT						*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_applicant(  v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth VARCHAR2,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    INSERT INTO APPLICANT VALUES (seq_applicantid.nextval,v_applicantName, v_citizenID , TO_DATE(v_dateOfBirth,'dd/mm/yyyy'), v_gender , v_address, v_PHONENUMBER, v_gmail, v_accountID);
    COMMIT;
END;

-----------------------UPDATE------------------------------------
CREATE OR REPLACE PROCEDURE proc_update_applicant(  v_applicantNo APPLICANT.applicantNo%TYPE,
                                                    v_applicantName APPLICANT.applicantName%TYPE,
                                                    v_citizenID APPLICANT.citizenID%TYPE,
                                                    v_dateOfBirth VARCHAR2,
                                                    v_gender APPLICANT.gender%TYPE,
                                                    v_address APPLICANT.address%TYPE,
                                                    v_PHONENUMBER APPLICANT.PHONENUMBER%TYPE,
                                                    v_gmail APPLICANT.gmail%TYPE,
                                                    v_accountID APPLICANT.accountID%TYPE)
AS
BEGIN
    UPDATE APPLICANT
    SET applicantName = v_applicantName,
        citizenID = v_citizenID,
        dateOfBirth = TO_DATE(v_dateOfBirth,'dd/mm/yyyy'),
        gender = v_gender,
        address = v_address,
        PHONENUMBER = v_PHONENUMBER,
        gmail = v_gmail,
        accountID = v_accountID
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;

---------------------------DELETE----------------------------
CREATE OR REPLACE PROCEDURE proc_delete_applicant(v_applicantNo APPLICANT.applicantNo%TYPE)
AS
BEGIN
    DELETE FROM APPLICANT
    WHERE applicantNo = v_applicantNo;
    COMMIT;
END;


/*==============================================================*/
/*      PROCEDURE: TH??M X?“A S???A                                 */
/*      B???NG: SKILL						*/
/*==============================================================*/

-------------------------INSERT----------------------------------

CREATE OR REPLACE PROCEDURE proc_insert_skill(v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    INSERT INTO SKILL VALUES (seq_skillid.nextval, v_skillName);
    COMMIT;
END;

------------------------UPDATE------------------------------------
CREATE OR REPLACE PROCEDURE proc_update_skill(v_skillNo SKILL.skillNo%TYPE, v_skillName SKILL.skillName%TYPE)
AS
BEGIN
    UPDATE SKILL
    SET skillName = v_skillName
    WHERE skillNo = v_skillNo;
    COMMIT;
END;

-------------------------DELETE--------------------------------
CREATE OR REPLACE PROCEDURE proc_delete_skillt(v_skillNo SKILL.skillNo%TYPE)
AS
BEGIN
    DELETE FROM SKILL
    WHERE skillNo = v_skillNo;
    COMMIT;
END;


/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin cong ty		   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Company (name_co company.companyname%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName, address, startDate FROM COMPANY WHERE companyName = name_co;
    v_companyNo company.companyno%type;
    v_companyName company.companyName%type;
    v_address company.address%type;
    v_startDate company.startDate%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName, v_address, v_startDate;
        EXIT WHEN c_company%NOTFOUND;
        
        DBMS_OUTPUT.PUT('Ma cong ty: ' || v_companyNo ||'. Ten cong ty: ' || v_companyName || '. Dia chi: ' || v_address || 
                                '. Ngay thanh lap: ' || v_startDate);
                                
        DECLARE
        CURSOR c_position IS SELECT P.positionNo, P.positionName, P.numberOfPersonnel, AVG(E.mark_co)
                                FROM BELONG B JOIN DEPARTMENT D ON B.departmentNo = D.departmentNo
                                                JOIN RECRUIT R ON D.departmentNo = R.departmentNo
                                                JOIN POSITION P ON R.positionNo = P.positionNo
                                                JOIN EVALUATE_CO E ON B.companyNo = E.companyNo
                                WHERE B.companyNo = v_companyNo
                                GROUP BY P.positionNo, P.positionName, P.numberOfPersonnel;
                                
        v_positionNo POSITION.positionNo%type;
        v_positionName POSITION.positionName%type;
        v_numberOfPersonnel POSITION.numberOfPersonnel%type;
        v_avg float;
        
        BEGIN
            OPEN c_position;
            LOOP
                FETCH c_position INTO v_positionNo, v_positionName, v_numberOfPersonnel, v_avg;
                EXIT WHEN c_position%NOTFOUND;
                
                IF c_position%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('. Ma vi tri: ' || v_positionNo || '. Ten vi tri: ' || v_positionName || 
                    '. So luong can:' || v_numberOfPersonnel || '. Diem trung binh: ' || v_avg);
                END IF;
            END LOOP;
            CLOSE c_position;
        END;
    END LOOP;
    CLOSE c_company;
END;


/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin ung vien		   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Applicant (name_apl APPLICANT.applicantName%type)
AS
    v_apl APPLICANT%ROWTYPE;
BEGIN
    SELECT * INTO v_apl
    FROM APPLICANT
    WHERE applicantName = name_apl;
    
    DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_apl.applicantNo || '. Ten ung vien: ' || v_apl.applicantName ||
                            '. CCCD: ' || v_apl.citizenid || '. Ngay sinh: ' || v_apl.dateofbirth || '. Gioi tinh: ' ||
                            v_apl.gender || '. Dia chi: ' || v_apl.address || '. SDT: ' || v_apl.phonenumber || 
                            '. Gmail: ' || v_apl.gmail || '. So tai khoan: ' || v_apl.accountid);
END;



/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin nha tuyen dung	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Interviewer (name_interviewer INTERVIEWER.interviewerName%type)
AS
    CURSOR c_interviewer IS SELECT  I.interviewerNo, I.interviewerName, I.phoneNumber, I.gmail, C.companyName 
                            FROM INTERVIEWER I JOIN COMPANY C ON I.companyNo = C.companyNo
                            WHERE I.interviewerName =  name_interviewer;
    v_interviewerNo INTERVIEWER.interviewerNo%type;
    v_interviewerName INTERVIEWER.interviewerName%type;
    v_phoneNumber INTERVIEWER.phoneNumber%type;
    v_gmail INTERVIEWER.gmail%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_interviewer;
    LOOP
        FETCH c_interviewer INTO v_interviewerNo, v_interviewerName, v_phoneNumber, v_gmail, v_companyName;
        EXIT WHEN c_interviewer%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma nha tuyen dung: ' || v_interviewerNo || '. Ten nha tuyen dung: ' || v_interviewerName ||
                                '. SDT: ' || v_phoneNumber || '. Gmail: ' || v_gmail || '. Ten cong ty: ' || v_companyName);
    END LOOP;
    CLOSE c_interviewer;
END;

/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin danh gia cong ty	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Evaluate_Company (name_co COMPANY.companyName%type)
AS
    CURSOR c_company IS SELECT companyNo, companyName FROM COMPANY WHERE companyName = name_co;
    v_companyNo COMPANY.companyNo%type;
    v_companyName COMPANY.companyName%type;
BEGIN
    OPEN c_company;
    LOOP
        FETCH c_company INTO v_companyNo, v_companyName;
        EXIT WHEN c_company%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Ten cong ty: ' || v_companyName);
        
        DECLARE
        CURSOR c_evaluate IS SELECT mark_co, comment_co, applicantNo FROM EVALUATE_CO WHERE companyNo = v_companyNo;
        v_mark_co EVALUATE_CO.mark_co%type;
        v_comment_co EVALUATE_CO.comment_co%type;
        v_applicantNo EVALUATE_CO.applicantNo%type;
        
        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_co, v_comment_co, v_applicantNo;
            EXIT WHEN c_evaluate%NOTFOUND;
            
            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Diem danh gia: ' || v_mark_co || '. Ghi chu: ' ||
                                        v_comment_co);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_company;
END;

/*=========================================================*/
/*	PROCEDURRE: Tra cuu thong tin danh gia ung vien	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE Find_Evaluate_Applicant (name_apl APPLICANT.applicantName%type)
AS
    CURSOR c_applicant IS SELECT applicantNo, applicantName FROM APPLICANT WHERE applicantName = name_apl;
    v_applicantNo APPLICANT.applicantNo%type;
    v_applicantName APPLICANT.applicantName%type;
BEGIN
    OPEN c_applicant;
    LOOP
        FETCH c_applicant INTO v_applicantNo, v_applicantName;
        EXIT WHEN c_applicant%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || v_applicantNo || '. Ten ung vien: ' || v_applicantName);
        
        DECLARE
        CURSOR c_evaluate IS SELECT mark_apl, comment_apl, companyNo FROM EVALUATE_APL WHERE applicantNo = v_applicantNo;
        v_mark_apl EVALUATE_APL.mark_apl%type;
        v_comment_apl EVALUATE_APL.comment_apl%type;
        v_companyNo EVALUATE_APL.companyNo%type;
        
        BEGIN
        OPEN c_evaluate;
        LOOP
            FETCH c_evaluate INTO v_mark_apl, v_comment_apl, v_companyNo;
            EXIT WHEN c_evaluate%NOTFOUND;
            
            IF c_evaluate%FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || v_companyNo || '. Diem danh gia: ' || v_mark_apl || '. Ghi chu: ' ||
                                        v_comment_apl);
            END IF;
        END LOOP;
        CLOSE c_evaluate;
        END;
    END LOOP;
    CLOSE c_applicant;
END;



/*=========================================================*/
/*	PROCEDURRE: TRA CUU CAC PHONG BAN CONG TY 	   */
===========================================================*/

CREATE OR REPLACE PROCEDURE pro_belong_company(companyNo_IN IN company.companyno%TYPE)
AS 
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM COMPANY WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);
        
        DECLARE
            -- Khoi tao con tro thu hai luu ma va ten phong ban 
            -- Dieu kien: Ma cong ty cua phong ban duoc luu boi con tro 2 phai bang ma cong ty cua con tro o tren
            CURSOR C_DEPARTMENT IS SELECT D.DepartmentNo, D.DepartmentName
                                   FROM COMPANY C JOIN BELONG B ON C.CompanyNo = B.CompanyNo
                                                  JOIN DEPARTMENT D ON B.DepartmentNo = D.DepartmentNo
                                   WHERE C.CompanyNo = Company_No;
            Depart_No DEPARTMENT.DepartmentNo%TYPE;
            Depart_Name DEPARTMENT.DepartmentName%TYPE;
        BEGIN
            OPEN C_DEPARTMENT;
            LOOP 
                FETCH C_DEPARTMENT INTO Depart_No, Depart_Name;
                EXIT WHEN C_DEPARTMENT%NOTFOUND;
                
                IF C_DEPARTMENT%FOUND THEN
                    
                    DBMS_OUTPUT.PUT_LINE('Ma phong ban: ' || Depart_No);
                    DBMS_OUTPUT.PUT_LINE('Ten phong ban: ' || Depart_Name);
                
                END IF;
            END LOOP;
            CLOSE C_DEPARTMENT;
        END;
        
    END LOOP;
    CLOSE C_COMPANY;
    
END;

/*=================================================================*/
/*	PROCEDURRE: TRA CUU CONG VIEC CONG TY DANG DANG TUYEN 	   */
===================================================================*/

CREATE OR REPLACE PROCEDURE proc_company_recruit (companyNo_IN IN company.companyno%TYPE)
AS
    -- Khoi tao con tro luu du lieu Ma Cong Ty voi dieu kien Ma Cong Ty = Ma Cong Ty truyen vao
    CURSOR C_COMPANY IS SELECT CompanyNo FROM Company WHERE CompanyNo = companyNo_IN;
    Company_No company.companyno%TYPE;
BEGIN
    OPEN C_COMPANY;
    LOOP
        FETCH C_COMPANY INTO Company_No;
        EXIT WHEN C_COMPANY%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma cong ty: ' || companyNo_IN);
        
        DECLARE
            -- Khoi tao con tro luu du lieu ten cong viec va ma cong viec can tuyen
            -- Dieu kien: Ma cong ty tuyen cong viec do bang ma cua con tro o tren
            CURSOR C_POS IS SELECT P.PositionNo, P.PositionName 
                            FROM DEPARTMENT D JOIN BELONG B ON D.departmentNo = B.departmentNo 
                                  JOIN COMPANY C ON B.companyNo = C.companyNo
                                  JOIN RECRUIT R ON R.departmentNo = D.departmentNo
                                  JOIN POSITION P ON P.positionNo = R.positionNo
                            WHERE C.CompanyNo = Company_No; 
            Pos_No Position.PositionNo%TYPE;
            Pos_name Position.PositionName%TYPE;
        BEGIN                           
            OPEN C_POS;
            LOOP
                FETCH C_POS INTO Pos_No, Pos_Name;
                EXIT WHEN C_POS%NOTFOUND;

                IF C_POS%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma cong viec dang tuyen: ' || Pos_No);
                    DBMS_OUTPUT.PUT_LINE('Ten cong viec dang tuyen: ' || Pos_Name);
                END IF;
            END LOOP;
            CLOSE C_POS;
        END;
        
    END LOOP;
    CLOSE C_COMPANY;
END;

/*=================================================================*/
/*	PROCEDURRE: TRA CUU KY NANG UNG VIEN 	   		   */
===================================================================*/

CREATE OR REPLACE PROCEDURE proc_applicant_skill (ApplicantNo_In applicant.applicantno%TYPE)
AS
    -- Khoi tao con tro luu du lieu ma ung vien voi ma ung vien = ma ung vien truyen vao
    CURSOR C_APPLICANT IS SELECT ApplicantNo FROM APPLICANT WHERE ApplicantNo = ApplicantNo_In;
    Applicant_No APPLICANT.ApplicantNo%TYPE;
BEGIN
    OPEN C_APPLICANT;
    LOOP
        FETCH C_APPLICANT INTO Applicant_No;
        EXIT WHEN C_APPLICANT%NOTFOUND;
        
        DBMS_OUTPUT.PUT_LINE('Ma ung vien: ' || Applicant_No);
        
        DECLARE
            -- Khoi tao con tro luu du lieu cac ki nang cua ung vien
            -- Dieu kien: ma ung vien co ki nang nay phai bang ma ung vien duoc luu boi con tro o tren
            CURSOR C_SKILL IS SELECT S.SkillNo, S.SkillName
                              FROM APPLICANT A JOIN HAVE H ON A.ApplicantNo = H.ApplicantNo
                                               JOIN SKILL S ON H.SkillNo = S.SkillNo
                              WHERE A.ApplicantNo = Applicant_No;
            Skill_No SKILL.SkillNo%TYPE;
            Skill_Name SKILL.SkillName%TYPE;
        BEGIN
            OPEN C_SKILL;
            LOOP
                FETCH C_SKILL INTO Skill_No, Skill_Name;
                EXIT WHEN C_SKILL%NOTFOUND;
                
                IF C_SKILL%FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('Ma ky nang: ' || Skill_No);
                    DBMS_OUTPUT.PUT_LINE('Ky nang cua ung vien: ' || Skill_Name);
                END IF;
            END LOOP;
            CLOSE C_SKILL;
        END;
    END LOOP;
    CLOSE C_APPLICANT;
END;