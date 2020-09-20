*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.GET.ANNUITY
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
$INSERT I_COMMON              
$INSERT I_EQUATE              
$INSERT I_ENQUIRY.COMMON      
$INSERT I_F.LD.SCHEDULE.DEFINE


*ZIT-UPG-R09-R13/E

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

    RETURN

****************OPEN FILE*******************
OPENFILEEB.SystemTables.getVFunction()FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FN.LD.tmp.V$FUNCTION.LD.SCHEDULE)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus**********PROCESS*********************
PROCESFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus=O.DATA
    O.DATA=''
    R.LD.SCHEDULE=''
	LD.SCHEDULE.ERR=''

    CALL F.READ(FN.LD.SCHEDULE,LD.ID,R.LD.SCHEDULE,F.LD.SCHEDULE,LD.SCHEDULE.ERR)

    Y.SCH.TYPE.LIST=R.LD.SCHEDULE<LD.SD.SCH.TYPE>
    Y.FREQUENCY.LIST=R.LD.SCHEDULE<LD.SD.FREQUENCY>

    NBR.SCH.TYPE=DCOUNT(Y.SCH.TYPE.LIST,@VM)

    FOR COUNTER=1 TO NBR.SCH.TYPE
        Y.SCH.TYPE.CUR =Y.SCH.TYPE.LIST<1,COUNTER>
        IF Y.SCH.TYPE.CUR EQ 'A' THEN
            Y.FREQUENCY = Y.FREQUENCY.LIST<1,COUNTER>
            O.DATA=Y.FREQUENCY
        END
    NEXT COUNTER

    RETURN
END
