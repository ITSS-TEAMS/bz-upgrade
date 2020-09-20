*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description : Verifier l'egibilite du compte FACTURATION
*---------------------------------------------
*Modification History:

*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CUS.FACT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3


    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
*    $INSERT BP I_F.BZ.COFFRE.CONTRAT
* $INSERT I_COMMON - Not Used anymore;E.CONTRAT
* $INSERT I_EQUATE - Not Used anymore;

    IF MESSAGE EQ 'VAL' THEN RETURN

    ACCOUNT.ID=COMI
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;IENT)
    FN.ACC = "F.ACCOUNT"
    F.ACC = ""
    R.ACC= ''
    ERR.ACC = ''

    CALL OPF(FN.ACC,F.ACC)

******************************

    CALLEB.SystemTables.getVFunction().ACC,ACCOUNT.ID,R.ACC,F.ACC,ERR.ACCEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
        ACC.CUS = R.ACC<AC.CUSTOMER>
       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusC<AC.CATEGORY>

        IF ACC.CUS NE CPT.CLT THEN
            ETEXT="Compte n'appartient pas au client: " : CPT.CLT
            CALL STORE.END.ERROR
        END ELSE

            IF ACC.CATEG LT 1000 OR ACC.CATEG GT 1999 THEN

                ETEXT="Categorie de Compte non permise: " : ACC.CATEG
                CALL STORE.END.ERROR

            END


        END

    END ELSE

        ETEXT="Compte inexistant"
        CALL STORE.END.ERROR


    END

    RETUREB.DataAccess.Opf
END
