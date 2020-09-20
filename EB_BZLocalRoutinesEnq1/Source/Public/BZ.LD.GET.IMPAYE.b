*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.GET.IMPAYE
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
    *INCLUDE GLOBUS.BP I_F.PD.PAYMENT.DUE
$INSERT I_COMMON          
$INSERT I_EQUATE          
$INSERT I_ENQUIRY.COMMON  
$INSERT I_F.PD.PAYMENT.DUE
   
*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

****************INIT************************
INIT:

    FN.PD="F.PD.PAYMENT.DUE"
    F.PD=""

    LD.ID=O.DATA
    O.DATA=''
    Y.TOT.IMP=''

    RETURN

****************OPEN FILE*******************
OPENFILES:FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPD,F.PD)
    RETURN

****************PROCESFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus*****
PROCESS:

    ID.PD="PD":LD.ID

    R.PD=''
	PD.ERR=''
    CALL F.READ(FN.PD,ID.PD,R.PD,F.PD,PD.ERR)

    IF R.PD THEN
        Y.TOT.IMP=R.PD<PD.TOTAL.AMT.TO.REPAY>
    END

    O.DATA=Y.TOT.IMP

    RETURN
END
