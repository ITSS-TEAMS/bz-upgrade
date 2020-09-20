*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TTID.E.REST.AGENCE.USER(ENQ.DATA)
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
* Routine permettant de restrindre l affichage au donnees de Agence Utili
*
*------------------------------------------------------------------------
* 02 / 03 / 2010
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VM CHANGED @VM
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;----------------------------------
MAIN:
    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    ENQ.DATA<2,V.VM> = 'TELLER.OFFICE'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE
    RETURN
END
