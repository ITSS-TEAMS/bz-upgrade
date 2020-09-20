*-----------------------------------------------------------------------------
* <Rating>-61</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM
*** Converted GET.LOC.REF
*** VARIABLE INITIALIZED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATAIRE(TABLEAU)
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR



MAIN:

    GOSUB INIT
* $INSERT I_COMMON - Not Used anymore;
    GOSUB PROCESS
RETURN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;******
INIT:


    FN.CUS="F.CUSTOMER"
    F.CUS=""
    CUS.ERR=''
    R.CUS=''
    FN.AC="F.ACCOUNT"
    F.AC=""
    AC.ERR=''
    R.AC=''
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEB.SystemTables.getVFunction()OR"
    F.SEC=""
    SEC.ERR=''
    R.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusAGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTHEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)

RETURN
***************************************
PROCESS:



    SEL.COMMAND="SELECT ":FN.AC:" WITH CATEGORY GE 1000 AND CATEGORY LE 1999 AND ACCOUNT.OFFICER EQ " : AGENCE

    SEL.LEB.DataAccess.Opf=''
    NO.OFEB.DataAccess.OpfC=''
    ERR1=''
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        RETURN
    END FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEB.DataAccess.FRead           REMOVE Y.ACCOUNT FROM SEL.LIST SETTING POS
        WHILE Y.ACCOUNT :POS
            CALL F.READ(FN.AC,Y.ACCOUNT,R.AC,F.AC,AC.ERR)

            Y.CATEGORY=R.AEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer          EB.SystemTables.setE(R.AC<AC.CUSTOMER>)
tmp.ID.NEW.US.ERR = EB.SystemTables.getIdNew(US.ERR)
            CALL F.REB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.CUS,tmp.ID.NEW.US.ERR
EB.SystemTables.setIdNew(US.ERR, tmp.ID.NEW.US.ERR)

            IF CUEB.DataAccess.FWriteQ "" THEN
                Y.SECTOR=R.CUS<EB.CUS.SECTOR>
                CALL F.READ(FN.SEC,Y.SECTOR,R.SECTOR,F.SEC,SEC.ERR)

***     EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-61</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM
*** Converted GET.LOC.REF
*** VARIABLE INITIALIZED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATAIRE(TABLEAU)
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR



MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN
***************************************
INIT:


    FN.CUS="F.CUSTOMER"
    F.CUS=""
    CUS.ERR=''
    R.CUS=''
    FN.AC="F.ACCOUNT"
    F.AC=""
    AC.ERR=''
    R.AC=''
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEC="F.SECTOR"
    F.SEC=""
    SEC.ERR=''
    R.SECTOR=''

    AGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AG.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)

RETURN
***************************************
PROCESS:



    SEL.COMMAND="SELECT ":FN.AC:" WITH CATEGORY GE 1000 AND CATEGORY LE 1999 AND ACCOUNT.OFFICER EQ " : AGENCE

    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE Y.ACCOUNT FROM SEL.LIST SETTING POS
        WHILE Y.ACCOUNT :POS
            CALL F.READ(FN.AC,Y.ACCOUNT,R.AC,F.AC,AC.ERR)

            Y.CATEGORY=R.AC<AC.CATEGORY>

            Y.CUS=R.AC<AC.CUSTOMER>
            CALL F.READ(FN.CUS,Y.CUS,R.CUS,F.CUS,CUS.ERR)

            IF CUS.ERR EQ "" THEN
                Y.SECTOR=R.CUS<EB.CUS.SECTOR>
                CALL F.READ(FN.SEC,Y.SECTOR,R.SECTOR,F.SEC,SEC.ERR)

***        FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefT.LOC.REF("SECTOR","LIB.NAT.CLT",LIB.NAT.CLT.POS)
*** "ZITEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-61</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM
*** Converted GET.LOC.REF
*** VARIABLE INITIALIZED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AG.CHECK.SIGNATAIRE(TABLEAU)
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.EB.SIGNATORY.GROUP
    $INSERT I_F.SECTOR



MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN
***************************************
INIT:


    FN.CUS="F.CUSTOMER"
    F.CUS=""
    CUS.ERR=''
    R.CUS=''
    FN.AC="F.ACCOUNT"
    F.AC=""
    AC.ERR=''
    R.AC=''
    FN.SG="F.EB.SIGNATORY.GROUP"
    F.SG=""
    FN.SEC="F.SECTOR"
    F.SEC=""
    SEC.ERR=''
    R.SECTOR=''

    AGENCE=""

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AG.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AG.POS>
    END

    CHANGE @SM TO " " IN AGENCE

RETURN
***************************************
OPENFILES:
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SG,F.SG)
    CALL OPF(FN.SEC,F.SEC)

RETURN
***************************************
PROCESS:



    SEL.COMMAND="SELECT ":FN.AC:" WITH CATEGORY GE 1000 AND CATEGORY LE 1999 AND ACCOUNT.OFFICER EQ " : AGENCE

    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE Y.ACCOUNT FROM SEL.LIST SETTING POS
        WHILE Y.ACCOUNT :POS
            CALL F.READ(FN.AC,Y.ACCOUNT,R.AC,F.AC,AC.ERR)

            Y.CATEGORY=R.AC<AC.CATEGORY>

            Y.CUS=R.AC<AC.CUSTOMER>
            CALL F.READ(FN.CUS,Y.CUS,R.CUS,F.CUS,CUS.ERR)

            IF CUS.ERR EQ "" THEN
                Y.SECTOR=R.CUS<EB.CUS.SECTOR>
                CALL F.READ(FN.SEC,Y.SECTOR,R.SECTOR,F.SEC,SEC.ERR)

***                CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",LIB.NAT.CLT.POS)
*** "ZIT-UPG-R13-R19 S"
                Y.APP = "SECTOR"
                Y.FIELD = "LIB.NAT.CLT"
                Y.POS = ''
                CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
                LIB.NAT.CLT.POS = Y.POS<1,1>
*** "ZIT-UPG-R13-R19 E"
                Y.NAT.CLT = R.SECTOR<EB.SEC.LOCAL.REF,LIB.NAT.CLT.POS>

            END

            IF Y.NAT.CLT EQ "PM" THEN
                GOSUB VERIFY.SIGNATAIRES
            END


        REPEAT
    END
RETURN
*************************************
VERIFY.SIGNATAIRES:

    SEL.COMMAND.CUS="SELECT ":FN.SG:" WITH @ID LIKE '":Y.CUS:"...'"
    ERR1=''
    NO.OF.SIG=''
    SEL.LIST.CUS=''
    CALL EB.READLIST(SEL.COMMAND.CUS,SEL.LIST.CUS,'',NO.OF.SIG,ERR1)

    IF SEL.LIST.CUS EQ '' THEN
        TABLEAU<-1>=Y.ACCOUNT
    END

RETURN
END
