*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : NO CHANGES
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.ISRACIDCPT
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
*---------------------------------------
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
*-----------------------------------
INIT:
    ERR.ACCOUNT=""
    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ""
    R.ACCOUNT=""
    Y.ACCOUNT = O.DATA
*------------------------------------
OPENFILES:
* $INSERT I_COMMON - Not Used anymore;UNT,F.ACCOUNT)
    RETURN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;--------
PROCESS:
    CALL F.READ(    FN.ACCOUNT,    Y.ACCOUNT,    R.ACCOUNT,    F.ACCOUNT,    ERR.ACCOUNT)
    Y.CATEGORY=R.ACCOUNT<AC.CATEGORY>
    IF (Y.CATEGORY EQ '1002') THEN
        O.DATA=1
    END ELSE
        O.DATA=0
    END
    RETURN
