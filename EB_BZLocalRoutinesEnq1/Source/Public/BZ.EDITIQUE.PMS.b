*-----------------------------------------------------------------------------
* <Rating>179</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
*- SUBROUTINE BZ.EDITIQUE.PMS(RESULTAT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
    SUBROUTINE BZ.EDITIQUE.PMS(TABLEAU)

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19:Converted GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file 
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.LOOKUP
*ZIT-UPG-R09-R13 / S
** $INSERT I_COMMON - Not Used anymore;IQUE.PMS.RET.SOURCE
** $INSERT I_EQUATE - Not Used anymore;IQUE.PMS
** $INSERT I_ENQUIRY.COMMON - Not Used anymore;C
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;CE
$INSERT I_F.EDITIQUE.PMS
$INSERT I_F.EDITIQUE.SYNC
*ZIT-UPG-R09-R13 / E
    $INSERT I_F.SECTOR

*    RUNNING.UNDER.BATCH =1
MAIN:
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*-------EB.SystemTables.getVFunction()-------------EB.SystemTables.getVFunction()------------EB.SystemTables.getRNew()-FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-*
INITIALISATION:
*------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-----------------------------------*

    FN.MM = "F.MM.MONEY.MARKET"
    F.MM = ""
    MM.REC=''
    ERR.MM=''

    FN.LD = "F.LD.LOANS.AND.DEPOSITS"
    F.LD = ""
    LD.REC=''
    ERR.LD=''

    FN.LMM=  "F.LMM.SCHEDULES.PAST"
    F.LMM=""
    LMM.REC=''
    ERR.LMM=''

    FN.LD.HIS=  "F.LD.LOANS.AND.DEPOSITS$HIS"
    F.LD.HIS=""
    LD.HIS.REC=''
    ERR.LD.HIS=''

    FN.MM.HIS = "F.MM.MONEY.MARKET$HIS"
    F.MM.HIS = ""
    MM.HIS.REC=''
    ERR.MM.HIS=''

    FN.CUEB.DataAccess.Opf "F.CUSTOMER"
    F.CUSEB.DataAccess.Opf""
    CUS.REC=''
    ERR.CUS=''

    FN.PMS = "F.EDITIQUE.PMS.RET.SOURCE"
    F.PMS = ""
    PMS.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.PEB.DataAccess.FRead

    FN.SYNC = "F.EDITIQUE.SYNC"
    F.SYNC = ""

    FN.LUP="F.EB.LOOKUP"
EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyertemTables.setE()*-----------------------------------------------------------------------------
* <Rating>179</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
*- SUBROUTINE BZ.EDITIQUE.PMS(RESULTAT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
    SUBROUTINE BZ.EDITIQUE.PMS(TABLEAU)

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19:Converted GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file 
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.LOOKUP
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.EDITIQUE.PMS.RET.SOURCE
*$INSERT BP I_F.EDITIQUE.PMS
*$INSERT BP I_F.EDITIQUE.SYNC
$INSERT I_F.EDITIQUE.PMS.RET.SOURCE
$INSERT I_F.EDITIQUE.PMS
$INSERT I_F.EDITIQUE.SYNC
*ZIT-UPG-R09-R13 / E
    $INSERT I_F.SECTOR

*    RUNNING.UNDER.BATCH =1
MAIN:
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.MM = "F.MM.MONEY.MARKET"
    F.MM = ""
    MM.REC=''
    ERR.MM=''

    FN.LD = "F.LD.LOANS.AND.DEPOSITS"
    F.LD = ""
    LD.REC=''
    ERR.LD=''

    FN.LMM=  "F.LMM.SCHEDULES.PAST"
    F.LMM=""
    LMM.REC=''
    ERR.LMM=''

    FN.LD.HIS=  "F.LD.LOANS.AND.DEPOSITS$HIS"
    F.LD.HIS=""
    LD.HIS.REC=''
    ERR.LD.HIS=''

    FN.MM.HIS = "F.MM.MONEY.MARKET$HIS"
    F.MM.HIS = ""
    MM.HIS.REC=''
    ERR.MM.HIS=''

    FN.CUS = "F.CUSTOMER"
    F.CUS = ""
    CUS.REC=''
    ERR.CUS=''

    FN.PMS = "F.EDITIQUE.PMS.RET.SOURCE"
    F.PMS = ""
    PMS.REC=''
    ERR.PMS=''

    FN.SYNC = "F.EDITIQUE.SYNC"
    F.SYNC = ""

    FN.LUP="F.EB.LOOKUP"
    F.LUP=""

    FN.CURRENCY="F.CEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerRRENCY=""

    FN.SECT = "EB.DataAccess.FWriteR"
    F.SECT = ""
    SECT.REC=''
    ERR.EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>179</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
*- SUBROUTINE BZ.EDITIQUE.PMS(RESULTAT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
    SUBROUTINE BZ.EDITIQUE.PMS(TABLEAU)

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19:Converted GET.LOC.REF to MULTI.GET.LOC.REF,Used reference from I_F file 
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.LOOKUP
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.EDITIQUE.PMS.RET.SOURCE
*$INSERT BP I_F.EDITIQUE.PMS
*$INSERT BP I_F.EDITIQUE.SYNC
$INSERT I_F.EDITIQUE.PMS.RET.SOURCE
$INSERT I_F.EDITIQUE.PMS
$INSERT I_F.EDITIQUE.SYNC
*ZIT-UPG-R09-R13 / E
    $INSERT I_F.SECTOR

*    RUNNING.UNDER.BATCH =1
MAIN:
    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.MM = "F.MM.MONEY.MARKET"
    F.MM = ""
    MM.REC=''
    ERR.MM=''

    FN.LD = "F.LD.LOANS.AND.DEPOSITS"
    F.LD = ""
    LD.REC=''
    ERR.LD=''

    FN.LMM=  "F.LMM.SCHEDULES.PAST"
    F.LMM=""
    LMM.REC=''
    ERR.LMM=''

    FN.LD.HIS=  "F.LD.LOANS.AND.DEPOSITS$HIS"
    F.LD.HIS=""
    LD.HIS.REC=''
    ERR.LD.HIS=''

    FN.MM.HIS = "F.MM.MONEY.MARKET$HIS"
    F.MM.HIS = ""
    MM.HIS.REC=''
    ERR.MM.HIS=''

    FN.CUS = "F.CUSTOMER"
    F.CUS = ""
    CUS.REC=''
    ERR.CUS=''

    FN.PMS = "F.EDITIQUE.PMS.RET.SOURCE"
    F.PMS = ""
    PMS.REC=''
    ERR.PMS=''

    FN.SYNC = "F.EDITIQUE.SYNC"
    F.SYNC = ""

    FN.LUP="F.EB.LOOKUP"
    F.LUP=""

    FN.CURRENCY="F.CURRENCY"
    F.CURRENCY=""

    FN.SECT = "F.SECTOR"
    F.SECT = ""
    SECT.REC=''
    ERR.SECFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.SystemTables.setE(0.2)

    R.NEW(ED.PMS.EDITER)=''
    R.NEW(ED.PMS.TYPE)=''

    LOCATE "@ID" IN D.FIELDS<1> SETTING ID.POS THEN
        IDENTIF = D.RANGE.AND.VALUE<ID.POS>
    END
    RETURN
*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.LD, F.LD)
    CALL OPF(FN.LMM, F.LMM)
    CALL OPF(FN.LD.HIS, F.LD.HIS)
    CALL OPF(FN.MM.HIS, F.MM.HIS)
    CALL OPF(FN.MM, F.MM)
    CALL OPF(FN.CUS, F.CUS)
    CALL OPF(FN.PMS, F.PMS)
    CALL OPF(FN.SYNC, F.SYNC)
    CALL OPF(FN.LUP, F.LUP)
    CALL OPF(FN.CURRENCY, F.CURRENCY)
    CALL OPF(FN.SECT, F.SECT)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
* SI LD OU MM EXISTE DANS LA TABLE LMM.SCHEDULES.PAST ALORS
*GOSUB TRAITER_LMM.SCHEDULES.PAST {CAS 1 LD , CAS 2 MM }
* SINON { LD OU MM SANS ECHEANCIER : TRAITER CONTRAT}
* GOSUB TRAITER_CONTRAT { CAS 1 LD, CAS 2 MM }
*END

    SELECTION = "SELECT ":FN.LMM:" WITH @ID LIKE " : IDENTIF : "..."
    CALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL,SEL.ERR)

    IF SEL.LIST EQ '' THEN
        GOSUB TRAITER_CONTRAT
    END ELSE
        GOSUB TRAITER_SCHEDULE
    END

    RETURN

    TRAITER_CONTRAT:

    IF IDENTIF[1,2] EQ "LD"  THEN
        ID.CONTRAT = IDENTIF[1,12]
        SELECTION = "SSELECT ":FN.LD.HIS:" WITH @ID LIKE " : ID.CONTRAT : "... BY-DSND @ID"
        CALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL.LD.HIS,SEL.ERR)

        ID.CONTRAT.HIS=ID.CONTRAT:";": NO.SEL.LD.HIS

        CALL F.READ(FN.LD.HIS,ID.CONTRAT.HIS,LD.HIS.REC,F.LD.HIS,ERR.LD.HIS)

        Y.MNT.RECEIVED= LD.HIS.REC<LD.TOT.INTEREST.AMT>
        Y.MONTANT.RET=LD.HIS.REC<LD.TOT.INT.TAX>
        Y.DATE=LD.HIS.REC<LD.FIN.MAT.DATE>
        COMPTE=LD.HIS.REC<LD.PRIN.LIQ.ACCT>

****RECUPERATION ID CUSTOMER DU CONTRAT LD.HIS****

        Y.CUSTOMER=LD.HIS.REC<LD.CUSTOMER.ID>
        GOSUB INFO.CLIENT

**** FIN RECUPERATION ID CUSTOMER DU CONTRAT LD.HIS****

    END ELSE

        ID.CONTRAT = IDENTIF[1,12]
        SELECTION = "SELECT ":FN.MM.HIS:" WITH @ID LIKE " : ID.CONTRAT : "... BY-DSND @ID"
        CALL EB.READLIST(SELECTION,SEL.LIST,'',NO.SEL.MM.HIS,SEL.ERR)

        ID.CONTRAT.HIS=ID.CONTRAT:";": NO.SEL.MM.HIS

        CALL F.READ(FN.MM.HIS,ID.CONTRAT.HIS,MM.HIS.REC,F.MM.HIS,ERR.MM.HIS)

        Y.MNT.RECEIVED= MM.HIS.REC<MM.TOT.INTEREST.AMT>
        DEVISE=MM.HIS.REC<MM.CURRENCY>
        Y.MONTANT.RET=Y.MNT.RECEIVED*POURCENTAGE
        CALL EB.ROUND.AMOUNT(DEVISE,Y.MONTANT.RET,"","")
        Y.MONTANT.NET=Y.MNT.RECEIVED-Y.MONTANT.RET
        CALL EB.ROUND.AMOUNT(DEVISE,Y.MONTANT.NET,"","")

        Y.DATE=MM.HIS.REC<MM.MATURITY.DATE>
        COMPTE=MM.HIS.REC<MM.PRIN.LIQ.ACCT>

****RECUPERATION ID CUSTOMER DU CONTRAT MM.HIS****
        Y.CUSTOMER=MM.HIS.REC<MM.CUSTOMER.ID>
        GOSUB INFO.CLIENT

    END

    TABLEAU<-1>=IDENTIF:"*":ID.CONTRAT:"*":Y.CUSTOMER:"*":Y.NOM:"*":COMPTE:"*":Y.DATE:"*":Y.MNT.RECEIVED:"*":Y.TYPE.NUM.IDENT.LIB:"*":Y.NUM.IDENTITE:"*":Y.MONTANT.RET:"*":Y.ADRESSE
**    RESULTAT<-1>=IDENTIF:"*":ID.CONTRAT:"*":Y.CUSTOMER:"*":Y.NOM:"*":COMPTE:"*":Y.DATE:"*":Y.MNT.RECEIVED:"*":Y.TYPE.NUM.IDENT.LIB:"*":Y.NUM.IDENTITE:"*":Y.MONTANT.RET:"*":Y.ADRESSE

    RETURN


* FIN TRAITER_CONTRAT:

    TRAITER_SCHEDULE:
    ID.CONTRAT = IDENTIF[1,12]
    FOR COMPTEUR=1 TO NO.SEL
        REMOVE IDENTIF FROM SEL.LIST SETTING POS
        CALL F.READ(FN.LMM,IDENTIF,LMM.REC,F.LMM,ERR.LMM)
        IF IDENTIF[1,2] EQ "LD"  THEN

            Y.MNT.RECEIVED= LMM.REC<LD28.INT.RECEIVED>
            Y.DATE=LMM.REC<LD28.DATE.INT.REC>
            Y.MONTANT.RET=LMM.REC<LD28.TAX.CODE.INT>
            Y.MONTANT.NET=Y.MNT.RECEIVED-Y.MONTANT.RET

* RECUPERATION ID CUSTOMER DU CONTRAT LD

            CALL F.READ(FN.LD,ID.CONTRAT, LD.REC,F.LD, ERR.LD)
            IF LD.REC THEN
                COMPTE=LD.REC<LD.PRIN.LIQ.ACCT>
                Y.CUSTOMER=LD.REC<LD.CUSTOMER.ID>
                GOSUB INFO.CLIENT
            END ELSE
                ID.CONTRAT.HIS = ID.CONTRAT
*ID.CONTRAT.HIS = ID.CONTRAT : ";1"
*CALL F.READ(FN.LD.HIS,ID.CONTRAT, LD.HIS.REC,F.LD.HIS, ERR.LD.HIS)
                CALL F.READ(FN.LD.HIS,ID.CONTRAT.HIS, LD.HIS.REC,F.LD.HIS, ERR.LD.HIS)
                Y.CUSTOMER=LD.HIS.REC<LD.CUSTOMER.ID>
                COMPTE=LD.HIS.REC<LD.PRIN.LIQ.ACCT>
                GOSUB INFO.CLIENT
            END


* FIN RECUPERATION ID CUSTOMER DU CONTRAT LD

        END ELSE

            Y.MNT.RECEIVED= LMM.REC<LD28.INTEREST.REC.AMT>
            Y.MONTANT.RET=LMM.REC<LD28.TAX.CODE.INT>
*
            CALL F.READ(FN.MM,ID.CONTRAT, MM.REC,F.MM, ERR.MM)
            DEVISE=MM.REC<MM.CURRENCY>
            CALL EB.ROUND.AMOUNT(DEVISE,Y.MONTANT.RET,"","")
            Y.MONTANT.NET=Y.MNT.RECEIVED-Y.MONTANT.RET
            CALL EB.ROUND.AMOUNT(DEVISE,Y.MONTANT.NET,"","")
            Y.DATE.PROFIT=IDENTIF[13,7]
            Y.DATE.FMT=""
            CALL JULDATE(Y.DATE.FMT,Y.DATE.PROFIT)
            Y.DATE=Y.DATE.FMT

* RECUPERATION ID CUSTOMER DU CONTRAT MM

            CALL F.READ(FN.MM,ID.CONTRAT, MM.REC,F.MM, ERR.MM)
            IF MM.REC THEN

                Y.CUSTOMER=MM.REC<MM.CUSTOMER.ID>
                COMPTE=MM.REC<MM.PRIN.LIQ.ACCT>
                GOSUB INFO.CLIENT
            END ELSE
*ID.CONTRAT.HIS = ID.CONTRAT : ";1"
*CALL F.READ(FN.MM.HIS,ID.CONTRAT, MM.HIS.REC,F.MM.HIS, ERR.MM.HIS)
                ID.CONTRAT.HIS = ID.CONTRAT
                CALL F.READ(FN.MM.HIS,ID.CONTRAT.HIS, MM.HIS.REC,F.MM.HIS, ERR.MM.HIS)
                COMPTE=MM.REC<MM.PRIN.LIQ.ACCT>
                Y.CUSTOMER=MM.HIS.REC<MM.CUSTOMER.ID>
                GOSUB INFO.CLIENT
            END
* FIN RECUPERATION ID CUSTOMER DU CONTRAT MM

        END

** RESULTAT<-1>=IDENTIF:"*":ID.CONTRAT:"*":Y.CUSTOMER:"*":Y.NOM:"*":COMPTE:"*":Y.DATE:"*":Y.MNT.RECEIVED:"*":Y.TYPE.NUM.IDENT.LIB:"*":Y.NUM.IDENTITE:"*":Y.MONTANT.RET:"*":Y.ADRESSE
        TABLEAU<-1>=IDENTIF:"*":ID.CONTRAT:"*":Y.CUSTOMER:"*":Y.NOM:"*":COMPTE:"*":Y.DATE:"*":Y.MNT.RECEIVED:"*":Y.TYPE.NUM.IDENT.LIB:"*":Y.NUM.IDENTITE:"*":Y.MONTANT.RET:"*":Y.ADRESSE

    NEXT COMPTEUR

    RETURN
* FIN  TRAITER_SCHEDULE:

INFO.CLIENT:
***********TRAITER INFO CLIENT*************************
    CALL F.READ(FN.CUS,Y.CUSTOMER, CUS.REC,F.CUS, ERR.CUS)

    Y.SECTOR=CUS.REC<EB.CUS.SECTOR>
    CALL F.READ(FN.SECT,Y.SECTOR, SECT.REC,F.SECT, ERR.SECT)
	
*ZIT-UPG-R13-R19 S 
*   CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",POS.LIB)
    Y.APPLICATION.NAME = "SECTOR"
	Y.FIELD.NAME = "LIB.NAT.CLT"
	Y.POS = ''
	CALL MULTI.GET.LOC.REF (Y.APPLICATION.NAME, Y.FIELD.NAME, Y.POS)
	POS.LIB = Y.POS<1,1>
*ZIT-UPG-R13-R19  E	

    Y.LIB.NAT.CLT=SECT.REC<EB.SEC.LOCAL.REF,POS.LIB>   ;*Used reference from I_F file 

    IF Y.LIB.NAT.CLT EQ 'PM' THEN

        Y.LEGAL.ID.DOCS=CUS.REC<EB.CUS.LEGAL.DOC.NAME>
        NBR.LEGAL.DOCS=DCOUNT(Y.LEGAL.ID.DOCS,@VM)

        FOR COUNTER=1 TO NBR.LEGAL.DOCS
            Y.DOCS.NAME=Y.LEGAL.ID.DOCS<1,COUNTER>

            IF Y.DOCS.NAME EQ "MF" THEN
                Y.MAT.FIS=CUS.REC<EB.CUS.LEGAL.ID><1,COUNTER>
                Y.MAT.FIS=LEFT(Y.MAT.FIS,8)
            END

        NEXT COUNTER
        Y.TYPE.NUM.IDENT=Y.LEGAL.ID.DOCS<1,2>
        Y.NUM.IDENTITE=CUS.REC<EB.CUS.LEGAL.ID><1,2>

        CALL F.READ(FN.LUP,"CUS.LEGAL.DOC.NAME*":Y.TYPE.NUM.IDENT, REC.LUP,F.LUP, ERR.LUP)
        Y.TYPE.NUM.IDENT.LIB=REC.LUP<EB.LU.DESCRIPTION>

        Y.NOM=CUS.REC<EB.CUS.SHORT.NAME>
        Y.ADRESSE= CUS.REC<EB.CUS.ADDRESS>

    END ELSE

        IF Y.LIB.NAT.CLT EQ 'PP' THEN

            Y.LEGAL.ID.DOCS=CUS.REC<EB.CUS.LEGAL.DOC.NAME>
            NBR.LEGAL.DOCS=DCOUNT(Y.LEGAL.ID.DOCS,@VM)

            FOR COUNTER=1 TO NBR.LEGAL.DOCS
                Y.DOCS.NAME=Y.LEGAL.ID.DOCS<1,COUNTER>

                IF Y.DOCS.NAME EQ "MF" THEN
                    Y.MAT.FIS=CUS.REC<EB.CUS.LEGAL.ID><1,COUNTER>
                    Y.MAT.FIS=LEFT(Y.MAT.FIS,8)
                END

            NEXT COUNTER
            Y.TYPE.NUM.IDENT=Y.LEGAL.ID.DOCS<1,1>
            Y.NUM.IDENTITE=CUS.REC<EB.CUS.LEGAL.ID><1,1>

            CALL F.READ(FN.LUP,"CUS.LEGAL.DOC.NAME*":Y.TYPE.NUM.IDENT, REC.LUP,F.LUP, ERR.LUP)
            Y.TYPE.NUM.IDENT.LIB=REC.LUP<EB.LU.DESCRIPTION>

            Y.NOM=CUS.REC<EB.CUS.SHORT.NAME>
            Y.ADRESSE= CUS.REC<EB.CUS.ADDRESS>

        END

    END

    RETURN
************FIN TRAITER INFO CLIENT*********************
