* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------
*-----------------------------------------------------------
* reconstitution des critres dynamiques
*-----------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.CHECK.DAO (ENQ.DATA)
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
*-----------------------------------------------------------

    DAO = R.USER<EB.USE.DEPARTMENT.CODE>

    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

* $INSERT I_EQUATE - Not Used anymore;L + 1> = 'DEPT.CODE'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore; 'EQ'
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;

    RETURN
