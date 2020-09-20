*-------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19:NO CHANGES
*-------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SIGNATORY.RESTRICT.DDE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.USER
*-------------------------------------------------------------

    ENQ.DATA<2,1> = '@ID'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = PREVIOUS.RECORD<12>

    RETURN
END
