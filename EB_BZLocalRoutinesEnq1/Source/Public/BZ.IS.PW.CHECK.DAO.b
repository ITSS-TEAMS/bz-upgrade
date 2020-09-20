*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------

* reconstitution des critres dynamiques
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.PW.CHECK.DAO (ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON  
$INSERT I_F.USER
*-----------------------------------------------------------

    DAO = R.USER<EB.USE.DEPARTMENT.CODE>
*    DAO = FMT(DAO,"R%5")

    SELECT.ENQ  = ENQ.DATA<2>  

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

    ENQ.DATA<2,NB.SEL + 1> = 'DEPT.CODE'
* $INSERT I_COMMON - Not Used anymore;L + 1> = 'EQ'
* $INSERT I_EQUATE - Not Used anymore;L + 1> = DAO


    RETURN
