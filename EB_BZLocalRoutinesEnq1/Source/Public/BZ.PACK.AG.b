*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PACK.AG(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author AMENI YOUNES
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.BZ.PACK
*-------------------------------------------------------------

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    IF ENQ.DATA<2> THEN
        ENQ.DATA<2,-1> = 'DEPT.CODE'
        ENQ.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = DEPART.CODE
    END     ELSE
        ENQ.DATA<2,1> = 'DEPT.CODE'
* $INSERT I_COMMON - Not Used anymore;> = 'EQ'
* $INSERT I_EQUATE - Not Used anymore;> = DEPART.CODE
    END

    RETURN
END
