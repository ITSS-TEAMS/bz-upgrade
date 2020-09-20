*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONV.JUL.DATE
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

    V.DATE = O.DATA

    CALL JULDATE(STD.DATE,V.DATE)

    O.DATA = STD.DATE

    RETURN
END
