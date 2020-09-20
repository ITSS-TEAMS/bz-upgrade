$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.EMP.FORMAT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : NO CHANGES
*=======================================================================

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
*----------------------------------

    Y.CPT= O.DATA
    Y.CPT= FMT(Y.CPT,"R%10")
    O.DATA =Y.CPT
    RETURN
END
