*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.TSF.REST.AGENCE.USER(ENQ.DATA)
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
*------------------------------------------------------------------------
* 02 / 03 / 2010
*ZIT-UPG-R13-R19 : Converted VM to @VM. 
*-------------------------------------------------------------
$INSERT  I_COMMON
$INSERT  I_EQUATE
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_F.USER
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
MAIN:
    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1


* $INSERT I_ENQUIRY.COMMON - Not Used anymore;USE.DEPARTMENT.CODE>
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;EPTRICE'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE
    RETURN
END
