*-----------------------------------------------------------------------------
* <Rating>-44</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: VM,FM CHANGED TO @VM,@FM
*                 OPERATORS CHANGED TO OPERANDS
*                 VARIABLE INITIALISED
*                 E TO ETEXT, CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.AUT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13/S
    *$INSERT GLOBUS.BP I_COMMON        
    *$INSERT GLOBUS.BP I_EQUATE        
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT
    ** $INSERT I_COMMON - Not Used anymore;BZ.COFFRE.REGISTRE
    ** $INSERT I_EQUATE - Not Used anymore;BZ.CPS.PARAMETER
    ** $INSERT I_ENQUIRY.COMMON - Not Used anymore;T.COMMISSION.TYPE
    ** $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;CY
    *$INSERT GLOBUS.BP I_F.ACCOUNT
    *$INSERT BP I_F.BZ.COFFRE.TYPE
    *$INSERT BP I_F.BZ.COFFRE.LOYER
    ** $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.CPS.PARAMETER
$INSERT I_F.BZ.COFFRE.TYPE
$INSERT I_F.BZ.COFFRE.LOYER
$INSERT I_F.FT.COMMISSION.TYPE 
$INSERT EB.SystemTables.getVFunction()CY           
$INSERT I_F.ACCOUNT       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusF.USER

*ZIT-UPG-R09-R13/E
    GOSUB INITIAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusUB OPENFILES


    IF (V$FUNCTION EQ "I") OR (V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    FN.LOYER = "F.BZ.COFFRE.LOYER"
    F.LOYER = ''
    R.LOYER= ''
    ERR.LEB.DataAccess.OpfR = ''

    FN.EB.DataAccess.Opf= "F.BZ.COFFRE.CONTRAT"
    F.CT = ''
    R.CT= ''
    ERR.CT = ''

    FN.TYP = "F.BZ.COFFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefF.TYPEB.DataAccess.FRead
    R.TYP= ''
    ERR.TYP = ''

    FN.COM = "F.FT.COMMISSIOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer = ''
    R.COM= 'EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-44</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: VM,FM CHANGED TO @VM,@FM
*                 OPERATORS CHANGED TO OPERANDS
*                 VARIABLE INITIALISED
*                 E TO ETEXT, CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.AUT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13/S
    *$INSERT GLOBUS.BP I_COMMON        
    *$INSERT GLOBUS.BP I_EQUATE        
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
    *$INSERT BP I_F.BZ.CPS.PARAMETER
    *$INSERT GLOBUS.BP I_F.FT.COMMISSION.TYPE
    *$INSERT GLOBUS.BP I_F.CURRENCY
    *$INSERT GLOBUS.BP I_F.ACCOUNT
    *$INSERT BP I_F.BZ.COFFRE.TYPE
    *$INSERT BP I_F.BZ.COFFRE.LOYER
    *$INSERT GLOBUS.BP I_F.USER
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.CPS.PARAMETER
$INSERT I_F.BZ.COFFRE.TYPE
$INSERT I_F.BZ.COFFRE.LOYER
$INSERT I_F.FT.COMMISSION.TYPE 
$INSERT I_F.CURRENCY           
$INSERT I_F.ACCOUNT            
$INSERT I_F.USER

*ZIT-UPG-R09-R13/E
    GOSUB INITIALISATION
    GOSUB OPENFILES


    IF (V$FUNCTION EQ "I") OR (V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    FN.LOYER = "F.BZ.COFFRE.LOYER"
    F.LOYER = ''
    R.LOYER= ''
    ERR.LOYER = ''

    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ''
    R.CT= ''
    ERR.CT = ''

    FN.TYP = "F.BZ.COFFRE.TYPE"
    F.TYP = ''
    R.TYP= ''
    ERR.TYP = ''

    FN.COM = "F.FT.COMMISSION.TYPE"
    F.COM = ''
    R.COM= ''
    ERR.COM = ''


    FN.AC= "F.ACEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerite    F.AC = ''
    R.AC= ''
    ERR.AC = ''

    FNEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-44</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: VM,FM CHANGED TO @VM,@FM
*                 OPERATORS CHANGED TO OPERANDS
*                 VARIABLE INITIALISED
*                 E TO ETEXT, CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.AUT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13/S
    *$INSERT GLOBUS.BP I_COMMON        
    *$INSERT GLOBUS.BP I_EQUATE        
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
    *$INSERT BP I_F.BZ.CPS.PARAMETER
    *$INSERT GLOBUS.BP I_F.FT.COMMISSION.TYPE
    *$INSERT GLOBUS.BP I_F.CURRENCY
    *$INSERT GLOBUS.BP I_F.ACCOUNT
    *$INSERT BP I_F.BZ.COFFRE.TYPE
    *$INSERT BP I_F.BZ.COFFRE.LOYER
    *$INSERT GLOBUS.BP I_F.USER
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.CPS.PARAMETER
$INSERT I_F.BZ.COFFRE.TYPE
$INSERT I_F.BZ.COFFRE.LOYER
$INSERT I_F.FT.COMMISSION.TYPE 
$INSERT I_F.CURRENCY           
$INSERT I_F.ACCOUNT            
$INSERT I_F.USER

*ZIT-UPG-R09-R13/E
    GOSUB INITIALISATION
    GOSUB OPENFILES


    IF (V$FUNCTION EQ "I") OR (V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    FN.LOYER = "F.BZ.COFFRE.LOYER"
    F.LOYER = ''
    R.LOYER= ''
    ERR.LOYER = ''

    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ''
    R.CT= ''
    ERR.CT = ''

    FN.TYP = "F.BZ.COFFRE.TYPE"
    F.TYP = ''
    R.TYP= ''
    ERR.TYP = ''

    FN.COM = "F.FT.COMMISSION.TYPE"
    F.COM = ''
    R.COM= ''
    ERR.COM = ''


    FN.AC= "F.ACCOUNT"
    F.AC = ''
    R.AC= ''
    ERR.AC = ''

    FN.CEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE("F.CURRENCY")
    F.CUR= ''
    R.CUR= ''
    ERR.CUR= ''

    FN.CT= "F.BZ.COFFRE.CONTRAT"
    F.CT= ''
    R.CT= ''
    ERR.CT= ''

    C.STAT.LOUE="2"
    POS  = ''


    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.OFS.LOGIN = Y.REC.CPS.PARAMS<CPS.PAR.OFS.LOGIN>
    Y.OFS.PASSWD = Y.REC.CPS.PARAMS<CPS.PAR.OFS.PASSWD>

    RETURN



OPENFILES:
    CALL OPF(FN.REG,F.REG)
    CALL OPF(FN.TYP,F.TYP)
    CALL OPF(FN.COM,F.COM)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.CUR,F.CUR)
    CALL OPF(FN.CT,F.CT)
    CALL OPF(FN.LOYER,F.LOYER)
    RETURN

PROCESS:
* Metre a jour statut coffre : 2 lou�
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

    IF R.REG NE "" THEN
        R.REG<CF.REG.STATUT> = C.STAT.LOUE
        CALL F.WRITE(FN.REG,V.NUM.COFFRE,R.REG)
    END ELSE
*//        E ="NUM coffre inexistant"
        ETEXT ="NUM coffre inexistant"
        CALL STORE.END.ERROR
    END

* FIN Metre a jour statut coffre : 2 lou�


* Prelevement garantie

    IF R.NEW(CF.CT.GARANTIE) EQ 'YES' THEN
        Y.CPTE.DEBIT= R.NEW(CF.CT.COMPTE.FACTURATION)
        Y.CPTE.CREDIT=R.NEW(CF.CT.COMPTE.GARANTIE)
        Y.MONTANT.GAR=R.NEW(CF.CT.AMOUNT.GARANTIE)

        CALL F.READ(FN.AC,Y.CPTE.DEBIT,R.AC.DB,F.AC,ERR.AC)
        IF R.AC.DB THEN
            DEVISE.CPT.FACT=R.AC.DB<AC.CURRENCY>
        END

        IF NOT(DEVISE.CPT.FACT MATCHES "TND":@VM:"TNC") THEN
            MONTANT.TND=Y.MONTANT.GAR
            DEVISE.CLIENT=DEVISE.CPT.FACT
            GOSUB CONVERT.AMOUNT
        END ELSE
            MONTANT.CONVERTI=Y.MONTANT.GAR
        END

        Y.PAYMENT.DETAILS=ID.NEW
        SOURCE.OFS='TAG'
        OPTIONS.OFS=''

        R.NEW(CF.CT.MNT.GAR.FCY)= MONTANT.CONVERTI
*R.NEW(CF.CT.COMPTE.FACTURATION)
        MESSAGE.OFS = "FUNDS.TRANSFER,BZ.COFFRE.GARANTIE/I/PROCESS,":Y.OFS.LOGIN:"/":Y.OFS.PASSWD:",,DEBIT.ACCT.NO=":Y.CPTE.DEBIT:",CREDIT.ACCT.NO=":Y.CPTE.CREDIT:",CREDIT.CURRENCY=":DEVISE.CPT.FACT:",CREDIT.AMOUNT=" :  MONTANT.CONVERTI : ",PAYMENT.DETAILS:1:=" : Y.PAYMENT.DETAILS : ",DEBIT.THEIR.REF:1:=" : V.NUM.COFFRE : ",CREDIT.THEIR.REF:1:=" : V.NUM.COFFRE
        CALL OFS.POST.MESSAGE (MESSAGE.OFS, OFS.MSG.ID, SOURCE.OFS, OPTIONS.OFS)
        R.NEW(CF.CT.REFERENCE.GARANTIE)=OFS.MSG.ID

    END
*Fin Prelevement garantie

* Prelevement 1er loyer

** R�cup�ration code COM DE LA TABLE BZ.COFFRE.TYPE SELON TYPE COFFRE

*Y.CODE.COM = 'COFF01'
*************************************************************************************************
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)
    V.TYPE.COFFRE =R.REG<CF.REG.TYPE>
    CALL F.READ(FN.TYP,V.TYPE.COFFRE,R.TYP,F.TYP,ERR.TYP)
    Y.CODE.COM =R.TYP<CF.TYPE.LOYER.ANNUEL>
**


    CALL F.READ (FN.COM,Y.CODE.COM, COM.REC, F.COM, ERR.COM)
    MNT.COMMISSION = COM.REC<FT4.FLAT.AMT>

    Y.CLIENT = R.NEW(CF.CT.ID.CLIENT)
    IN.CHARGE=''
    MNT.CHARGE=''

    Y.CPTE.FACTURATION = R.NEW(CF.CT.COMPTE.FACTURATION)

    CALL F.READ(FN.AC,Y.CPTE.FACTURATION,R.AC,F.AC,ERR.AC)
    Y.CCY.COMPTE.FACT=R.AC<AC.CURRENCY>

    CALL BZ.GET.PREFERENTIEL(Y.CLIENT,"FUNDS.TRANSFER","","",Y.CODE.COM,MNT.COMMISSION,IN.CHARGE,MNT.CHARGE)

    IF NOT(Y.CCY.COMPTE.FACT MATCHES "TND":@VM:"TNC") THEN
        MONTANT.TND=MNT.COMMISSION
        DEVISE.CLIENT=Y.CCY.COMPTE.FACT
        GOSUB CONVERT.AMOUNT
        MNT.COMMISSION=MONTANT.CONVERTI
    END

    IF MNT.COMMISSION GT 0 THEN

        ID.LOYER = ID.NEW : "." : R.NEW(CF.CT.DATE.CONTRAT)

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

        CALL OFS.POST.MESSAGE(Y.OFS.MSG, OFS.MSG.ID, SOURCE.OFS, OPTIONS.OFS)

        R.NEW(CF.CT.MNT.PRE.LOYER)=MNT.COMMISSION
*creer record ds la table BZ.COFFRE.LOYER

* LIRE LA TEMPLATE


        CALL F.READ(FN.LOYER,ID.LOYER,R.LOYER,F.LOYER,ERR.LOYER)
*Mise a jour table
        IF R.LOYER EQ '' THEN
            R.LOYER<CF.LOYER.ID.CONTRAT> = ID.NEW
            R.LOYER<CF.LOYER.DATE.LOYER> = R.NEW(CF.CT.DATE.CONTRAT)
            R.LOYER<CF.LOYER.REF.OFS> = OFS.MSG.ID
* R.LOYER<CF.LOYER.REF.LOYER>  SERA GARNI PAR LA REFERENCE COMPTABLE AC.CHARGE.REQUEST APRES CONSOMMATION OFS
            R.LOYER<CF.LOYER.DATE.PRELEVEMENT> = TODAY
            R.LOYER<CF.LOYER.MONTANT> = MNT.COMMISSION
            R.LOYER<CF.LOYER.COMPTE> = Y.CPTE.FACTURATION
            R.LOYER<CF.LOYER.DEVISE> = Y.CCY.COMPTE.FACT
            R.LOYER<CF.LOYER.NUM.COFFRE> = V.NUM.COFFRE
            R.LOYER<CF.LOYER.CHARGE.CODE> = Y.CODE.COM

*Ecrire dans la table

            CALL F.WRITE(FN.LOYER,ID.LOYER,R.LOYER)
        END ELSE
*//            E = "LOYER existe"
            ETEXT = "LOYER existe"
            CALL STORE.END.ERROR


        END



*Fin Prelevement 1er loyer

*Enregistrement evenement location coffre


        Y.TIME = OCONV(TIME(), "MTS")
        CHANGE ':' TO '' IN Y.TIME


        DATE.EVENT=TODAY
        DETAILS='AUTHORISER: ' : R.USER<EB.USE.USER.NAME>
        NUMERO.COFFRE=R.NEW(CF.CT.NUMERO.COFFRE)
        TYPE.EVENT='2'
        ID.CONTRAT=ID.NEW
        REF.OPERATION=ID.NEW
        ID.EVENT =  NUMERO.COFFRE :'.':DATE.EVENT:'.':TYPE.EVENT:'.':Y.TIME

        CALL BZ.COFFRE.EVENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME)


    END




*Fin Enregistrement evenement location coffre

    RETURN


********************************************************************
**************** convert
********************************************************************
CONVERT.AMOUNT:



    BUY.AMT = ""
    BUY.CCY=DEVISE.CLIENT

    SELL.AMT = MONTANT.TND
    SELL.CCY="TND"

    CALL F.READ(FN.CUR,BUY.CCY,CUR.REC,F.CUR,ERR.CUR)
    CURRENCY.MARKET = CUR.REC<EB.CUR.CURRENCY.MARKET>
    BUY.RATES = CUR.REC<EB.CUR.BUY.RATE>
    SELL.RATES = CUR.REC<EB.CUR.SELL.RATE>
    MID.RATES = CUR.REC<EB.CUR.MID.REVAL.RATE>

    CCY.MKT = "1"
    CHANGE @VM TO @FM IN CURRENCY.MARKET

    LOCATE CCY.MKT IN  CURRENCY.MARKET<1> SETTING POS ELSE POS = 0
    BUY.RATE.CR = BUY.RATES<1,POS>
    SELL.RATE.CR = SELL.RATES<1,POS>
    MID.RATE.CR = MID.RATES<1,POS>

    BASE.CCY = ''

    DIFFERENCE = ''
    LCY.AMT = ''
    RETURN.CODE = ''

    EXCHANGE.RATE = BUY.RATE.CR

    CALL EXCHRATE(CCY.MKT,BUY.CCY,BUY.AMT,SELL.CCY, SELL.AMT,BASE.CCY,EXCHANGE.RATE, DIFFERENCE,LCY.AMT,RETURN.CODE)

    CALL EB.ROUND.AMOUNT(BUY.CCY,BUY.AMT,'','')

    MONTANT.CONVERTI=BUY.AMT

    RETURN
END
