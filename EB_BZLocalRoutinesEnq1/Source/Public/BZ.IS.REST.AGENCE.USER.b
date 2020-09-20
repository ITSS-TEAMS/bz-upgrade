*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.REST.AGENCE.USER(ENQ.DATA)
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
* Routine permettant de restrindre l affichage de l'unite receptrice au donnees de Agence Utilisateur
*
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted VM to @VM
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
* $INSERT I_COMMON - Not Used anymore;Q.DATA<2>,@VM) + 1


* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;EPARTMENT.CODE>
    ENQ.DATA<2,V.VM> = 'UNITE.GESTION'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE
    RETURN
END
