*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-20</Rating>
*----------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : VM CHANGED TO @VM;
*----------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FT.ANCIENS(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 24 / 04 / 2010
*-------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R13-R19/E
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
* $INSERT I_EQUATE - Not Used anymore;------------------------------------------
MAIN:

OPEN.FILE:
    DATE.LIMITE = TODAY
    CALL CDT('',DATE.LIMITE,'-2W')

    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1

    ENQ.DATA<2,V.VM> = 'PROCESSING.DATE'
    ENQ.DATA<3,V.VM> = 'LE'
    ENQ.DATA<4,V.VM> = DATE.LIMITE
    RETURN
END
