*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.CLASS.POUR.TOTAL(Y.DATA,Y.CLASS)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-NO CHANGES
********************************************************
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON



    Y.DATA = FIELD(Y.DATA,",",1)

    IF Y.DATA GE 20 THEN
        Y.CLASS = "BOLD-RED"

    END ELSE
        Y.CLASS = "GREEN"

    END

    RETURN
