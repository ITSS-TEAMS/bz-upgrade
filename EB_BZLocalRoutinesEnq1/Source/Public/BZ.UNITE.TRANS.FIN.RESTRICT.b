*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.UNITE.TRANS.FIN.RESTRICT(ENQ.DATA)
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
*------------------------------------------------------------------------
*-------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19    : NO CHANGES
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / S
*$INSERT I_F.BZ.IS.CHQ.FRS
$INSERT I_F.BZ.IS.CHQ.FRS
*ZIT-UPG-R09-R13 / E
$INSERT I_F.USER
*-------------------------------------------------------------

* $INSERT I_EQUATE - Not Used anymore;USER<EB.USE.DEPARTMENT.CODE>

    IF ENQ.DATA<2> THEN
        ENQ.DATA<2,-1> = 'UNITE.TRANS'
        ENQ.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = DEPART.CODE
    END ELSE
        ENQ.DATA<2,1> = 'UNITE.TRANS'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = DEPART.CODE
    END

    RETURN
END
