*-----------------------------------------------------------------------------
* <Rating>311</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.SED.CONTRE.VAL.CONV(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.BZ.SED.SOLDE.CONTRE.VAL.2
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:


    FN.CRT.VAL.2="F.BZ.SED.SOLDE.CONTRE.VAL.2"
    F.CRT.VAL.2=""
    R.VAL=''
    YERR=''
    FN.CUS="F.CUSTOMER"
    F.CUS=""
    R.CUS=''
    CUS.ERR=''
    FN.SEC= 'F.SECTOR'
    F.SEC=''
    R.SEC=''
    ERR.EB.SystemTables.getVFunction()  MOIS=""
    
    SED.IDS=''
    SED.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.ERROR=''
RETURN
OPENFILES:

    CALL OPF(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT.VAL.2)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.SEC,F.SEC)

    LOCATE "MOIS" IN D.FIELDS<1> SETTING MOIS.POS THEN
        MOIS = D.RANGE.AND.VALUE<MOIS.POS>
    END
RETURN
PROCESS:

    CONDITION=""

    IF MOIS THEN
        CONDITION:=" MOIS EQ ":MOIS
    END

    IF CONDITION THEN
        SQL.SED = "SELECT " : FN.CRT.VAL.2 :" WITH ":CONDITION
        CALL EB.READLIST(SQL.SED , SED.IDS,'',SED.COUNT,SED.ERROR)

        IEB.DataAccess.OpfED.IDS EQ '' THEN
         EB.DataAccess.OpfRETURN
        END ELSE
            LOOP
                REMOVE REF.ID FROM SED.IDS SETTING POS
            WHILE REF.ID :POS
                CAEB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef2,REF.ID,R.VAL,F.CRT.VAL.2,YERR)
                GOSUB GET.SED.IDS

       EB.DataAccess.FReadEPEAT
        END
    END

GET.SED.IDS:
    IF R.VALEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyertE()*-----------------------------------------------------------------------------
* <Rating>311</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.SED.CONTRE.VAL.CONV(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.BZ.SED.SOLDE.CONTRE.VAL.2
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:


    FN.CRT.VAL.2="F.BZ.SED.SOLDE.CONTRE.VAL.2"
    F.CRT.VAL.2=""
    R.VAL=''
    YERR=''
    FN.CUS="F.CUSTOMER"
    F.CUS=""
    R.CUS=''
    CUS.ERR=''
    FN.SEC= 'F.SECTOR'
    F.SEC=''
    R.SEC=''
    ERR.SEC=''
    MOIS=""
    
    SED.IDS=''
    SED.COUNT=''
    SED.ERROR=''
RETURN
OPENFILES:

    CALL OPF(FN.CRT.VAL.2,F.CRT.VAL.2)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.SEC,F.SEC)

    LOCATE "MOIS" IN D.FIELDS<1> SETTING MOIS.POS THEN
        MOIS = D.RANGE.AND.VALUE<MOIS.POS>
    END
RETURN
PROCESS:

    CONDITION=""

    IF MOIS THEN
        CONDITION:=" MOIS EQ ":MOIS
    END

    IF CONDITION THEN
        SQL.SED = "SELECT " : FN.CRT.VAL.2 :" WITH ":CONDITION
        CALL EB.READLIST(SQL.SED , SED.IDS,'',SED.COUNT,SED.ERROR)

        IF SED.IDS EQ '' THEN
            RETURN
        END ELSE
            LOOP
                REMOVE REF.ID FROM SED.IDS SETTING POS
            WHILE REF.ID :POS
                CALL F.READ(FN.CRT.VAL.2,REF.ID,R.VAL,F.CRT.VAL.2,YERR)
                GOSUB GET.SED.IDS

            REPEAT
        END
    END

GET.SED.IDS:
    IF R.VAL THEN
        CUSTOMER.ID=R.VAL<CTR.VAL2.CUSTOMER>
tmp.ID.NEW..CUS.ERR = EB.SystemTables.getIdNew(,CUS.ERR)
        CALL F.READ(EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer,R.CUtmp.ID.NEW..CUS.ERR
EB.SystemTables.setIdNew(,CUS.ERR, tmp.ID.NEW..CUS.ERR)
        CUS.NAME=R.CUS<EB.CUS.SHORT.NAME>
        Y.DATE.OPEB.DataAccess.FWrite = R.VAL<CTR.VAL2.DATE.OPERATION>
        Y.SOLDE.OPERATION = R.VAL<CTR.VAL2.SOLDE.OPERATION>

        Y.SECTOR=R.CUS<EB.CUS.SECTOR>

      EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>311</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.SED.CONTRE.VAL.CONV(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.BZ.SED.SOLDE.CONTRE.VAL.2
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:


    FN.CRT.VAL.2="F.BZ.SED.SOLDE.CONTRE.VAL.2"
    F.CRT.VAL.2=""
    R.VAL=''
    YERR=''
    FN.CUS="F.CUSTOMER"
    F.CUS=""
    R.CUS=''
    CUS.ERR=''
    FN.SEC= 'F.SECTOR'
    F.SEC=''
    R.SEC=''
    ERR.SEC=''
    MOIS=""
    
    SED.IDS=''
    SED.COUNT=''
    SED.ERROR=''
RETURN
OPENFILES:

    CALL OPF(FN.CRT.VAL.2,F.CRT.VAL.2)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.SEC,F.SEC)

    LOCATE "MOIS" IN D.FIELDS<1> SETTING MOIS.POS THEN
        MOIS = D.RANGE.AND.VALUE<MOIS.POS>
    END
RETURN
PROCESS:

    CONDITION=""

    IF MOIS THEN
        CONDITION:=" MOIS EQ ":MOIS
    END

    IF CONDITION THEN
        SQL.SED = "SELECT " : FN.CRT.VAL.2 :" WITH ":CONDITION
        CALL EB.READLIST(SQL.SED , SED.IDS,'',SED.COUNT,SED.ERROR)

        IF SED.IDS EQ '' THEN
            RETURN
        END ELSE
            LOOP
                REMOVE REF.ID FROM SED.IDS SETTING POS
            WHILE REF.ID :POS
                CALL F.READ(FN.CRT.VAL.2,REF.ID,R.VAL,F.CRT.VAL.2,YERR)
                GOSUB GET.SED.IDS

            REPEAT
        END
    END

GET.SED.IDS:
    IF R.VAL THEN
        CUSTOMER.ID=R.VAL<CTR.VAL2.CUSTOMER>
        CALL F.READ(FN.CUS,CUSTOMER.ID,R.CUS,F.CUS,CUS.ERR)
        CUS.NAME=R.CUS<EB.CUS.SHORT.NAME>
        Y.DATE.OPERATION = R.VAL<CTR.VAL2.DATE.OPERATION>
        Y.SOLDE.OPERATION = R.VAL<CTR.VAL2.SOLDE.OPERATION>

        Y.SECTOR=R.CUS<EB.CUS.SECTOR>

        EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>311</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
*-------------------------------------------------------------------------
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.SED.CONTRE.VAL.CONV(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------------------
* ------------------------------------------------------------------------
* <region name= Inserts>

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.BZ.SED.SOLDE.CONTRE.VAL.2
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
RETURN

INIT:


    FN.CRT.VAL.2="F.BZ.SED.SOLDE.CONTRE.VAL.2"
    F.CRT.VAL.2=""
    R.VAL=''
    YERR=''
    FN.CUS="F.CUSTOMER"
    F.CUS=""
    R.CUS=''
    CUS.ERR=''
    FN.SEC= 'F.SECTOR'
    F.SEC=''
    R.SEC=''
    ERR.SEC=''
    MOIS=""
    
    SED.IDS=''
    SED.COUNT=''
    SED.ERROR=''
RETURN
OPENFILES:

    CALL OPF(FN.CRT.VAL.2,F.CRT.VAL.2)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.SEC,F.SEC)

    LOCATE "MOIS" IN D.FIELDS<1> SETTING MOIS.POS THEN
        MOIS = D.RANGE.AND.VALUE<MOIS.POS>
    END
RETURN
PROCESS:

    CONDITION=""

    IF MOIS THEN
        CONDITION:=" MOIS EQ ":MOIS
    END

    IF CONDITION THEN
        SQL.SED = "SELECT " : FN.CRT.VAL.2 :" WITH ":CONDITION
        CALL EB.READLIST(SQL.SED , SED.IDS,'',SED.COUNT,SED.ERROR)

        IF SED.IDS EQ '' THEN
            RETURN
        END ELSE
            LOOP
                REMOVE REF.ID FROM SED.IDS SETTING POS
            WHILE REF.ID :POS
                CALL F.READ(FN.CRT.VAL.2,REF.ID,R.VAL,F.CRT.VAL.2,YERR)
                GOSUB GET.SED.IDS

            REPEAT
        END
    END

GET.SED.IDS:
    IF R.VAL THEN
        CUSTOMER.ID=R.VAL<CTR.VAL2.CUSTOMER>
        CALL F.READ(FN.CUS,CUSTOMER.ID,R.CUS,F.CUS,CUS.ERR)
        CUS.NAME=R.CUS<EB.CUS.SHORT.NAME>
        Y.DATE.OPERATION = R.VAL<CTR.VAL2.DATE.OPERATION>
        Y.SOLDE.OPERATION = R.VAL<CTR.VAL2.SOLDE.OPERATION>

        Y.SECTOR=R.CUS<EB.CUS.SECTOR>

        CALL F.READ(FN.SEC,Y.SECTOR,R.SEC,F.SEC,ERR.SEC)
*     CALL GET.LOC.REF('SECTOR','LIB.NAT.CLT',POS.LIB.NAT.CLT)
* ZIT-UPG-R13-R19/S
        Y.APP = "SECTOR"
        Y.FIELD = "LIB.NAT.CLT"
        Y.POS = ''
        CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
        POS.LIB.NAT.CLT = Y.POS<1,1>
* ZIT-UPG-R13-R19/E
    
        Y.CUST_TYPE= R.SEC<EB.SEC.LOCAL.REF,POS.LIB.NAT.CLT>
        Y.LEGAL.ID.DOCS=R.CUS<EB.CUS.LEGAL.DOC.NAME>
        NBR.LEGAL.DOCS=DCOUNT(Y.LEGAL.ID.DOCS,@VM)
        Y.DOCS.ID=""
        FOR  COUNTER=1 TO NBR.LEGAL.DOCS

            Y.DOCS.NAME=Y.LEGAL.ID.DOCS<1,COUNTER>
            IF Y.CUST_TYPE EQ "PM" OR Y.CUST_TYPE EQ "PF" THEN
                IF Y.DOCS.NAME EQ "MF" THEN
                    Y.DOCS.ID=R.CUS<EB.CUS.LEGAL.ID><1,COUNTER>
                END
            END
            IF Y.CUST_TYPE EQ "PP" THEN

                IF Y.DOCS.NAME EQ "CIN" THEN
                    Y.DOCS.ID=R.CUS<EB.CUS.LEGAL.ID><1,COUNTER>
                END
            END

        NEXT COUNTER

        DATE.1=R.VAL<CTR.VAL2.DATE.OPERATION,1>
        DATE.2=R.VAL<CTR.VAL2.DATE.OPERATION,2>
        DATE.3=R.VAL<CTR.VAL2.DATE.OPERATION,3>
        DATE.4=R.VAL<CTR.VAL2.DATE.OPERATION,4>
        DATE.5=R.VAL<CTR.VAL2.DATE.OPERATION,5>
        DATE.6=R.VAL<CTR.VAL2.DATE.OPERATION,6>
        DATE.7=R.VAL<CTR.VAL2.DATE.OPERATION,7>
        DATE.8=R.VAL<CTR.VAL2.DATE.OPERATION,8>
        DATE.9=R.VAL<CTR.VAL2.DATE.OPERATION,9>
        DATE.10=R.VAL<CTR.VAL2.DATE.OPERATION,10>
        DATE.11=R.VAL<CTR.VAL2.DATE.OPERATION,11>
        DATE.12=R.VAL<CTR.VAL2.DATE.OPERATION,12>
        DATE.13=R.VAL<CTR.VAL2.DATE.OPERATION,13>
        DATE.14=R.VAL<CTR.VAL2.DATE.OPERATION,14>
        DATE.15=R.VAL<CTR.VAL2.DATE.OPERATION,15>
        DATE.16=R.VAL<CTR.VAL2.DATE.OPERATION,16>
        DATE.17=R.VAL<CTR.VAL2.DATE.OPERATION,17>
        DATE.18=R.VAL<CTR.VAL2.DATE.OPERATION,18>
        DATE.19=R.VAL<CTR.VAL2.DATE.OPERATION,19>
        DATE.20=R.VAL<CTR.VAL2.DATE.OPERATION,20>
        DATE.21=R.VAL<CTR.VAL2.DATE.OPERATION,21>
        DATE.22=R.VAL<CTR.VAL2.DATE.OPERATION,22>
        DATE.23=R.VAL<CTR.VAL2.DATE.OPERATION,23>
        DATE.24=R.VAL<CTR.VAL2.DATE.OPERATION,24>
        DATE.25=R.VAL<CTR.VAL2.DATE.OPERATION,25>
        DATE.26=R.VAL<CTR.VAL2.DATE.OPERATION,26>
        DATE.27=R.VAL<CTR.VAL2.DATE.OPERATION,27>
        DATE.28=R.VAL<CTR.VAL2.DATE.OPERATION,28>
        DATE.29=R.VAL<CTR.VAL2.DATE.OPERATION,29>
        DATE.30=R.VAL<CTR.VAL2.DATE.OPERATION,30>
        DATE.31=R.VAL<CTR.VAL2.DATE.OPERATION,31>
        SOLDE.OP.1=R.VAL<CTR.VAL2.SOLDE.OPERATION,1>
        SOLDE.OP.2=R.VAL<CTR.VAL2.SOLDE.OPERATION,2>
        SOLDE.OP.3=R.VAL<CTR.VAL2.SOLDE.OPERATION,3>
        SOLDE.OP.4=R.VAL<CTR.VAL2.SOLDE.OPERATION,4>
        SOLDE.OP.5=R.VAL<CTR.VAL2.SOLDE.OPERATION,5>
        SOLDE.OP.6=R.VAL<CTR.VAL2.SOLDE.OPERATION,6>
        SOLDE.OP.7=R.VAL<CTR.VAL2.SOLDE.OPERATION,7>
        SOLDE.OP.8=R.VAL<CTR.VAL2.SOLDE.OPERATION,8>
        SOLDE.OP.9=R.VAL<CTR.VAL2.SOLDE.OPERATION,9>
        SOLDE.OP.10=R.VAL<CTR.VAL2.SOLDE.OPERATION,10>
        SOLDE.OP.11=R.VAL<CTR.VAL2.SOLDE.OPERATION,11>
        SOLDE.OP.12=R.VAL<CTR.VAL2.SOLDE.OPERATION,12>
        SOLDE.OP.13=R.VAL<CTR.VAL2.SOLDE.OPERATION,13>
        SOLDE.OP.14=R.VAL<CTR.VAL2.SOLDE.OPERATION,14>
        SOLDE.OP.15=R.VAL<CTR.VAL2.SOLDE.OPERATION,15>
        SOLDE.OP.16=R.VAL<CTR.VAL2.SOLDE.OPERATION,16>
        SOLDE.OP.17=R.VAL<CTR.VAL2.SOLDE.OPERATION,17>
        SOLDE.OP.18=R.VAL<CTR.VAL2.SOLDE.OPERATION,18>
        SOLDE.OP.19=R.VAL<CTR.VAL2.SOLDE.OPERATION,19>
        SOLDE.OP.20=R.VAL<CTR.VAL2.SOLDE.OPERATION,20>
        SOLDE.OP.21=R.VAL<CTR.VAL2.SOLDE.OPERATION,21>
        SOLDE.OP.22=R.VAL<CTR.VAL2.SOLDE.OPERATION,22>
        SOLDE.OP.23=R.VAL<CTR.VAL2.SOLDE.OPERATION,23>
        SOLDE.OP.24=R.VAL<CTR.VAL2.SOLDE.OPERATION,24>
        SOLDE.OP.25=R.VAL<CTR.VAL2.SOLDE.OPERATION,25>
        SOLDE.OP.26=R.VAL<CTR.VAL2.SOLDE.OPERATION,26>
        SOLDE.OP.27=R.VAL<CTR.VAL2.SOLDE.OPERATION,27>
        SOLDE.OP.28=R.VAL<CTR.VAL2.SOLDE.OPERATION,28>
        SOLDE.OP.29=R.VAL<CTR.VAL2.SOLDE.OPERATION,29>
        SOLDE.OP.30=R.VAL<CTR.VAL2.SOLDE.OPERATION,30>
        SOLDE.OP.31=R.VAL<CTR.VAL2.SOLDE.OPERATION,31>

        TABLEAU<-1>=REF.ID:'*':CUSTOMER.ID:'*':CUS.NAME:'*':Y.DOCS.ID:'*':DATE.1:'*':SOLDE.OP.1:'*':DATE.2:'*':SOLDE.OP.2:'*':DATE.3:'*':SOLDE.OP.3:'*':DATE.4:'*':SOLDE.OP.4:'*':DATE.5:'*':SOLDE.OP.5:'*':DATE.6:'*':SOLDE.OP.6:'*':DATE.7:'*':SOLDE.OP.7:'*':DATE.8:'*':SOLDE.OP.8:'*':DATE.9:'*':SOLDE.OP.9:'*':DATE.10:'*':SOLDE.OP.10:'*':DATE.11:'*':SOLDE.OP.11:'*':DATE.12:'*':SOLDE.OP.12:'*':DATE.13:'*':SOLDE.OP.13:'*':DATE.14:'*':SOLDE.OP.14:'*':DATE.15:'*':SOLDE.OP.15:'*':DATE.16:'*':SOLDE.OP.16:'*':DATE.17:'*':SOLDE.OP.17:'*':DATE.18:'*':SOLDE.OP.18:'*':DATE.19:'*':SOLDE.OP.19:'*':DATE.20:'*':SOLDE.OP.20:'*':DATE.21:'*':SOLDE.OP.21:'*':DATE.22:'*':SOLDE.OP.22:'*':DATE.23:'*':SOLDE.OP.23:'*':DATE.24:'*':SOLDE.OP.24:'*':DATE.25:'*':SOLDE.OP.25:'*':DATE.26:'*':SOLDE.OP.26:'*':DATE.27:'*':SOLDE.OP.27:'*':DATE.28:'*':SOLDE.OP.28:'*':DATE.29:'*':SOLDE.OP.29:'*':DATE.30:'*':SOLDE.OP.30:'*':DATE.31:'*':SOLDE.OP.31
    END
RETURN
END
