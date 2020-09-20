*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** F.READ VARIABLE INITIALIZED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATURE.READ
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
$INSERT I_F.ACCOUNT

    FN.AC='F.ACCOUNT'
    F.AC=''
    AC.ERR=''
	AC.REC=''
    COMPTE=O.DATA

    CALL OPF(FN.AC,F.AC)
    
    CALL F.READ(FN.AC,COMPTE,AC.REC,F.AC,AC.ERR)
    R.RECORD<1>=AC.REC<AC.SHORT.TITLE>
* $INSERT I_COMMON - Not Used anymore;EC<AC.ACCOUNT.OFFICER>
* $INSERT I_EQUATE - Not Used anymore;EC<AC.OPENING.DATE>
    RETURN
END

