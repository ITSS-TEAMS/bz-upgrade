*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CV.DATE
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

    DATE.IN = O.DATA
    IF DATE.IN NE '' THEN
        SEP ="/"
        CALL BZ.CONV.DATE(DATE.IN,SEP)
    END
    O.DATA = DATE.IN  


    RETURN

END
