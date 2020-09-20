* <Rating>0</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.REMISE.CHQ.TMP.RESTRICT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author firasYengui
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.ACCOUNT


*-------------------------------------------------------------
    FN.USER='F.USER'
    F.USER=''
    CALL OPF (FN.USER,F.USER)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    SEL=ENQ.DATA<4>
 
    ENQ.DATA<2,1> = 'AGENCE.REM'
* $INSERT I_COMMON - Not Used anymore;'EQ'
* $INSERT I_EQUATE - Not Used anymore;DEPART.CODE
    RETURN
END
