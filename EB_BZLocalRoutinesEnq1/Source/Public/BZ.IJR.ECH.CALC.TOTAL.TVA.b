$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IJR.ECH.CALC.TOTAL.TVA
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------------------
*ZIT-UPG-R13-R19:NO CHANGES
* ----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 S

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON

*ZIT-UPG-R13-R19 E

    O.DATA = SUM(R.RECORD<40>)

    RETURN
END
