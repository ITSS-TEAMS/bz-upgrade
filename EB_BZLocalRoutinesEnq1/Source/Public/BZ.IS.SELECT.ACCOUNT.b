* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : VM CHANGED TO @VM
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.SELECT.ACCOUNT(ENQ.DATA)
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
* Routine permettant de forcer le choix d'un compte
*
*------------------------------------------------------------------------
* 06 / 04 / 2010
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
MAIN:
* $INSERT I_COMMON - Not Used anymore;Q.DATA<2>,@VM)

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;>
    COMPTE = "CURR.":COMPTE

    *ENQ.DATA<2,V.VM> = '@ID'
    ENQ.DATA<3,V.VM> = 'LK'
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;    RETURN
END
