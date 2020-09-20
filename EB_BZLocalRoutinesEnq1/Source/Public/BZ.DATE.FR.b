*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification histrory

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DATE.FR
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

    O.DATA = O.DATA[7,2] : '/' : O.DATA[5,2] : '/' : O.DATA[1,4]
    RETURN
