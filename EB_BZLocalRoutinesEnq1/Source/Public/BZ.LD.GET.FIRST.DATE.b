*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19     :  Initialized OPF (Missing OPF)
*-----------------------------------------------------------------------------
    
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.GET.FIRST.DATE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.LD.SCHEDULE.DEFINE
    *INCLUDE GLOBUS.BP I_F.LMM.SCHEDULES.PAST

$INSERT I_COMMON              
$INSERT I_EQUATE              
$INSERT I_ENQUIRY.COMMON      
$INSERT I_F.LD.SCHEDULE.DEFINE
$INSERT I_F.LMM.SCHEDULES.PAST

* $INSERT I_EQUATE - Not Used anymore;
MAIN:
    RUNNING.UNDER.BATCH=1
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

****************INIT************************
INIT:

    FN.LD.SCHEDULE="F.LD.SCHEDULE.DEFINE"
    F.LD.SCHEDULE=""
    FN.SCHEDULES.PAST="F.LMM.SCHEDULES.PAST"
    F.SCHEDULES.PAST=""


    LD.ID=O.DATA
    O.DATA=''
    Y.DATE=''

    RFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus********OPEN FILE*******************
OPENFILEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusFN.SCHEDULES.PAST,F.SCHEDULES.PAST)
	CALL OPF(FN.LD.SCHEDULE,F.LD.SCHEDULE)          ;* Initialized OPF (Missing OPF)
    RETURN

****************PROCESS*********************
PROCESS:



    SEL.CMD="SSELECT ":FN.SCHEDULES.PAST:" WITH @ID LIKE '":LD.ID:"...'"
    CALL EB.READLIST(SEL.CMD,SEL.LIST,"",NO.OF.REC,SEL.ERR)

    IF SEL.LIST THEN
        LMM.ID =SEL.LIST<1>
        CALL F.READ(FN.SCHEDULES.PAST,LMM.ID,R.LMM,F.SCHEDULES.PAST,LMM.ERR)
        Y.DATE=R.LMM<LD28.DATE.REC>
    END ELSE
        CALL F.READ(FN.LD.SCHEDULE,LD.ID,R.LD.SCHEDULE,F.LD.SCHEDULE,LD.SCHEDULE.ERR)
        Y.SCH.TYPE.LIST=R.LD.SCHEDULE<LD.SD.SCH.TYPE>
        YEB.DataAccess.OpfTE.LIST=R.LD.SCHEDULE<LD.SD.DATE>

       EB.DataAccess.OpfR.SCH.TYPE=DCOUNT(Y.SCH.TYPE.LIST,@VM)

        FOR COUNTER=1 TO NBR.SCH.TYPE
            Y.SCH.TYPE.CUR =Y.SCH.TYPE.LIST<1,COUNTER>
            IF Y.SEB.SystemTables.getRNew()PFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEN
                Y.DATE = Y.DATE.LIST<1,COUNTER>

       EB.DataAccess.FReadND
        NEXT COUNTER
    END




    O.DAEB.SystemTabEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
