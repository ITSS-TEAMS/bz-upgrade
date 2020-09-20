* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : VM CHANGED TO @VM
*----------------------------------------------------------------------
* <Rating>-20</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.REST.CHQ.ANCIENS(ENQ.DATA)
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
* Routine permettant de restrindre l affichage des demandes de chequiers aux cheques recus depuis plus d'un mois.
*
*------------------------------------------------------------------------
* 06 / 04 / 2010
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*-------------------------------------------------------------
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
MAIN:

OPEN.FILE:
* $INSERT I_EQUATE - Not Used anymore;DAY
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;'-30C')

    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1

    ENQ.DATA<2,V.VM> = 'DATE.RECEP.CONF'
    ENQ.DATA<3,V.VM> = 'LT'
    ENQ.DATA<4,V.VM> = DATE.LIMITE
    RETURN
END
