*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.REST.AGENCE.USER(ENQ.DATA)
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
* Routine permettant de restrindre l affichage au donnees de Agence Utilisateur
*
*------------------------------------------------------------------------
* 28 / 04 / 2010
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM
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
* $INSERT I_COMMON - Not Used anymore;Q.DATA<2>,@VM) + 1


* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;EPARTMENT.CODE>
    ENQ.DATA<2,V.VM> = 'DEPT.CODE'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE
    RETURN
END
