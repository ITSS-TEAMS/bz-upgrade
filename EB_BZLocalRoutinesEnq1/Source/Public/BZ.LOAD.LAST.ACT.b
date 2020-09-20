*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  :NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LOAD.LAST.ACT
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
$INSERT I_F.PW.TXN.REF

    FN.REF='F.PW.TXN.REF'
    F.REF=''
    ID.REF = O.DATA
    R.REF= ''
    ERR.REF=''

    CALL OPF(FN.REF,F.REF)

    CALL F.READ(FN.REF,ID.REF,R.REF,F.REF,ERR.REF)

* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;T,@FM)

    O.DATA = ACT.LIST<NBR.ACT>
    RETURN
END
