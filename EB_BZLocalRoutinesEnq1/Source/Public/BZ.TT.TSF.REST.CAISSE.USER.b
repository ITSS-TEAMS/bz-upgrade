*Modification History:
*-------------------------------------------------------
*ZIT-UPG-R13-R19  :  NO CHANGES
*----------------------------------------------------------------------
* <Rating>-20</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.TSF.REST.CAISSE.USER(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author  azdadou@temenos.com
* Routine permettant de restrindre l affichage au donnees de la caisse du user
*
*------------------------------------------------------------------------
* 26 / 03 / 2010
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*
*-------------------------------------------------------------
    GOSUB OPEN.FILE
    GOSUB MAIN
    RETURN
* $INSERT I_COMMON - Not Used anymore;------------------------------------------
OPEN.FILE:

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ER"
    F.TELLER.USER = ""
    CALL OPF(FN.TELLER.USER,F.TELLER.USER)

    RETURN

MAIN:

    R.TELLER.USER = ""
    ERR.TELLER.USER = ""
    CALL F.READ(FN.TELLER.USER,OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.TELLER.USER)
    VALEUR.CAISSE = R.TELLER.USER<1,1>

    V.VM = 0
    ENQ.EB.SystemTables.getVFunction()M> = 'CAISSE.EB.SystemTables.getVFunction() ENQ.DATA<3,V.VM> FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusATA<4,V.VM> = VALEUR.CAISSE

    RETURN
