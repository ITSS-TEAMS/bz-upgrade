*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: COMMENTING F.READ FOR USER AS IT CONTAINS CURRENT USER.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AC.CHRG.REQ.AUT(ENQ.DATA)
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
$INSERT I_F.USER


*    FN.USER='F.USER'
*    F.USER=''
*    R.USER=''
*    ERR1=''
*    CALL OPF (FN.USER,F.USER)
*    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

* $INSERT I_COMMON - Not Used anymore;'REMARKS'
* $INSERT I_EQUATE - Not Used anymore;'EQ'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;CODE

END
