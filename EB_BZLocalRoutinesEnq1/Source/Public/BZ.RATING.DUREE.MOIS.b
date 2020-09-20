****************************
*Author ameni younes
*************************

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.DUREE.MOIS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED;
*-----------------------------------------------------------------------------	
*ZIT-UPG-R13-R19/S	
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R13-R19/E
*---------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS
    RETURN
*------------------------------------------------
INIT:

* $INSERT I_COMMON - Not Used anymore;DEPOSITS='F.LD.LOANS.AND.DEPOSITS'
* $INSERT I_EQUATE - Not Used anymore;EPOSITS=''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;''
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;
    CALL OPF (FN.LD.LOANS.AND.DEPOSITS, F.LD.LOANS.AND.DEPOSITS)
    Y.LD=O.DATA
    RETURN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;--------------------------------
PROCESS:

    CALL F.READ(    FN.LD.LOANS.AND.DEPOSITS,    Y.LD,  R.LD.LOANS.AND.DEPOSITS,  F.LD.LOANS.AND.DEPOSITS,   ERR.LD.LOANS.AND.DEPOSITS)
    Y.FIN.MAT.DATE=R.LD.LOANS.AND.DEPOSITS<LD.FIN.MAT.DATE>
    Y.FIN.DATE=Y.FIN.MAT.DATE+1
    CALL BZ.LD.GET.FIRST.DATE.PARAMS(Y.LD,DATE.ECH)
    Y.DIFF="C"

    CALL CDD ('',DATE.ECH,Y.FIN.DATE,Y.DIFF)
    Y.VAEB.SystemTables.getVFunction()30
    Y.VAL= FIELD(Y.VAL,'.',1)


  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    RETURN
