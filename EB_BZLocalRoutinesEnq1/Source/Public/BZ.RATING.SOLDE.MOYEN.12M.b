$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.SOLDE.MOYEN.12M
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S  
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R13-R19/E
*-------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS

    RETURN
*-------------------------------------
INIT:
    ACCT.ID.TMP =O.DATA
    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ""
	ACCOUNT.ERR = ''
	ACCOUNT.REC = ''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;COUNT)

    CALL F.READ(FN.ACCOUNT,ACCT.ID.TMP,ACCOUNT.REC,F.ACCOUNT,ACCOUNT.ERR)
    IF ACCOUNT.ERR THEN
        GOSUB END.PROGRAM
    END ELSE
        V.DEVISE = ACCOUNT.REC<AC.CURRENCY>
        Y.DATA.FORM=TODAY
        CALL CDT('',Y.DATA.FORM,'-365C')
        ID.LIST=""
        OPENING.BAL=""
        ER=""
        FROM.DATE =""
        ACCT.REC = ""
        CREDIT.MVMT = ""
        EB.SystemTables.getVFunction() = ""
        SYSTEM.DATE = ""
        FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  Y.SOLDE.MOYEN=0
    END

    RETURN

*-FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-------------------
PROCESS:
    Y.ANNEE = Y.DATA.FORM[1,4]
    Y.MOIS = Y.DATA.FORM[5,2]

    Y.MOIS+=1
    Y.MOIS = FMT(Y.MOIS,"R%2")

    FOR COMPTEUR = 1 TO 12
        IF Y.MOIS GT 12 THEN
            Y.ANNEE +=1
            Y.MOIS = "01"
        END
        FROM.DATE = Y.ANNEE:Y.MOIS:"01"
        GOSUB GET.SOLDE.FIN
        IF OPENING.BAL THEN
            Y.SOMME = Y.SOMME + OPENING.BAL
        END
        Y.MOIS+=1

        Y.MOIS = FMT(Y.MOIS,"R%2")


    NEB.DataAccess.OpfB.DataAccess.OpfOMPTEUR

    Y.SOLDE.MOYEN = Y.SOMME /12
    CALL EB.ROUND.AMOUNT(V.DEVISE,Y.SOLDE.MOYEN,"","")
    O.DATA= Y.SOLDEB.SystemTables.getRNew()EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.DataAccess.FRead-----------------------------------

GET.SOLDE.FIN:
    CALL EB.GET.ACCT.BALANCEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerT.REC, 'BOOKING', FROM.DATE, SYSTEM.DATE,OPENING.BAL, CREDIT.MVMT, DEBIT.MVMT, ERR.MSG)

    RETURN
EB.SystemTables.setE()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.SOLDE.MOYEN.12M
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S  
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R13-R19/E
*-------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS

    RETURN
*-------------------------------------
INIT:
    ACCT.ID.TMP =O.DATA
    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ""
	ACCOUNT.ERR = ''
	ACCOUNT.REC = ''
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    CALL F.READ(FN.ACCOUNT,ACCT.ID.TMP,ACCOUNT.REC,F.ACCOUNT,ACCOUNT.ERR)
    IF ACCOUNT.ERR THEN
        GOSUB END.PROGRAM
    END ELSE
        V.DEVISE = ACCOUNT.REC<AC.CURRENCY>
        Y.DATA.FORM=TODAY
        CALL CDT('',Y.DATA.FORM,'-365C')
        ID.LIST=""
        OPENING.BAL=""
        ER=""
        FROM.DATE =""
        ACCT.REC = ""
        CREDIT.MVMT = ""
        DEBIT.MVMT = ""
        SYSTEM.DATE = ""
        Y.SOMME=0
        Y.SOLDE.MOYEN=0
    END

    RETURN

*-------------------------------------
PROCESS:
    Y.ANNEE = Y.DATA.FORM[1,4]
    Y.MOIS = Y.DATA.FORM[5,2]

    Y.MOIS+=1
    Y.MOIS = FMT(Y.MOIS,"R%2")

    FOR COMPTEUR = 1 TO 12
        IF Y.MOIS GT 12 THEN
            Y.ANNEE +=1
            Y.MOIS = "01"
        END
        FROM.DATE = Y.ANNEE:Y.MOIS:"01"
        GOSUB GET.SOLDE.FIN
        IF OPENING.BAL THEN
            Y.SOMME = Y.SOMME + OPENING.BAL
        END
        Y.MOIS+=1

        Y.MOIS = FMT(Y.MOIS,"R%2")


    NEXT COMPTEUR

    Y.SOLDE.MOYEN = Y.SOMME /12
    CALL EB.ROUND.AMOUNT(V.DEVISE,Y.SOLDE.MOYEN,"","")
    O.DATA= Y.SOLDE.MOYEN

    RETURN
*-------------------------------------

GET.SOLDE.FIN:
    CALL EB.GET.ACCT.BALANCE (ACCT.ID.TMP, ACCT.REC, 'BOOKING', FROM.DATE, SYSTEM.DATE,OPENING.BAL, CREDIT.MVMT, DEBIT.MVMT, ERR.MSG)

    RETURN
*---------------------------------------------------------------------

END.PROGRAM:
END
