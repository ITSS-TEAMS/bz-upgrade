*-----------------------------------------------------------------------------
* <Rating>-43</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DEC.SED.PRETS
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
* declarer le fichier 600010
* pour les categories 21075 21076 21078 21079
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
*
*
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19-CHAR TO CHARX;ABORT TO TRANSACTION.ABORT;STOP TO FATAL ERROR
* ------------------------------------------------------------------------
* <region name= Inserts>

	$INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;ONEY.MARKET

* </region>
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;-----------------------------------------

* ------------------------------------------------------------------------
* <region name= MAIN>

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

* ------------------------------------------------------------------------
* </region>

* -------------------------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
* <region name= INIT>

INIT:
    FN.MM="FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    F.MM=""
    MM.REC = ""
    MM.ERR = ""

    FN.CODE='F.BC.SORT.CODE'
    F.CODE=''
    CODE.REC=''
    CODE.ERROR=''

    V.RET.CHARIOT = CHARX(13):CHARX(10)
    LIGNE.FINALE = ''

    Y.REP.IN = 'DEC.SED'
    Y.FILE.NAME = 'PRET':TODAY:".txt"

    DIRFILE="./":Y.REP.IN:"/":Y.FILE.NAME
    OPENSEQ DIRFILE TO FILE
    ELSE CREATE FILE ELSE CALL TRANSACTION.ABORT  ;*ABORT

    RETURN

* ------------------------------------------------------------------------
* </region>
* -------EB.DataAccess.Opf--------------------------------------------------------------
* <regionEB.DataAccess.Opfme= OPENFILE>

OPENFILES:
    CALL OPF(FN.MM,F.MM)
    RETURN


* -------EB.DataAcceFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef----------------------------------------------------
* </region>
* ------------------------------------------------------------------------

* <region name= PROCESS>
PREB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerarEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-43</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DEC.SED.PRETS
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
* declarer le fichier 600010
* pour les categories 21075 21076 21078 21079
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
*
*
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19-CHAR TO CHARX;ABORT TO TRANSACTION.ABORT;STOP TO FATAL ERROR
* ------------------------------------------------------------------------
* <region name= Inserts>

	$INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.MM.MONEY.MARKET

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
    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    MM.REC = ""
    MM.ERR = ""

    FN.CODE='F.BC.SORT.CODE'
    F.CODE=''
    CODE.REC=''
    CODE.ERROR=''

    V.RET.CHARIOT = CHARX(13):CHARX(10)
    LIGNE.FINALE = ''

    Y.REP.IN = 'DEC.SED'
    Y.FILE.NAME = 'PRET':TODAY:".txt"

    DIRFILE="./":Y.REP.IN:"/":Y.FILE.NAME
    OPENSEQ DIRFILE TO FILE
    ELSE CREATE FILE ELSE CALL TRANSACTION.ABORT  ;*ABORT

    RETURN

* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------
* <region name= OPENFILE>

OPENFILES:
    CALL OPF(FN.MM,F.MM)
    RETURN


* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------

* <region name= PROCESS>
PROCESS:

*** preparer l'entete

    NDECL.ENETE = EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTE=FEB.DataAccess.FWriteL.ENETE,"R%7")
    KTENR.ENETE = '1'
    KTENR.ENETE = FMT(KTENR.ENETE,"R%3")
    KTE = '600010'
    DATEEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-43</Rating>
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DEC.SED.PRETS
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
* declarer le fichier 600010
* pour les categories 21075 21076 21078 21079
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
*
*
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19-CHAR TO CHARX;ABORT TO TRANSACTION.ABORT;STOP TO FATAL ERROR
* ------------------------------------------------------------------------
* <region name= Inserts>

	$INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.MM.MONEY.MARKET

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
    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    MM.REC = ""
    MM.ERR = ""

    FN.CODE='F.BC.SORT.CODE'
    F.CODE=''
    CODE.REC=''
    CODE.ERROR=''

    V.RET.CHARIOT = CHARX(13):CHARX(10)
    LIGNE.FINALE = ''

    Y.REP.IN = 'DEC.SED'
    Y.FILE.NAME = 'PRET':TODAY:".txt"

    DIRFILE="./":Y.REP.IN:"/":Y.FILE.NAME
    OPENSEQ DIRFILE TO FILE
    ELSE CREATE FILE ELSE CALL TRANSACTION.ABORT  ;*ABORT

    RETURN

* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------
* <region name= OPENFILE>

OPENFILES:
    CALL OPF(FN.MM,F.MM)
    RETURN


* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------

* <region name= PROCESS>
PROCESS:

*** preparer l'entete

    NDECL.ENETE = '1'
    NDECL.ENETE=FMT(NDECL.ENETE,"R%7")
    KTENR.ENETE = '1'
    KTENR.ENETE = FMT(KTENR.ENETE,"R%3")
    KTE = '600010'
    DATE.ENFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef  CODEEB.SystemTables.setE('25')
    KMDECL = '1'
    NAT.DECL = '     '

    ENTETE = NDECL.ENETE:KTENR.ENETE:KTE:DATE.ENVOI:CODE.BQ:KMDECL:NAT.DECL

**** Preparer les lignes
	SEL.LIST.MM=''
	TOTAL.COUNT.MM=''
	CUST.ERROR=''
	SEL.LIST=''
	TOTAL.COUNT=''
	CODE.ERROR=''
    CMD.MM = "SELECT ":FN.MM:" WITH CATEGORY EQ 21075 21076 21078 21079 AND DEAL.DATE EQ ":TODAY:" AND CURRENCY EQ TND"
    CALL EB.READLIST(CMD.MM, SEL.LIST.MM,'', TOTAL.COUNT.MM, CUST.ERROR)
    LIGNE = ''
    FOR I =1 TO TOTAL.COUNT.MM

        CALL F.READ(FN.MM,SEL.LIST.MM<I>,MM.REC,F.MM,MM.ERR)
        CURRENCY = MM.REC<MM.CURRENCY>


        CUSTOMER.ID = MM.REC<MM.CUSTOMER.ID>

        CMD.CODE  = "SELECT ":FN.CODE:" WITH CUSTOMER.NO EQ ":CUSTOMER.ID
        CALL EB.READLIST(CMD.CODE, SEL.LIST,'', TOTAL.COUNT, CODE.ERROR)

        NDECL.LIGNE =  NDECL.ENETE
        KTENR.LIGNE = '2'
        KTENR.LIGNE = FMT(KTENR.LIGNE,"R%3")
        CODE.OPER = 'A'
        CODE.BQ = SEL.LIST<1>
        NUM.OP = '01'
        MONTANT = MM.REC<MM.PRINCIPAL>
        AMOUNT = FIELD(MONTANT,'.',1)
        AMOUNT = FMT(AMOUNT,"R%15")
        MATURITY.DATE = MM.REC<MM.MATURITY.DATE>
        VALUE.DATE = MM.REC<MM.VALUE.DATE>

        CALL CDD ('',VALUE.DATE,MATURITY.DATE,NBR.DUREE)

        DUREE = NBR.DUREE
        DUREE = FMT(DUREE,"R%4")

        TAUX = MM.REC<MM.INTEREST.RATE>
        TAUX =TAUX*100
        TAUX = FMT(TAUX,"R%7")

        DATE.VALEUR = VALUE.DATE
        DATE.ECH = MATURITY.DATE

        CALL CDT('',MATURITY.DATE,'+1C')
        DATE.REGL = MATURITY.DATE

        LIGNE = NDECL.LIGNE:KTENR.LIGNE:KTENR.LIGNE:CODE.OPER:CODE.BQ:NUM.OP:AMOUNT:DUREE:TAUX:DATE.VALEUR:DATE.ECH:DATE.REGL
        LIGNES = LIGNES:LIGNE:V.RET.CHARIOT
    NEXT I

*** preparer la fin

    NDECL.FIN = NDECL.ENETE
    KTENR.FIN  = '999'
    V_CPT1 =  TOTAL.COUNT.MM
    V_CPT1 = FMT(V_CPT1,"R%14")
    V_CPT2 =  ''
    V_CPT3 =''

    FIN = NDECL.FIN:KTENR.FIN:V_CPT1:V_CPT2:V_CPT3

***preparer entete plus ligne plus fin

    LINE = ENTETE:V.RET.CHARIOT:LIGNES:FIN

    IF LINE NE '' THEN
        WRITESEQ LINE TO FILE ELSE      ;*STOP
*ZIT-UPG-R13-R19 S 
		Y.MESSAGE="UNABLE TO WRITE THE FILE ":DIRFILE
		Y.MESSAGE.INFO=''
        Y.MESSAGE.INFO<1> =''
        Y.MESSAGE.INFO<2> = ''
		Y.MESSAGE.INFO<3> =''
        Y.MESSAGE.INFO<4> = Y.MESSAGE
        Y.MESSAGE.INFO<5> = 'NO'
		Y.MESSAGE.INFO<6> = ''
        Y.MESSAGE.INFO<7> = ''

		CALL FATAL.ERROR(Y.MESSAGE.INFO)
		END
*ZIT-UPG-R13-R19 E 		
    END

    RETURN
* ------------------------------------------------------------------------
* </region>
* ------------------------------------------------------------------------
END
