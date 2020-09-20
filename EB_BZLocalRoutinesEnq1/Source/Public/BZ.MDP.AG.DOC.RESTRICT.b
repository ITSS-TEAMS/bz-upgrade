$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.AG.DOC.RESTRICT(ENQ.DATA)
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
* Modification History :      
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT          
*----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON      
    $INSERT I_F.USER
  
    ENQ.DATA<2,-1> = 'CODE.AGENCE'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> = R.USER<EB.USE.DEPARTMENT.CODE>

    RETURN
END
