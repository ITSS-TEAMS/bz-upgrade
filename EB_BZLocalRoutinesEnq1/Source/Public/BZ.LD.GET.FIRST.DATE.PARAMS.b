*-----------------------------------------------------------------------------
*Author ameni younes
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*-----------------------------------------------------------------------------


$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.GET.FIRST.DATE.PARAMS(ID.LD,DATE.ECH)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.SCHEDULE.DEFINE
    $INSERT I_F.LMM.SCHEDULES.PAST


MAIN:
    RUNNING.UNDER.BATCH=1
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

****************INIT************************
INIT:

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;EDULE.DEFINE"
    F.LD.SCHEDULE=""
    R.LD.SCHEDULE=''
    LD.SCHEDULE.ERR=''
    FN.SCHEDULES.PAST="F.LMM.SCHEDULES.PAST"
    F.SCHEDULES.PAST=""
    R.LMM=''
    LMM.ERR=''
    LD.ID=ID.LD
    SEL.LIST=''
    NO.OF.REC=''
    SEL.ERR=''


    O.DATA=''
    Y.DAEB.SystemTables.getVFunction() RETURN
****************OPEN FILE*******FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusNFILES:
    CALL OPF(FN.SCHEDULES.PAST,F.SCHEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusL OPF(FN.LD.SCHEDULE,F.LD.SCHEDULE)   
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
        Y.DATE.LIST=R.LD.SCHEDULE<LD.SD.DATE>
        NBR.SCH.TYPE=DCOUNT(Y.SCH.TYPE.LIST,@VM)
        FOR COUNTER=1 TO NBR.SCH.TYPE
            Y.SCH.TYPE.CUR =Y.SCH.TYPE.LIST<1,COUNTER>
            IF Y.SCH.TYPE.CUR EQ 'A' THEN
                Y.DATE = Y.DATE.LIST<1,COUNTER>
            END
        NEXT COUNTER
    END
    DATE.EB.DataAccess.Opf=Y.DATE
    RETUREB.DataAccess.OpfEND
