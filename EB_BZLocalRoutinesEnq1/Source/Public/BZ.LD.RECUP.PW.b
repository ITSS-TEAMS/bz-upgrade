* Modification History :
*ZIT-UPG-R13-R19 : NO CHANGE
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.RECUP.PW
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
$INSERT I_F.ENQUIRY
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.PW.ACTIVITY.TXN

    REF.LD = O.DATA
SEL.BI =''
N.BI=''
E.BI =''
    CMD.PW.ACTIVITY  = "SELECT F.PW.ACTIVITY.TXN WITH TRANSACTION.REF EQ ": REF.LD
    CALL EB.READLIST(CMD.PW.ACTIVITY , SEL.BI , '', N.BI , E.BI )

    FN.PW.ACTIVITY.TXN = 'F.PW.ACTIVITY.TXN'
    F.PW.ACTIVITY.TXN = ''
    K.PW.ACTIVITY.TXN = SEL.BI<1>
* $INSERT I_COMMON - Not Used anymore;N = ''
* $INSERT I_EQUATE - Not Used anymore;N = ''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;TXN,F.PW.ACTIVITY.TXN)
	R.PW.ACTIVITY.TXN =''
	E.PW.ACTIVITY.TXN =''
    CALL F.READ(FN.PW.ACTIVITY.TXN,K.PW.ACTIVITY.TXN,R.PW.ACTIVITY.TXN,F.PW.ACTIVITY.TXN,E.PW.ACTIVITY.TXN)

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;PW.ACT.TXN.PROCESS>

    RETURN
END
