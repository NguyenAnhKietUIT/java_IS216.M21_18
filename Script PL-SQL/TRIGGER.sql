/*=======================================================================================================================================================*/
/*									TRIGGER									 	 */
/*=======================================================================================================================================================*/



/*========================================================= 
	TRIGGER QD8: THOI GIAN KET THUC > THOI GIAN BAT DAU
===========================================================*/

CREATE OR REPLACE TRIGGER trigger_interview_time_interviewshcedule
AFTER INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN
	IF ((:NEW.ENDTIME - :NEW.STARTTIME)/365 < 0) THEN
        Raise_Application_Error(-20011, 'THOI GIAN KET THUC KHONG THE BE HON THOI GIAN BAT DAU');
    END IF;
END;

/*========================================================= 
	TRIGGER 10: SO luong ung vi??n toi da duoc dang ky phong van (slot) trong mot buoi kh??ng qu?? 20 nguoi.
===========================================================*/
CREATE OR REPLACE TRIGGER interview_slot 
BEFORE INSERT OR UPDATE
ON INTERVIEW_SCHEDULE
FOR EACH ROW
BEGIN    
    IF (:NEW.slot > 20)
    THEN
        RAISE_APPLICATION_ERROR(-20000, N'B?N ?ANG NH?P HO?C C?P NH?T D? LI?U KH?”NG H?P L?');
    END IF;
END;

/*========================================================= 
	TRIGGER 11: DIEM UY T??N NHO HON 3 THI UNG VI??N CHI C?“ THE DK TOI DA 3 LICH PHONG VAN
===========================================================*/
create OR replace trigger RegistInterview_CheckPoint
before insert
on register
for each row
declare
    diemTB float;
    slg int;
begin		
    select avg(e.mark_apl) into diemTB
    from EVALUATE_APL e
    where e.applicantNo = :NEW.applicantNo;

	select count(r.interviewScheduleNo) into slg
	from REGISTER r
	where r.applicantNo = :NEW.applicantNo
	and r.status = 0; --phieu phong van da dang ky

	if diemTB < 3 and slg >= 3
    then
        RAISE_APPLICATION_ERROR(-20000, N'?I?M UY T??N KH?”NG ?? ?? ??NG K?? TH??M');
	end if;
end;

/*========================================================= 
	TRIGGER 12:HUY LICH PHONG VAN TRE NHAT 1 NG?€Y
===========================================================*/
CREATE OR REPLACE TRIGGER Cancel_Schedule
BEFORE DELETE
ON REGISTER
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
DECLARE 
    ID INTERVIEW_SCHEDULE.interviewerNo%TYPE;
BEGIN
    SELECT (ISC.interviewerNo) into ID
				FROM INTERVIEW_SCHEDULE ISC
				WHERE ISC.interviewScheduleNo = :OLD.interviewScheduleNo
                AND (( TO_DATE(ISC.startTime,'dd/mm/yyyy') - TO_DATE(CURRENT_DATE,'dd/mm/yyyy')) <= 1);
	IF  (ID is null)
    THEN
        RAISE_APPLICATION_ERROR(-20000, N'?ng vi??n ch? c?? th? h?y l?ch ??ng k?? ph?ng v?n tr? nh?t l?  1 ng? y tr??c khi b?t ??u bu?i ph?ng v?n');
	END IF;
END;


/*========================================================= 
	TRIGGER 13: TAI 1 THOI DIEM UNG VIEN KH?”NG THE DK PHONG VAN TAI NHIEU C?”NG TY
===========================================================*/
create OR replace  trigger RegistInterview_CheckDate
after insert 
on register
for each row
declare
    interviewScheduleNo_n register.interviewscheduleno%TYPE;
    applicantNo_n register.applicantno%TYPE;
    flag number(1);
begin
    interviewScheduleNo_n := :NEW.interviewScheduleNo;
    applicantNo_n := :NEW.APPLICANTNO;
    
    select case
            when exists (select *
                        from (select is_i.startTime, is_i.endTime, i_i.companyNo
                                from INTERVIEW_SCHEDULE is_i join interviewer i_i on is_i.interviewerNo = i_i.interviewerNo
                                where is_i.interviewScheduleNo = interviewScheduleNo_n) them,
                            (select r_e.*, is_e.startTime, is_e.endTime, i_e.companyNo
                            from (register r_e join INTERVIEW_SCHEDULE is_e on r_e.interviewScheduleNo = is_e.interviewScheduleNo) join interviewer i_e on is_e.interviewerNo = i_e.interviewerNo) existed
                        where applicantNo_n = existed.applicantNo and
                        ((them.startTime >= existed.startTime and them.startTime <= existed.endTime) or (them.startTime < existed.startTime and them.endTime >= existed.startTime))
                        and them.companyNo <> existed.companyNo)
            then 1
            else 0 
        end into flag
    from dual;

    if flag = 1
    then
        RAISE_APPLICATION_ERROR(-20000, N'Ung vien khong the dang ky lich phong van cho nhieu cong ty tai mot thoi diem');
    end if;
end;


/*========================================================= 
	TRIGGER: THEM LICH
   	 DIEU KIEN: NHA TUYEN DUNG KHONG THE THEM LICH TRUNG LICH CU
===========================================================*/
CREATE OR REPLACE TRIGGER trigger_schedule_notSame_interviewschedule
BEFORE INSERT 
ON INTERVIEW_SCHEDULE
FOR EACH ROW
DECLARE
    ITVS INTERVIEW_SCHEDULE%ROWTYPE;
BEGIN
        SELECT * INTO ITVS
        FROM INTERVIEW_SCHEDULE
        WHERE InterviewerNo = :NEW.InterviewerNo;
        IF (:NEW.InterviewerNo = ITVS.InterviewerNo 
                AND   :NEW.interviewScheduleNo <> ITVS.interviewScheduleNo
                AND ( :NEW.STARTTIME >= ITVS.STARTTIME AND :NEW.STARTTIME <= ITVS.ENDTIME) 
                OR  ( :NEW.STARTTIME < ITVS.STARTTIME AND :NEW.ENDTIME >= ITVS.STARTTIME))
        THEN
            Raise_Application_Error(-20011, 'BAN DA CO LICH NGAY HOM DO ROI');
        END IF;
END;
-- khong the tao duoc
INSERT INTO INTERVIEW_SCHEDULE VALUES (seq_scheduleid.nextval,TO_DATE('13/01/2021','dd/mm/yyyy'), TO_DATE('14/01/2021','dd/mm/yyyy') , '72 Ho Tung Mau' , 1 , 20, 4);
SELECT * FROM INTERVIEW_SCHEDULE;
/*========================================================= 
        TRIGGER: KHI DANG KY
    	DIEU KIEN: CAP NHAT LAI SLOT TRONG INTERVIEW_SCHEDULE
===========================================================*/
CREATE OR REPLACE TRIGGER trigger_minus_regis_slot 
AFTER INSERT 
ON REGISTER
FOR EACH ROW
DECLARE
    SlotInItvs NUMBER := 0;
BEGIN
    -- TIM SO SLOT DANG CO TRONG LICH PHONG VAN
    SELECT Slot INTO SlotInItvs
    FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = :NEW.interviewScheduleNo AND :NEW.status = 0;
    
    -- BAT DAU CAP NHAT
    IF(SlotInItvs <= 0) THEN
        Raise_Application_Error(-20011, 'LICH DA QUA SO LUOT SO DANG KY');
    ELSE
        UPDATE INTERVIEW_SCHEDULE S
        SET slot = slot - 1
        WHERE S.interviewScheduleNo = :NEW.interviewScheduleNo;
    END IF;
END;

/*========================================================= 
        TRIGGER: KHI HUY DANG KY
    	DIEU KIEN: CAP NHAT LAI SLOT TRONG INTERVIEW_SCHEDULE
===========================================================*/

CREATE OR REPLACE TRIGGER trigger_add_regis_slot 
AFTER DELETE
ON REGISTER
FOR EACH ROW
DECLARE
    SlotInItvs NUMBER := 0;
BEGIN
    -- TIM SO SLOT DANG CO TRONG LICH PHONG VAN
    SELECT Slot INTO SlotInItvs
    FROM INTERVIEW_SCHEDULE
    WHERE interviewScheduleNo = :OLD.interviewScheduleNo;
    
    -- BAT DAU CAP NHAT
    IF(SlotInItvs >= 20) THEN
        Raise_Application_Error(-20011, 'MOT LICH CHI CO 20 UNG VIEN DUOC DANG KY');
    ELSE
        UPDATE INTERVIEW_SCHEDULE S
        SET slot = slot + 1
        WHERE S.interviewScheduleNo = :OLD.interviewScheduleNo;
    END IF;
END;

update register 
set status = 1
where interviewScheduleNo = 1 and applicantNo = 1 and positionNo = 2; 
select * from evaluate_apl;
select * from interview_schedule;
/*========================================================= 
        TRIGGER: KHI NHA TUYEN DUNG XAC NHAN ??NG VIEN V?€O L?€M 
    	DIEU KIEN: CAP NHAT LAI SO LUONG UNG VIEN CAN TUYEN CUA CONG TY
===========================================================*/
CREATE OR REPLACE TRIGGER confirmApplicant
AFTER UPDATE
ON REGISTER
FOR EACH ROW
BEGIN
    UPDATE POSITION P SET NUMBEROFPERSONNEL = NUMBEROFPERSONNEL - 1 WHERE :NEW.STATUS = 4 AND P.POSITIONNO = :OLD.POSITIONNO;
END;

/*========================================================= 
        TRIGGER: KHI SUA THUOC TINH SO LUONG UNG VIEN CAN TUYEN CHO VI TRI ,NEU TON TAI UNG VIEN DANG KY PHONG VAN CHO VI TRI DO 
    	DIEU KIEN: KHONG CAP NHAT LAI SO LUONG UNG VIEN CAN TUYEN CUA CONG TY BANG 0
===========================================================*/
CREATE OR REPLACE TRIGGER fix
AFTER UPDATE
ON POSITION
FOR EACH ROW
DECLARE 
v_NUMBEROFPERSONNEL NUMBER;
BEGIN
    SELECT COUNT(APPLICANTNO) INTO v_NUMBEROFPERSONNEL
    FROM REGISTER
    WHERE STATUS = 0
    GROUP BY POSITIONNO
    HAVING POSITIONNO = :OLD.POSITIONNO;
    
    IF (:NEW.NUMBEROFPERSONNEL = 0 AND v_NUMBEROFPERSONNEL > 0) THEN
        ROLLBACK;
    END IF;
END;

create or replace TRIGGER notEngaged
AFTER UPDATE
ON REGISTER
FOR EACH ROW
declare
    companyNo_new COMPANY.COMPANYNO%TYPE;
BEGIN
    IF :NEW.status = 1 THEN
        select i.companyNo into companyNo_new
        from interview_Schedule its join interviewer i on its.interviewerNo = i.interviewerNo
        where its.interviewScheduleNo = :NEW.interviewScheduleNo;
        
        INSERT INTO EVALUATE_APL VALUES (seq_scheduleid.nextval, companyNo_new, :NEW.APPLICANTNO, 1, 'Khong tham gia');
    END IF;
END;