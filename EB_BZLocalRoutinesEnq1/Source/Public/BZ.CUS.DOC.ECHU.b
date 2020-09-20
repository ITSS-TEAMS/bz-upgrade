*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Changed FM,VM to @FM,@VM
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUS.DOC.ECHU(TABLEAU)
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
    GOSUB GET.COMPTE
    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
* $INSERT I_EQUATE - Not Used anymore;---------------------------------------------------------*
    RUNNING.UNDER.BATCH=1
	
    FN.CUS = 'F.CUSTOMER'
    F.CUS = ''

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;NT"
    F.CUS.AC=""

    FN.USER='F.USER'
    F.USER=''
    PS='PS'
    CS='CS'
    CC='CRC'
    XN='XN'
    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        EB.SystemTables.getVFunction().RANGE.AND.VAEB.SystemTables.getVFunction()>
    END

    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-----*
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
*CALL CDT('',V.DATE,'+365C')
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 AND ACCOUNT.OFFICER EQ " : DEPART.CODE
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)
        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        CHANGE @VM TO @FM IN TYPE.DOC
        NEB.DataAccess.OpfOC=DCOUNT(TYPE.DOC,@FM)
        DEB.DataAccess.Opf.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
        CHANGE @VM TO @FM IN DATE.FIN
        NB.DATE=DCOUNT(DATE.FIN,@FM)
        LOCATE PS IN TYPE.DOC SETTING POS.PS ELSE POS.PS='0'
        LOCATE CS IN TYPE.DOC SETTING POS.CS ELSE POS.CS='0'
        LOCATE CC EB.SystemTables.getRNew()PFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefOS.CC ELSE POS.CC='0'
        LOCATE XN IN TYPE.DOC SETTING POS.XN ELSE POS.XN='0'

       EB.DataAccess.FReadS.PS NE '0' THEN
            TYPE.IDENT=R.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.PS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.PS>
            IF V.DATE.FIN NEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer LT TODAY THEN
                GOSUB GET.COMPTE
            EB.SystemTables.setE()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Changed FM,VM to @FM,@VM
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUS.DOC.ECHU(TABLEAU)
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
    GOSUB GET.COMPTE
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
*CALL CDT('',V.DATE,'+365C')
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 AND ACCOUNT.OFFICER EQ " : DEPART.CODE
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)
        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        CHANGE @VM TO @FM IN TYPE.DOC
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
        CHANGE @VM TO @FM IN DATE.FIN
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
       EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTHEN
            TYPE.EB.DataAccess.FWrite.CUS<EB.CUS.LEGAL.DOC.NAME><1,POS.CS>
            V.DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE><1,POS.CS>
            IF V.DATE.FIN NE "" AND V.DATE.FIN LT TODAY THEN
                GOSUB GET.COMPTE
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Changed FM,VM to @FM,@VM
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUS.DOC.ECHU(TABLEAU)
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
    GOSUB GET.COMPTE
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
*CALL CDT('',V.DATE,'+365C')
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 AND ACCOUNT.OFFICER EQ " : DEPART.CODE
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)
        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        CHANGE @VM TO @FM IN TYPE.DOC
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
        CHANGE @VM TO @FM IN DATE.FIN
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
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.SystemTables.setE()*-----------------------------------------------------------------------------*
* <Rating>-41</Rating>
*-----------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Changed FM,VM to @FM,@VM
*               :READNEXT converted to LOOP WHILE REPEAT  
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CUS.DOC.ECHU(TABLEAU)
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
    GOSUB GET.COMPTE
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
*CALL CDT('',V.DATE,'+365C')
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    SEL.CUS = "SELECT ":FN.CUS:" WITH LEGAL.EXP.DATE LT ": V.DATE : " AND LEGAL.EXP.DATE GE 20100101 AND ACCOUNT.OFFICER EQ " : DEPART.CODE
    CALL EB.READLIST(SEL.CUS,SEL.LIST,'',NO.SEL,SEL.ERR)

    LOOP
        REMOVE ID.CUS FROM SEL.LIST SETTING POS UNTIL ID.CUS = ''
        CALL F.READ(FN.CUS,ID.CUS,R.CUS,F.CUS,ERR.CUS)
        NOM.CLIENT=R.CUS<EB.CUS.NAME.1>
        TYPE.DOC=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        CHANGE @VM TO @FM IN TYPE.DOC
        NB.DOC=DCOUNT(TYPE.DOC,@FM)
        DATE.FIN=R.CUS<EB.CUS.LEGAL.EXP.DATE>
        CHANGE @VM TO @FM IN DATE.FIN
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
