*-----------------------------------------------------------------------------
* <Rating>511</Rating>
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------- *
*                                                 ZITOUNA Project                                       *
* ----------------------------------------------------------------------------------------------------- *
* @desc La fonction principale du traitement Mult-Thread pour Gestion Coffre Fort.
* ----------------------------------------------------------------------------------------------------- *
* @author Marwen Ben Nasr Marwen.BenNasr@banquezitouna.com
* @create 11/09/2014
* ----------------------------------------------------------------------------------------------------- *
* @revby
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;VM,FM TO @VM,@FM;
*          		-CONVERT TO CHANGE;OPERATIONS TO OPERANDS
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.FACTURATION(ID.FROM.LIST)
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
* $INSERT I_COMMON - Not Used anymore;* $INSERT BP I_F.BZ.COFFRE.CONTRAT
* * $INSERT I_EQUATE - Not Used anymore;COFFRE.LOYER
* * $INSERT I_ENQUIRY.COMMON - Not Used anymore;EGISTRE
* * $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;
*$INSERT BP I_F.BZ.COFFRE.TYPE
*$INSERT BZ.COFFRE.FACTURATION.COMMON
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.LOYER
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.CPS.PARAMETER
$INSERT I_F.BZ.COFFRE.TYPE
$INSERT BZ.COFFRE.FACTURATION.COMMON
*ZIT-UPG-R09-R13/E
    $INSERT I_F.FT.COMMISSION.TYPE
    $INSERT I_F.CURRENCY
    $INSERT I_F.ACCOUNT
    $INSEB.SystemTables.getVFunction()IRY.COMMON



    GOSUB TRAITEMENT
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus------------------------------------ *
TRAITEMENT:

    ID.LOYER = ''
	R.CT=''
	ERR.CT=''
    CALL F.READ(FN.CT,ID.FROM.LIST,R.CT,F.CT,ERR.CT)

    Y.TODAY=TODAY
    Y.DATE.CONTRAT=R.CT<CF.CT.DATE.CONTRAT>
    Y.REF.CONTRAT = ID.FROM.LIST
    Y.MM_CONTRAT = Y.DATE.CONTRAT[5,2]
    Y.JJ_CONTRAT = Y.DATE.CONTRAT[7,2]
    Y.MM_TODAY = Y.TODAY[5,2]


    IF  Y.MM_TODAY EQ Y.MM_CONTRAT THEN
* VERIFIER EXISTENCE DANS LA TABLE LOYER POUR L'ANNEE
        Y.AAAA_TODAY = Y.TODAY[1,4]
        Y.ANNIVERSAIRE =Y.AAAA_TODAY : Y.MM_CONTRAT : Y.JJ_CONTRAT

        ID.LOYER = Y.REF.CONTRAT:"." : Y.ANNIVERSAEB.DataAccess.Opf
		SEL.LIST.CT.COFFREEB.DataAccess.Opf
		NO.SEL=''
		SEL.ERR=''
        SELECTION = "SELECT ":FN.LOYER:" WITH @ID EQ " : ID.LOYER
        CALL EB.READLIST(SELECTION, SEL.LIST.CT.COFFRE, '', NO.SEL, SEL.ERR)
    END
    IF SEL.LIST.CTEB.SystemTables.getRNew()RFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef


** RéEB.DataAccess.FReadtion code COM DE LA TABLE BZ.COFFRE.TYPE SELON TYPE COFFRE

		R.REG=''
		EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer  V.NUEB.SystemTables.setE(R.CT<CF.CT.NUMERO.COFFRE>)
        CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)
        IF R.REG EQ EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer        V.TYPE.COEB.DataAccess.FWrite.REG<CF.REG.TYPE>
		R.TYPE=''
		ERR.TYPE=''
        CALL F.READ(FN.TYP,V.TYPE.COFFRE,R.TYP,F.TYP,ERR.TYP)
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>511</Rating>
*-----------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------- *
*                                                 ZITOUNA Project                                       *
* ----------------------------------------------------------------------------------------------------- *
* @desc La fonction principale du traitement Mult-Thread pour Gestion Coffre Fort.
* ----------------------------------------------------------------------------------------------------- *
* @author Marwen Ben Nasr Marwen.BenNasr@banquezitouna.com
* @create 11/09/2014
* ----------------------------------------------------------------------------------------------------- *
* @revby
* ----------------------------------------------------------------------------------------------------- *
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;VM,FM TO @VM,@FM;
*          		-CONVERT TO CHANGE;OPERATIONS TO OPERANDS
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.FACTURATION(ID.FROM.LIST)
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
*ZIT-UPG-R09-R13/S
* $INSERT BP I_F.BZ.COFFRE.CONTRAT
* $INSERT BP I_F.BZ.COFFRE.LOYER
* $INSERT BP I_F.BZ.COFFRE.REGISTRE
* $INSERT BP I_F.BZ.CPS.PARAMETER
*$INSERT BP I_F.BZ.COFFRE.TYPE
*$INSERT BZ.COFFRE.FACTURATION.COMMON
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.LOYER
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.CPS.PARAMETER
$INSERT I_F.BZ.COFFRE.TYPE
$INSERT BZ.COFFRE.FACTURATION.COMMON
*ZIT-UPG-R09-R13/E
    $INSERT I_F.FT.COMMISSION.TYPE
    $INSERT I_F.CURRENCY
    $INSERT I_F.ACCOUNT
    $INSERT I_ENQUIRY.COMMON



    GOSUB TRAITEMENT

    RETURN
* ----------------------------------------------------------------------------------------------------- *
TRAITEMENT:

    ID.LOYER = ''
	R.CT=''
	ERR.CT=''
    CALL F.READ(FN.CT,ID.FROM.LIST,R.CT,F.CT,ERR.CT)

    Y.TODAY=TODAY
    Y.DATE.CONTRAT=R.CT<CF.CT.DATE.CONTRAT>
    Y.REF.CONTRAT = ID.FROM.LIST
    Y.MM_CONTRAT = Y.DATE.CONTRAT[5,2]
    Y.JJ_CONTRAT = Y.DATE.CONTRAT[7,2]
    Y.MM_TODAY = Y.TODAY[5,2]


    IF  Y.MM_TODAY EQ Y.MM_CONTRAT THEN
* VERIFIER EXISTENCE DANS LA TABLE LOYER POUR L'ANNEE
        Y.AAAA_TODAY = Y.TODAY[1,4]
        Y.ANNIVERSAIRE =Y.AAAA_TODAY : Y.MM_CONTRAT : Y.JJ_CONTRAT

        ID.LOYER = Y.REF.CONTRAT:"." : Y.ANNIVERSAIRE
		SEL.LIST.CT.COFFRE=''
		NO.SEL=''
		SEL.ERR=''
        SELECTION = "SELECT ":FN.LOYER:" WITH @ID EQ " : ID.LOYER
        CALL EB.READLIST(SELECTION, SEL.LIST.CT.COFFRE, '', NO.SEL, SEL.ERR)
    END
    IF SEL.LIST.CT.COFFRE EQ '' THEN



** Récupération code COM DE LA TABLE BZ.COFFRE.TYPE SELON TYPE COFFRE

		R.REG=''
		ERR.REF=''
        V.NUM.COFFRE = R.CT<CF.CT.NUMERO.COFFRE>
        CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)
        IF R.REG EQ '' THEN RETURN

        V.TYPE.COFFRE =R.REG<CF.REG.TYPE>
		R.TYPE=''
		ERR.TYPE=''
        CALL F.READ(FN.TYP,V.TYPE.COFFRE,R.TYP,F.TYP,ERR.TYP)
        Y.CFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefCF.TYPE.LOYER.ANNUEL>
**

		EB.SystemTables.setE('')
		ERR.COM=''
        CALL F.READ(FN.COM,Y.CODE.COM, COM.REC, F.COM, ERR.COM)

        IF COM.REC EQ '' THEN RETURN

        MNT.COMMISSION = COM.REC<FT4.FLAT.AMT>

        Y.CLIENT = R.CT<CF.CT.ID.CLIENT>
        IN.CHARGE=''
        MNT.CHARGE=''

        Y.CPTE.FACTURATION = R.CT<CF.CT.COMPTE.FACTURATION>
		R.AC=''
		ERR.AC=''
        CALL F.READ(FN.AC,Y.CPTE.FACTURATION,R.AC,F.AC,ERR.AC)

        IF R.AC EQ '' THEN RETURN

        Y.CCY.COMPTE.FACT=R.AC<AC.CURRENCY>

        CALL BZ.GET.PREFERENTIEL(Y.CLIENT,"FUNDS.TRANSFER","","",Y.CODE.COM,MNT.COMMISSION,IN.CHARGE,MNT.CHARGE)

        IF NOT(Y.CCY.COMPTE.FACT MATCHES "TND":@VM:"TNC") THEN
            MONTANT.TND=MNT.COMMISSION
            DEVISE.CLIENT=Y.CCY.COMPTE.FACT
            GOSUB CONVERT.AMOUNT
            MNT.COMMISSION=MONTANT.CONVERTI
        END

        IF MNT.COMMISSION GT 0 THEN
            Y.REC.CPS.PARAMS = ''
            CALL BZ.MDP.GETCPS.PARAMS.RTN(Y.REC.CPS.PARAMS)

            Y.OFS.LOGIN = Y.REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
            Y.OFS.PASSWD = Y.REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>



            Y.OFS.MSG="AC.CHARGE.REQUEST,BZ.COFFRE.LOYER/I/PROCESS,":Y.OFS.LOGIN:"/":Y.OFS.PASSWD:",,"
            Y.OFS.MSG=Y.OFS.MSG:"REQUEST.TYPE=BOOK,"
            Y.OFS.MSG=Y.OFS.MSG:"DEBIT.ACCOUNT=" :Y.CPTE.FACTURATION:","
            Y.OFS.MSG=Y.OFS.MSG:"CHARGE.CODE=" :Y.CODE.COM:","

            Y.OFS.MSG=Y.OFS.MSG:"CHARGE.AMOUNT=" :MNT.COMMISSION :","
            Y.OFS.MSG=Y.OFS.MSG:"CHARGE.CCY=":Y.CCY.COMPTE.FACT:","

            Y.OFS.MSG=Y.OFS.MSG:"EXTRA.DETAILS=":V.NUM.COFFRE:","

            Y.OFS.MSG=Y.OFS.MSG:"RELATED.REF=":ID.LOYER:","
            Y.OFS.MSG=Y.OFS.MSG:"STATUS=PAID"



            SOURCE.OFS='TAG'
            OPTIONS.OFS=''
        END

        CALL OFS.POST.MESSAGE (Y.OFS.MSG, OFS.MSG.ID, SOURCE.OFS, OPTIONS.OFS)
*creer record ds la table BZ.COFFRE.LOYER

* LIRE LA TEMPLATE

		R.LOYER=''
		ERR.LOYER=''
        CALL F.READ(FN.LOYER,ID.LOYER,R.LOYER,F.LOYER,ERR.LOYER)
*Mise a jour table
        IF R.LOYER EQ '' THEN
            R.LOYER<CF.LOYER.ID.CONTRAT> = Y.REF.CONTRAT
            R.LOYER<CF.LOYER.DATE.LOYER> = R.CT<CF.CT.DATE.CONTRAT>
            R.LOYER<CF.LOYER.REF.OFS> = OFS.MSG.ID
* R.LOYER<CF.LOYER.REF.LOYER> SERA GARNI PAR LA REFERENCE COMPTABLE AC.CHARGE.REQUEST APRES CONSOMMATION OFS
            R.LOYER<CF.LOYER.DATE.PRELEVEMENT> = TODAY
            R.LOYER<CF.LOYER.MONTANT> = MNT.COMMISSION
            R.LOYER<CF.LOYER.COMPTE> = Y.CPTE.FACTURATION
            R.LOYER<CF.LOYER.DEVISE> = Y.CCY.COMPTE.FACT
            R.LOYER<CF.LOYER.NUM.COFFRE> = V.NUM.COFFRE
            R.LOYER<CF.LOYER.CHARGE.CODE> = Y.CODE.COM

*Ecrire dans la table

            CALL F.WRITE(FN.LOYER,ID.LOYER,R.LOYER)



        END


    END
*Fin Prelevement 1er loyer


    RETURN


********************************************************************
**************** convert
********************************************************************
CONVERT.AMOUNT:

    BUY.AMT = MONTANT.TND
    BUY.CCY="TND"

    SELL.CCY=DEVISE.CLIENT
	CUR.REC=''
	ERR.CUR=''
    CALL F.READ(FN.CUR,SELL.CCY,CUR.REC,F.CUR,ERR.CUR)
    CURRENCY.MARKET = CUR.REC<EB.CUR.CURRENCY.MARKET>
    BUY.RATES = CUR.REC<EB.CUR.BUY.RATE>
    SELL.RATES = CUR.REC<EB.CUR.SELL.RATE>
    MID.RATES = CUR.REC<EB.CUR.MID.REVAL.RATE>

    CCY.MKT = "1"
*    CONVERT VM TO FM IN CURRENCY.MARKET
	 CHANGE @VM TO @FM IN CURRENCY.MARKET
    LOCATE CCY.MKT IN  CURRENCY.MARKET<1> SETTING POS ELSE POS = 0
    BUY.RATE.CR = BUY.RATES<1,POS>
    SELL.RATE.CR = SELL.RATES<1,POS>
    MID.RATE.CR = MID.RATES<1,POS>

    SELL.AMT = ''
    BASE.CCY = ''

    DIFFERENCE = ''
    LCY.AMT = ''
    RETURN.CODE = ''

    EXCHANGE.RATE = BUY.RATE.CR

    CALL EXCHRATE(CCY.MKT,BUY.CCY,BUY.AMT,SELL.CCY, SELL.AMT,BASE.CCY,EXCHANGE.RATE, DIFFERENCE,LCY.AMT,RETURN.CODE)

    CALL EB.ROUND.AMOUNT(SELL.CCY,SELL.AMT,'','')

    MONTANT.CONVERTI=SELL.AMT

    RETURN
END
