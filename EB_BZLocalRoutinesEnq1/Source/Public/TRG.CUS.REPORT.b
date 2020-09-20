* Modification History :                                                                                
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM 
*                   CRT IS COMMENTED FOR BROWSER COMPATABILITY ISSUE
*-----------------------------------------------------------------------------
* <Rating>76</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE TRG.CUS.REPORT(AC.DET.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.CUSTOMER.ACCOUNT
$INSERT I_F.STMT.ENTRY
$INSERT I_F.HOLIDAY
$INSERT I_ENQUIRY.COMMON


    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*--------------*
INITIALISATION:
*--------------*

    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''

    FN.AC="FBNK.ACCOUNT"
    F.AC=""

    FN.STMT = 'F.STMT.ENTRY'
    F.STMT = ''

    FN.HOLIDAY="F.HOLIDAY"
    F.HOLIDAY=""

    ANNEEB.SystemTables.getVFunction()Y[1,4]
    MOIS.COUR=TODAY[5,2]-1
    MFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.COUR, "R%2")
    ANN.MO.COUR=ANNE.COUR:MOIS.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMOIS.TRAIT=0
    LISTE.COMPTE.RES=""

    RETURN

*----------*
OPEN.FILES:
*----------*
    CALL OPF(FN.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.HOLIDAY,F.HOLIDAY)
    CALL OPF(FN.AC,F.AC)

    RETURN

*-------*
PROCESS:
*-------*
*Locate and extract the customer number from the selection criteria box
    LOCATE "CUSTOMER.NO" IN D.FIELDS<1> SETTING CUS.POS THEN
        CUSTOMER.NO = D.RANGE.AND.VALUE<CUS.POS>
    END
CUS.ACC.REC =''
CUS.ACC.R.ERR =''
    CALL F.READ(FN.CUSTOMER.ACCOUNT,CUSTOMER.NO,CUS.ACC.REC,F.CUSTOMER.ACCOUNT,CUS.ACC.R.ERR)

    LOOEB.DataAccess.OpfB.DataAccess.Opf      REMOVE AC.ID FROM CUS.ACC.REC SETTING AC.POS
    WHILE AC.ID:AC.POS

        NOMBRE.MOIS.TRAIT=0
        Y.ANNE=""
     FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef       AEB.DataAccess.FReadTMP=""
        *AC.ID=SEL.LIST<COMPTEUR.CPT>
*        CRT "Traitement compte ":AC.ID:" en cours..."
ACCT.REC =''
AC.REC =''
        CALL F.REB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerCT.REC,F.AC,AC.REC)
        Y.OPEB.SystemTables.setE(ACCT.REC<AC.OPENING.DATE>)
        Y.ACCOUNT.TITLE.1=ACCT.REC<AC.CUSTOMER>
        IF Y.OPEN.DAEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer         E="ERROR-OPENING DATE MISSING"
        END ELSEEB.DataAccess.FWrite      LOOP
*                NOMBRE.MOIS.TRAIT++
                NOMBRE.MOIS.TRAIT+=1
        EB.SystemTables.setAf(Y.ANNE:Y.MOIS)
        EB.SystemTables.setE()* Modification History :                                                                                
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM 
*                   CRT IS COMMENTED FOR BROWSER COMPATABILITY ISSUE
*-----------------------------------------------------------------------------
* <Rating>76</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE TRG.CUS.REPORT(AC.DET.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.CUSTOMER.ACCOUNT
$INSERT I_F.STMT.ENTRY
$INSERT I_F.HOLIDAY
$INSERT I_ENQUIRY.COMMON


    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*--------------*
INITIALISATION:
*--------------*

    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''

    FN.AC="FBNK.ACCOUNT"
    F.AC=""

    FN.STMT = 'F.STMT.ENTRY'
    F.STMT = ''

    FN.HOLIDAY="F.HOLIDAY"
    F.HOLIDAY=""

    ANNE.COUR=TODAY[1,4]
    MOIS.COUR=TODAY[5,2]-1
    MOIS.COUR=FMT(MOIS.COUR, "R%2")
    ANN.MO.COUR=ANNE.COUR:MOIS.COUR
    NOMBRE.MOIS.TRAIT=0
    LISTE.COMPTE.RES=""

    RETURN

*----------*
OPEN.FILES:
*----------*
    CALL OPF(FN.CUSTOMER.ACCOUNT,F.CUSTOMER.ACCOUNT)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.HOLIDAY,F.HOLIDAY)
    CALL OPF(FN.AC,F.AC)

    RETURN

*-------*
PROCESS:
*-------*
*Locate and extract the customer number from the selection criteria box
    LOCATE "CUSTOMER.NO" IN D.FIELDS<1> SETTING CUS.POS THEN
        CUSTOMER.NO = D.RANGE.AND.VALUE<CUS.POS>
    END
CUS.ACC.REC =''
CUS.ACC.R.ERR =''
    CALL F.READ(FN.CUSTOMER.ACCOUNT,CUSTOMER.NO,CUS.ACC.REC,F.CUSTOMER.ACCOUNT,CUS.ACC.R.ERR)

    LOOP
        REMOVE AC.ID FROM CUS.ACC.REC SETTING AC.POS
    WHILE AC.ID:AC.POS

        NOMBRE.MOIS.TRAIT=0
        Y.ANNE=""
        Y.MOIS=""
        ANN.MO.TMP=""
        *AC.ID=SEL.LIST<COMPTEUR.CPT>
*        CRT "Traitement compte ":AC.ID:" en cours..."
ACCT.REC =''
AC.REC =''
        CALL F.READ(FN.AC,AC.ID,ACCT.REC,F.AC,AC.REC)
        Y.OPEN.DATE = ACCT.REC<AC.OPENING.DATE>
        Y.ACCOUNT.TITLE.1=ACCT.REC<AC.CUSTOMER>
        IF Y.OPEN.DATE EQ "" THEN
            E="ERROR-OPENING DATE MISSING"
        END ELSE
            LOOP
*                NOMBRE.MOIS.TRAIT++
                NOMBRE.MOIS.TRAIT+=1
                ANN.MO.TMP=Y.ANNE:Y.MOIS
                IF ANN.MO.TMP EQ "" THEN
                    ANN.MO.TMP=Y.OPEN.DATE[1,6]
                END ELSE
                    Y.MOIS=Y.MOIS+1
                    IF Y.MOIS GT 12 THEN
                        Y.MOIS=MOD(Y.MOIS,12)
                        Y.ANNE=Y.ANNE+1
                    END
                    Y.ANNE=FMT(Y.ANNE, "R%4")
                    Y.MOIS=FMT(Y.MOIS, "R%2")
                END
            WHILE (ANN.MO.COUR GT ANN.MO.TMP)DO
                GOSUB TRAIT.MOIS.CPT
            REPEAT
        END

*AC.DET.ARR<-1> = AC.ID:"*":FWD.CR.AMT:"*":FWD.DR.AMT:"*":CR.TOT.INT:"*":DR.TOT.INT
    REPEAT

    RETURN
*--------------
TRAIT.MOIS.CPT:
*-------------
    IF NOMBRE.MOIS.TRAIT EQ 1 THEN
        Y.ANNE=Y.OPEN.DATE[1,4]
        Y.MOIS=Y.OPEN.DATE[5,2]
        GOSUB GET.FIN.MOIS
        Y.DATE.FIN=Y.ANNE:Y.MOIS:NOMBRE.JOURS
        FROM.DATE=Y.OPEN.DATE
        TO.DATE=Y.DATE.FIN
        GOSUB TRAIT.TXN.CPT
    END ELSE
        Y.ANNE=FMT(Y.ANNE, "R%4")
        Y.MOIS=FMT(Y.MOIS, "R%2")
        GOSUB GET.FIN.MOIS
        Y.DATE.FIN=Y.ANNE:Y.MOIS:NOMBRE.JOURS
        FROM.DATE=Y.ANNE:Y.MOIS:"01"
        TO.DATE=Y.DATE.FIN
        GOSUB TRAIT.TXN.CPT
    END
    RETURN
*--------------
TRAIT.TXN.CPT:
*--------------
    ID.LIST=""
    OPENING.BAL=""
    ER=""
    CALL EB.ACCT.ENTRY.LIST(AC.ID,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
    GOSUB TRAIT.TXN.ACCOUNT
    SOLDE.FIN.TOTAL.COMPTE=OPENING.BAL+SOLDE.FIN.MOIS
    MOIS.ANNEE = TO.DATE[1 ,6]
********************
    SOLDE.FIN.TOTAL.COMPTE = FMT (SOLDE.FIN.TOTAL.COMPTE,"R3")
    CHANGE "." TO "" IN SOLDE.FIN.TOTAL.COMPTE
    CHANGE "," TO "" IN SOLDE.FIN.TOTAL.COMPTE
    FRM="R ### ### ### ###,#3"
    SOLDE.FIN.TOTAL.COMPTE=FMT(SOLDE.FIN.TOTAL.COMPTE,FRM)
    SOLDE.FIN.TOTAL.COMPTE = TRIM(SOLDE.FIN.TOTAL.COMPTE,'',"L")

    SOLDE.DEBIT.MOIS = FMT (SOLDE.DEBIT.MOIS,"R3")
    CHANGE "." TO "" IN SOLDE.DEBIT.MOIS
    CHANGE "," TO "" IN SOLDE.DEBIT.MOIS
    FRM="R ### ### ### ###,#3"
    SOLDE.DEBIT.MOIS=FMT(SOLDE.DEBIT.MOIS,FRM)
    SOLDE.DEBIT.MOIS = TRIM(SOLDE.DEBIT.MOIS,'',"L")

    SOLDE.CREDIT.MOIS = FMT (SOLDE.CREDIT.MOIS,"R3")
    CHANGE "." TO "" IN SOLDE.CREDIT.MOIS
    CHANGE "," TO "" IN SOLDE.CREDIT.MOIS
    FRM="R ### ### ### ###,#3"
    SOLDE.CREDIT.MOIS=FMT(SOLDE.CREDIT.MOIS,FRM)
    SOLDE.CREDIT.MOIS = TRIM(SOLDE.CREDIT.MOIS,'',"L")


    AC.DET.ARR<-1>=Y.ACCOUNT.TITLE.1:"*":AC.ID:"*":MOIS.ANNEE:"*":SOLDE.DEBIT.MOIS:"*":SOLDE.CREDIT.MOIS:"*":SOLDE.FIN.TOTAL.COMPTE
    RETURN

*------------*
TRAIT.TXN.ACCOUNT:
*------------*

    MONTANT.TOTAL.TXN=0
    IF ID.LIST THEN
        NBRE.TXNS=DCOUNT(ID.LIST,@FM)
    END ELSE
        NBRE.TXNS=0
    END
    SOLDE.FIN.MOIS=0
    SOLDE.CREDIT.MOIS=0
    SOLDE.DEBIT.MOIS=0
    FOR COMPTEUR.TXN=1 TO NBRE.TXNS
        ID.TRANSA=ID.LIST<COMPTEUR.TXN>
        CALL F.READ(FN.STMT,ID.TRANSA,STMT.REC,F.STMT,STMT.ER)
        MONTANT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>
        MONTANT.CREDIT=0
        MONTANT.DEBIT=0
        IF MONTANT.LCY GE 0 THEN
            MONTANT.CREDIT=MONTANT.LCY
        END ELSE
            MONTANT.DEBIT=ABS(MONTANT.LCY)
        END
        SOLDE.CREDIT.MOIS=SOLDE.CREDIT.MOIS+MONTANT.CREDIT
        SOLDE.DEBIT.MOIS=SOLDE.DEBIT.MOIS+MONTANT.DEBIT
    NEXT COMPTEUR.TXN
    SOLDE.FIN.MOIS=SOLDE.CREDIT.MOIS-SOLDE.DEBIT.MOIS

    RETURN

*------------*
GET.FIN.MOIS:
*------------*
    V.HOLIDAY.ID="TN00":Y.ANNE
	HOLIDAY.REC =''
	ERR.HOLIDAY =''
    CALL F.READ(FN.HOLIDAY,V.HOLIDAY.ID,HOLIDAY.REC, F.HOLIDAY, ERR.HOLIDAY)
    IF ERR.HOLIDAY THEN
        E="ANNE ERRONE":Y.ANNE
        CALL ERR
    END ELSE
        BEGIN CASE
        CASE Y.MOIS EQ 1
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.01.TABLE>
        CASE Y.MOIS EQ 2
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.02.TABLE>
        CASE Y.MOIS EQ 3
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.03.TABLE>
        CASE Y.MOIS EQ 4
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.04.TABLE>
        CASE Y.MOIS EQ 5
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.05.TABLE>
        CASE Y.MOIS EQ 6
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.06.TABLE>
        CASE Y.MOIS EQ 7
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.07.TABLE>
        CASE Y.MOIS EQ 8
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.08.TABLE>
        CASE Y.MOIS EQ 9
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.09.TABLE>
        CASE Y.MOIS EQ 10
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.10.TABLE>
        CASE Y.MOIS EQ 11
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.11.TABLE>
        CASE Y.MOIS EQ 12
            TABLE.HOLIDAY.MOIS=HOLIDAY.REC<EB.HOL.MTH.12.TABLE>
        END CASE
        NOMBRE.JOURS.OUV=COUNT(TABLE.HOLIDAY.MOIS,"W")
        NOMBRE.JOURS.FER=COUNT(TABLE.HOLIDAY.MOIS,"H")
        NOMBRE.JOURS=NOMBRE.JOURS.OUV+NOMBRE.JOURS.FER
    END
    RETURN



*End of routine
END
