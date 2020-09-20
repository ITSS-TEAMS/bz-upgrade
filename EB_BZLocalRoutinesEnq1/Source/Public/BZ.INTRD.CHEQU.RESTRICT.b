* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGE
*-----------------------------------------------------------------------------
* <Rating>-11</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.INTRD.CHEQU.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER

    Y.COMPTE = ENQ.DATA<4,1>

    Y.COMPTE.NEW = FMT(Y.COMPTE,"R%10")

    ENQ.DATA<4,1> = "CURR.":Y.COMPTE.NEW


    RETURN

END
