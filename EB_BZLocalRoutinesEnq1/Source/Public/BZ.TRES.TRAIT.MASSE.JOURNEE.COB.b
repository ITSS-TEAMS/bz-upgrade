$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.TRAIT.MASSE.JOURNEE.COB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT et vente de la journee
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:FM,VM converted to @FM,@VM
*               :GET.LOC.REF converted to MULTI.GET.LOC.REF                   
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR
    $INSERT I_F.STMT.ENTRY

    $INSERT I_F.BZ.CPT.GEN.COMPTA
    $INSERT I_F.BZ.CPS.PARAMETER
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.BZ.FX.TXN.ETRANGER


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
***********************
INIT:
***********************

***************
    SOURCE.OFS = "TAG"
    STATUT = 2
    DEPARTEMENT = 6030

********
    Y.TIEB.SystemTables.getVFunction()(TIME(), "MTSEB.SystemTables.getVFunction()ANGE ':' TO '' IN FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRE.GEN = FMT(Y.TIME[1,6],"6L")
********
    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC=""
    EVT.REC=""
    REC.CPS.PARAMS = ''
	ETR.REC=''
	ETR.ERR=''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (REC.CPS.PARAMS)
    OFS.LOGIN = REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
    OFS.PASSWD = REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>
****************

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.COMPTA = "F.BZ.CPT.GEN.COMPTA"
    F.COMPTA = ""

    FN.FT = "F.FUNDS.TRANSFER$HIS"
    F.FT = ""

    FN.ETR = "F.BZ.FX.TXN.ETRANGER"
    F.ETREB.DataAccess.Opf""

    Y.YEB.DataAccess.OpfERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    FROM.DATE = Y.YESTERDAY
    TO.DATE = Y.YEEB.SystemTables.getRNew()AFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.DataAccess.FReadS='...TND1401600...'

    CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"

    ECRAN = "FOREX,OPERATIONEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
*ZIT-UPG-R13EB.SystemTables.setE()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.TRAIT.MASSE.JOURNEE.COB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT et vente de la journee
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:FM,VM converted to @FM,@VM
*               :GET.LOC.REF converted to MULTI.GET.LOC.REF                   
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR
    $INSERT I_F.STMT.ENTRY

    $INSERT I_F.BZ.CPT.GEN.COMPTA
    $INSERT I_F.BZ.CPS.PARAMETER
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.BZ.FX.TXN.ETRANGER


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
***********************
INIT:
***********************

***************
    SOURCE.OFS = "TAG"
    STATUT = 2
    DEPARTEMENT = 6030

********
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

    HEURE.GEN = FMT(Y.TIME[1,6],"6L")
********
    ERR1=""
    AC.REC=""
    EVT.REC=""
    REC.CPS.PARAMS = ''
	ETR.REC=''
	ETR.ERR=''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (REC.CPS.PARAMS)
    OFS.LOGIN = REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
    OFS.PASSWD = REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>
****************

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.COMPTA = "F.BZ.CPT.GEN.COMPTA"
    F.COMPTA = ""

    FN.FT = "F.FUNDS.TRANSFER$HIS"
    F.FT = ""

    FN.ETR = "F.BZ.FX.TXN.ETRANGER"
    F.ETR = ""

    Y.YESTERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    FROM.DATE = Y.YESTERDAY
    TO.DATE = Y.YESTERDAY

    CATEGORY.POS='...TND1401600...'

    CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"

    ECRAN = "FOREX,OPERATION.MASSE.COB"   
	
*ZIT-UPG-R13-R19 S
*   CALL GET.LOC.REF("FUNDS.TRANSFER","FULL.PAY",NEG.POS)
    Y.APPLICATION.NAEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer"
	Y.FIELD.NAME="FULL.PAY"
	Y.POS=''EB.DataAccess.FWriteMULTI.GET.LOC.REF(Y.APPLICATION.NAME,Y.FIELD.NAME,Y.POS)
	NEG.POS=Y.POS<1,1>
*ZIT-UPG-R13-R19 E

    REEB.SystemTables.setAf()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.TRAIT.MASSE.JOURNEE.COB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT et vente de la journee
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:FM,VM converted to @FM,@VM
*               :GET.LOC.REF converted to MULTI.GET.LOC.REF                   
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR
    $INSERT I_F.STMT.ENTRY

    $INSERT I_F.BZ.CPT.GEN.COMPTA
    $INSERT I_F.BZ.CPS.PARAMETER
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.BZ.FX.TXN.ETRANGER


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
***********************
INIT:
***********************

***************
    SOURCE.OFS = "TAG"
    STATUT = 2
    DEPARTEMENT = 6030

********
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

    HEURE.GEN = FMT(Y.TIME[1,6],"6L")
********
    ERR1=""
    AC.REC=""
    EVT.REC=""
    REC.CPS.PARAMS = ''
	ETR.REC=''
	ETR.ERR=''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (REC.CPS.PARAMS)
    OFS.LOGIN = REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
    OFS.PASSWD = REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>
****************

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.COMPTA = "F.BZ.CPT.GEN.COMPTA"
    F.COMPTA = ""

    FN.FT = "F.FUNDS.TRANSFER$HIS"
    F.FT = ""

    FN.ETR = "F.BZ.FX.TXN.ETRANGER"
    F.ETR = ""

    Y.YESTERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    FROM.DATE = Y.YESTERDAY
    TO.DATE = Y.YESTERDAY

    CATEGORY.POS='...TND1401600...'

    CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"

    ECRAN = "FOREX,OPERATION.MASSE.COB"   
	
*ZIT-UPG-R13-R19 S
*   CALL GET.LOC.REF("FUNDS.TRANSFER","FULL.PAY",NEG.POS)
    Y.APPLICATION.NAME="FUNDS.TRANSFER"
	Y.FIELD.NAME="FULL.PAY"
	Y.POS=''
	CALL MULTI.GET.LOC.REF(Y.APPLICATION.NAME,Y.FIELD.NAME,Y.POS)
	NEG.POS=Y.POS<1,1>
*ZIT-UPG-R13-R19 E

    RETUEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.TRAIT.MASSE.JOURNEE.COB
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT et vente de la journee
*-----------------------------------------------------------------------------
*Modification History:                                                        
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:FM,VM converted to @FM,@VM
*               :GET.LOC.REF converted to MULTI.GET.LOC.REF                   
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR
    $INSERT I_F.STMT.ENTRY

    $INSERT I_F.BZ.CPT.GEN.COMPTA
    $INSERT I_F.BZ.CPS.PARAMETER
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.BZ.FX.TXN.ETRANGER


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
***********************
INIT:
***********************

***************
    SOURCE.OFS = "TAG"
    STATUT = 2
    DEPARTEMENT = 6030

********
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME

    HEURE.GEN = FMT(Y.TIME[1,6],"6L")
********
    ERR1=""
    AC.REC=""
    EVT.REC=""
    REC.CPS.PARAMS = ''
	ETR.REC=''
	ETR.ERR=''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (REC.CPS.PARAMS)
    OFS.LOGIN = REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
    OFS.PASSWD = REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>
****************

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.COMPTA = "F.BZ.CPT.GEN.COMPTA"
    F.COMPTA = ""

    FN.FT = "F.FUNDS.TRANSFER$HIS"
    F.FT = ""

    FN.ETR = "F.BZ.FX.TXN.ETRANGER"
    F.ETR = ""

    Y.YESTERDAY = TODAY
    CALL CDT('',Y.YESTERDAY,'-1W')

    FROM.DATE = Y.YESTERDAY
    TO.DATE = Y.YESTERDAY

    CATEGORY.POS='...TND1401600...'

    CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"

    ECRAN = "FOREX,OPERATION.MASSE.COB"   
	
*ZIT-UPG-R13-R19 S
*   CALL GET.LOC.REF("FUNDS.TRANSFER","FULL.PAY",NEG.POS)
    Y.APPLICATION.NAME="FUNDS.TRANSFER"
	Y.FIELD.NAME="FULL.PAY"
	Y.POS=''
	CALL MULTI.GET.LOC.REF(Y.APPLICATION.NAME,Y.FIELD.NAME,Y.POS)
	NEG.POS=Y.POS<1,1>
*ZIT-UPG-R13-R19 E

    RETURN
***********************
OPENFILES:
***********************
    CALL OPF(FN.STMT.ENTRY,F.STMT.ENTRY)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.COMPTA,F.COMPTA)
    CALL OPF(FN.FT,F.FT)
    CALL OPF(FN.ETR,F.ETR)

    RETURN

***********************
PROCESS:
***********************

    SEL.ACCOUNT= "SELECT ":FN.AC:CONDITION.SEL
	SEL.ACCOUNT.IDS=''
	SEL.ACCOUNT.COUNT=''
	SEL.ACCOUNT.ERROR=''
    CALL EB.READLIST(SEL.ACCOUNT, SEL.ACCOUNT.IDS, '', SEL.ACCOUNT.COUNT, SEL.ACCOUNT.ERROR)

    FOR COMPTEUR.AC=1 TO SEL.ACCOUNT.COUNT
        ID.LIST=""
        OPENING.BAL=""
        ER=""
        ACCT.ID=SEL.ACCOUNT.IDS<COMPTEUR.AC>

        MONTANT.TOTAL.DVS.ACHAT=0
        MONTANT.TOTAL.LCY.ACHAT=0

        MONTANT.TOTAL.DVS.VENTE=0
        MONTANT.TOTAL.LCY.VENTE=0

        SOLDE.FIN.PERIODE=0

        CALL EB.ACCT.ENTRY.LIST(ACCT.ID,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
*******
        ACCT.ID=ACCT.ID<1>
******* 

        IF ID.LIST THEN

            NBRE.TXN.AC=DCOUNT(ID.LIST,@FM)

            GOSUB TRAIT.STMT

            MONTANT.TOTAL.DVS.ACHAT = ABS(MONTANT.TOTAL.DVS.ACHAT)

            IF MONTANT.TOTAL.DVS.ACHAT GT 0 THEN

                MONTANT.COMPTA = MONTANT.TOTAL.DVS.ACHAT
                MONTANT.COMPTA.LCY = ABS(MONTANT.TOTAL.LCY.ACHAT)

                EVT ="FX03"

                GOSUB SET.TXN.VENTE
            END

            MONTANT.TOTAL.DVS.VENTE = ABS(MONTANT.TOTAL.DVS.VENTE)

            IF MONTANT.TOTAL.DVS.VENTE GT 0 THEN
***
                MONTANT.COMPTA = MONTANT.TOTAL.DVS.VENTE
                MONTANT.COMPTA.LCY = ABS(MONTANT.TOTAL.LCY.VENTE)
***
                EVT ="FX04"

                GOSUB SET.TXN.ACHAT
            END


        END

    NEXT COMPTEUR.AC

    RETURN

***********************
SET.TXN.ACHAT:
***********************
    MESSAGE.OFS = ECRAN:"/I/PROCESS,":OFS.LOGIN:"/":OFS.PASSWD:",,"


    MESSAGE.OFS:=\COUNTERPARTY::=\
    MESSAGE.OFS:= "00"
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\CURRENCY.BOUGHT::=\
    MESSAGE.OFS:= CURRENCY
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\AMOUNT.BOUGHT::=\
    MESSAGE.OFS:= ABS(MONTANT.COMPTA)
    MESSAGE.OFS:=\,\


    MESSAGE.OFS:=\CURRENCY.SOLD::=\
    MESSAGE.OFS:= "TND"
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\SPOT.DATE::=\
    MESSAGE.OFS:= TODAY
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\AMOUNT.SOLD::=\
    MESSAGE.OFS:= ABS(MONTANT.COMPTA.LCY)
    MESSAGE.OFS:=\,\

    GOSUB POST.MSG

    RETURN

***********************
SET.TXN.VENTE:
***********************
    MESSAGE.OFS = ECRAN:"/I/PROCESS,":OFS.LOGIN:"/":OFS.PASSWD:",,"

    MESSAGE.OFS:=\COUNTERPARTY::=\
    MESSAGE.OFS:= "00"
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\CURRENCY.BOUGHT::=\
    MESSAGE.OFS:= "TND"
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\AMOUNT.BOUGHT::=\
    MESSAGE.OFS:= MONTANT.COMPTA.LCY
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\CURRENCY.SOLD::=\
    MESSAGE.OFS:= CURRENCY
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\SPOT.DATE::=\
    MESSAGE.OFS:= TODAY
    MESSAGE.OFS:=\,\

    MESSAGE.OFS:=\AMOUNT.SOLD::=\
    MESSAGE.OFS:= MONTANT.COMPTA
    MESSAGE.OFS:=\,\

    GOSUB POST.MSG

    RETURN

***********************
TRAIT.STMT:
***********************

    FOR COMPTEUR.TXN=1 TO NBRE.TXN.AC
        ID.TRANSA=ID.LIST<COMPTEUR.TXN>

        GOSUB GET.STMT.DETAIL


        IF RECORD.STATUS EQ 'REVE' THEN
            CONTINUE
        END ELSE

            BEGIN CASE

            CASE Y.SYSTEM.ID EQ "FT"


***********Regle
                IF DEPARTMENT.CODE EQ "6029" THEN
                    CONTINUE
                END
***********Regle
                IF (Y.TRANS.CODE EQ "ACGE") AND (DEPARTMENT.CODE EQ "6013") THEN
                    CONTINUE
                END
***********Regle

                CALL F.READ(FN.ETR,ID.TRANSA,ETR.REC,F.ETR,ETR.ERR)

                IF ETR.REC AND DEPARTMENT.CODE EQ "6030" THEN
                    CONTINUE
                END


***********
            CASE 1
			
				CALL F.READ(FN.ETR,ID.TRANSA,ETR.REC,F.ETR,ETR.ERR)

                IF ETR.REC AND DEPARTMENT.CODE EQ "6030" THEN
                    CONTINUE
                END

                IF NOT(DEPARTMENT.CODE MATCHES "6029":@VM:"6030") THEN

                    IF ((DEPARTMENT.CODE EQ "1") AND (Y.SYSTEM.ID EQ "FX")) OR ((DEPARTMENT.CODE EQ "6005") AND (Y.SYSTEM.ID EQ "FX")) THEN

                        CONTINUE

                    END
                END

            END CASE

            IF AMOUNT.LCY LT 0 THEN     ;*Achat

                MONTANT.TOTAL.DVS.ACHAT += AMOUNT.FCY
                MONTANT.TOTAL.LCY.ACHAT += AMOUNT.LCY
**

            END ELSE          ;*Vente

                MONTANT.TOTAL.DVS.VENTE += AMOUNT.FCY
                MONTANT.TOTAL.LCY.VENTE += AMOUNT.LCY

            END

        END

    NEXT COMPTEUR.TXN

    RETURN


***********************
GET.STMT.DETAIL:
***********************
    Y.TRANS.CODE = ""
    Y.SYSTEM.ID = ""
    
	STMT.REC=''
	STMT.ER=''
    CALL F.READ(FN.STMT.ENTRY,ID.TRANSA,STMT.REC,F.STMT.ENTRY,STMT.ER)

    RECORD.STATUS=STMT.REC<AC.STE.RECORD.STATUS>

    AMOUNT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>

    OPENNING.BALANCE=OPENING.BAL
    TRANSACTION.CODE=STMT.REC<AC.STE.TRANSACTION.CODE>
    THEIR.REFERENCE=STMT.REC<AC.STE.THEIR.REFERENCE>
    ACCOUNT.OFFICER=STMT.REC<AC.STE.ACCOUNT.OFFICER>
    BOOKING.DATE=STMT.REC<AC.STE.BOOKING.DATE>
    CURRENCY=STMT.REC<AC.STE.CURRENCY>
    IF CURRENCY EQ "TNC" THEN
        AMOUNT.FCY=STMT.REC<AC.STE.AMOUNT.LCY>
    END ELSE
        AMOUNT.FCY=STMT.REC<AC.STE.AMOUNT.FCY>
    END
    EXCHANGE.RATE=STMT.REC<AC.STE.EXCHANGE.RATE>

    DEPARTMENT.CODE=STMT.REC<AC.STE.DEPARTMENT.CODE>

    TRANSACTION.REF=STMT.REC<AC.STE.TRANS.REFERENCE>
    TRANSACTION.TIME=STMT.REC<AC.STE.DATE.TIME>

    TRANSACTION.TIME=TRANSACTION.TIME[7,8]

    Y.SYSTEM.ID =STMT.REC<AC.STE.SYSTEM.ID>
    TRANS.REFERENCE = STMT.REC<AC.STE.TRANS.REFERENCE>
    Y.SYS.ID = STMT.REC<AC.STE.SYSTEM.ID>

**********************
    BEGIN CASE

    CASE Y.SYS.ID EQ "FT"


        TRANS.REFERENCE.TMP = TRANS.REFERENCE
		FT.REC=''
		FT.ER=''
        CALL F.READ.HISTORY(FN.FT,TRANS.REFERENCE.TMP,FT.REC,F.FT,FT.ER)

        IF FT.REC THEN
*****************
            NEG.Y.N = FT.REC<FT.LOCAL.REF,NEG.POS>

            IF NEG.Y.N EQ "OUI" THEN

                DVS.MNT.COMM = FT.REC<FT.TOTAL.CHARGE.AMOUNT>[1,3]

                IF DVS.MNT.COMM EQ CURRENCY THEN

                    AMOUNT.FCY = FT.REC<FT.TOTAL.CHARGE.AMOUNT>[4,19]
                    AMOUNT.LCY = FT.REC<FT.LOCAL.CHARGE.AMT>

                END ELSE
                    AMOUNT.FCY = 0
                    AMOUNT.LCY =0
                END

            END
*****************
            Y.TRANS.CODE = FT.REC<FT.TRANSACTION.TYPE>

        END ELSE
            E = "ERROR TXN FT ":TRANS.REFERENCE
        END

    CASE 1


    END CASE

**********************
    RETURN


POST.MSG:

    DONNE.REC<GEN.CPT.EVENEMENT>=EVT
* DONNE.REC<GEN.CPT.OFS.MESSAGE>=MESSAGE.OFS
    DONNE.REC<GEN.CPT.DB.DEVISE>=CURRENCY
    DONNE.REC<GEN.CPT.DB.COMPTE>=""
    DONNE.REC<GEN.CPT.CR.DEVISE>=CURRENCY
    DONNE.REC<GEN.CPT.CR.COMPTE>=""
    DONNE.REC<GEN.CPT.MONTANT>=MONTANT.COMPTA
    DONNE.REC<GEN.CPT.DEBIT.REF>=""
    DONNE.REC<GEN.CPT.CREDIT.REF>=""
    DONNE.REC<GEN.CPT.DATE.OPERATION>=TODAY
    DONNE.REC<GEN.CPT.STATUT>=STATUT
    DONNE.REC<GEN.CPT.REF.ORIGINE>=""
    DONNE.REC<GEN.CPT.DEPT>=DEPARTEMENT
    DONNE.REC<GEN.CPT.ID.CPT.LOT>="COB.":TODAY

    IDENTIF = EVT:TODAY:CURRENCY

    CALL F.READ (FN.COMPTA,IDENTIF,COMPTA.REC,F.COMPTA,COMPTA.ERR)
    IF COMPTA.REC THEN
        E="EVENEMENT ":IDENTIF:"EN COURS EXECUTION"

    END ELSE

        MESSAGE.OFS:=\NOTES::=\
        MESSAGE.OFS:= IDENTIF
        MESSAGE.OFS:=\,\

        DONNE.REC<GEN.CPT.OFS.MESSAGE>=MESSAGE.OFS

        CALL OFS.POST.MESSAGE (MESSAGE.OFS, OFS.MSG.ID, SOURCE.OFS, OPTIONS.OFS)
        DONNE.REC<GEN.CPT.REF.OFS>=OFS.MSG.ID
        CALL F.WRITE(FN.COMPTA,IDENTIF,DONNE.REC)
    END

    RETURN


END
