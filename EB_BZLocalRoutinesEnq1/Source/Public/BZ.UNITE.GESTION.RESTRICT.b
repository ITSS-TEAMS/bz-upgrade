*-----------------------------------------------------------------------------
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.UNITE.GESTION.RESTRICT(ENQ.DATA)
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : NO CHANGES;
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.BZ.EMISSION.CHQ.BQ
$INSERT I_F.BZ.EMISSION.CHQ.BQ
*ZIT-UPG-R09-R13 / E
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E
* $INSERT I_COMMON - Not Used anymore;------------------------------------------

*Y.SELECT=ENQ.DATA<2>

*NBRE.VM=DCOUNT(Y.SELECT,@VM)

*NBRE.VM=NBRE.VM+1

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    IF ENQ.DATA<2> THEN
        ENQ.DATA<2,-1> = 'UNITE.EMISSION'
        ENQ.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = DEPART.CODE
    END ELSE
        ENQ.DATA<2,1> = 'UNITE.EMISSION'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = DEPART.CODE
    END
    RETURN
END
