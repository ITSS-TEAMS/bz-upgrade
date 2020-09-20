*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-21</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.E.REST.CAISSE.USER(ENQ.DATA)
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
* 05 / 01 / 2010
*-----------------------------------------------------------------------------
* MODIFICATION HISTORY :

*ZIT-UPG-R13-R19 : NO CHANGE
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E
*-------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
    GOSUB MAIN
    RETURN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;-----------------------------
OPEN.FILE:

    FN.TELLER.USER = "F.TELLER.USER"
    F.TELLER.USER = ""
    CALL OPF(FN.TELLER.USER,F.TELLER.USER)

    RETURN

MAIN:

    R.TELLER.USER = ""
    ERR.TELLER.USER = ""
    CALL F.READ(FN.TELLER.USER,OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.TELLER.USER)
    VALEEB.SystemTables.getVFunction()= R.TELLER.USEB.SystemTables.getVFunction()
    *TELLER.ID.1 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCEPTRICE (VERS CAISSE)
    V.VM = 0
    ENQ.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusELLER.ID.1'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = VALEUR.CAISSE

    RETURN
END
