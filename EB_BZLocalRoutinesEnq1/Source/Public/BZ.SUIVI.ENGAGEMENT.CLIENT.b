*-----------------------------------------------------------------------------
* <Rating>-43</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SUIVI.ENGAGEMENT.CLIENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
*<doc>
* Cette routine
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
*
*
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : AC.ONLINE.ACTUAL.BAL changed to ECB.ONLINE.ACTUAL.BAL
*                     ABORT CHANGED TO TRANSACTION.ABORT
*                     CHAR CHANGED TO CHARX; FM ,VM CHANGED TO @FM, @VM
*                     STOP IS REPLACED BY RETURN 
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    * $INSERT I_COMMON - Not Used anymore;Y.COMMON
    * $INSERT I_EQUATE - Not Used anymore;OANS.AND.DEPOSITS
    * $INSERT I_ENQUIRY.COMMON - Not Used anymore;UE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.LETTER.OF.CREDIT
    $INSERT I_F.MD.DEAL
    $INSERT I_F.DRAWINGS
    $INSERT I_F.CURRENCY
*ZIT-UPG-R13-R19/S	
	$INSERT I_F.EB.CONTRACT.BALANCES
*ZIT-UPG-R13-R19/E
* </region>
*-------------------------------------------------------------------------

* ------------------------------------------------------------------------
* <region name= MAIN>

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN

* ---------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------
* </region>

* ------------------------------------------------------------------------
* <region name= INIT>

INIT:

    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD=""
    LD.REC = ""
    LD.ERR = ""

    FN.PD="F.PD.PAYMENT.DUE"
    F.PD=""
    PD.REC = ""
    PD.ERR = ""

    FN.ACCT="F.ACCOUNT"
    F.ACCT=""
    ACCT.REC = ""
    ACCT.EB.DataAccess.Opf = ""

    FN.EB.DataAccess.OpfT="F.CUSTOMER"
    F.CUST=""
    CUST.REC = ""
    CUST.ERR = ""

    FN.CUR="F.CURRENCYFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefDataAccess.FRead   CUR.REC = ""
    CUR.ERR = ""

    FN.LMM.CUST="F.LMM.CUSTOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerST=""
    LMM.CUSTEB.SystemTables.setE("")
    LMM.CUST.ERR = ""

    FN.PD.CUST="F.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerF.PD.CUST=""EB.DataAccess.FWrite.CUST.REC = ""
    PD.CUST.ERR = ""

    FN.CEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-43</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SUIVI.ENGAGEMENT.CLIENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
*<doc>
* Cette routine
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
*
*
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : AC.ONLINE.ACTUAL.BAL changed to ECB.ONLINE.ACTUAL.BAL
*                     ABORT CHANGED TO TRANSACTION.ABORT
*                     CHAR CHANGED TO CHARX; FM ,VM CHANGED TO @FM, @VM
*                     STOP IS REPLACED BY RETURN 
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.LETTER.OF.CREDIT
    $INSERT I_F.MD.DEAL
    $INSERT I_F.DRAWINGS
    $INSERT I_F.CURRENCY
*ZIT-UPG-R13-R19/S	
	$INSERT I_F.EB.CONTRACT.BALANCES
*ZIT-UPG-R13-R19/E
* </region>
*-------------------------------------------------------------------------

* ------------------------------------------------------------------------
* <region name= MAIN>

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

* ------------------------------------------------------------------------
* </region>

* ------------------------------------------------------------------------
* <region name= INIT>

INIT:

    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD=""
    LD.REC = ""
    LD.ERR = ""

    FN.PD="F.PD.PAYMENT.DUE"
    F.PD=""
    PD.REC = ""
    PD.ERR = ""

    FN.ACCT="F.ACCOUNT"
    F.ACCT=""
    ACCT.REC = ""
    ACCT.ERR = ""

    FN.CUST="F.CUSTOMER"
    F.CUST=""
    CUST.REC = ""
    CUST.ERR = ""

    FN.CUR="F.CURRENCY"
    F.CUR=""
    CUR.REC = ""
    CUR.ERR = ""

    FN.LMM.CUST="F.LMM.CUSTOMER"
    F.LMM.CUST=""
    LMM.CUST.REC = ""
    LMM.CUST.ERR = ""

    FN.PD.CUST="F.PD.CUSTOMER"
    F.PD.CUST=""
    PD.CUST.REC = ""
    PD.CUST.ERR = ""

    FN.CUSTFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefOMER.ACCOUNT'
    F.CUEB.SystemTables.setE('')

    FN.LC.CUST="F.LC.APPLICANT"
    F.LC.CUST=""
    LC.CUST.REC = ""
    LC.CUST.ERR = ""

    FN.LC.DRAWINGS="F.DRAWINGS"
    F.LC.DRAWINGS=""
    LC.DRAWINGS.REC = ""
    LC.DRAWINGS.ERR = ""

    FN.MD.CUST="F.MD.CUSTOMER"
    F.MD.CUST=""
    MD.CUST.REC = ""
    MD.CUST.ERR = ""

    FN.LC="F.LETTER.OF.CREDIT"
    F.LC=""
    LC.REC = ""
    LC.ERR = ""

    FN.MD="F.MD.DEAL"
    F.MD=""
    MD.REC = ""
    MD.ERR = ""

    Y.CCY = 'TND'

    TOTAL.AMOUNT.LD = '0'
    TOTAL.AMOUNT.PD = '0'
    TOTAL.AMOUNT.CCD = '0'
    TOTAL.AMOUNT.LC = '0'
    TOTAL.COUNT.DRAW = '0'
    TOTAL.ENGAGEMENT = '0'
    TOTAL.HORS.BILAN = '0'
    TOTAL.AMOUNT.MD = '0'
    TOTAL.AMOUNT.LC.DRAW = '0'

    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    Y.REP.IN = 'ENG.CLIENT'
    Y.FILE.NAME = 'ENGAGEMENT.CLIENT':TODAY:Y.TIME:".csv"

    DIRFILE="./":Y.REP.IN:"/":Y.FILE.NAME
    OPENSEQ DIRFILE TO FILE
*    ELSE CREATE FILE ELSE ABORT ;* ABORT CHANGED TO TRANSACTION.ABORT
    ELSE CREATE FILE ELSE CALL TRANSACTION.ABORT

*    V.RET.CHARIOT = CHAR(13): CHAR(10) ;*CHAR CHANGED TO CHARX
    V.RET.CHARIOT = CHARX(13): CHARX(10)

    RETURN
* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------
* <region name= OPENFILE>

OPENFILES:

    CALL OPF(FN.LD,F.LD)
    CALL OPF(FN.PD,F.PD)
    CALL OPF(FN.ACCT,F.ACCT)
    CALL OPF(FN.CUST,F.CUST)
    CALL OPF(FN.CUST.ACCT,F.CUST.ACCT)
    CALL OPF(FN.LC,F.LC)
    CALL OPF(FN.MD,F.MD)
    CALL OPF(FN.LC.DRAWINGS,F.LC.DRAWINGS)
    CALL OPF(FN.CUR,F.CUR)

    RETURN
* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------

* <region name= PROCESS>
PROCESS:
SEL.LIST.CUST =''
TOTAL.COUNT.CUST =''
CUST.ERROR =''
    CMD.CUST = "SELECT ":FN.CUST
    CALL EB.READLIST(CMD.CUST, SEL.LIST.CUST,'', TOTAL.COUNT.CUST, CUST.ERROR)

    FOR COMPTEUR.CUST = 1 TO TOTAL.COUNT.CUST
********************************************************
* recuperation des encours pour les LD
********************************************************

        TOTAL.AMOUNT.LD = 0
        TOTAL.AMOUNT.PD = 0
        TOTAL.AMOUNT.CCD = 0
        TOTAL.AMOUNT.LC = 0
        TOTAL.COUNT.DRAW = 0
        TOTAL.ENGAGEMENT = 0
        TOTAL.BILAN = 0
        TOTAL.HORS.BILAN = 0
        TOTAL.AMOUNT.MD = 0

        CALL F.READ(FN.LMM.CUST,SEL.LIST.CUST<COMPTEUR.CUST>,LMM.CUST.REC,F.LMM.CUST,LMM.CUST.ERR)
        NBR.LD = DCOUNT(LMM.CUST.REC,@FM)
        TOTAL.AMOUNT.LD = 0
        FOR COMPTEUR.LD=1 TO NBR.LD
            IF LMM.CUST.REC<COMPTEUR.LD>[1,2] EQ 'LD' THEN


                CALL F.READ(FN.LD,LMM.CUST.REC<COMPTEUR.LD>,LD.REC,F.LD,LD.ERR)

                CATEGORY.LD = LD.REC<LD.CATEGORY>
                CURRENCY.LD = LD.REC<LD.CURRENCY>

                IF CATEGORY.LD LT '21050' OR CATEGORY.LD GT '21074' THEN CONTINUE

                IF CURRENCY.LD NE Y.CCY THEN
                    CUR.REC = ''
                    CUR.ERR = ''
                    COURS.REVAL.LD = ''
                    Q.CODE.LD = ''

                    CALL F.READ(FN.CUR,CURRENCY.LD,CUR.REC,F.CUR,CUR.ERR)

                    CURRENCY.MARKET.LD = CUR.REC<EB.CUR.CURRENCY.MARKET>
                    NBR.MARCHE.LD = DCOUNT(CURRENCY.MARKET.LD,@VM)

                    FOR K = 1 TO NBR.MARCHE.LD

                        IF CURRENCY.MARKET.LD<1,K> EQ '1' THEN
                            COURS.REVAL.LD = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                            BREAK
                        END
                    NEXT K

                    Q.CODE.LD  = CUR.REC<EB.CUR.QUOTATION.CODE>
                    COURS.REVAL.LD = COURS.REVAL.LD / PWR(10,Q.CODE.LD)

                    AMOUNT.LD = LD.REC<LD.AMOUNT> * COURS.REVAL.LD
                    AMOUNT.LD = DROUND(AMOUNT.LD,3)

                END ELSE
                    AMOUNT.LD = LD.REC<LD.AMOUNT>
                    AMOUNT.LD = DROUND(AMOUNT.LD,3)
                END

                TOTAL.AMOUNT.LD = TOTAL.AMOUNT.LD + AMOUNT.LD
            END
        NEXT COMPTEUR.LD
*******************************************************
* recuperation des impayes des financements
*******************************************************

        CALL F.READ(FN.PD.CUST,SEL.LIST.CUST<COMPTEUR.CUST>,PD.CUST.REC,F.PD.CUST,PD.CUST.ERR)
        NBR.PD = DCOUNT(PD.CUST.REC,@FM)

        FOR COMPTEUR.PD=1 TO NBR.PD
            CALL F.READ(FN.PD,PD.CUST.REC<COMPTEUR.PD>,PD.REC,F.PD,PD.ERR)
            STATUT.PD = PD.REC<PD.STATUS>
            IF STATUT.PD NE 'CUR' THEN

                CURRENCY.PD = PD.REC<PD.CURRENCY>

                IF CURRENCY.PD NE Y.CCY THEN
                    CUR.REC=''
                    CUR.ERR=''
                    COURS.REVAL.PD =''
                    Q.CODE.PD = ''

                    CALL F.READ(FN.CUR,CURRENCY.PD,CUR.REC,F.CUR,CUR.ERR)

                    CURRENCY.MARKET.PD = CUR.REC<EB.CUR.CURRENCY.MARKET>
                    NBR.MARCHE.PD = DCOUNT(CURRENCY.MARKET.PD,@VM)

                    FOR K = 1 TO NBR.MARCHE.PD

                        IF CURRENCY.MARKET.PD<1,K> EQ '1' THEN
                            COURS.REVAL.PD = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                            BREAK
                        END
                    NEXT K

                    Q.CODE.PD  = CUR.REC<EB.CUR.QUOTATION.CODE>

                    COURS.REVAL.PD = COURS.REVAL.PD / PWR(10,Q.CODE.PD)

                    AMOUNT.PD = PD.REC<PD.TOTAL.AMT.TO.REPAY> * COURS.REVAL.PD
                    AMOUNT.PD = DROUND(AMOUNT.PD,3)
                END ELSE

                    AMOUNT.PD = PD.REC<PD.TOTAL.AMT.TO.REPAY>
                    AMOUNT.PD = DROUND(AMOUNT.PD,3)
                END
                TOTAL.AMOUNT.PD = TOTAL.AMOUNT.PD + AMOUNT.PD
            END
        NEXT COMPTEUR.PD

*******************************************************
* recuperation des soldes des comptes debiteurs
*******************************************************

        CALL F.READ(FN.CUST.ACCT,SEL.LIST.CUST<COMPTEUR.CUST>,R.CUST.ACCT,F.CUST.ACCT,ERR.CUST.ACCT)
        IF R.CUST.ACCT NE '' THEN

            S.ACCT.CNT = DCOUNT(R.CUST.ACCT,@FM)
            TOTAL.AMOUNT.CCD = 0
            FOR JJ = 1 TO S.ACCT.CNT

                ACCT.REC = ''
                K.ACCOUNT = R.CUST.ACCT<JJ>

                CALL F.READ(FN.ACCT,K.ACCOUNT,ACCT.REC,F.ACCT,ACCT.ERR)

                IF ACCT.REC NE '' THEN
                    Y.ACCT.CCY = ACCT.REC<AC.CURRENCY>
                    Y.ACCT.CATEG = ACCT.REC<AC.CATEGORY>
*ZIT-UPG-R13-R19/S
					
CALL EB.READ.HVT ('EB.CONTRACT.BALANCES', K.ACCOUNT, R.ECB, ECB.ERR)
Y.ACCT.WK.BL = R.ECB<ECB.WORKING.BALANCE>
*Y.ACCT.WK.BL =ACCT.REC<AC.ONLINE.ACTUAL.BAL> ;*CHANGE

*ZIT-UPG-R13-R19/E					
                    

                    IF (Y.ACCT.CATEG GE '1000' AND Y.ACCT.CATEG LE '1999') OR (Y.ACCT.CATEG GE '6000' AND Y.ACCT.CATEG LE '6999') OR (Y.ACCT.CATEG EQ '8101') OR (Y.ACCT.CATEG EQ '8102') OR (Y.ACCT.CATEG EQ '8024') OR (Y.ACCT.CATEG EQ '8025') THEN
                        IF Y.ACCT.WK.BL LT 0 THEN

                            Y.ACCT.WK.BL = ABS(Y.ACCT.WK.BL)

                            IF Y.ACCT.CCY NE Y.CCY THEN
                                CUR.REC=''
                                CUR.ERR=''
                                COURS.REVAL.ACCT =''
                                Q.CODE.ACCT = ''
                                CALL F.READ(FN.CUR,Y.ACCT.CCY,CUR.REC,F.CUR,CUR.ERR)

                                CURRENCY.MARKET.ACCT = CUR.REC<EB.CUR.CURRENCY.MARKET>
                                NBR.MARCHE.ACCT = DCOUNT(CURRENCY.MARKET.ACCT,@FM)

                                FOR K = 1 TO NBR.MARCHE.ACCT

                                    IF CURRENCY.MARKET.ACCT<1,K> EQ '1' THEN
                                        COURS.REVAL.ACCT = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                                        BREAK
                                    END

                                NEXT K

                                Q.CODE.ACCT  = CUR.REC<EB.CUR.QUOTATION.CODE>
                                COURS.REVAL.ACCT = COURS.REVAL.ACCT / PWR(10,Q.CODE.ACCT)
                                Y.ACCT.WK.BL = Y.ACCT.WK.BL * COURS.REVAL.ACCT
                            END

                            TOTAL.AMOUNT.CCD = TOTAL.AMOUNT.CCD + Y.ACCT.WK.BL

                        END
                    END
                END
            NEXT JJ
        END

        TOTAL.BILAN = TOTAL.AMOUNT.LD + TOTAL.AMOUNT.PD + ABS(TOTAL.AMOUNT.CCD)

*******************************************************
* recuperation des encours LC
*******************************************************

        CALL F.READ(FN.LC.CUST,SEL.LIST.CUST<COMPTEUR.CUST>,LC.CUST.REC,F.LC.CUST,LC.CUST.ERR)
        NBR.LC = DCOUNT(LC.CUST.REC,@FM)
        TOTAL.AMOUNT.LC = '0'
        FOR COMPTEUR.LC=1 TO NBR.LC

            CALL F.READ(FN.LC,LC.CUST.REC<COMPTEUR.LC>,LC.REC,F.LC,LC.ERR)

            CATEGORY.LC = LC.REC<TF.LC.CATEGORY.CODE>
            CURRENCY.LC = LC.REC<TF.LC.LC.CURRENCY>
            IF CATEGORY.LC LT '23000' OR CATEGORY.LC GT '23099' THEN CONTINUE

            CALL F.READ(FN.CUR,CURRENCY.LC,CUR.REC,F.CUR,CUR.ERR)
            AMOUNT.LC = '0'
            AMOUNT.LC = LC.REC<TF.LC.LIABILITY.AMT>

            IF CURRENCY.LC NE Y.CCY THEN

                CUR.REC=''
                CUR.ERR=''
                COURS.REVAL.LC =''
                Q.CODE.LC = ''

                CALL F.READ(FN.CUR,CURRENCY.LC,CUR.REC,F.CUR,CUR.ERR)

                COURS.REVAL.LC = CUR.REC<EB.CUR.MID.REVAL.RATE>
                Q.CODE.LC  = CUR.REC<EB.CUR.QUOTATION.CODE>

                CURRENCY.MARKET.LC = CUR.REC<EB.CUR.CURRENCY.MARKET>
                NBR.MARCHE.LC = DCOUNT(CURRENCY.MARKET.LC,@FM)

                FOR K = 1 TO NBR.MARCHE.LC

                    IF CURRENCY.MARKET.LC<1,K> EQ '1' THEN
                        COURS.REVAL.LC = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                        BREAK
                    END
                NEXT K

                COURS.REVAL.LC = COURS.REVAL.LC / PWR(10,Q.CODE.LC)

                AMOUNT.LC = AMOUNT.LC * COURS.REVAL.LC

            END

            CMD.DRAWINGS = "SELECT ":FN.LC.DRAWINGS:" WITH @ID LIKE ":LC.CUST.REC<COMPTEUR.LC>:"..."
            CALL EB.READLIST(CMD.DRAWINGS, SEL.LIST.DRAW,'', TOTAL.COUNT.DRAW, DRAW.ERROR)
            TOTAL.AMOUNT.LC.DRAW = '0'
            IF TOTAL.COUNT.DRAW GT '0' THEN
                FOR COMPTEUR.DRAW = 1 TO TOTAL.COUNT.DRAW

                    CALL F.READ(FN.LC.DRAWINGS,SEL.LIST.DRAW<COMPTEUR.DRAW>,LC.DRAWINGS.REC,F.LC.DRAWINGS,LC.DRAWINGS.ERR)

                    DRAWING.TYPE=LC.DRAWINGS.REC<TF.DR.DRAWING.TYPE>
                    DISCOUNT.AMT=LC.DRAWINGS.REC<TF.DR.DISCOUNT.AMT>

                    IF DRAWING.TYPE NE 'AC' AND DRAWING.TYPE NE 'DP' THEN CONTINUE
                    IF DISCOUNT.AMT NE '' THEN CONTINUE

                    CURRENCY.DRAW =LC.DRAWINGS.REC<TF.DR.DRAW.CURRENCY>
                    AMOUNT.LC.DRAW = '0'
                    AMOUNT.LC.DRAW = LC.DRAWINGS.REC<TF.DR.DOCUMENT.AMOUNT>

                    IF CURRENCY.DRAW NE Y.CCY THEN
                        CUR.REC=''
                        CUR.ERR=''
                        COURS.REVAL.DRAW =''
                        Q.CODE.DRAW = ''

                        CALL F.READ(FN.CUR,CURRENCY.DRAW,CUR.REC,F.CUR,CUR.ERR)
                        COURS.REVAL.DRAW = CUR.REC<EB.CUR.MID.REVAL.RATE>
                        Q.CODE.DRAW  = CUR.REC<EB.CUR.QUOTATION.CODE>
                        CURRENCY.MARKET.DRAW = CUR.REC<EB.CUR.CURRENCY.MARKET>

                        NBR.MARCHE.DRAW = DCOUNT(CURRENCY.MARKET.DRAW,@VM)

                        FOR K = 1 TO NBR.MARCHE.DRAW

                            IF CURRENCY.MARKET.DRAW<1,K> EQ '1' THEN
                                COURS.REVAL.DRAW = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                                BREAK
                            END
                        NEXT K

                        COURS.REVAL.DRAW = COURS.REVAL.DRAW / PWR(10,Q.CODE.DRAW)
                        AMOUNT.LC.DRAW = AMOUNT.LC.DRAW * COURS.REVAL.DRAW

                    END

                    AMOUNT.LC.DRAW = DROUND(AMOUNT.LC.DRAW,3)
                    TOTAL.AMOUNT.LC.DRAW = TOTAL.AMOUNT.LC.DRAW + AMOUNT.LC.DRAW

                NEXT COMPTEUR.DRAW

            END

            AMOUNT.LC = DROUND(AMOUNT.LC,3)
            TOTAL.AMOUNT.LC = TOTAL.AMOUNT.LC + AMOUNT.LC + TOTAL.AMOUNT.LC.DRAW

        NEXT COMPTEUR.LC
*******************************************************
* recuperation des encours MD
*******************************************************
        CALL F.READ(FN.MD.CUST,SEL.LIST.CUST<COMPTEUR.CUST>,MD.CUST.REC,F.MD.CUST,MD.CUST.ERR)
        NBR.MD = DCOUNT(MD.CUST.REC,@FM)

        FOR COMPTEUR.MD=1 TO NBR.MD

            CALL F.READ(FN.MD,MD.CUST.REC<COMPTEUR.MD>,MD.REC,F.MD,MD.ERR)
            CATEGORY.MD = MD.REC<MD.DEA.CATEGORY>
            CURRENCY.MD = MD.REC<MD.DEA.CURRENCY>

            IF CATEGORY.MD LT '28000' OR CATEGORY.MD GT '28099' THEN CONTINUE
            CONTRAT.TYPE = MD.REC<MD.DEA.CONTRACT.TYPE>

            IF CONTRAT.TYPE EQ 'CA' THEN

                AMOUNT.MD = MD.REC<MD.DEA.PRINCIPAL.AMOUNT>

                CUR.REC=''
                CUR.ERR=''
                COURS.REVAL.MD =''

                IF CURRENCY.MD NE Y.CCY THEN

                    CALL F.READ(FN.CUR,CURRENCY.MD,CUR.REC,F.CUR,CUR.ERR)

                    CURRENCY.MARKET.MD = CUR.REC<EB.CUR.CURRENCY.MARKET>
                    NBR.MARCHE.MD = DCOUNT(CURRENCY.MARKET.MD,@VM)

                    FOR K = 1 TO NBR.MARCHE.MD

                        IF CURRENCY.MARKET.MD<1,K> EQ '1' THEN
                            COURS.REVAL.MD = CUR.REC<EB.CUR.MID.REVAL.RATE><1,K>
                            BREAK
                        END
                    NEXT K

                    Q.CODE.MD  = CUR.REC<EB.CUR.QUOTATION.CODE>

                    COURS.REVAL.MD = COURS.REVAL.MD / PWR(10,Q.CODE.MD)

                    AMOUNT.MD = AMOUNT.MD * COURS.REVAL.MD
                END

                AMOUNT.MD = DROUND(AMOUNT.MD,3)
                TOTAL.AMOUNT.MD = TOTAL.AMOUNT.MD + AMOUNT.MD

            END
        NEXT COMPTEUR.MD

        TOTAL.HORS.BILAN = TOTAL.AMOUNT.MD + TOTAL.AMOUNT.LC

        TOTAL.ENGAGEMENT = TOTAL.BILAN + TOTAL.HORS.BILAN
*********************************************************
        LINE=SEL.LIST.CUST<COMPTEUR.CUST>:";":TOTAL.AMOUNT.LD:";":TOTAL.AMOUNT.PD:";":TOTAL.AMOUNT.CCD:";":TOTAL.BILAN:";":TOTAL.AMOUNT.LC:";":TOTAL.AMOUNT.MD:";":TOTAL.HORS.BILAN:";":TOTAL.ENGAGEMENT
*********************************************************

        IF LINE NE '' THEN
*            WRITESEQ LINE TO FILE ELSE STOP
            WRITESEQ LINE TO FILE ELSE 
			*STOP
			RETURN
			END
        END
    NEXT COMPTEUR.CUST
    RETURN

* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------
END
