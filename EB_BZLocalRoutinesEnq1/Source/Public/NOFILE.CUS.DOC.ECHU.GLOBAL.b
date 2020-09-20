*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------*
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM 
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.CUS.DOC.ECHU.GLOBAL(TABLEAU)
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
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
* $INSERT I_COMMON - Not Used anymore;---------------------------------------------------------*
* $INSERT I_EQUATE - Not Used anymore;TCH=1
	
    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.USER='F.USER'
    F.USER=''
	
    PS='PS'
    CS='CS'
    CC='CRC'
    XN='XN'

    LOCAEB.SystemTables.getVFunction() D.FIELDS<1> EB.SystemTables.getVFunction().POS THEN
       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.AND.VALUE<ID.POS>
    END

    RETURN
*--FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus---------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
    V.DATE=TODAY
    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 "
	SEL.LIST=''
	NO.SEL=''
	SEL.ERR=''
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)
    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
		R.CUS=''
		ERR.CUS=''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)

        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
*ZIT-UPG-EB.DataAccess.Opf-R19 S
*       CEB.DataAccess.OpfERT VM TO FM IN TYPE.DOC
		CHANGE @VM TO @FM IN TYPE.DOC
*ZIT-UPG-R13-R19 E
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
*ZIT-UPG-R13-R19 S
*   FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTO FM IN DATE.EB.DataAccess.FRead	CHANGE @VM TO @FM IN DATE.FIN
*ZIT-UPG-R13-R19 E
        NB.DATE=DCOUNT(DATE.FIN,@FM)
        LOCATE PS IN TYPE.DOC SETTING POS.PS ELSE POS.PS='0'
        LOCATE CS IN TYPE.DOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerLSE POS.CS='0'
        LOCATE CC IN TYPE.DOC SETTING POS.CC ELSE POS.CC='0'
        LOCAEB.SystemTables.setE('0')

        IF POS.PS NEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer     TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.PS>
            V.DATEB.DataAccess.FWrite.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.PS>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END

      EB.SystemTables.setAf()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------*
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM 
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.CUS.DOC.ECHU.GLOBAL(TABLEAU)
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
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*
    RUNNING.UNDER.BATCH=1
	
    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.USER='F.USER'
    F.USER=''
	
    PS='PS'
    CS='CS'
    CC='CRC'
    XN='XN'

    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.CUS = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN
*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
    V.DATE=TODAY
    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 "
	SEL.LIST=''
	NO.SEL=''
	SEL.ERR=''
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)
    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
		R.CUS=''
		ERR.CUS=''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)

        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
*ZIT-UPG-R13-R19 S
*       CONVERT VM TO FM IN TYPE.DOC
		CHANGE @VM TO @FM IN TYPE.DOC
*ZIT-UPG-R13-R19 E
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
*ZIT-UPG-R13-R19 S
*       CONVERT VM TO FM IN DATE.FIN
		CHANGE @VM TO @FM IN DATE.FIN
*ZIT-UPG-R13-R19 E
        NB.DATE=DCOUNT(DATE.FIN,@FM)
        LOCATE PS IN TYPE.DOC SETTING POS.PS ELSE POS.PS='0'
        LOCATE CS IN TYPE.DOC SETTING POS.CS ELSE POS.CS='0'
        LOCATE CC IN TYPE.DOC SETTING POS.CC ELSE POS.CC='0'
        LOCATE XN IN TYPE.DOC SETTING POS.XN ELSE POS.XN='0'

        IF POS.PS NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.PS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.PS>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END

        EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------------*
*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM,VM converted to @FM,@VM 
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.CUS.DOC.ECHU.GLOBAL(TABLEAU)
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
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.USER

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS
    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*
    RUNNING.UNDER.BATCH=1
	
    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

    FN.CUS.AC="F.CUSTOMER.ACCOUNT"
    F.CUS.AC=""

    FN.USER='F.USER'
    F.USER=''
	
    PS='PS'
    CS='CS'
    CC='CRC'
    XN='XN'

    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.CUS = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN
*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.CUS.AC,F.CUS.AC)
    CALL OPF(FN.USER,F.USER)
    RETURN
*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*
    V.DATE=TODAY
    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 "
	SEL.LIST=''
	NO.SEL=''
	SEL.ERR=''
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)
    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
		R.CUS=''
		ERR.CUS=''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)

        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
*ZIT-UPG-R13-R19 S
*       CONVERT VM TO FM IN TYPE.DOC
		CHANGE @VM TO @FM IN TYPE.DOC
*ZIT-UPG-R13-R19 E
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
*ZIT-UPG-R13-R19 S
*       CONVERT VM TO FM IN DATE.FIN
		CHANGE @VM TO @FM IN DATE.FIN
*ZIT-UPG-R13-R19 E
        NB.DATE=DCOUNT(DATE.FIN,@FM)
        LOCATE PS IN TYPE.DOC SETTING POS.PS ELSE POS.PS='0'
        LOCATE CS IN TYPE.DOC SETTING POS.CS ELSE POS.CS='0'
        LOCATE CC IN TYPE.DOC SETTING POS.CC ELSE POS.CC='0'
        LOCATE XN IN TYPE.DOC SETTING POS.XN ELSE POS.XN='0'

        IF POS.PS NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.PS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.PS>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END

        END
        IF POS.CS NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.CS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.CS>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END
        END
        IF POS.CC NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.CC>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.CC>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END
        END
        IF POS.XN NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.XN>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.XN>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
            END
        END
    REPEAT
*---------------------------------------------------------------*
GET.COMPTE:
    R.CUS.AC=''
	E.CUS.AC=''
    CALL F.READ(FN.CUS.AC,ID.CUS,R.CUS.AC,F.CUS.AC,E.CUS.AC)
    IF R.CUS.AC THEN
        LOOP
*ZIT-UPG-R13-R19 S
*           READNEXT AC.ID FROM R.CUS.AC ELSE BREAK
			REMOVE AC.ID FROM R.CUS.AC SETTING POS 
        WHILE  AC.ID:POS
*ZIT-UPG-R13-R19 E
            TABLEAU<-1>=ID.CUS:"*":NOM.CLIENT:"*":TYPE.IDENT:"*":V.DATE.FIN:"*":AC.ID
        REPEAT
    END
    RETURN
*--------------------------------------------------------------------------------*
    RETURN
END
