
*ZIT-UPG-R13-R19: Converted VM, SM TO @VM, @SM.
*------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
	SUBROUTINE BZ.CUS.ADDRESS
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
    $INSERT I_F.CUSTOMER

    Y.ADD = O.DATA
    CHANGE @VM TO ' ' IN Y.ADD
    CHANGE @SM TO ' ' IN Y.ADD
    O.DATA=Y.ADD

    RETURN
