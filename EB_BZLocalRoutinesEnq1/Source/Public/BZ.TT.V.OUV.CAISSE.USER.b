*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-24</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM, VM to @FM, @VM, CONVERT to CHANGE
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.V.OUV.CAISSE.USER
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author aelidrissi@temenos.com
* Routine permettant de controler l utilisateur au moment de l ouverture d une caisse
* L utilisateur doit appartenir a la meme agence que la caisse a ouvrir
* L utiliseur doit le titulaire de la caisse a ouvrir
*
*------------------------------------------------------------------------
* 31 / 12 / 09
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.TELLER.ID
*
*-------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
    GOSUB MAIN
RETURN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;-----------------------------
OPEN.FILE:

    FN.TELLER.USER = "F.TELLER.USER"
    F.TELLER.USER = ""
    FN.USER = "F.USER"
    F.USER = ""

    CALL OPF(FN.TELLER.USER,F.TELLER.USER)
    CALL OPF(FN.USER,F.USER)
RETURN

MAIN:

    R.TEEB.SystemTables.getVFunction()= ""
    ERR.TELLER.USER = ""
    CALL FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusUSER,OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus R.USER = ""
    ERR.USER = ""
    CALL F.READ(FN.USER,OPERATOR,R.USER,F.USER,ERR.USER)

    VALEUR.CAISSE = R.TELLER.USER  ;* La caisse de l utilisateur en cours
    CHANGE @FM TO @VM IN VALEUR.CAISSE
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>  ;* L agence de l utilisateur en cours

* Controler si l utilisateur appartient a la meme agence que la caisse

    IF R.NEW(TT.TID.TELLER.OFFICE) NE DEPART.CODE THEN

        AF = TT.TID.USER
        ETEXT = "L utilisateur doit etre rattache a l agence de la caisse!"
        CALL STORE.END.ERROR

    END ELSE

* Controler si l utilisateur est le titulaire de la caisse
        IF ID.NEW MATCHES VALEUR.CAISSE THEN

        END ELSE

            AF = TT.TID.USER
            ETEXT = "L utilisateur ne peut pas ouvrir une caisse qui ne lui appartient pas!"
            CALL STORE.END.ERROR

       EB.DataAccess.OpfB.DataAccess.Opf
    END



RETURN
