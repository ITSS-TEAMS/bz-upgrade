***AUTHOR : FEHMI BOUNOUARA
*-------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:NO CHANGES
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.RESTRICT.DAB(ENQ.DATA)
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
$INSERT I_F.USER

    DEPART.CODE=R.USER<EB.USE.DEPARTMENT.CODE>
    ENQ.DATA<2,1>="UNITE.GESTION"
    ENQ.DATA<3,1>="EQ"
    ENQ.DATA<4,1>=DEPART.CODE

END
