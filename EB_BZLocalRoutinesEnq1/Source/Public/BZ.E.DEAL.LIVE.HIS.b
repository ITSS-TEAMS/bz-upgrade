*-----------------------------------------------------------------------------
* <Rating>1067</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des records live et history de la table MD.DEAL
* @Desc   : Regle REG28 STD Garanties Emises
* @Date   : Le 30/12/2010

*********************************************************************
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.LIVE.HIS(Y.LIST.TYPE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-GET.LOC.REF TO MULTI.GET.LOC.REF;FM TO @FM;INTIALISED VARIABLES;REPLACED @ID WITH Y.ID
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.MD.DEAL

* $INSERT I_COMMON - Not Used anymore;---------------------------------------------------
* $INSERT I_EQUATE - Not Used anymore;TION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.DEAL = "F.MD.DEAL"
    F.MD.DEAL = ""
    R.MD.DEAL = ""
    ERR.MD.DEAL = ""
    CALL OPF(FN.MD.DEAL, F.MD.DEAL)


    FN.MD.DEAL.HIS = "F.MD.DEAL$HIS"
    F.MDEB.SystemTables.getVFunction()= ""
    R.MD.DEAL.HIS = ""
    ERR.MD.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FN.MD.Dtmp.V$FUNCTION.MD.DEAL.HIS)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
*ZIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
*    CALL GET.LOC.REF("MD.DEAL","BZ.AGENCE", POS1)
		Y.APP='MD.DEAL'
		Y.FIELD='BZ.AGENCE'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS1=Y.POS<1,1>
*ZIT-UPG-R13-R19 E   
	Y.LIST.TYPE = ''
    I = 0
    NB = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:


* LOCATE CRITERIA : DEAL.ID : Rfrence de Garantie

    LOCATEB.DataAccess.Opf@ID" IN D.FIELDS<1> SETTING POS.ID ELSE NULL
    DATA.EB.DataAccess.Opf= D.RANGE.AND.VALUE<POS.ID>
    OPERANDE.ID= D.LOGICAL.OPERANDS<POS.ID>
    CALL BZ.GET.ENQ.SELECT.STRING("@ID" ,OPERANDE.ID,DATA.ID,Y.QUERY)

* LOCATE CRITERIA : DEAL.TYPE : Type de Garantie

    LOCATE "DEAL.SUB.TFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefS<1> SETTING POS.TYPE ELSE NULL
    DATA.EB.DataAccess.FRead D.RANGE.AND.VALUE<POS.TYPE>
    OPERANDE.TYPE= D.LOGICAL.OPERANDS<POS.TYPE>
    CALL BZ.GET.ENQ.SELECT.STRING("DEAL.SUB.TYPE" ,OPERANDE.TYPE,DATA.TYPE,Y.QUERY)


* LOCATE CRITERIA : CUSTOMEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer LOCATEEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1067</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des records live et history de la table MD.DEAL
* @Desc   : Regle REG28 STD Garanties Emises
* @Date   : Le 30/12/2010

*********************************************************************
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.LIVE.HIS(Y.LIST.TYPE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-GET.LOC.REF TO MULTI.GET.LOC.REF;FM TO @FM;INTIALISED VARIABLES;REPLACED @ID WITH Y.ID
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.MD.DEAL

*----------------------------------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.DEAL = "F.MD.DEAL"
    F.MD.DEAL = ""
    R.MD.DEAL = ""
    ERR.MD.DEAL = ""
    CALL OPF(FN.MD.DEAL, F.MD.DEAL)


    FN.MD.DEAL.HIS = "F.MD.DEAL$HIS"
    F.MD.DEAL.HIS = ""
    R.MD.DEAL.HIS = ""
    ERR.MD.DEAL.HIS = ""
    CALL OPF(FN.MD.DEAL.HIS, F.MD.DEAL.HIS)
*ZIT-UPG-R13-R19 S 
*    CALL GET.LOC.REF("MD.DEAL","BZ.AGENCE", POS1)
		Y.APP='MD.DEAL'
		Y.FIELD='BZ.AGENCE'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS1=Y.POS<1,1>
*ZIT-UPG-R13-R19 E   
	Y.LIST.TYPE = ''
    I = 0
    NB = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:


* LOCATE CRITERIA : DEAL.ID : Rfrence de Garantie

    LOCATE "@ID" IN D.FIELDS<1> SETTING POS.ID ELSE NULL
    DATA.ID = D.RANGE.AND.VALUE<POS.ID>
    OPERANDE.ID= D.LOGICAL.OPERANDS<POS.ID>
    CALL BZ.GET.ENQ.SELECT.STRING("@ID" ,OPERANDE.ID,DATA.ID,Y.QUERY)

* LOCATE CRITERIA : DEAL.TYPE : Type de Garantie

    LOCATE "DEAL.SUB.TYPE" IN D.FIELDS<1> SETTING POS.TYPE ELSE NULL
    DATA.TYPE = D.RANGE.AND.VALUE<POS.TYPE>
    OPERANDE.TYPE= D.LOGICAL.OPERANDS<POS.TYPE>
    CALL BZ.GET.ENQ.SELECT.STRING("DEAL.SUB.TYPE" ,OPERANDE.TYPE,DATA.TYPE,Y.QUERY)


* LOCATE CRITERIA : CUSTOMER : Client

    LOCATE "CUSTOMER" IN D.FIELDS<1> SETTING POS.CUS ELSE NULL
    DATA.CUS = D.RANEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerUS>
    OPERANDE.CUS= D.LOGICAL.OPERANDS<POS.CUS>
    EB.DataAccess.FWriteCT.STRING("CUSTOMER" ,OPERANDE.CUS,DATA.CUS,Y.QUERY)


* LOCATE CRITERIA : CURRENCY : Devise

    LOEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1067</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des records live et history de la table MD.DEAL
* @Desc   : Regle REG28 STD Garanties Emises
* @Date   : Le 30/12/2010

*********************************************************************
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.LIVE.HIS(Y.LIST.TYPE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-GET.LOC.REF TO MULTI.GET.LOC.REF;FM TO @FM;INTIALISED VARIABLES;REPLACED @ID WITH Y.ID
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.MD.DEAL

*----------------------------------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.DEAL = "F.MD.DEAL"
    F.MD.DEAL = ""
    R.MD.DEAL = ""
    ERR.MD.DEAL = ""
    CALL OPF(FN.MD.DEAL, F.MD.DEAL)


    FN.MD.DEAL.HIS = "F.MD.DEAL$HIS"
    F.MD.DEAL.HIS = ""
    R.MD.DEAL.HIS = ""
    ERR.MD.DEAL.HIS = ""
    CALL OPF(FN.MD.DEAL.HIS, F.MD.DEAL.HIS)
*ZIT-UPG-R13-R19 S 
*    CALL GET.LOC.REF("MD.DEAL","BZ.AGENCE", POS1)
		Y.APP='MD.DEAL'
		Y.FIELD='BZ.AGENCE'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS1=Y.POS<1,1>
*ZIT-UPG-R13-R19 E   
	Y.LIST.TYPE = ''
    I = 0
    NB = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:


* LOCATE CRITERIA : DEAL.ID : Rfrence de Garantie

    LOCATE "@ID" IN D.FIELDS<1> SETTING POS.ID ELSE NULL
    DATA.ID = D.RANGE.AND.VALUE<POS.ID>
    OPERANDE.ID= D.LOGICAL.OPERANDS<POS.ID>
    CALL BZ.GET.ENQ.SELECT.STRING("@ID" ,OPERANDE.ID,DATA.ID,Y.QUERY)

* LOCATE CRITERIA : DEAL.TYPE : Type de Garantie

    LOCATE "DEAL.SUB.TYPE" IN D.FIELDS<1> SETTING POS.TYPE ELSE NULL
    DATA.TYPE = D.RANGE.AND.VALUE<POS.TYPE>
    OPERANDE.TYPE= D.LOGICAL.OPERANDS<POS.TYPE>
    CALL BZ.GET.ENQ.SELECT.STRING("DEAL.SUB.TYPE" ,OPERANDE.TYPE,DATA.TYPE,Y.QUERY)


* LOCATE CRITERIA : CUSTOMER : Client

    LOCATE "CUSTOMER" IN D.FIELDS<1> SETTING POS.CUS ELSE NULL
    DATA.CUS = D.RANGE.AND.VALUE<POS.CUS>
    OPERANDE.CUS= D.LOGICAL.OPERANDS<POS.CUS>
    CALL BZ.GET.ENQ.SELECT.STRING("CUSTOMER" ,OPERANDE.CUS,DATA.CUS,Y.QUERY)


* LOCATE CRITERIA : CURRENCY : Devise

    LOCAEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>1067</Rating>
*-----------------------------------------------------------------------------

* @Author : lzazouli@temenos.com
* @Desc   : Routine Nofile pour sortir la liste des records live et history de la table MD.DEAL
* @Desc   : Regle REG28 STD Garanties Emises
* @Date   : Le 30/12/2010

*********************************************************************
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.DEAL.LIVE.HIS(Y.LIST.TYPE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-GET.LOC.REF TO MULTI.GET.LOC.REF;FM TO @FM;INTIALISED VARIABLES;REPLACED @ID WITH Y.ID
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.MD.DEAL

*----------------------------------------------------------------------
    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

***************************************************************************
INITIALISATION:

    FN.MD.DEAL = "F.MD.DEAL"
    F.MD.DEAL = ""
    R.MD.DEAL = ""
    ERR.MD.DEAL = ""
    CALL OPF(FN.MD.DEAL, F.MD.DEAL)


    FN.MD.DEAL.HIS = "F.MD.DEAL$HIS"
    F.MD.DEAL.HIS = ""
    R.MD.DEAL.HIS = ""
    ERR.MD.DEAL.HIS = ""
    CALL OPF(FN.MD.DEAL.HIS, F.MD.DEAL.HIS)
*ZIT-UPG-R13-R19 S 
*    CALL GET.LOC.REF("MD.DEAL","BZ.AGENCE", POS1)
		Y.APP='MD.DEAL'
		Y.FIELD='BZ.AGENCE'
		Y.POS=''
		CALL MULTI.GET.LOC.REF(Y.APP,Y.FIELD,Y.POS)
		POS1=Y.POS<1,1>
*ZIT-UPG-R13-R19 E   
	Y.LIST.TYPE = ''
    I = 0
    NB = 0


    RETURN
***************************************************************************




*---------------------------------------------------------------------------
MAIN.PROCESS:


* LOCATE CRITERIA : DEAL.ID : Rfrence de Garantie

    LOCATE "@ID" IN D.FIELDS<1> SETTING POS.ID ELSE NULL
    DATA.ID = D.RANGE.AND.VALUE<POS.ID>
    OPERANDE.ID= D.LOGICAL.OPERANDS<POS.ID>
    CALL BZ.GET.ENQ.SELECT.STRING("@ID" ,OPERANDE.ID,DATA.ID,Y.QUERY)

* LOCATE CRITERIA : DEAL.TYPE : Type de Garantie

    LOCATE "DEAL.SUB.TYPE" IN D.FIELDS<1> SETTING POS.TYPE ELSE NULL
    DATA.TYPE = D.RANGE.AND.VALUE<POS.TYPE>
    OPERANDE.TYPE= D.LOGICAL.OPERANDS<POS.TYPE>
    CALL BZ.GET.ENQ.SELECT.STRING("DEAL.SUB.TYPE" ,OPERANDE.TYPE,DATA.TYPE,Y.QUERY)


* LOCATE CRITERIA : CUSTOMER : Client

    LOCATE "CUSTOMER" IN D.FIELDS<1> SETTING POS.CUS ELSE NULL
    DATA.CUS = D.RANGE.AND.VALUE<POS.CUS>
    OPERANDE.CUS= D.LOGICAL.OPERANDS<POS.CUS>
    CALL BZ.GET.ENQ.SELECT.STRING("CUSTOMER" ,OPERANDE.CUS,DATA.CUS,Y.QUERY)


* LOCATE CRITERIA : CURRENCY : Devise

    LOCATE "CURRENCY" IN D.FIELDS<1> SETTING POS.DEV ELSE NULL
    DATA.DEV = D.RANGE.AND.VALUE<POS.DEV>
    OPERANDE.DEV= D.LOGICAL.OPERANDS<POS.DEV>
    CALL BZ.GET.ENQ.SELECT.STRING("CURRENCY" ,OPERANDE.DEV,DATA.DEV,Y.QUERY)


* LOCATE CRITERIA : PRINCIPAL.AMOUNT : Montant de la Garantie

    LOCATE "PRINCIPAL.AMOUNT" IN D.FIELDS<1> SETTING POS.AMT ELSE NULL
    DATA.AMT = D.RANGE.AND.VALUE<POS.AMT>
    OPERANDE.AMT= D.LOGICAL.OPERANDS<POS.AMT>
    CALL BZ.GET.ENQ.SELECT.STRING("PRINCIPAL.AMOUNT" ,OPERANDE.AMT,DATA.AMT,Y.QUERY)

* LOCATE CRITERIA :  DEAL.DATE  : Date de Transaction

    LOCATE "DEAL.DATE" IN D.FIELDS<1> SETTING POS.DE.DATE ELSE NULL
    DATA.DE.DATE = D.RANGE.AND.VALUE<POS.DE.DATE>
    OPERANDE.DE.DATE= D.LOGICAL.OPERANDS<POS.DE.DATE>
    CALL BZ.GET.ENQ.SELECT.STRING("DEAL.DATE" ,OPERANDE.DE.DATE,DATA.DE.DATE,Y.QUERY)

* LOCATE CRITERIA : VALUE.DATE  : Date de Valeur

    LOCATE "VALUE.DATE" IN D.FIELDS<1> SETTING POS.VAL.DATE ELSE NULL
    DATA.VAL.DATE = D.RANGE.AND.VALUE<POS.VAL.DATE>
    OPERANDE.VAL.DATE= D.LOGICAL.OPERANDS<POS.VAL.DATE>
    CALL BZ.GET.ENQ.SELECT.STRING("VALUE.DATE" ,OPERANDE.VAL.DATE,DATA.VAL.DATE,Y.QUERY)


* LOCATE CRITERIA : MATURITY.DATE  : Date echeance

    LOCATE "MATURITY.DATE" IN D.FIELDS<1> SETTING POS.MAT.DATE ELSE NULL
    DATA.MAT.DATE = D.RANGE.AND.VALUE<POS.MAT.DATE>
    OPERANDE.MAT.DATE= D.LOGICAL.OPERANDS<POS.MAT.DATE>
    CALL BZ.GET.ENQ.SELECT.STRING("MATURITY.DATE" ,OPERANDE.MAT.DATE,DATA.MAT.DATE,Y.QUERY)


* LOCATE CRITERIA : BZ.AGENCE  : Agence

    LOCATE "BZ.AGENCE" IN D.FIELDS<1> SETTING POS.AG ELSE NULL
    DATA.AG = D.RANGE.AND.VALUE<POS.AG>
    OPERANDE.AG = D.LOGICAL.OPERANDS<POS.AG>
    CALL BZ.GET.ENQ.SELECT.STRING("BZ.AGENCE" ,OPERANDE.AG,DATA.AG,Y.QUERY)


* LOCATE CRITERIA : BEN.ADDRESS  : Adresse Beneficiaire

    LOCATE "BEN.ADDRESS" IN D.FIELDS<1> SETTING POS.AD.BEN ELSE NULL
    DATA.AD.BEN = D.RANGE.AND.VALUE<POS.AD.BEN>
    OPERANDE.AD.BEN = D.LOGICAL.OPERANDS<POS.AD.BEN>
    CALL BZ.GET.ENQ.SELECT.STRING("BEN.ADDRESS" ,OPERANDE.AD.BEN,DATA.AD.BEN,Y.QUERY)


* LOCATE CRITERIA : RECEIVING.BANK  : Banque Receptrice

    LOCATE "RECEIVING.BANK" IN D.FIELDS<1> SETTING POS.BK ELSE NULL
    DATA.BK = D.RANGE.AND.VALUE<POS.BK>
    OPERANDE.BK = D.LOGICAL.OPERANDS<POS.BK>
    CALL BZ.GET.ENQ.SELECT.STRING("RECEIVING.BANK" ,OPERANDE.BK,DATA.BK,Y.QUERY)


    IF Y.QUERY NE "" THEN
        SEL.COMMAND.1 = "SELECT ": FN.MD.DEAL : " WITH SL.REF.TRANCHE EQ '' AND DEAL.SUB.TYPE NE 'GTREC' 'GTFAC' 'MARES' 'MAART' 'MLGEN' AND INV.STATUS EQ '' AND STATUS NE 'LIQ' AND ((ALTERNATE.ID LIKE 'GE...') OR (ALTERNATE.ID LIKE 'CE...') OR (ALTERNATE.ID LIKE 'CG...')) AND " : Y.QUERY
    END ELSE
        SEL.COMMAND.1 = "SELECT ": FN.MD.DEAL : " WITH SL.REF.TRANCHE EQ '' AND DEAL.SUB.TYPE NE 'GTREC' 'GTFAC' 'MARES' 'MAART' 'MLGEN' AND INV.STATUS EQ '' AND STATUS NE 'LIQ' AND ((ALTERNATE.ID LIKE 'GE...') OR (ALTERNATE.ID LIKE 'CE...') OR (ALTERNATE.ID LIKE 'CG...'))"
    END
    SEL.LISR.1=''
	NO.OF.REC.1=''
	ERR1=''
	CALL EB.READLIST(SEL.COMMAND.1,SEL.LIST.1,'',NO.OF.REC.1,ERR1)


    IF Y.QUERY NE "" THEN
        SEL.COMMAND.2 = "SELECT ": FN.MD.DEAL.HIS : " WITH SL.REF.TRANCHE EQ '' AND DEAL.SUB.TYPE NE 'GTREC' 'GTFAC' 'MARES' 'MAART' 'MLGEN' AND INV.STATUS EQ '' AND STATUS NE 'LIQ' AND ((ALTERNATE.ID LIKE 'GE...') OR (ALTERNATE.ID LIKE 'CE...') OR (ALTERNATE.ID LIKE 'CG...')) AND " : Y.QUERY
    END ELSE
        SEL.COMMAND.2 = "SELECT ": FN.MD.DEAL.HIS : " WITH SL.REF.TRANCHE EQ '' AND DEAL.SUB.TYPE NE 'GTREC' 'GTFAC' 'MARES' 'MAART' 'MLGEN' AND INV.STATUS EQ '' AND STATUS NE 'LIQ' AND ((ALTERNATE.ID LIKE 'GE...') OR (ALTERNATE.ID LIKE 'CE...') OR (ALTERNATE.ID LIKE 'CG...'))"
    END
	 SEL.LISR.2=''
	NO.OF.REC.2=''
	ERR2=''
    CALL EB.READLIST(SEL.COMMAND.2,SEL.LIST.2,'',NO.OF.REC.2,ERR2)


*  SEL.COMMAND.2="SELECT ":FN.MD.DEAL.HIS
*   CALL EB.READLIST(SEL.COMMAND.2,SEL.LIST.2,'',NO.OF.REC.2,ERR2)

    IF SEL.LIST.1 EQ '' THEN
        SEL.LIST = SEL.LIST.2
    END
    IF SEL.LIST.2 EQ '' THEN
        SEL.LIST = SEL.LIST.1

    END ELSE

        SEL.LIST = SEL.LIST.1:@FM:SEL.LIST.2
    END

    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE

        NB = DCOUNT(SEL.LIST, @FM)
        FOR I = 1 TO NB
*		REMOVE @ID FROM SEL.LIST SETTING POS1
            REMOVE Y.ID FROM SEL.LIST SETTING POS1   ;*REPLACED @ID WITH Y.ID

            CALL F.READ(FN.MD.DEAL,Y.ID,R.MD.DEAL,F.MD.DEAL,ERR.MD.DEAL)
            IF ERR.MD.DEAL NE '' THEN

                CALL F.READ(FN.MD.DEAL.HIS,Y.ID,R.MD.DEAL.HIS,F.MD.DEAL.HIS,ERR.MD.DEAL.HIS)

                DEAL.SUB.TYPE = R.MD.DEAL.HIS<MD.DEA.DEAL.SUB.TYPE>
                CUSTOMER = R.MD.DEAL.HIS<MD.DEA.CUSTOMER>
                CURRENCY = R.MD.DEAL.HIS<MD.DEA.CURRENCY>
                PRINCIPAL.AMOUNT = R.MD.DEAL.HIS<MD.DEA.PRINCIPAL.AMOUNT>
                DEAL.DATE = R.MD.DEAL.HIS<MD.DEA.DEAL.DATE>
                VALUE.DATE = R.MD.DEAL.HIS<MD.DEA.VALUE.DATE>
                MATURITY.DATE = R.MD.DEAL.HIS<MD.DEA.MATURITY.DATE>
                BZ.AGENCE = R.MD.DEAL.HIS<MD.DEA.LOCAL.REF,POS1>
                BEN.ADDRESS = R.MD.DEAL.HIS<MD.DEA.BEN.ADDRESS>
                RECEIVING.BANK = R.MD.DEAL.HIS<MD.DEA.RECEIVING.BANK>
                SL.REF.TRANCHE = R.MD.DEAL.HIS<MD.DEA.SL.REF.TRANCHE>
                INV.STATUS = R.MD.DEAL.HIS<MD.DEA.INV.STATUS>
                STATUT = R.MD.DEAL.HIS<MD.DEA.STATUS>
                BENEF.CUST.1 = R.MD.DEAL.HIS<MD.DEA.BENEF.CUST.1>


            END ELSE

                DEAL.SUB.TYPE = R.MD.DEAL<MD.DEA.DEAL.SUB.TYPE>
                CUSTOMER = R.MD.DEAL<MD.DEA.CUSTOMER>
                CURRENCY = R.MD.DEAL<MD.DEA.CURRENCY>
                PRINCIPAL.AMOUNT = R.MD.DEAL<MD.DEA.PRINCIPAL.AMOUNT>
                DEAL.DATE = R.MD.DEAL<MD.DEA.DEAL.DATE>
                VALUE.DATE = R.MD.DEAL<MD.DEA.VALUE.DATE>
                MATURITY.DATE = R.MD.DEAL<MD.DEA.MATURITY.DATE>
                BZ.AGENCE = R.MD.DEAL<MD.DEA.LOCAL.REF,POS1>
                BEN.ADDRESS = R.MD.DEAL<MD.DEA.BEN.ADDRESS>
                RECEIVING.BANK = R.MD.DEAL<MD.DEA.RECEIVING.BANK>
                SL.REF.TRANCHE = R.MD.DEAL<MD.DEA.SL.REF.TRANCHE>
                INV.STATUS = R.MD.DEAL<MD.DEA.INV.STATUS>
                STATUT = R.MD.DEAL<MD.DEA.STATUS>
                BENEF.CUST.1 = R.MD.DEAL<MD.DEA.BENEF.CUST.1>


            END

            Y.LIST.TYPE<-1> = Y.ID:'*':DEAL.SUB.TYPE:'*':CUSTOMER:'*':CURRENCY:'*':PRINCIPAL.AMOUNT:'*':DEAL.DATE:'*':VALUE.DATE:'*':MATURITY.DATE:'*':BZ.AGENCE:'*':BEN.ADDRESS:'*':RECEIVING.BANK:'*':SL.REF.TRANCHE:'*':INV.STATUS:'*':STATUT:'*':BENEF.CUST.1

        NEXT I
    END

    RETURN

END
