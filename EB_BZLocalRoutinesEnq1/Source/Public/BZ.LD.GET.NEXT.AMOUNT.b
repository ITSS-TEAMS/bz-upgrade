*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.GET.NEXT.AMOUNT
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
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON              
$INSERT I_EQUATE              
$INSERT I_ENQUIRY.COMMON      
$INSERT I_F.LD.SCHEDULE.DEFINE
*ZIT-UPG-R09-R13/E
* $INSERT I_COMMON - Not Used anymore;MAIN:
* $INSERT I_EQUATE - Not Used anymore;TCH=1
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;*************
INIT:

    FN.LD.SCHEDULE="F.LD.SCHEDULE.DEFINE"
    F.LD.SCHEDULE=""
	R.LD.SCHEDULE=""
	LD.SCHEDULE.ERR=""


    LD.IEB.SystemTables.getVFunction()    O.DATA=''
    Y.AMOUNT=''

    RETFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus******OPEN FILE*******************
OPENFILES:FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.LD.SCHEDULE,F.LD.SCHEDULE)
    RETURN

****************PROCESS*********************
PROCESS:




    CALL F.READ(FN.LD.SCHEDULE,LD.ID,R.LD.SCHEDULE,F.LD.SCHEDULE,LD.SCHEDULE.ERR)

    Y.AMOUNT.LIST=R.LD.SCHEDULE<LD.SD.AMOUNT>

    NBR.SCH.TYPE=DCOUNT(Y.AMOUNT.LIST,@VM)

    FOR COUNTER=1 TO NBR.SCH.TYPE
        Y.AMOUNT+= Y.AMOUNT.LIST<1,COUNTER>
    NEXT COUNTER

    O.DATA=Y.AMOUNT


    RETEB.DataAccess.OpfB.DataAccess.OpfEND
