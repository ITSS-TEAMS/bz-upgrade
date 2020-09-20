*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MON.NUM.COMPTE.CTX(ENQ.DATA)
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
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:NO CHANGES
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.TELLER
*-------------------------------------------------------------

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    ENQ.DATA<2,1> = 'IMAGE.REFERENCE'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = R.NEW(TT.TE.ACCOUNT.2)

    RETURN
END
