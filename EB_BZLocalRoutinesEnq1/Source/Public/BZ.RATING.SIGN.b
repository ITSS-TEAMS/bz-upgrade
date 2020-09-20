* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.SIGN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*********************************
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON

    $INSERT I_F.ACCOUNT

    OP.SIG=O.DATA

    IF OP.SIG EQ "" THEN
        O.DATA = "SEPARE"
    END

    RETURN
