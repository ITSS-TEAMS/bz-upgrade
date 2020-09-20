*-----------------------------------------------------------------------------
* <Rating>36820</Rating>
*-----------------------------------------------------------------------------   
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE CEC.TEST.INWARD 
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
 
*---------------------------------------------------------------------
*
* This program is called as load routine whenever an Inward cec file
* has been received from the provider center to check its integrity.
*
* First it validates the file. Any problem with the header is
* reported and the process skips it.
*
* The transactions booked into the CEC.INWARD.PENDING messages that
* have reached their maturity date are processed prior to any new file
* dowload.
*
* This program may also runs during the start of day to process the
* pending file prior to any new file processing.
*
*---- Revision History ------------------------------------------------
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT
*                      Arithmatic operations converted to operands , !HUSHIT to HUSHIT
* $INSERT I_COMMON - Not Used anymore;   removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM
* $INSERT I_EQUATE - Not Used anymore;---------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_F.SPF
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_F.ACCOUNT.CLASS
    $INSERT I_F.CEC.LOG.LEVEL
    $INSERT I_F.CEC.LAYOUT
    $INSERT I_F.CEC.PARAMETER
    $INSERT I_F.CEC.INWARD.PENDING
    $INSERT I_F.CEC.INWARD.FILES
    $INSERT I_F.CEC.INWARD.LOG
    $INSEB.SystemTables.getVFunction()C.INWARD
    $INSERT I_F.ALTERNATE.ACCOUFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPE.CONDITION
    $INSERT I_F.FT.GROUP.CONDITION
    $INSERT I_F.CUSTOMER.CHARGE
    $INSERT I_OVE.COMMON

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

    $INSERT I_SITCOM
    $INSERT I_SITCHQ
    $INSERT I_SITOVA
    $INSERT I_CECLOC
    $INSERT I_CECLIN
    $INSERT I_CECFMT
    $INSERT I_CECSUH
    $INSERT I_CECREH
    $INSERT I_CECRET
    $INSERT I_CECSUT
    $INSERT I_CECHEA
*$INSERT I_CECLAY
    $INSERT I_CECREC
    $INSERT I_CECDEF
    $INSERT I_ACT.CECLAY
    $INSERT I_NEXT.CECLAY
    $INSERT I_CECDIR
    $INSERT I_CECICF
    $INSEEB.DataAccess.OpfI_CECOC
    $INSEEB.DataAccess.OpfI_CECVAR
    $INSERT I_CECPAR
    $INSERT I_LOTERR
    $INSERT I_CECBBAN

* Equate the fieldEB.SystemTables.getRNew()CFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefneric ones for include I_CEC.ACCOUNTING

    $INSEEB.DataAccess.FReadIT.ACCOUNTING.FIELDS
    $INSERT I_CEC.ACCOUNTING.IC

    AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP

    SW.HEADER.EXPECTED = 'EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.SystemTables.setE('CEC.INWARD')
    V = CEC.IC.AUDITEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer ; * EB.SystemTables.getIdNew()ulate the template of CEC.INWARD

    TEXT = '' ; EEB.DataAccess.FWrite'' ; SW.COMMIT = ''
    SW.UNKNOWN.MESSAGE = '' ; SW.RECOVERY = ''
    ACT.OPCODE = '' ; LAST.OPCODE = ''
    CEC.LOCAL.FIELDS = 'TEST'
    SUH.EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>36820</Rating>
*-----------------------------------------------------------------------------   
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE CEC.TEST.INWARD 
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
 
*---------------------------------------------------------------------
*
* This program is called as load routine whenever an Inward cec file
* has been received from the provider center to check its integrity.
*
* First it validates the file. Any problem with the header is
* reported and the process skips it.
*
* The transactions booked into the CEC.INWARD.PENDING messages that
* have reached their maturity date are processed prior to any new file
* dowload.
*
* This program may also runs during the start of day to process the
* pending file prior to any new file processing.
*
*---- Revision History ------------------------------------------------
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT
*                      Arithmatic operations converted to operands , !HUSHIT to HUSHIT
*                      removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM
*----------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_F.SPF
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.USER
    $INSERT I_F.ACCOUNT.CLASS
    $INSERT I_F.CEC.LOG.LEVEL
    $INSERT I_F.CEC.LAYOUT
    $INSERT I_F.CEC.PARAMETER
    $INSERT I_F.CEC.INWARD.PENDING
    $INSERT I_F.CEC.INWARD.FILES
    $INSERT I_F.CEC.INWARD.LOG
    $INSERT I_F.CEC.INWARD
    $INSERT I_F.ALTERNATE.ACCOUNT
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.FT.TXN.TYPE.CONDITION
    $INSERT I_F.FT.GROUP.CONDITION
    $INSERT I_F.CUSTOMER.CHARGE
    $INSERT I_OVE.COMMON

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

    $INSERT I_SITCOM
    $INSERT I_SITCHQ
    $INSERT I_SITOVA
    $INSERT I_CECLOC
    $INSERT I_CECLIN
    $INSERT I_CECFMT
    $INSERT I_CECSUH
    $INSERT I_CECREH
    $INSERT I_CECRET
    $INSERT I_CECSUT
    $INSERT I_CECHEA
*$INSERT I_CECLAY
    $INSERT I_CECREC
    $INSERT I_CECDEF
    $INSERT I_ACT.CECLAY
    $INSERT I_NEXT.CECLAY
    $INSERT I_CECDIR
    $INSERT I_CECICF
    $INSERT I_CECOC
    $INSERT I_CECVAR
    $INSERT I_CECPAR
    $INSERT I_LOTERR
    $INSERT I_CECBBAN

* Equate the fields of CEC.INWARD to generic ones for include I_CEC.ACCOUNTING

    $INSERT I_SIT.ACCOUNTING.FIELDS
    $INSERT I_CEC.ACCOUNTING.IC

    AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP

    SW.HEADER.EXPECTED = 'Y'

    APPLICATION = 'CEC.INWARD'
    V = CEC.IC.AUDIT.DATE.TIME         ; * To simulate the template of CEC.INWARD

    TEXT = '' ; ETEXT = '' ; SW.COMMIT = ''
    SW.UNKNOWN.MESSAGE = '' ; SW.RECOVERY = ''
    ACT.OPCODE = '' ; LAST.OPCODE = ''
    CEC.LOCAL.FIELDS = 'TEST'
    SUH.CECFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefSUT.EB.SystemTables.setE('')
    REH.CEC.IDS = ''
    RET.CEC.IDS = ''

    R.ANNEX.RECORD = ''
    CEC.CENTER.ID = ''

    LOG.JUMP = '' ; LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''
    PINTAPE = '' ; PINTAPE.PREV = '' ; IN.FILE.ID.PREV = ''

    GOSUB INITIALISE

    IF LOG.MESSAGE THEN
        LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
        IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
        RETURN
    END

    LOCATE 'INWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING IN.POS THEN

*        Load specific treatment constraints from parameter

        DUPLICATE.PROC = R.CEC.PARAMETER<CEC.PAR.DUPLICATE.PROC,IN.POS>
        COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,IN.POS>
        SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,IN.POS>:'"0"':"R"
        DEF.VAL.RTN = '' ; DEF.NB.VAL.RTN = 0
        IN.POS.DCNT = DCOUNT(R.CEC.PARAMETER<CEC.PAR.VALIDATE.RTN,IN.POS>,@SM)
        FOR ILD = 1 TO IN.POS.DCNT
            RTN.ID = TRIM(FIELD(R.CEC.PARAMETER<CEC.PAR.VALIDATE.RTN,IN.POS,ILD>,"@",2))
            IF RTN.ID THEN
                DEF.NB.VAL.RTN += 1
                DEF.VAL.RTN<1,DEF.NB.VAL.RTN> = RTN.ID
            END
        NEXT ILD
        DEF.AUTH.RTN = '' ; DEF.NB.AUTH.RTN = 0
        IN.POS.1.DCNT = DCOUNT(R.CEC.PARAMETER<CEC.PAR.AFT.AUTH.RTN,IN.POS>,@SM)
        FOR ILD = 1 TO IN.POS.1.DCNT
            RTN.ID = TRIM(FIELD(R.CEC.PARAMETER<CEC.PAR.AFT.AUTH.RTN,IN.POS,ILD>,"@",2))
            IF RTN.ID THEN
                DEF.NB.AUTH.RTN += 1
                DEF.AUTH.RTN<1,DEF.NB.AUTH.RTN> = RTN.ID
            END
        NEXT ILD

*        Calculate the date that decides on the pending of a message

        NB.PENDING.DAYS = R.CEC.PARAMETER<CEC.PAR.PENDING.DAYS,IN.POS>
        ADV.DAYS = ''
        IF NB.PENDING.DAYS NE '' THEN
            PENDING.DATE = R.DATES(EB.DAT.TODAY)
            BEGIN CASE
                CASE NB.PENDING.DAYS MATCH "0N'W'"
                    ADV.DAYS = FIELD(NB.PENDING.DAYS,"W",1)
                    ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'W'
                CASE NB.PENDING.DAYS MATCH "0N'C'"
                    ADV.DAYS = FIELD(NB.PENDING.DAYS,"C",1)
                    ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
                CASE NB.PENDING.DAYS MATCH "0N"
                    ADV.DAYS = NB.PENDING.DAYS
                    ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
            END CASE
            IF ADV.DAYS THEN CALL CEC.CDT(REGION,PENDING.DATE,ADV.DAYS)
        END ELSE
            PENDING.DATE = ''
        END

*        Load and process the inward SIT files available

        SW.EXTRACT.FROM.PENDING = ''
        GOSUB SELECT.WAITING.FILES

    END

*  WRITE AA TO F.TOOLS,"MP.CECIN"

RETURN

***********************************************************************
SELECT.WAITING.FILES:
***********************************************************************

    UNFORM.FILE.ID = "CECTEST"
    NEW.KEY.LIST = KEY.LIST
    KEY.LIST = ''

*     Check if previous execution has crashed then reexecute it first

    PINTAPE = '' ; KEY.ADD = ''
    RSTATEMENT = "SELECT FT.IN.TAPE WITH @ID EQ ":UNFORM.FILE.ID
    CALL EB.READLIST(RSTATEMENT,KEY.ADD,'','','')

    IF KEY.ADD NE '' THEN
        IF NEW.KEY.LIST NE '' THEN
            NEW.KEY.LIST = 'Reexecution':@FM:NEW.KEY.LIST
        END ELSE
            NEW.KEY.LIST = 'Reexecution'
        END
    END
    IF NEW.KEY.LIST NE '' THEN
        LOOP
            REMOVE PINTAPE FROM NEW.KEY.LIST SETTING POINT1
        WHILE PINTAPE:POINT1
            WORST.LEVEL = '0'
            IF PINTAPE NE 'Reexecution' THEN
                CEC.INWARD.FILES.ID = ''
                EXECUTE$CMD1 = "COPY FROM ":DIR.IDENT:" TO FT.IN.TAPE ":PINTAPE:",":UNFORM.FILE.ID:" OVERWRITING DELETING"
                CALL HUSHIT(1)
                EXECUTE EXECUTE$CMD1 RETURNING RETVAR
                CALL HUSHIT(0)
                SW.OKAY = 0
                RETVAR.DCNT = DCOUNT(RETVAR,@FM)
                FOR IIW = 1 TO RETVAR.DCNT
                    LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                NEXT IIW
                IF SW.OKAY EQ 0 THEN
                    IF NEW.KEY.LIST EQ FILE.IDENT THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.CALLED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END ELSE
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.LOADED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END
                    GOSUB UPDATE.LOG.FILE
                END
            END
            SAVE.R.CEC.INWARD.LOG = R.CEC.INWARD.LOG
            GOSUB PROCESS.INWARD.FILE
            YR.CEC.LOG.LEVEL.ID = WORST.LEVEL
            GOSUB READ.CEC.LOG.LEVEL.FILE
            IF R.CEC.LOG.LEVEL NE '' THEN
                FINAL.DIR = ''
                IF WORST.LEVEL GE '1' THEN
                    IF R.CEC.LOG.LEVEL<CEC.LGL.FINAL.DIRECTORY> NE ''
                    THEN FINAL.DIR = R.CEC.LOG.LEVEL<CEC.LGL.FINAL.DIRECTORY>
                    ELSE FINAL.DIR = FT.IN.TAPE
                END ELSE
                    FINAL.DIR = DIR.IDENT
                    KEY.LIST<-1> = PINTAPE
                    R.CEC.INWARD.LOG = SAVE.R.CEC.INWARD.LOG
                END
                IF R.CEC.LOG.LEVEL<CEC.LGL.FINAL.ROUTINE> THEN
                    FINAL.RTN = TRIM(FIELD(R.CEC.LOG.LEVEL<CEC.LGL.FINAL.ROUTINE>,"@",2))
                    ETEXT = '' ; SAVE.COMI = COMI ; COMI = FINAL.DIR
                    CALL @FINAL.RTN
                    IF ETEXT THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = ETEXT
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END ELSE
                        IF COMI THEN FINAL.DIR = COMI
                    END
                    ETEXT = '' ; COMI = SAVE.COMI
                END
                IF FINAL.DIR NE '' THEN
                    EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO ":FINAL.DIR:" ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
                    CALL HUSHIT(1)
                    EXECUTE EXECUTE$CMD2 RETURNING RETVAR
                    CALL HUSHIT(0)
                    SW.OKAY = 0
                    RETVAR.1.DCNT = DCOUNT(RETVAR,@FM)
                    FOR IIW = 1 TO RETVAR.1.DCNT
                        LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                    NEXT IIW
                    IF SW.OKAY EQ 0 THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.COPY':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END
                END ELSE
                    EXECUTE$CMD2 = "DELETE FT.IN.TAPE ":UNFORM.FILE.ID
                    CALL HUSHIT(1)
                    EXECUTE EXECUTE$CMD2
                    CALL HUSHIT(0)
                END
            END
        REPEAT
    END

RETURN

***********************************************************************
PROCESS.INWARD.FILE:
***********************************************************************

    ITB = 0
    Y.COUNT = ''
    Y.REMIT.NUM = 1
    LAST.OPCODE = ''
    LAST.LAYOUT.ID = ''
    CEC.LOCAL.FIELDS = 'TEST'
    CEC.PRE.HEADER = ''
    R.ANNEX.RECORD = ''
    R.DATA.RECORD = ''

    ACT.LAYOUT.ID = ''
    ACT.OPCODE = ''

    SAVE.CEC.IDS = ''
    CEC.IDS = ''
    CEC.CENTER.ID = ''

*     To skip a batch already processed this switch sould be set to 'Y'

    SW.SKIP = ''
    SW.FILE.HEADER = 'N'
    SW.FILE.TRAILER = 'N'
    SW.REMIT.HEADER = 'N'
    SW.REMIT.TRAILER = 'N'
    SW.TO.FILES.ID = ''
    SUH.CEC.IDS = ''
    SUT.CEC.IDS = ''
    REH.CEC.IDS = ''
    RET.CEC.IDS = ''

    TOT.NB.FOUND = 0
    TOT.NB.CR.FOUND = 0
    TOT.NB.DB.FOUND = 0
    TOT.AMT.FOUND = 0
    TOT.AMT.CR.FOUND = 0
    TOT.AMT.DB.FOUND = 0
    SW.UPDATE.FILE.TOTAL = 0

    CALL Y.CLEAR.CECREC

    SETTLEMENT.DATE = ''
    SW.PENDING.USED = ''
    TOTAL.FOR.COMMITMENT = 0
    LCCY.FOR.COMMITMENT = 0
    COUNTER.FOR.COMMITMENT = 0
    COUNTER.FOR.RECOVERY = 0
    CALC.FILE.REMIT = 0
    SW.CEC.MSG.CONCAT.CREATED = ''

    IHE.SUH = 1 ; IHE.REH = 1
    SW.SUH.FOUND = 0

    UNFORM.FILE = '' ; I.REC = '' ; IE = 0 ; SW.EOF = 0

    LAST.ENR.ARRAY = '' ;* Record the actual ENR values
    LAST.OPE.ARRAY = '' ;* Record the actual OPE values

    OPENSEQ TAPE.FILE.NAME,UNFORM.FILE.ID TO UNFORM.FILE THEN
        MY.SUM.TRAILER = ""
        LOOP
            LINE = '' ; GOT.LINE = 0
            LOOP
                BUFFER.DATA = ''
                READSEQ BUFFER.DATA FROM UNFORM.FILE ELSE SW.EOF = 1
                LINE.LEN = LEN(BUFFER.DATA)
                LINE := BUFFER.DATA
                IF LINE.LEN NE 1024 THEN GOT.LINE = 1
            UNTIL GOT.LINE
            REPEAT
            R.ACT.RECORD = LINE
        UNTIL SW.EOF = 1
            R.TEST.RECORD = TRIM(R.ACT.RECORD)
            IF R.TEST.RECORD THEN
*           IF R.ACT.RECORD NE '' THEN
                REC.LENGTH = LEN(R.ACT.RECORD)
                HEA = ''
                ENR.ID.DCNT = DCOUNT(HEA.ENR.ID,@FM)
                FOR IHE = 1 TO ENR.ID.DCNT
                    IF REC.LENGTH GT HEA.REC.LENGTH<IHE> THEN CONTINUE
                    GOOD.ENR.FOUND = 1
                    ACT.ENR.VALUE = ''
                    ENR.START.DCNT = DCOUNT(HEA.ENR.START<IHE>,@VM)
                    FOR IEN = 1 TO ENR.START.DCNT
                        IF HEA.ENR.START<IHE,IEN> EQ '#' OR HEA.ENR.LENGTH<IHE,IEN> EQ '#' THEN
                            IF HEA.ENR.VALUE<IHE,IEN> EQ '#' THEN

*                          The register code is in another record
                        
                                IF LAST.ENR.ARRAY<1,IEN> NE '' THEN ACT.ENR.VALUE<1,IEN> = LAST.ENR.ARRAY<1,IEN>
                            END
                        END ELSE
                            FIELD.ENR.START = HEA.ENR.START<IHE,IEN>
                            FIELD.ENR.LENGTH = HEA.ENR.LENGTH<IHE,IEN>
                            IF FIELD.ENR.START + FIELD.ENR.LENGTH - 1 LE REC.LENGTH THEN
                                TRAV.FIELD =  R.ACT.RECORD[FIELD.ENR.START,FIELD.ENR.LENGTH]
* CONVERT ' ' TO CHARX(125) IN TRAV.FIELD
                                CHANGE ' ' TO CHARX(125) IN TRAV.FIELD
                                ACT.ENR.VALUE<1,IEN> = TRAV.FIELD
                            END
                        END
                        BEGIN CASE
                            CASE ACT.ENR.VALUE<1,IEN> EQ HEA.ENR.VALUE<IHE,IEN> AND ACT.ENR.VALUE<1,IEN> NE ''
                            CASE HEA.ENR.VALUE<IHE,IEN> EQ '' OR HEA.ENR.VALUE<IHE,IEN> EQ '#'
                            CASE 1 ; GOOD.ENR.FOUND = 0 ; EXIT
                        END CASE
                    NEXT IEN

*AA<-1> = IHE:' ':HEA.ENR.START<IHE>:' ':HEA.ENR.LENGTH<IHE>:' ':HEA.ENR.VALUE<IHE>:' ':ACT.ENR.VALUE

                    IF GOOD.ENR.FOUND THEN

*                    The ENR code is compatible, now let's consider the OPE code if any
  
                        IF HEA.OPE.START<IHE> EQ '' THEN ;* No operation code used
                            BEGIN CASE
                                CASE HEA.NATURE<IHE> EQ 'SUT' AND SW.SUH.FOUND EQ 0
                                CASE HEA.NATURE<IHE> EQ 'SUT' AND IHE LT IHE.SUH
                                CASE IHE LT IHE.REH
                                CASE 1
                                    HEA = IHE ; EXIT
                            END CASE
                        END ELSE
                            GOOD.OPE.FOUND = 1
                            ACT.OPE.VALUE = ''
                            OPE.START.DCNT = DCOUNT(HEA.OPE.START<IHE>,@VM)
                            FOR IEN = 1 TO OPE.START.DCNT
                                IF HEA.OPE.START<IHE,IEN> EQ '#' OR HEA.OPE.LENGTH<IHE,IEN> EQ '#' THEN

*                             The operation code is in another record
                        
                                    IF LAST.OPE.ARRAY<1,IEN> NE '' THEN ACT.OPE.VALUE<1,IEN> = LAST.OPE.ARRAY<1,IEN>
                                END ELSE
                                    FIELD.OPE.START = HEA.OPE.START<IHE,IEN>
                                    FIELD.OPE.LENGTH = HEA.OPE.LENGTH<IHE,IEN>
                                    IF FIELD.OPE.START + FIELD.OPE.LENGTH - 1 LE REC.LENGTH THEN
                                        TRAV.FIELD =  R.ACT.RECORD[FIELD.OPE.START,FIELD.OPE.LENGTH]
* CONVERT ' ' TO CHARX(125) IN TRAV.FIELD
                                        CHANGE ' ' TO CHARX(125) IN TRAV.FIELD
                                        ACT.OPE.VALUE<1,IEN> = TRAV.FIELD
                                    END
                                END
                                BEGIN CASE
                                    CASE ACT.OPE.VALUE<1,IEN> EQ HEA.OPE.VALUE<IHE,IEN> AND ACT.OPE.VALUE<1,IEN> NE ''
                                    CASE HEA.OPE.VALUE<IHE,IEN> EQ '' OR HEA.OPE.VALUE<IHE,IEN> EQ '#'
                                    CASE 1 ; GOOD.OPE.FOUND = 0 ; EXIT
                                END CASE
                            NEXT IEN
*AA<-1> = IHE:' ':HEA.OPE.START<IHE>:' ':HEA.OPE.LENGTH<IHE>:' ':HEA.OPE.VALUE<IHE>:' ':ACT.OPE.VALUE
                            IF GOOD.OPE.FOUND THEN
                                BEGIN CASE
                                    CASE HEA.NATURE<IHE> EQ 'SUT' AND SW.SUH.FOUND EQ 0
                                    CASE HEA.NATURE<IHE> EQ 'SUT' AND IHE LT IHE.SUH
                                    CASE IHE LT IHE.REH
                                    CASE 1
                                        HEA = IHE ; EXIT
                                END CASE
                            END
                        END
                    END
                NEXT IHE
*
                IF HEA NE '' THEN
                    NOW.LAYOUT.ID = HEA.OPE.ID<HEA>
                    BEGIN CASE
                        CASE HEA.NATURE<HEA> EQ 'SUH'
                            IHE.SUH = HEA
                            SW.SUH.FOUND = 1
                            CALL Y.LOAD.CECSUH('INWARD','','',NOW.LAYOUT.ID)
                            CEC.CENTER.ID = HEA.CENTER.ID<HEA>
                            ACT.LAYOUT.ID = ''
                            AA<-1> = HEA:' SUH ':R.ACT.RECORD
                            GOSUB PROCESS.FILE.HEADER
                            LAST.ENR.ARRAY = ACT.ENR.VALUE
                            LAST.OPE.ARRAY = ACT.OPE.VALUE
                        CASE HEA.NATURE<HEA> EQ 'REH'
                            AA<-1> = HEA:' REH ':R.ACT.RECORD
                            IHE.REH = HEA
                            CALL Y.LOAD.CECREH('INWARD','','',NOW.LAYOUT.ID)
                            CEC.CENTER.ID = HEA.CENTER.ID<HEA>
                            GOSUB PROCESS.REMIT.HEADER
                            LAST.ENR.ARRAY = ACT.ENR.VALUE
                            LAST.OPE.ARRAY = ACT.OPE.VALUE
                        CASE HEA.NATURE<HEA> EQ 'RET'
                            AA<-1> = HEA:' RET ':R.ACT.RECORD
                            IHE.REH = 1
                            GOSUB PROCESS.REMIT.TRAILER
                        CASE HEA.NATURE<HEA> EQ 'SUT'
                            IHE.SUH = 1
                            SW.SUH.FOUND = 0
                            ACT.LAYOUT.ID = ''
                            GOSUB PROCESS.FILE.TRAILER
                            LAST.ENR.ARRAY = ''
                            LAST.OPE.ARRAY = ''
                        CASE HEA.NATURE<HEA> EQ 'DET'
                            ACT.LAYOUT.ID = 'INWARD.':NOW.LAYOUT.ID
                            ACT.OPCODE = HEA.OPE.ID<HEA>
                            AA<-1> = HEA:' DET ':R.ACT.RECORD
                            GOSUB PROCESS.DATA.RECORD
                        CASE HEA.NATURE<HEA>[1,2] EQ 'AN'
                            GOSUB PROCESS.ANNEX
                    END CASE
                END ELSE
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-LOT.UNRECOGNIZED.CODE'
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

        REPEAT

        GOSUB PROCESS.MISSING.REMIT.TRAILER
        GOSUB PROCESS.MISSING.FILE.TRAILER
        IF SW.SKIP EQ '' THEN
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.NO.PROBLEM.FOUND'
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END
        CLOSESEQ UNFORM.FILE
    END

RETURN

***********************************************************************
CHECK.FILE.HEADER.EXIST:
***********************************************************************

    IF SW.HEADER.EXPECTED NE '' AND SW.FILE.HEADER NE 'Y' AND NOT(SW.SKIP) THEN
        IF CEC.INWARD.FILES.ID EQ '' THEN SW.TO.FILES.ID = 'Y'
        SW.FILE.HEADER = 'Y'
        ACT.SUH.RECORD = ''
    END

RETURN

***********************************************************************
CHECK.REMIT.HEADER.EXIST:
***********************************************************************

    IF SW.REMIT.HEADER NE 'Y' AND NOT(SW.SKIP) THEN
        SETTLEMENT.DATE = ''
        SW.PENDING.USED = ''
        SW.REMIT.HEADER = 'Y'
        ACT.REH.RECORD = ''
        IF SW.HEADER.EXPECTED EQ '' THEN
            IF CEC.INWARD.FILES.ID EQ '' THEN SW.TO.FILES.ID = 'Y'
        END ELSE
            IF SW.TO.FILES.ID EQ '' THEN
                GOSUB REMIT.HEADER.UPDATE
                MSG.ERR = 'EB-CEC.MISSING.REM.HEADER'
                CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM> = MSG.ERR
                IF ACT.SUH.RECORD THEN ;* No report if file header is also missing
                    LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.HEADER':@FM:Y.REMIT.NUM
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
        END
    END

RETURN

***********************************************************************
GENERATE.LINE.ONLY.FILES.ID:
***********************************************************************

    R.CEC.INWARD.FILES = ''
    CEC.INWARD.FILES.ID = TRIM(Y.PROCESS.DATE," ","A")  ; * CEC working date
    GOSUB READ.CEC.INWARD.FILES.FILE

    IF LOG.LEVEL EQ '' THEN
        R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID> = CEC.CENTER.ID
        R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE> = Y.PROCESS.DATE
        R.CEC.INWARD.FILES<CEC.ICF.CREATION.TIME> = Y.PROCESS.TIME
        SW.SKIP = ''
    END

    IF LOG.MESSAGE THEN
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
        GOSUB UPDATE.LOG.FILE
    END

RETURN

***********************************************************************
PROCESS.MISSING.REMIT.TRAILER:
***********************************************************************

    IF SW.REMIT.TRAILER EQ '' AND NOT(SW.SKIP) THEN
        CALC.FILE.REMIT += 1
        MSG.ERR = 'EB-CEC.MISSING.REM.TRAILER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,Y.REMIT.NUM> = MSG.ERR

        IF SW.UNKNOWN.MESSAGE EQ '' THEN ;* AND COUNTER.FOR.COMMITMENT THEN
            IF R.DATA.RECORD EQ '' THEN
                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.DATA.LINE':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE ; SW.SKIP = 'Y'
                R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM> = ''
                R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,Y.REMIT.NUM> = ''
                RETURN
            END ELSE
                COUNTER.FOR.COMMITMENT += 1
                GOSUB POPULATE.IC.FIELDS
            END
        END

        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.TRAILER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL GT 1 THEN
            SW.SKIP = 'Y'
            R.SAVE.CEC.INWARD.FILES = R.CEC.INWARD.FILES
            FOR IRD = CEC.ICF.REM.HEADER TO CEC.ICF.REM.TRAILER
                R.CEC.INWARD.FILES<IRD> = ''
                FOR IDR = 1 TO Y.REMIT.NUM - 1
                    R.CEC.INWARD.FILES<IRD,IDR> = R.SAVE.CEC.INWARD.FILES<IRD,IDR>
                NEXT IDR
            NEXT IRD
        END
        GOSUB UPDATE.LOG.FILE
        SW.REMIT.HEADER = ''
        GOSUB REMIT.TRAILER.UPDATE
    END

RETURN

***********************************************************************
PROCESS.MISSING.FILE.TRAILER:
***********************************************************************

    IF SW.FILE.TRAILER EQ '' AND NOT(SW.SKIP) THEN
        MSG.ERR = 'EB-CEC.MISSING.FILE.TRAILER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.CEC.INWARD.FILES<CEC.ICF.FILE.TRAILER> = MSG.ERR
        GOSUB FILE.TRAILER.UPDATE
    END

RETURN

***********************************************************************
PROCESS.FILE.HEADER:
***********************************************************************

    GOSUB PROCESS.MISSING.REMIT.TRAILER
    GOSUB PROCESS.MISSING.FILE.TRAILER

    IF SW.FILE.HEADER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MANY.FILE.HEADER'
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END

    SW.FILE.HEADER = 'Y'

    CALC.FILE.REMIT = 0

    Y.REMIT.NUM = 0
    SUH.CEC.IDS = ''
    SUT.CEC.IDS = ''
    REH.CEC.IDS = ''
    RET.CEC.IDS = ''
    SW.FILE.TRAILER = 'N'
    SW.REMIT.TRAILER = 'N'

    TOT.NB.FOUND = 0
    TOT.NB.CR.FOUND = 0
    TOT.NB.DB.FOUND = 0
    TOT.AMT.FOUND = 0
    TOT.AMT.CR.FOUND = 0
    TOT.AMT.DB.FOUND = 0
    SW.UPDATE.FILE.TOTAL = 0

    CALL Y.CLEAR.CECREC
    R.DATA.RECORD = ''
    CEC.LOCAL.FIELDS = 'TEST'

*     Unmap the File Header fields

    R.CEC.INWARD.FILES = ''
    CEC.INWARD.FILES.ID = ''
    CALL Y.MAP.CEC.INWARD('SUH',R.ACT.RECORD,N.ERR)
    IF N.ERR THEN
        N.ERR.DCNT = DCOUNT(N.ERR,@FM)
        FOR JDF = 1 TO N.ERR.DCNT
            LOG.LEVEL = '2' ; LOG.MESSAGE = N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        NEXT JDF
        SW.SKIP = 'Y'
        RETURN
    END

*     Building up the CEC.INWARD.FILES key.

    CEC.IDS = ''
    NB.KEYS = DCOUNT(ACT.SUH.FIELDS<1>,@VM)
    FOR IDW = 1 TO NB.KEYS
        L.KEY.DATA = TRIM(ACT.SUH.FIELDS<9,IDW>," ","A")
        L.KEY.RANK = ACT.SUH.FIELDS<7,IDW>
        GOSUB UPDATE.REFERENCE
        IF ACT.SUH.FIELDS<7,IDW> MATCH '"FILE"1N0X' THEN
            L.FILE.ID = TRIM(ACT.SUH.FIELDS<9,IDW>," ","A")
            L.FILE.RK = ACT.SUH.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
        END
    NEXT IDW

    LOCATE 'BANKID' IN CEC.IDS<1,1> SETTING FIL THEN
        IF R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE> NE CEC.IDS<3,FIL,1> THEN
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.BANK.NOT.RECEIVER':@FM:CEC.IDS<3,FIL,1>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            SW.SKIP = 'Y'
            RETURN
        END
    END

    LOCATE 'FILE' IN CEC.IDS<1,1> SETTING FIL THEN
        CEC.INWARD.FILES.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '.' IN CEC.INWARD.FILES.ID
        CHANGE @SM TO '.' IN CEC.INWARD.FILES.ID
    END

    IF CEC.INWARD.FILES.ID EQ '' THEN SW.TO.FILES.ID = 'Y' ;*CEC.INWARD.FILES.ID = TODAY
    SUH.CEC.IDS = CEC.IDS

    IF SW.TO.FILES.ID NE 'Y' THEN GOSUB READ.CEC.INWARD.FILES.FILE
    IF NOT(LOG.LEVEL) THEN
        R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID> = CEC.CENTER.ID
        LOCATE 'CREAD' IN CEC.IDS<1,1> SETTING FIL THEN
            R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE> = CEC.IDS<3,FIL,1>
        END
        LOCATE 'CREAT' IN CEC.IDS<1,1> SETTING FIL THEN
            R.CEC.INWARD.FILES<CEC.ICF.CREATION.TIME> = CEC.IDS<3,FIL,1>
        END
        R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER> = ACT.SUH.RECORD
        SW.SKIP = ''
    END
    IF LOG.MESSAGE THEN
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        IF LOG.LEVEL GT 1 THEN SW.SKIP = 'Y'
        GOSUB UPDATE.LOG.FILE
    END

RETURN

***********************************************************************
PROCESS.REMIT.HEADER:
***********************************************************************

    IF ACT.SUH.RECORD EQ '' THEN
        MSG.ERR = 'EB-CEC.MISSING.FILE.HEADER'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER> = MSG.ERR
        SUH.CEC.IDS = ''
        SUT.CEC.IDS = ''
        REH.CEC.IDS = ''
        RET.CEC.IDS = ''
    END

    GOSUB PROCESS.MISSING.REMIT.TRAILER

    IF SW.REMIT.HEADER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MANY.MSG.HEADER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END ELSE SW.REMIT.HEADER = 'Y'

    SETTLEMENT.DATE = ''
    SW.PENDING.USED = ''
    CEC.LOCAL.FIELDS = 'TEST'
    R.DATA.RECORD = ''

    IF SW.SKIP EQ 'M' THEN SW.SKIP = ''

*     Unmap the Remit header fields

    CALL Y.MAP.CEC.INWARD('REH',R.ACT.RECORD,N.ERR)
    IF N.ERR THEN
        N.ERR.1.DCNT = DCOUNT(N.ERR,@FM)
        FOR JDF = 1 TO N.ERR.1.DCNT
            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM+1:@VM:N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        NEXT JDF
        SW.SKIP = 'M'
        RETURN
    END

*     Building up the CEC.MSG.CONCAT key.

    CEC.IDS = SUH.CEC.IDS
    NB.KEYS = DCOUNT(ACT.REH.FIELDS<1>,@VM)
    FOR IDW = 1 TO NB.KEYS
        L.KEY.DATA = TRIM(ACT.REH.FIELDS<9,IDW>) ;*," ","A")
        L.KEY.RANK = ACT.REH.FIELDS<7,IDW>
        GOSUB UPDATE.REFERENCE
    NEXT IDW
    REH.CEC.IDS = CEC.IDS
    RET.CEC.IDS = ''

    LOCATE 'SDATE' IN CEC.IDS<1,1> SETTING FIL THEN
        SETTLEMENT.DATE = CEC.IDS<3,FIL,1>
    END

    R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID> = CEC.CENTER.ID

    LOCATE 'CREAD' IN CEC.IDS<1,1> SETTING FIL THEN
        R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE> = CEC.IDS<3,FIL,1>
    END
    LOCATE 'CREAT' IN CEC.IDS<1,1> SETTING FIL THEN
        R.CEC.INWARD.FILES<CEC.ICF.CREATION.TIME> = CEC.IDS<3,FIL,1>
    END

    IF NUM(SETTLEMENT.DATE) THEN
        WORK.DATE = SETTLEMENT.DATE
        CALL CEC.CDT(REGION,WORK.DATE,"000W")
        SETTLEMENT.DATE = WORK.DATE
        IF PENDING.DATE AND SETTLEMENT.DATE GT PENDING.DATE
        THEN SW.PENDING.USED = 'Y'
        ELSE SW.PENDING.USED = 'N'
    END ELSE SETTLEMENT.DATE = ''

    LOCATE 'BANKID' IN CEC.IDS<1,1> SETTING FIL THEN
        IF R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE> NE CEC.IDS<3,FIL,1> THEN
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.BANK.NOT.RECEIVER':@FM:CEC.IDS<3,FIL,1>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            SW.SKIP = 'Y'
            RETURN
        END
    END

    IF CEC.INWARD.FILES.ID EQ '' THEN
        LOCATE 'FILE' IN CEC.IDS<1,1> SETTING FIL THEN
            CEC.INWARD.FILES.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '.' IN CEC.INWARD.FILES.ID
            CHANGE @SM TO '.' IN CEC.INWARD.FILES.ID
        END
        IF CEC.INWARD.FILES.ID EQ '' THEN CEC.INWARD.FILES.ID = TODAY
        SW.TO.FILES.ID = 'N'
        GOSUB READ.CEC.INWARD.FILES.FILE
    END

*     LOCATE 'APPLCD' IN CEC.IDS<1,1> SETTING FIL THEN
*        ACT.OPCODE = CEC.IDS<3,FIL,1>
*     END
      
    NEW.CEC.MSG.CONCAT.ID = ''
    LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
        IN.STRING = CEC.IDS<3,FIL,3>
        CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
        CEC.IDS<3,FIL,3> = OUT.STRING
        NEW.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT @SM TO '\' IN NEW.CEC.MSG.CONCAT.ID
        CHANGE @SM TO '\' IN NEW.CEC.MSG.CONCAT.ID
    END
    IF NEW.CEC.MSG.CONCAT.ID EQ '' THEN
        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.ID':@FM:Y.REMIT.NUM+1
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        SW.SKIP = 'Y'
        RETURN
    END

    OLD.CEC.MSG.CONCAT.ID = ''
    LOCATE 'MOLD' IN CEC.IDS<1,1> SETTING FIL THEN
        IN.STRING = CEC.IDS<3,FIL,3>
        CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
        CEC.IDS<3,FIL,3> = OUT.STRING
        OLD.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '\' IN OLD.CEC.MSG.CONCAT.ID
        CHANGE @SM TO '\' IN OLD.CEC.MSG.CONCAT.ID
        IF OLD.CEC.MSG.CONCAT.ID EQ '' THEN
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.ORIG.ID':@FM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            SW.SKIP = 'Y'
            RETURN
        END
    END

    GOSUB CHECK.FILE.HEADER.EXIST

REMIT.HEADER.UPDATE:                     ; * To process the remit even though its header is missing
********************

    SW.FILE.TRAILER = ''
    SW.REMIT.TRAILER = 'N'

    TOTAL.FOR.COMMITMENT = 0
    LCCY.FOR.COMMITMENT = 0
    COUNTER.FOR.COMMITMENT = 0
    COUNTER.FOR.RECOVERY = 0
    IF SW.SKIP EQ 'Y' THEN RETURN

    NB.REMIT = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER>,@VM)
    IF SW.RECOVERY EQ 'Y' THEN
        IF Y.REMIT.NUM ELSE NB.REMIT.INIT = NB.REMIT
        IF Y.REMIT.NUM LE NB.REMIT.INIT THEN
            Y.REMIT.NUM += 1
            IF R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> NE '' THEN
                SW.SKIP = 'R'             ; * Message already processed to the end not to be recovere
                TOT.NB.FOUND += R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                TOT.AMT.FOUND += ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                BEGIN CASE
                    CASE R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1> GT 0
                        TOT.NB.CR.FOUND = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                        TOT.AMT.CR.FOUND = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                    CASE R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1> LT 0
                        TOT.NB.DB.FOUND = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                        TOT.AMT.DB.FOUND = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                END CASE
            END ELSE
                SW.SKIP = ''              ; * Message partially processed to be recovered
                COUNTER.FOR.RECOVERY = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                TOTAL.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                IF LCCY NE CLEAR.CCY THEN LCCY.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2>+0)
            END
            SETTLEMENT.DATE = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>,":",1)
            SW.PENDING.USED = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>,":",2)
        END ELSE                        ; * Message still not processed when the crash occurred
            SW.SKIP = '' ; SW.RECOVERY = '' ; Y.REMIT.NUM = NB.REMIT + 1
        END
    END ELSE
        IF R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER> EQ ''
        THEN Y.REMIT.NUM = 1
        ELSE Y.REMIT.NUM = NB.REMIT + 1
    END

    R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM> = ACT.REH.RECORD
    R.CEC.INWARD.FILES<CEC.ICF.MESSAGE.ID,Y.REMIT.NUM> = NEW.CEC.MSG.CONCAT.ID

    SW.CEC.MSG.CONCAT.CREATED = ''

RETURN

***********************************************************************
PROCESS.REMIT.TRAILER:
***********************************************************************

    IF SW.REMIT.TRAILER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MANY.MSG.TRAILER':@FM:Y.REMIT.NUM
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END ELSE SW.REMIT.TRAILER = 'Y'

    SW.UPDATE.FILE.TOTAL = 0

    GOSUB CHECK.REMIT.HEADER.EXIST
    GOSUB CHECK.FILE.HEADER.EXIST

    IF NOT(SW.SKIP) THEN

        IF SW.UNKNOWN.MESSAGE EQ '' THEN
            IF R.DATA.RECORD EQ '' THEN
                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.DATA.LINE':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE ; SW.SKIP = 'Y'
                R.SAVE.CEC.INWARD.FILES = R.CEC.INWARD.FILES
                FOR IRD = CEC.ICF.REM.HEADER TO CEC.ICF.REM.TRAILER
                    R.CEC.INWARD.FILES<IRD> = ''
                    FOR IDR = 1 TO Y.REMIT.NUM - 1
                        R.CEC.INWARD.FILES<IRD,IDR> = R.SAVE.CEC.INWARD.FILES<IRD,IDR>
                    NEXT IDR
                NEXT IRD
                RETURN
            END ELSE
                COUNTER.FOR.COMMITMENT += 1
                GOSUB POPULATE.IC.FIELDS
            END
        END

        IF R.CEC.INWARD.FILES<CEC.ICF.COMMENT,Y.REMIT.NUM> EQ '' THEN
            R.CEC.INWARD.FILES<CEC.ICF.COMMENT,Y.REMIT.NUM> = 'Y'
        END

*        Unmap the Remit Trailer fields

        CALL Y.MAP.CEC.INWARD('RET',R.ACT.RECORD,N.ERR)
        IF N.ERR THEN
            ERR.DCNT = DCOUNT(N.ERR,@FM)
            FOR JDF = 1 TO ERR.DCNT
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM+1:@VM:N.ERR<JDF>
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            NEXT JDF
*           SW.SKIP = 'M'
        END

        CEC.IDS = REH.CEC.IDS
        NB.KEYS = DCOUNT(ACT.RET.FIELDS<1>,@VM)
        FOR IDW = 1 TO NB.KEYS
            L.KEY.DATA = TRIM(ACT.RET.FIELDS<9,IDW>) ;*," ","A")
            L.KEY.RANK = ACT.RET.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
        NEXT IDW
        RET.CEC.IDS = CEC.IDS

    END

    R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,Y.REMIT.NUM> = ACT.RET.RECORD

    CALC.FILE.REMIT += 1

    SW.REMIT.HEADER = ''

REMIT.TRAILER.UPDATE:                    ; * To commit a message even though its trailer is missing
*********************

    IF SW.SKIP THEN RETURN
      
    R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM> = COUNTER.FOR.COMMITMENT
    BEGIN CASE
        CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM> = TOTAL.FOR.COMMITMENT
            IF LCCY NE CLEAR.CCY AND LCCY.FOR.COMMITMENT THEN R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2> = LCCY.FOR.COMMITMENT
        CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM> = -1 * TOTAL.FOR.COMMITMENT
            IF LCCY NE CLEAR.CCY AND LCCY.FOR.COMMITMENT THEN R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2> = -1 * LCCY.FOR.COMMITMENT
        CASE 1
            R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM> = ''
    END CASE

    IF SW.COMMIT EQ '' THEN

        IF RET.CEC.IDS EQ '' THEN CEC.IDS = REH.CEC.IDS

        LOCATE 'TXNNB' IN CEC.IDS<1,1> SETTING FIL THEN
            NB.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE NB.GIVEN = ''
        LOCATE 'TXNAMT' IN CEC.IDS<1,1> SETTING FIL THEN
            AMT.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE AMT.GIVEN = ''
        LOCATE 'TXNNBCR' IN CEC.IDS<1,1> SETTING FIL THEN
            NB.CR.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE NB.CR.GIVEN = ''
        LOCATE 'TXNAMTCR' IN CEC.IDS<1,1> SETTING FIL THEN
            AMT.CR.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE AMT.CR.GIVEN = ''
        LOCATE 'TXNNBDB' IN CEC.IDS<1,1> SETTING FIL THEN
            NB.DB.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE NB.DB.GIVEN = ''
        LOCATE 'TXNAMTDB' IN CEC.IDS<1,1> SETTING FIL THEN
            AMT.DB.GIVEN = CEC.IDS<3,FIL,1>
        END ELSE AMT.DB.GIVEN = ''

        GOSUB UPDATE.FILE.TOTAL ; SW.UPDATE.FILE.TOTAL = 1

        IF NB.GIVEN THEN
            NB.GIVEN.FMT = FMT(NB.GIVEN,'18"0"R')
            NB.FOUND.FMT = FMT(COUNTER.FOR.COMMITMENT,'18"0"R')
            IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:NB.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF NB.CR.GIVEN THEN
            NB.GIVEN.FMT = FMT(NB.CR.GIVEN,'18"0"R')
            NB.FOUND.FMT = FMT(NB.CR.FOUND,'18"0"R')
            IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:NB.CR.FOUND+0:@VM:NB.CR.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF NB.DB.GIVEN THEN
            NB.GIVEN.FMT = FMT(NB.DB.GIVEN,'18"0"R')
            NB.FOUND.FMT = FMT(NB.DB.FOUND,'18"0"R')
            IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:NB.DB.FOUND+0:@VM:NB.DB.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF AMT.GIVEN THEN
            AMT.GIVEN.FMT = FMT(AMT.GIVEN*100,'18"0"R')
            AMT.FOUND.FMT = FMT(TOTAL.FOR.COMMITMENT*100,'18"0"R')
            IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:TOTAL.FOR.COMMITMENT:@VM:AMT.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF AMT.CR.GIVEN THEN
            AMT.GIVEN.FMT = FMT(AMT.CR.GIVEN*100,'18"0"R')
            AMT.FOUND.FMT = FMT(AMT.CR.FOUND*100,'18"0"R')
            IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:AMT.CR.FOUND+0:@VM:AMT.CR.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF AMT.DB.GIVEN THEN
            AMT.GIVEN.FMT = FMT(AMT.DB.GIVEN*100,'18"0"R')
            AMT.FOUND.FMT = FMT(AMT.DB.FOUND*100,'18"0"R')
            IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:AMT.DB.FOUND+0:@VM:AMT.DB.GIVEN+0
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        IF SW.UPDATE.FILE.TOTAL EQ 0 THEN GOSUB UPDATE.FILE.TOTAL ELSE SW.UPDATE.FILE.TOTAL = 0

*        If the processing date is superior to the allowed forward date the record key is stored in the pending file

        IF SETTLEMENT.DATE EQ '' THEN
            SETTLEMENT.DATE = R.DATES(EB.DAT.TODAY)
            CALL CEC.CDT(REGION,SETTLEMENT.DATE,"000W")
        END

        IF SW.UNKNOWN.MESSAGE EQ 'Y' THEN
            SET.DATE.EDITED = OCONV(ICONV(SETTLEMENT.DATE,"D"),"D4/E")
            MSG.ERR = 'EB-CEC.REJECT.IN.PENDING':@FM:SET.DATE.EDITED
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = MSG.ERR
        END

        LAST.OPCODE = ''
        REH.CEC.IDS = ''
        RET.CEC.IDS = ''
    END ELSE
        R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>  = SETTLEMENT.DATE:':':SW.PENDING.USED
    END

    R.CEC.INWARD.FILES<CEC.ICF.MESSAGE.ID,Y.REMIT.NUM> = NEW.CEC.MSG.CONCAT.ID

    IF SW.COMMIT EQ '' THEN CEC.LOCAL.FIELDS = 'TEST' ; R.DATA.RECORD = ''

RETURN

***********************************************************************
PROCESS.FILE.TRAILER:
***********************************************************************

    IF SW.FILE.TRAILER EQ 'Y' THEN
        LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MANY.FILE.TRAILER'
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        RETURN
    END ELSE SW.FILE.TRAILER = 'Y'

    GOSUB CHECK.FILE.HEADER.EXIST

    IF NOT(SW.SKIP) THEN
        R.CEC.INWARD.FILES<CEC.ICF.FILE.TRAILER> = R.ACT.RECORD

*        Unmap the File Trailer fields

        CALL Y.MAP.CEC.INWARD('SUT',R.ACT.RECORD,N.ERR)
        IF N.ERR THEN
            N.ERR.FM.DCNT = DCOUNT(N.ERR,@FM)
            FOR JDF = 1 TO N.ERR.FM.DCNT
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:N.ERR<JDF>
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            NEXT JDF
*           SW.SKIP = 'M'
        END

        CEC.IDS = SUH.CEC.IDS
        NB.KEYS = DCOUNT(ACT.SUT.FIELDS<1>,@VM)
        FOR IDW = 1 TO NB.KEYS
            L.KEY.DATA = TRIM(ACT.SUT.FIELDS<9,IDW>) ;*," ","A")
            L.KEY.RANK = ACT.SUT.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
        NEXT IDW
        SUT.CEC.IDS = CEC.IDS

FILE.TRAILER.UPDATE:                     ; * To commit a file even though its trailer is missing
********************

        IF NOT(SW.SKIP) THEN

            IF SUT.CEC.IDS EQ '' THEN CEC.IDS = SUH.CEC.IDS

            LOCATE 'TOTNB' IN CEC.IDS<1,1> SETTING FIL THEN
                NB.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE NB.GIVEN = ''
            LOCATE 'TOTAMT' IN CEC.IDS<1,1> SETTING FIL THEN
                AMT.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE AMT.GIVEN = ''
            LOCATE 'TOTNBCR' IN CEC.IDS<1,1> SETTING FIL THEN
                NB.CR.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE NB.CR.GIVEN = ''
            LOCATE 'TOTAMTCR' IN CEC.IDS<1,1> SETTING FIL THEN
                AMT.CR.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE AMT.CR.GIVEN = ''
            LOCATE 'TOTNBDB' IN CEC.IDS<1,1> SETTING FIL THEN
                NB.DB.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE NB.DB.GIVEN = ''
            LOCATE 'TOTAMTDB' IN CEC.IDS<1,1> SETTING FIL THEN
                AMT.DB.GIVEN = CEC.IDS<3,FIL,1>
            END ELSE AMT.DB.GIVEN = ''

            IF NB.GIVEN THEN
                NB.GIVEN.FMT = FMT(NB.GIVEN,'18"0"R')
                NB.FOUND.FMT = FMT(TOT.NB.FOUND,'18"0"R')
                IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:TOT.NB.FOUND:@VM:NB.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

            IF NB.CR.GIVEN THEN
                NB.GIVEN.FMT = FMT(NB.CR.GIVEN,'18"0"R')
                NB.FOUND.FMT = FMT(TOT.NB.CR.FOUND,'18"0"R')
                IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:TOT.NB.CR.FOUND:@VM:NB.CR.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

            IF NB.DB.GIVEN THEN
                NB.GIVEN.FMT = FMT(NB.DB.GIVEN,'18"0"R')
                NB.FOUND.FMT = FMT(TOT.NB.DB.FOUND,'18"0"R')
                IF NB.GIVEN.FMT NE NB.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.LINES':@FM:Y.REMIT.NUM:@VM:TOT.NB.DB.FOUND:@VM:NB.DB.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

            IF AMT.GIVEN THEN
                AMT.GIVEN.FMT = FMT(AMT.GIVEN*100,'18"0"R')
                AMT.FOUND.FMT = FMT(TOT.AMT.FOUND*100,'18"0"R')
                IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:TOT.AMT.FOUND:@VM:AMT.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

            IF AMT.CR.GIVEN THEN
                AMT.GIVEN.FMT = FMT(AMT.CR.GIVEN*100,'18"0"R')
                AMT.FOUND.FMT = FMT(TOT.AMT.CR.FOUND*100,'18"0"R')
                IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:TOT.AMT.CR.FOUND:@VM:AMT.CR.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END

            IF AMT.DB.GIVEN THEN
                AMT.GIVEN.FMT = FMT(AMT.DB.GIVEN*100,'18"0"R')
                AMT.FOUND.FMT = FMT(TOT.AMT.DB.FOUND*100,'18"0"R')
                IF AMT.GIVEN.FMT NE AMT.FOUND.FMT THEN
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.NO.MATCH.ON.TOTAL':@FM:Y.REMIT.NUM:@VM:TOT.AMT.DB.FOUND:@VM:AMT.DB.GIVEN+0
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END
  
        END

        SW.FILE.HEADER = ''

        SUH.CEC.IDS = ''
        SUT.CEC.IDS = ''
        REH.CEC.IDS = ''
        RET.CEC.IDS = ''

        IF SW.SKIP THEN RETURN

        RETURN

***********************************************************************
UPDATE.FILE.TOTAL:
***********************************************************************

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                NB.CR.FOUND = COUNTER.FOR.COMMITMENT
                AMT.CR.FOUND = TOTAL.FOR.COMMITMENT
                NB.DB.FOUND = 0
                AMT.DB.FOUND = 0
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                NB.DB.FOUND = COUNTER.FOR.COMMITMENT
                AMT.DB.FOUND = TOTAL.FOR.COMMITMENT
                NB.CR.FOUND = 0
                AMT.CR.FOUND = 0
        END CASE

        TOT.NB.FOUND += COUNTER.FOR.COMMITMENT
        TOT.NB.CR.FOUND += NB.CR.FOUND
        TOT.NB.DB.FOUND += NB.DB.FOUND
        TOT.AMT.FOUND += TOTAL.FOR.COMMITMENT
        TOT.AMT.CR.FOUND += AMT.CR.FOUND
        TOT.AMT.DB.FOUND += AMT.DB.FOUND

        RETURN

***********************************************************************
PROCESS.DATA.RECORD:
***********************************************************************

        GOSUB CHECK.FILE.HEADER.EXIST
        GOSUB CHECK.REMIT.HEADER.EXIST

        IF SW.TO.FILES.ID EQ 'Y' THEN

*        The missing CEC.INWARD.FILES record is created here

            SW.TO.FILES.ID = 'N'
            GOSUB GENERATE.LINE.ONLY.FILES.ID
            GOSUB REMIT.HEADER.UPDATE
            IF ACT.SUH.RECORD EQ '' THEN
                LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MISSING.FILE.HEADER'
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER> = LOG.MESSAGE
                GOSUB UPDATE.LOG.FILE
            END ELSE
                R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER> = ACT.SUH.RECORD
            END
            IF ACT.REH.RECORD EQ '' THEN
                MSG.ERR = 'EB-CEC.MISSING.REM.HEADER'
                CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM> = MSG.ERR
                LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.HEADER':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END ELSE
                R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM> = ACT.REH.RECORD
            END
            SW.TO.FILES.ID = 'N'
            SW.FILE.HEADER = 'Y'
            SW.REMIT.HEADER = 'Y'
        END

        SW.FILE.TRAILER = ''
        SW.REMIT.TRAILER = ''

        IF SW.SKIP THEN RETURN

        AA<-1> = 'LAST.LAYOUT.ID ':LAST.LAYOUT.ID
        AA<-1> = 'ACT.LAYOUT.ID ':ACT.LAYOUT.ID
        AA<-1> = 'ACT.OPCODE ':ACT.OPCODE

        IF R.DATA.RECORD NE '' THEN

            COUNTER.FOR.COMMITMENT += 1

*        Do not process transactions commited before the crash when recovered

            IF SW.RECOVERY AND COUNTER.FOR.COMMITMENT LE COUNTER.FOR.RECOVERY ELSE
                IF SW.UNKNOWN.MESSAGE EQ '' THEN
                    SAVE.ACT.LAYOUT.ID = ACT.LAYOUT.ID ;*EPI 2009/10/31
                    SAVE.ACT.OPCODE = ACT.OPCODE ;*EPI 2009/10/31
                    GOSUB POPULATE.IC.FIELDS
                    ACT.LAYOUT.ID = SAVE.ACT.LAYOUT.ID ;*EPI 2009/10/31
                    ACT.OPCODE = SAVE.ACT.OPCODE ;*EPI 2009/10/31
                END
            END
        END

        IF LAST.LAYOUT.ID EQ '' OR LAST.LAYOUT.ID NE ACT.LAYOUT.ID THEN GOSUB READ.CODE.LAYOUT

        IF SW.RECOVERY AND COUNTER.FOR.COMMITMENT LE COUNTER.FOR.RECOVERY THEN RETURN

        R.ANNEX.RECORD = ''
        R.DATA.RECORD = R.ACT.RECORD

        RETURN

***********************************************************************
READ.CODE.LAYOUT:
***********************************************************************

*     Extraction du format du message

        NEXT.OPCODE = ''
        CALL Y.LOAD.CEC.LAYOUT('INWARD','',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,Y.REJECT.REASON)
        IF Y.REJECT.REASON THEN GOSUB WRITE.REJECT.FILES ; RETURN

        IF LAST.LAYOUT.ID EQ ACT.LAYOUT.ID THEN RETURN

*     Extraction des conditions de compabilisation actuelles

        CALL Y.LOAD.ACT.CECLAY(ACT.LAYOUT.ID,R.ACT.LAYOUT,CLEAR.CCY,Y.REJECT.REASON)
        IF Y.REJECT.REASON THEN GOSUB WRITE.REJECT.FILES ; RETURN

        VAL.RTN = DEF.VAL.RTN ; NB.VAL.RTN = DEF.NB.VAL.RTN
        IF R.ACT.LAYOUT<CEC.LAY.VALIDATION.RTN> NE '' THEN
            VALIDATION.RTN.DCNT = DCOUNT(R.ACT.LAYOUT<CEC.LAY.VALIDATION.RTN>,@VM)
            FOR ILD = 1 TO VALIDATION.RTN.DCNT
                RTN.ID = TRIM(FIELD(R.ACT.LAYOUT<CEC.LAY.VALIDATION.RTN,ILD>,"@",2))
                IF RTN.ID THEN
                    NB.VAL.RTN += 1
                    VAL.RTN<1,NB.VAL.RTN> = RTN.ID
                END
            NEXT ILD
        END

        AUTH.RTN = DEF.AUTH.RTN ; NB.AUTH.RTN = DEF.NB.AUTH.RTN
        IF R.ACT.LAYOUT<CEC.LAY.AFTER.AUTH.RTN> NE '' THEN
            AFTER.AUTH.DCNT = DCOUNT(R.ACT.LAYOUT<CEC.LAY.AFTER.AUTH.RTN>,@VM)
            FOR ILD = 1 TO AFTER.AUTH.DCNT
                RTN.ID = TRIM(FIELD(R.ACT.LAYOUT<CEC.LAY.AFTER.AUTH.RTN,ILD>,"@",2))
                IF RTN.ID THEN
                    NB.AUTH.RTN += 1
                    AUTH.RTN<1,NB.AUTH.RTN> = RTN.ID
                END
            NEXT ILD
        END

        R.FTTC = R.ACT.FTTC ; YR.FTTC.ID = ACT.FTTC.ID

*     Extraction des conditions de compabilisation de la reponse envisagee

        CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,CLEAR.CCY,Y.REJECT.REASON)
        IF Y.REJECT.REASON THEN GOSUB WRITE.REJECT.FILES ; RETURN

        LAST.OPCODE = ACT.OPCODE
        LAST.LAYOUT.ID = ACT.LAYOUT.ID
        SW.UNKNOWN.MESSAGE = ''

        RETURN

***********************************************************************
PROCESS.ANNEX:
***********************************************************************

        IF SW.SKIP THEN RETURN

        SW.ANNEX.FOUND = ''
        LAYOUT.ID.DCNT = DCOUNT(ACT.ANNEX.LAYOUT.ID,@VM)
        FOR IJK = 1 TO LAYOUT.ID.DCNT
            IF ACT.ANNEX.LAYOUT.ID<1,IJK> EQ 'INWARD.':NOW.LAYOUT.ID THEN
                IF R.ANNEX.RECORD<1,IJK> NE '' AND HEA.NATURE<HEA> EQ 'ANM' THEN

*              This type of annex message may be recorded several time per operation

                    R.ANNEX.RECORD<1,IJK,-1> = R.ACT.RECORD
                END ELSE
                    R.ANNEX.RECORD<1,IJK> = R.ACT.RECORD
                END
                SW.ANNEX.FOUND = 'Y'
                EXIT
            END
        NEXT IJK
        IF SW.ANNEX.FOUND EQ '' THEN
            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.UNEXPECTED.ANNEX':@FM:Y.REMIT.NUM:@VM:NOW.LAYOUT.ID
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END

        RETURN

***********************************************************************
WRITE.REJECT.FILES:
***********************************************************************

        R.FTTC = '' ; YR.FTTC.ID = ''

        MAT R.NEW = ''

        IF SW.UNKNOWN.MESSAGE EQ '' THEN
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM:@VM:Y.REJECT.REASON
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            SW.SKIP = 'Y'
            SW.UNKNOWN.MESSAGE = 'Y'
        END

        RETURN

***********************************************************************
POPULATE.IC.FIELDS:
***********************************************************************

        CURR.NO = 0
        R.ACCOUNT = ''
        ACCT.ID = ''
        MAT R.NEW = ''
        R.NEW(CEC.IC.CENTER.ID) = CEC.CENTER.ID
        R.NEW(CEC.IC.APPLICATION.CODE) = LAST.OPCODE

        ACT.LAYOUT.ID = 'INWARD.':LAST.OPCODE

*     Unmap the Transaction Information fields into R.NEW

        ACT.DAT.RECORD = R.DATA.RECORD
        IF R.ANNEX.RECORD NE '' THEN ACT.DAT.RECORD := @VM:R.ANNEX.RECORD ; R.ANNEX.RECORD = ''

        CALL Y.MAP.CEC.INWARD('DAT',ACT.DAT.RECORD,N.ERR)
        IF N.ERR THEN
            N.ERR.DCT = DCOUNT(N.ERR,@FM)
            FOR JDF = 1 TO N.ERR.DCT
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.TXN.REASON':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:N.ERR<JDF>
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            NEXT JDF
        END

*     Extraction of useful fields data from the 3 layout sequences.

        CEC.IDS = REH.CEC.IDS
        NB.KEYS = DCOUNT(ACT.LAYOUT.FIELDS<1>,@VM)
        FOR IDW = 1 TO NB.KEYS
            L.KEY.DATA = TRIM(ACT.LAYOUT.FIELDS<9,IDW>) ;*," ","A")
            L.KEY.RANK = ACT.LAYOUT.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
        NEXT IDW

        OLD.CEC.TXN.CONCAT.ID = ''

        IF R.ACT.LAYOUT<CEC.LAY.PREVIOUS.OPER> THEN
            OLD.CEC.MSG.CONCAT.ID = ''
            LOCATE 'MOLD' IN CEC.IDS<1,1> SETTING FIL THEN
                IN.STRING = CEC.IDS<3,FIL,3>
                CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
                CEC.IDS<3,FIL,3> = OUT.STRING
                OLD.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '\' IN OLD.CEC.MSG.CONCAT.ID
                CHANGE @SM TO '\' IN OLD.CEC.MSG.CONCAT.ID
            END
*        IF OLD.CEC.MSG.CONCAT.ID EQ '' THEN
*            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.ORIG.ID':@FM:Y.REMIT.NUM
*           CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
*           GOSUB UPDATE.LOG.FILE
*        END

            LOCATE 'TOLD' IN CEC.IDS<1,1> SETTING FIL THEN
                NB.SM.VAL = DCOUNT(CEC.IDS<3,FIL>,@SM)
                IN.STRING = CEC.IDS<3,FIL,4>
                CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
                CEC.IDS<3,FIL,4> = OUT.STRING
                OLD.CEC.TXN.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '\' IN OLD.CEC.TXN.CONCAT.ID
                CHANGE @SM TO '\' IN OLD.CEC.TXN.CONCAT.ID
            END
            IF OLD.CEC.TXN.CONCAT.ID EQ '' THEN
                LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.TXN.ORIG.ID':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
            END
        END

        NEW.CEC.TXN.CONCAT.ID = ''
        LOCATE 'TNEW' IN CEC.IDS<1,1> SETTING FIL THEN
            IN.STRING = CEC.IDS<3,FIL,4>
            CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
            CEC.IDS<3,FIL,4> = OUT.STRING
            NEW.CEC.TXN.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '\' IN NEW.CEC.TXN.CONCAT.ID
            CHANGE @SM TO '\' IN NEW.CEC.TXN.CONCAT.ID
        END

        IF NEW.CEC.TXN.CONCAT.ID EQ '' THEN
            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.TXN.ID':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END

        LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
            IN.STRING = CEC.IDS<3,FIL,3>
            CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
            CEC.IDS<3,FIL,3> = OUT.STRING
            NEW.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
* CONVERT SM TO '\' IN NEW.CEC.MSG.CONCAT.ID
            CHANGE @SM TO '\' IN NEW.CEC.MSG.CONCAT.ID
        END
        IF NEW.CEC.MSG.CONCAT.ID EQ '' THEN
*        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.ID':FM:Y.REMIT.NUM
*        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
*        GOSUB UPDATE.LOG.FILE
        END ELSE
            IF SW.CEC.MSG.CONCAT.CREATED NE 'Y' THEN
                GOSUB CREATE.MSG.CONCAT.FILE
                SW.CEC.MSG.CONCAT.CREATED = 'Y'
            END
        END

        LOCATE 'REASON' IN CEC.IDS<1,1> SETTING FIL THEN
            R.NEW(CEC.IC.REASON.CODE) = CEC.IDS<3,FIL,1>
        END
 
        IF R.NEW(CEC.IC.PAYMENT.DETAILS) EQ '' THEN
            N.NARRATIVE = ''
            LOCATE 'NARR' IN CEC.IDS<1,1> SETTING FIL THEN
                N.NARRATIVE = CEC.IDS<3,FIL>
* CONVERT SM TO VM IN N.NARRATIVE
                CHANGE @SM TO @VM IN N.NARRATIVE
                IEB = 0
                NARRATIVE.DCNT = DCOUNT(N.NARRATIVE,@VM)
                FOR IQJ = 1 TO NARRATIVE.DCNT
                    IF N.NARRATIVE<1,IQJ> NE '' THEN
                        IEB += 1 ; R.NEW(CEC.IC.PAYMENT.DETAILS)<1,IEB> = N.NARRATIVE<1,IQJ>
                    END
* NEXT IEB
                NEXT IQJ
            END
        END

        IF R.NEW(CEC.IC.THEIR.ADDRESS) EQ '' THEN
            N.ADDRESSE = ''
            LOCATE 'ADDR' IN CEC.IDS<1,1> SETTING FIL THEN
                N.ADDRESSE = CEC.IDS<3,FIL>
* CONVERT SM TO VM IN N.ADDRESSE
                CHANGE @SM TO @VM IN N.ADDRESSE
                IEB = 0
                N.ADDRESSE.DCNT = DCOUNT(N.ADDRESSE,@VM)
                FOR IQJ = 1 TO N.ADDRESSE.DCNT
                    IF N.ADDRESSE<1,IQJ> NE '' THEN
                        IEB += 1 ; R.NEW(CEC.IC.THEIR.ADDRESS)<1,IEB> = N.ADDRESSE<1,IQJ>
                    END
* NEXT IEB
                NEXT IQJ
            END
        END

*     Verify, complete and adjust the already mapped R.NEW fields

        NB.KEYS = DCOUNT(ACT.LAYOUT.FIELDS<1>,@VM)
        FOR IDW = 1 TO NB.KEYS
            L.KEY.DATA = TRIM(ACT.LAYOUT.FIELDS<9,IDW>)
            IF L.KEY.DATA NE '' AND ACT.LAYOUT.FIELDS<5,IDW> THEN

*           Add the data value among archive fields

                R.NEW(CEC.IC.INWARD.DATA)<1,-1> = L.KEY.DATA
            END
        NEXT IDW

        R.NEW(CEC.IC.INWARD.REC) = ACT.DAT.RECORD

        R.NEW(CEC.IC.INITIAL.CURRENCY) = CLEAR.CCY

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                IF R.NEW(CEC.IC.CREDIT.AMOUNT) EQ '' AND R.NEW(CEC.IC.INITIAL.AMOUNT) THEN
                    R.NEW(CEC.IC.CREDIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                END
                IF R.NEW(CEC.IC.CREDIT.VALUE.DATE) EQ '' THEN R.NEW(CEC.IC.CREDIT.VALUE.DATE) = SETTLEMENT.DATE
                R.NEW(CEC.IC.INITIAL.AMOUNT) = R.NEW(CEC.IC.CREDIT.AMOUNT)
                ACCT.ID = R.NEW(CEC.IC.DEBIT.ACCT.NO)
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                IF R.NEW(CEC.IC.DEBIT.AMOUNT) EQ '' AND R.NEW(CEC.IC.INITIAL.AMOUNT) THEN
                    R.NEW(CEC.IC.DEBIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                END
                IF R.NEW(CEC.IC.DEBIT.VALUE.DATE) EQ '' THEN R.NEW(CEC.IC.DEBIT.VALUE.DATE) = SETTLEMENT.DATE
                R.NEW(CEC.IC.INITIAL.AMOUNT) = R.NEW(CEC.IC.DEBIT.AMOUNT)
                ACCT.ID = R.NEW(CEC.IC.CREDIT.ACCT.NO)
        END CASE

        TOTAL.FOR.COMMITMENT += R.NEW(CEC.IC.INITIAL.AMOUNT)
        IF LCCY EQ CLEAR.CCY THEN LCCY.FOR.COMMITMENT += R.NEW(CEC.IC.INITIAL.AMOUNT)

        IF R.NEW(CEC.IC.INITIAL.AMOUNT) THEN GOSUB CALCULATE.ACCOUNT

        IF R.NEW(CEC.IC.PROCESSING.DATE) EQ '' THEN R.NEW(CEC.IC.PROCESSING.DATE) = SETTLEMENT.DATE
     
        R.PROC.DATE = R.NEW(CEC.IC.PROCESSING.DATE)
        CALL CEC.CDT(REGION,R.PROC.DATE,"000W")
        R.NEW(CEC.IC.PROCESSING.DATE) = R.PROC.DATE

        IF SETTLEMENT.DATE EQ '' THEN
            SETTLEMENT.DATE = R.NEW(CEC.IC.PROCESSING.DATE)
            IF PENDING.DATE AND SETTLEMENT.DATE GT PENDING.DATE
            THEN SW.PENDING.USED = 'Y'
            ELSE SW.PENDING.USED = 'N'
        END ELSE
            IF R.NEW(CEC.IC.PROCESSING.DATE) LT SETTLEMENT.DATE THEN
                SETTLEMENT.DATE = R.NEW(CEC.IC.PROCESSING.DATE)
            END
        END

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                N.AMT = -1 * R.NEW(CEC.IC.INITIAL.AMOUNT)
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                N.AMT = R.NEW(CEC.IC.INITIAL.AMOUNT)
            CASE 1
                N.AMT = ''
        END CASE

        GOSUB CREATE.TXN.CONCAT.FILE

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACCT.ID
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACCOUNT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.VALUE.DATE) = ''
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACT.NOSTRO.ACCT.NO
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACT.NOSTRO.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                R.NEW(CEC.IC.DEBIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACT.NOSTRO.ACCT.NO
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACT.NOSTRO.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                R.NEW(CEC.IC.CREDIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACCT.ID
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACCOUNT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.VALUE.DATE) = ''
            CASE 1 ; * No entries except fees
                IF ACT.COMMISSION.CODE EQ 'DEBIT PLUS CHARGES' OR ACT.CHARGE.CODE EQ 'DEBIT PLUS CHARGES' THEN
                    IF ACCT.ID MATCH '3A9N' ELSE R.NEW(CEC.IC.CHARGE.ACCT.NO) = ACCT.ID
                END
        END CASE

        CUSTOMER.SIGN = R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN>

        GOSUB CHECK.VALUE.DATES
        IF E THEN GOSUB UPDATE.OVERRIDE

        R.NEW(CEC.IC.TRANSACTION.TYPE) = YR.FTTC.ID
  
        RETURN

***********************************************************************
UPDATE.REFERENCE:
***********************************************************************

* CONVERT ',' TO FM IN L.KEY.RANK
        CHANGE ',' TO @FM IN L.KEY.RANK
        KEY.RANK.DCNT = DCOUNT(L.KEY.RANK,@FM)
        FOR IRQ = 1 TO KEY.RANK.DCNT
            L.KEY.PREFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",1)
            L.KEY.SUFFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",2)
            L.KEY.WRAP = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",3)
            LOCATE L.KEY.PREFIX IN CEC.IDS<1,1> SETTING LFI THEN
                IF CEC.IDS<2,LFI> EQ '' THEN
                    CEC.IDS<2,LFI> = L.KEY.SUFFIX
                    CEC.IDS<3,LFI> = L.KEY.DATA
                END ELSE
                    LOCATE L.KEY.SUFFIX IN CEC.IDS<2,LFI,1> SETTING ITW THEN
                        IF L.KEY.WRAP EQ '' THEN
                            CEC.IDS<3,LFI,ITW> = L.KEY.DATA
                        END ELSE
                            IF L.KEY.DATA THEN CEC.IDS<3,LFI,ITW> := ' ':L.KEY.DATA
                        END
                    END ELSE
                        NB.IDENT = COUNT(CEC.IDS<2,LFI>,@SM) + 1
                        IF L.KEY.SUFFIX GT CEC.IDS<2,LFI,NB.IDENT> THEN
                            CEC.IDS<2,LFI,NB.IDENT+1> = L.KEY.SUFFIX
                            CEC.IDS<3,LFI,NB.IDENT+1> = L.KEY.DATA
                        END ELSE
                            FOR ITD = 1 TO NB.IDENT
                                IF L.KEY.SUFFIX LT CEC.IDS<2,LFI,ITD> THEN
                                    CEC.IDS<2,LFI,ITD> = L.KEY.SUFFIX:@SM:CEC.IDS<2,LFI,ITD>
                                    CEC.IDS<3,LFI,ITD> = L.KEY.DATA:@SM:CEC.IDS<3,LFI,ITD>
                                    EXIT
                                END
                            NEXT ITD
                        END
                    END
                END
            END ELSE
                IF CEC.IDS EQ '' THEN
                    CEC.IDS<1> = L.KEY.PREFIX
                    CEC.IDS<2> = L.KEY.SUFFIX
                    CEC.IDS<3> = L.KEY.DATA
                END ELSE
                    CEC.IDS<1> := @VM:L.KEY.PREFIX
                    CEC.IDS<2> := @VM:L.KEY.SUFFIX
                    CEC.IDS<3> := @VM:L.KEY.DATA
                END
            END
        NEXT IRQ

        RETURN

***********************************************************************
CALCULATE.ACCOUNT:
***********************************************************************

        R.NEW(CEC.IC.INITIAL.ACCOUNT) = ACCT.ID
        GOSUB READ.ACCOUNT.FILE
        IF ER THEN
            MSG.ERR = 'EB-CEC.CUST.NOT.FOUND'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.NEW(CEC.IC.IN.REASON.OVE)<1,-1> = MSG.ERR
            R.NEW(CEC.IC.INITIAL.ACCOUNT) = ''

*        Take the TRANSIT account by default

            GOSUB CALCULATE.ACT.TRANSIT.ACCT
            ACCT.ID = ACT.TRANSIT.ACCT.NO
            R.ACCOUNT = R.ACT.TRANSIT.ACCT
        END ELSE
            R.NEW(CEC.IC.PROFIT.CENTRE.DEPT) = R.ACCOUNT<AC.ACCOUNT.OFFICER,1>
            R.NEW(CEC.IC.INITIAL.CUSTOMER) = R.ACCOUNT<AC.CUSTOMER>
        END
        IF R.ACT.LAYOUT<CEC.LAY.OFFSET.ACCT.NO> THEN

*        A valid substitution account should replace the customer's one

            Y.SAVE.ACCOUNT = ACCT.ID
            R.SAVE.ACCOUNT = R.ACCOUNT
            ACCT.ID = R.ACT.LAYOUT<CEC.LAY.OFFSET.ACCT.NO>
            GOSUB READ.ACCOUNT.FILE
            IF ER THEN
                ACCT.ID = Y.SAVE.ACCOUNT
                R.ACCOUNT = R.SAVE.ACCOUNT
            END
        END
        IF ACT.NOSTRO.CATEGORY THEN

*        Calculate the nostro account if fixed by category

            N.CATEGORY = ACT.NOSTRO.CATEGORY
            GOSUB GET.ACCOUNT.FROM.CATEGORY
            ACT.NOSTRO.ACCT.NO = N.ACCT.NO
            R.ACT.NOSTRO.ACCT = N.ACCOUNT
        END

        RETURN

***********************************************************************
CREATE.MSG.CONCAT.FILE:
***********************************************************************

*     Create an entry in the CEC.MSG.CONCAT file to retrieve the linked CEC messages

        IF NEW.CEC.MSG.CONCAT.ID NE '' THEN

*        An original message key is stored in a concat file

            YR.MSGC.ID = NEW.CEC.MSG.CONCAT.ID
*        ER = '' R.MSGC = ''
            ER = '' ; R.MSGC = ''
            CALL F.READ(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC,F.CEC.MSG.CONCAT,ER)
            IF ER THEN
                R.MSGC<1> = CEC.INWARD.FILES.ID
                R.MSGC<2> = Y.REMIT.NUM
            END ELSE
                LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.MSG.ID':@FM:Y.REMIT.NUM
                CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                GOSUB UPDATE.LOG.FILE
                NB.SIMILAR = DCOUNT(R.MSGC<1>,@VM)
                R.MSGC<1,NB.SIMILAR+1> = CEC.INWARD.FILES.ID
                R.MSGC<2,NB.SIMILAR+1> = Y.REMIT.NUM
            END
        END

        RETURN

***********************************************************************
CREATE.TXN.CONCAT.FILE:
***********************************************************************

*     Create an entry in the CEC.TXN.CONCAT file to retrieve the linked CEC operations

        SW.ALREADY = 0
        YR.TXNC.ID = NEW.CEC.TXN.CONCAT.ID
        ER = '' ; R.TXNC = ''
        CALL F.READ(CEC.TXN.CONCAT.FILE,YR.TXNC.ID,R.TXNC,F.CEC.TXN.CONCAT,ER)
        IF ER THEN
            R.TXNC<1> = 'I.':ID.NEW
            R.TXNC<2> = N.AMT
        END ELSE
            SW.ALREADY = 1
            NB.SIMILAR = DCOUNT(R.TXNC<1>,@VM)
            IF DUPLICATE.PROC NE 'NO' THEN
                SW.FOUND = ''
                FOR IJD = NB.SIMILAR TO 1 STEP -1
                    IF R.TXNC<1,IJD,1>[1,1] EQ 'I' THEN
                        YR.SIC.ID = R.TXNC<1,IJD,1>[3,LEN(R.TXNC<1,IJD,1>)-2]
                        ER = '' ; R.SIC = ''
                        CALL F.READ(CEC.INWARD.FILE,YR.SIC.ID,R.SIC,F.CEC.INWARD,ER)
                        IF NOT(ER) THEN
                            IF R.NEW(CEC.IC.INWARD.REC) EQ R.SIC<CEC.IC.INWARD.REC> THEN
                                DUPLICATE.MSG = 'EB-CEC.ALREADY.PROCESSED.TXN'
                                CALL LOT.TRANSLATE.ERROR(DUPLICATE.MSG,'')
                                R.NEW(CEC.IC.IN.REASON.OVE)<1,-1> = DUPLICATE.MSG
                                EXIT
                            END
                        END
                    END
                NEXT IJD
            END
            R.TXNC<1,NB.SIMILAR+1> = 'I.':ID.NEW
            R.TXNC<2,NB.SIMILAR+1> = N.AMT
        END

        R.NEW(CEC.IC.HIST.MSG.ID) = NEW.CEC.MSG.CONCAT.ID
        R.NEW(CEC.IC.HIST.TXN.ID) = NEW.CEC.TXN.CONCAT.ID

        IF R.ACT.LAYOUT<CEC.LAY.PREVIOUS.OPER> NE '' AND OLD.CEC.TXN.CONCAT.ID NE '' THEN

*        Check and update the history of a connex operation regarding the initial/previous one

            N.EXTRACT = ''
            FOR IDM = CEC.IC.THEIR.NAME TO CEC.IC.PROFIT.CENTRE.DEPT
                N.EXTRACT<IDM-CEC.IC.THEIR.NAME+1> = R.NEW(IDM)
            NEXT IDM
            N.MSG = OLD.CEC.MSG.CONCAT.ID:@VM:NEW.CEC.MSG.CONCAT.ID
            N.TXN = OLD.CEC.TXN.CONCAT.ID:@VM:NEW.CEC.TXN.CONCAT.ID
*        CALL Y.CEC.HIST.UPDATE('INWARD',ID.NEW,N.MSG,N.TXN,N.AMT,N.ALTN,'UPDATE',N.EXTRACT,N.HISTORY,N.ERR)
*        IF N.ERR THEN R.NEW(CEC.IC.IN.REASON.OVE)<1,-1> = N.ERR

*        To complete the unmapped fields absent from the connex message

            FOR IDM = CEC.IC.THEIR.NAME TO CEC.IC.PROFIT.CENTRE.DEPT
                R.NEW(IDM) = N.EXTRACT<IDM-CEC.IC.THEIR.NAME+1>
            NEXT IDM
*        IF N.HISTORY THEN R.NEW(CEC.IC.HIST.OPE.ID) = N.HISTORY
            R.NEW(CEC.IC.HIST.MSG.ID)<1,2> = OLD.CEC.MSG.CONCAT.ID
            R.NEW(CEC.IC.HIST.TXN.ID)<1,2> = OLD.CEC.TXN.CONCAT.ID
        END

        RETURN

***********************************************************************
GENERATE.ACCOUNTING.ENTRIES:
***********************************************************************

        E = '' ; V$ERROR = '' ; ETEXT = '' ; TEXT = ''
        SW.EB.ACCOUNTING = '' ; SW.REFUSAL = ''
      
        CURR.NO = 0
        R.NEW(CEC.IC.OVERRIDE) = ''

        SAVE.R.FTTC = R.FTTC
        CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
        CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
        CALL Y.CLEAR.SITCOM
        R.FTTC = SAVE.R.FTTC
        REC.PROCESS.TYPE = ACT.PROCESS.TYPE
        NEXT.REASON.CODE = ''

        T.IN.REASON.OVE = R.NEW(CEC.IC.IN.REASON.OVE)
        R.NEW(CEC.IC.IN.REASON.OVE) = ''
        REASON.OVE.DCNT = DCOUNT(T.IN.REASON.OVE,@VM)
        FOR IUF = 1 TO REASON.OVE.DCNT
            DUPLICATE.MSG = 'EB-CEC.ALREADY.PROCESSED.TXN'
            CALL LOT.TRANSLATE.ERROR(DUPLICATE.MSG,'')
            IF T.IN.REASON.OVE<1,IUF> EQ DUPLICATE.MSG THEN
                REC.PROCESS.TYPE = DUPLICATE.PROC
                IF DUPLICATE.PROC EQ 'REJ' OR DUPLICATE.PROC EQ 'MAN' THEN
                    E = T.IN.REASON.OVE<1,IUF>
                    GOSUB UPDATE.OVERRIDE
                END ELSE
                    TEXT = T.IN.REASON.OVE<1,IUF>
                    GOSUB UPDATE.OVERRIDE
                END
            END ELSE
                E = T.IN.REASON.OVE<1,IUF>
                GOSUB UPDATE.OVERRIDE
            END
        NEXT IUF
         
        IF R.NEW(CEC.IC.COMMISSION.CODE) EQ '' THEN R.NEW(CEC.IC.COMMISSION.CODE) = ACT.COMMISSION.CODE
        IF R.NEW(CEC.IC.CHARGE.CODE) EQ '' THEN R.NEW(CEC.IC.CHARGE.CODE) = ACT.CHARGE.CODE

*     To avoid a double read on the account file for non pending operations

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                IF SW.EXTRACT.FROM.PENDING EQ '' THEN R.DEBIT.ACCT = R.ACCOUNT ;*EPI 04.01.2008
                R.CREDIT.ACCT = R.ACT.NOSTRO.ACCT
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACT.NOSTRO.ACCT.NO
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACT.NOSTRO.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                R.NEW(CEC.IC.CREDIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
*           IF R.NEW(CEC.IC.DEBIT.ACCT.NO) MATCH '3A9N' THEN
                IF R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO THEN
                    R.NEW(CEC.IC.DEBIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
                    R.NEW(CEC.IC.COMMISSION.CODE) = 'WAIVE'
                    R.NEW(CEC.IC.CHARGE.CODE) = 'WAIVE'
                    IF REC.PROCESS.TYPE EQ '' THEN REC.PROCESS.TYPE = 'ALL'
                END
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                IF SW.EXTRACT.FROM.PENDING EQ '' THEN R.CREDIT.ACCT = R.ACCOUNT ;*EPI 04.01.2008
                R.DEBIT.ACCT = R.ACT.NOSTRO.ACCT
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACT.NOSTRO.ACCT.NO
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACT.NOSTRO.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.AMOUNT) = R.NEW(CEC.IC.INITIAL.AMOUNT)
                R.NEW(CEC.IC.DEBIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
*           IF R.NEW(CEC.IC.CREDIT.ACCT.NO) MATCH '3A9N' THEN
                IF R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO THEN
                    R.NEW(CEC.IC.CREDIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
                    R.NEW(CEC.IC.COMMISSION.CODE) = 'WAIVE'
                    R.NEW(CEC.IC.CHARGE.CODE) = 'WAIVE'
                    IF REC.PROCESS.TYPE EQ '' THEN REC.PROCESS.TYPE = 'ALL'
                END
        END CASE

        CUSTOMER.SIGN = R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN>

        GOSUB PRODUCE.ENTRIES

        RETURN

***********************************************************************
PRODUCE.ENTRIES:
***********************************************************************

*     Validation routines are run from here

        FOR ILD = 1 TO NB.VAL.RTN
            SAVE.COMI = COMI ; COMI = ''
            Y.VAL.RTN = VAL.RTN<1,ILD>
            CALL @Y.VAL.RTN
            IF ETEXT
            THEN E = ETEXT
            ELSE IF COMI THEN TEXT = COMI
            GOSUB UPDATE.OVERRIDE
            COMI = SAVE.COMI
        NEXT ILD

        IF R.NEW(CEC.IC.TRANSACTION.TYPE) NE YR.FTTC.ID THEN
            YR.FTTC.ID = R.NEW(CEC.IC.TRANSACTION.TYPE)
            IF R.NEW(CEC.IC.TRANSACTION.TYPE) EQ ACT.FTTC.ID
            THEN R.FTTC = R.ACT.FTTC
            ELSE R.FTTC = ''
        END

        GOSUB CHECK.VALUE.DATES
        IF E OR TEXT THEN GOSUB UPDATE.OVERRIDE

*     Check accounts and calculate fees

        GOSUB CALCULATE.CHARGES
        IF E OR TEXT THEN GOSUB UPDATE.OVERRIDE

        IF LCCY NE CLEAR.CCY AND R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ CUSTOMER.SIGN THEN
            BEGIN CASE
                CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                    LCCY.FOR.COMMITMENT += LCCY.AMOUNT.CREDITED
                CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                    LCCY.FOR.COMMITMENT += LCCY.AMOUNT.DEBITED
            END CASE
        END

        RETURN

***********************************************************************
CALCULATE.ACT.TRANSIT.ACCT:
***********************************************************************

        IF ACT.TRANSIT.CATEGORY THEN

*        Calculate the transit account if fixed by category

            N.CATEGORY = ACT.TRANSIT.CATEGORY
            GOSUB GET.ACCOUNT.FROM.CATEGORY
            ACT.TRANSIT.ACCT.NO = N.ACCT.NO
            R.ACT.TRANSIT.ACCT = N.ACCOUNT
        END

        RETURN

***********************************************************************
UPDATE.OVERRIDE:
***********************************************************************

        E = '' ; V$ERROR = '' ; ETEXT = '' ; TEXT = ''

        RETURN

***********************************************************************
INITIALISE:
***********************************************************************

        REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
        IF LEN(REGION) EQ 2 THEN REGION = REGION:'00'

        JNL.ID = Y.PROCESS.DATE

        TAPE.FILE.NAME = "FT.IN.TAPE" ; FT.IN.TAPE = ''

        IF R.SPF.SYSTEM<SPF.OPERATING.SYSTEM>[1,4] EQ 'UNIX' THEN SW.UNIX = 'Y' ELSE SW.UNIX = 'N'

        TIME.STAMP = TIMEDATE()
        X = OCONV(DATE(),"D-")
        DT = X[9,2]:X[1,2]:X[4,2]:TIME.STAMP[1,2]:TIME.STAMP[4,2]

        CEC.INWARD.LOG.FILE = 'F.CEC.INWARD.LOG'
        F.CEC.INWARD.LOG = ''
        CALL OPF(CEC.INWARD.LOG.FILE, F.CEC.INWARD.LOG)

        CALL Y.LOAD.CECPAR(LOG.MESSAGE)
        IF LOG.MESSAGE THEN RETURN

        I.SEP = R.CEC.PARAMETER<CEC.PAR.SEPARATOR>

        CALL Y.LOAD.SITCHQ
        CALL Y.LOAD.CECDEF
        CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
        CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
        CALL Y.CLEAR.SITCOM
        CALL Y.CLEAR.CECFMT
        CALL Y.CLEAR.CECICF
        CALL Y.CLEAR.CECREC

        CALL Y.LOAD.CECHEA('INWARD')

*     Set up the valid record types...

        CEC.HEADER.FILE = 'F.CEC.HEADER'
        F.CEC.HEADER = ''
        CALL OPF(CEC.HEADER.FILE, F.CEC.HEADER)
        YR.CEC.HEADER.ID = '' ; R.CEC.HEADER = ''

        CEC.INWARD.PENDING.FILE = 'F.CEC.INWARD.PENDING'
        F.CEC.INWARD.PENDING = ''
        CALL OPF(CEC.INWARD.PENDING.FILE, F.CEC.INWARD.PENDING)
        YR.CEC.INWARD.PENDING.ID = '' ; R.CEC.INWARD.PENDING = ''

        CEC.INWARD.FILE = 'F.CEC.INWARD'
        F.CEC.INWARD = ''
        CALL OPF(CEC.INWARD.FILE, F.CEC.INWARD)
        YR.CEC.INWARD.ID = '' ; R.CEC.INWARD = ''

        FT.TXN.TYPE.CONDITION.FILE = 'F.FT.TXN.TYPE.CONDITION'
        F.FT.TXN.TYPE.CONDITION = ''
        CALL OPF(FT.TXN.TYPE.CONDITION.FILE, F.FT.TXN.TYPE.CONDITION)
        YR.FTTC.ID = '' ; R.FTTC = ''

        CEC.INWARD.FILES.FILE = 'F.CEC.INWARD.FILES'
        F.CEC.INWARD.FILES = ''
        CALL OPF(CEC.INWARD.FILES.FILE, F.CEC.INWARD.FILES)
        CEC.INWARD.FILES.ID = '' ; R.CEC.INWARD.FILES = ''

        CEC.INWARD.CONCAT.FILE = 'F.CEC.INWARD.CONCAT'
        F.CEC.INWARD.CONCAT = ''
        CALL OPF(CEC.INWARD.CONCAT.FILE, F.CEC.INWARD.CONCAT)
        YR.CEC.INWARD.CONCAT.ID = '' ; R.CEC.INWARD.CONCAT = ''

        CEC.TXN.CONCAT.FILE = 'F.CEC.TXN.CONCAT'
        F.CEC.TXN.CONCAT = ''
        CALL OPF(CEC.TXN.CONCAT.FILE, F.CEC.TXN.CONCAT)
        YR.TXNC.ID = '' ; R.TXNC = ''

        CEC.MSG.CONCAT.FILE = 'F.CEC.MSG.CONCAT'
        F.CEC.MSG.CONCAT = ''
        CALL OPF(CEC.MSG.CONCAT.FILE, F.CEC.MSG.CONCAT)
        YR.MSGC.ID = '' ; R.MSGC = ''

        CEC.LOG.LEVEL.FILE = 'F.CEC.LOG.LEVEL'
        F.CEC.LOG.LEVEL = ''
        CALL OPF(CEC.LOG.LEVEL.FILE, F.CEC.LOG.LEVEL)
        R.CEC.LOG.LEVEL = ''

        ACCOUNT.FILE = 'F.ACCOUNT' ; FBNK.ACCOUNT = ''
        CALL OPF(ACCOUNT.FILE, FBNK.ACCOUNT)

        ACCOUNT.CLASS.FILE = 'F.ACCOUNT.CLASS'
        F.ACCOUNT.CLASS = ''
        CALL OPF(ACCOUNT.CLASS.FILE, F.ACCOUNT.CLASS)
        YR.ACCOUNT.CLASS.ID = '' ; R.ACCOUNT.CLASS = ''

        CUSTOMER.FILE = 'F.CUSTOMER' ; F.CUSTOMER = ''
        CALL OPF(CUSTOMER.FILE, F.CUSTOMER)
        YR.CUSTOMER.ID = '' ; R.CUSTOMER = ''

*     Cumulate the override class of ACCOUNT (for EB.ACCOUNTING) and FUNDS.TRANSFER:

        OVERRIDE.APPL = 'CEC.FOLLOW.UP':@VM:'ACCOUNT':@VM:'FUNDS.TRANSFER'
        CALL SIT.T.OV.CLASS

        CALL Y.CEC.LOCREF.POS('FUNDS.TRANSFER',R.FT.LOCREF,LOG.MESSAGE)
        IF LOG.MESSAGE THEN RETURN

*     Load the routine that calculates the T24 ACCOUNT from the BBAN

        CALL Y.LOAD.CECBBAN

        RETURN

************************************************************************
GET.ACCOUNT.FROM.CATEGORY:
************************************************************************

        ACCT.OFFICER = R.ACCOUNT<AC.ACCOUNT.OFFICER,1>
        IF ACCT.OFFICER EQ '' THEN ACCT.OFFICER = R.CEC.PARAMETER<CEC.PAR.SUFFIX.BY.DEFAULT>
        IF ACCT.OFFICER EQ '' THEN ACCT.OFFICER = 1
        N.ACCT.NO = CLEAR.CCY:N.CATEGORY:STR('0',4-LEN(ACCT.OFFICER)):ACCT.OFFICER
        N.ACCOUNT = '' ; ER = ''
        CALL F.READ(ACCOUNT.FILE,N.ACCT.NO,N.ACCOUNT,FBNK.ACCOUNT,ER)
        IF ER THEN

*        If the account to be created from account class does not yet exist, take the model

            N.ACCT.MODEL = LCCY:N.CATEGORY:'0001'
            N.ACCOUNT = '' ; ER = ''
            CALL F.READ(ACCOUNT.FILE,N.ACCT.MODEL,N.ACCOUNT,FBNK.ACCOUNT,ER)
            IF NOT(ER) THEN
                N.ACCOUNT<AC.ACCOUNT.OFFICER> = ACCT.OFFICER
                N.ACCOUNT<AC.CURRENCY> = CLEAR.CCY
            END
        END

        RETURN

***********************************************************************
READ.CUSTOMER.FILE:
***********************************************************************

        ER = ''
        CALL F.READ(CUSTOMER.FILE,YR.CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,ER)
	  

        RETURN

***********************************************************************
READ.CEC.HEADER.FILE:
***********************************************************************

        ER = ''
        CALL F.READ(CEC.HEADER.FILE,YR.CEC.HEADER.ID,R.CEC.HEADER,F.CEC.HEADER,ER)

        RETURN

***********************************************************************
READ.CEC.INWARD.PENDING.FILE:
***********************************************************************

        ER = ''
        CALL F.READ(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID,R.CEC.INWARD.PENDING,F.CEC.INWARD.PENDING,ER)

        RETURN

***********************************************************************
READ.CEC.INWARD.FILE:
***********************************************************************

        ER = ''
        CALL F.READ(CEC.INWARD.FILE,YR.CEC.INWARD.ID,R.CEC.INWARD,F.CEC.INWARD,ER)

        RETURN

***********************************************************************
READ.CEC.LOG.LEVEL.FILE:
***********************************************************************

        ER = ''
        CALL F.READ(CEC.LOG.LEVEL.FILE,YR.CEC.LOG.LEVEL.ID,R.CEC.LOG.LEVEL,F.CEC.LOG.LEVEL,ER)

        RETURN

***********************************************************************
READ.CEC.INWARD.FILES.FILE:
***********************************************************************

*     Check if a file with a similar header already exist
*     Preference goes to an identical header, otherwise, the last one is incremented by 1
        SW.RECOVERY = ''
        NB.DOTS = COUNT(CEC.INWARD.FILES.ID,".")
        SELECT.COMMAND = 'SELECT ':CEC.INWARD.FILES.FILE:' WITH @ID LIKE ':CEC.INWARD.FILES.ID:'... BY @ID'
        AE.ID.LIST = '' ; NO.SELECTED = ''
        CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
        YR.SICF.ID = CEC.INWARD.FILES.ID
        IF AE.ID.LIST THEN
            GOSUB SORT.AE.ID.LIST
            YR.SICF.ID.CALC = ''
            GO.ON = ''
            LOOP
                REMOVE YR.SICF.ID FROM AE.ID.LIST SETTING GO.ON
                R.SICF = '' ; ER = ''
                CALL F.READ(CEC.INWARD.FILES.FILE,YR.SICF.ID,R.SICF,F.CEC.INWARD.FILES,ER)
                IF NOT(ER) THEN
                    LAST.PROCESS.DATE = OCONV(ICONV(R.SICF<CEC.ICF.PROCESS.DATE>,"D"),"D4/E")
                    IF SW.TO.FILES.ID EQ 'N' THEN
                        IF ACT.REH.RECORD EQ R.SICF<CEC.ICF.REM.HEADER,1> THEN
                            IF R.SICF<CEC.ICF.FILE.TRAILER> THEN    ; * Already processed to the end
                                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
                                LOG.JUMP = 'Y' ; RETURN
                            END ELSE            ; * Recovery from a crash
                                SW.RECOVERY = 'Y'
                                LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.CRASH.RECOVERY'
                                IF R.SICF<CEC.ICF.FILE.NAME> THEN PINTAPE = R.SICF<CEC.ICF.FILE.NAME>
                                R.CEC.INWARD.FILES = R.SICF
                                CEC.INWARD.FILES.ID = YR.SICF.ID
                            END
                            YR.SICF.ID.CALC = YR.SICF.ID
                            GO.ON = ''
                        END ELSE
                            IF YR.SICF.ID.CALC EQ '' THEN
                                LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.SIMILAR.FILE':@FM:LAST.PROCESS.DATE
                            END
                            IF YR.SICF.ID EQ CEC.INWARD.FILES.ID THEN
                                YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                            END ELSE
                                YR.SICF.ID.CALC = YR.SICF.ID
                            END
                        END
                    END ELSE
                        IF SW.HEADER.EXPECTED EQ '' THEN       ; * No file header required
                            IF ACT.REH.RECORD EQ R.SICF<CEC.ICF.REM.HEADER,1> THEN  ; * Same message being treated again
                                IF R.SICF<CEC.ICF.STMT.NOS,1> THEN   ; * Already processed to the end
                                    LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.MSG':@FM:LAST.PROCESS.DATE
                                    LOG.JUMP = 'Y' ; RETURN
                                END ELSE            ; * Recovery from a crash
                                    SW.RECOVERY = 'Y'
                                    LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.CRASH.RECOVERY'
                                    IF R.SICF<CEC.ICF.FILE.NAME> THEN PINTAPE = R.SICF<CEC.ICF.FILE.NAME>
                                    R.CEC.INWARD.FILES = R.SICF
                                    CEC.INWARD.FILES.ID = YR.SICF.ID
                                END
                                YR.SICF.ID.CALC = YR.SICF.ID
                                GO.ON = ''
                            END ELSE
                                IF YR.SICF.ID.CALC EQ '' THEN
                                    LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.SIMILAR.MSG':@FM:LAST.PROCESS.DATE
                                END
                                IF YR.SICF.ID EQ CEC.INWARD.FILES.ID THEN
                                    YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                                END ELSE
                                    YR.SICF.ID.CALC = YR.SICF.ID
                                END
                            END
                        END ELSE
                            IF ACT.SUH.RECORD EQ R.SICF<CEC.ICF.FILE.HEADER> THEN   ; * Same File being treated again
                                IF R.SICF<CEC.ICF.FILE.TRAILER> THEN    ; * Already processed to the end
                                    LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
                                END ELSE            ; * Recovery from a crash
                                    SW.RECOVERY = 'Y'
                                    LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.CRASH.RECOVERY'
                                    IF R.SICF<CEC.ICF.FILE.NAME> THEN PINTAPE = R.SICF<CEC.ICF.FILE.NAME>
                                    R.CEC.INWARD.FILES = R.SICF
                                    CEC.INWARD.FILES.ID = YR.SICF.ID
                                END
                                YR.SICF.ID.CALC = YR.SICF.ID
                                GO.ON = ''
                            END ELSE
                                IF YR.SICF.ID.CALC EQ '' THEN
                                    LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.SIMILAR.FILE':@FM:LAST.PROCESS.DATE
                                END
                                IF YR.SICF.ID EQ CEC.INWARD.FILES.ID THEN
                                    YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                                END ELSE
                                    YR.SICF.ID.CALC = YR.SICF.ID
                                END
                            END
                        END
                    END
                END
            UNTIL NOT(GO.ON)
            REPEAT
            YR.SICF.ID = YR.SICF.ID.CALC
        END

        IF LEN(YR.SICF.ID) NE LEN(CEC.INWARD.FILES.ID) THEN
            LAST.NUM = FIELD(YR.SICF.ID,".",NB.DOTS+2)+0
            LAST.NUM += 1
            CEC.INWARD.FILES.ID := '.':LAST.NUM
        END

        RETURN

***********************************************************************
SORT.AE.ID.LIST:
***********************************************************************

*     Ascending sort on the key suffix number

        NB.AE.ID.LIST = DCOUNT(AE.ID.LIST,@FM)
        SORTED.KEY3 = ""
        SORTED.LIST = ""
        FOR ITR = 1 TO NB.AE.ID.LIST
            SICF.KEY3 = FIELD(AE.ID.LIST<ITR>,".",NB.DOTS+2)
            IF SICF.KEY3 EQ '' THEN SICF.KEY3 = 0
            IF SORTED.LIST EQ '' THEN
                SORTED.KEY3 = SICF.KEY3
                SORTED.LIST = AE.ID.LIST<ITR>
            END ELSE
                LOCATE SICF.KEY3 IN SORTED.KEY3<1> SETTING FOUN ELSE
                    NB.SORTED.LIST = DCOUNT(SORTED.LIST,@FM)
                    IF SICF.KEY3 GT SORTED.KEY3<NB.SORTED.LIST> THEN
                        SORTED.KEY3 := @FM:SICF.KEY3
                        SORTED.LIST := @FM:AE.ID.LIST<ITR>
                    END ELSE
                        FOR ITZ = 1 TO NB.SORTED.LIST
                            IF SICF.KEY3 LT SORTED.KEY3<ITZ> THEN
                                SORTED.KEY3<ITZ> = SICF.KEY3:@FM:SORTED.KEY3<ITZ>
                                SORTED.LIST<ITZ> = AE.ID.LIST<ITR>:@FM:SORTED.LIST<ITZ>
                                EXIT
                            END
                        NEXT ITZ
                    END
                END
            END
        NEXT ITR
        AE.ID.LIST = SORTED.LIST

        RETURN

***********************************************************************
EXTRACT.ACCOUNT.CLASS.OR.ACCOUNT:
***********************************************************************

        GOSUB READ.ACCOUNT.CLASS
        IF ACC.CLASS.REC<AC.CLS.CATEGORY,1> THEN
            N.CATEGORY = ACC.CLASS.REC<AC.CLS.CATEGORY,1>
            N.ACCT.NO = ''
            R.ACCOUNT = ''
        END ELSE
            N.CATEGORY = ''
            ACCT.ID = ACCL.ID
            GOSUB READ.ACCOUNT.FILE
            IF ER THEN N.ACCT.NO = '' ELSE N.ACCT.NO = ACCL.ID
        END

        RETURN

***********************************************************************
READ.ACCOUNT.CLASS:
***********************************************************************

        ER = ''
        ACC.CLASS.REC = ''
        CALL F.READ(ACCOUNT.CLASS.FILE,ACCL.ID,ACC.CLASS.REC,F.ACCOUNT.CLASS,ER)

        RETURN

***********************************************************************
UPDATE.LOG.FILE:
***********************************************************************

        IF LOG.LEVEL EQ '' THEN LOG.LEVEL = 0

        IF LOG.LEVEL GT WORST.LEVEL THEN WORST.LEVEL = LOG.LEVEL

        IF PINTAPE EQ '' THEN

*        General problem not linked to a given file

            NB.LOG.PROBLEMS = DCOUNT(R.CEC.INWARD.LOG<CEC.ICL.PROBLEM.TIME>,@VM)
            R.CEC.INWARD.LOG<CEC.ICL.PROBLEM.TIME,NB.LOG.PROBLEMS+1> = OCONV(TIME(),"MTS")
            R.CEC.INWARD.LOG<CEC.ICL.PROBLEM.MESS,NB.LOG.PROBLEMS+1> = LOG.MESSAGE
            R.CEC.INWARD.LOG<CEC.ICL.PROBLEM.LEVEL,NB.LOG.PROBLEMS+1> = LOG.LEVEL
        END ELSE

*        Specific problem linked to a given file

            I.EVENT = 0
            NB.LOG.FILES = DCOUNT(R.CEC.INWARD.LOG<CEC.ICL.FILE.NAME>,@VM)
            IF NOT(NB.LOG.FILES) THEN
                I.LOG = 1
            END ELSE
                PINTAPE.PREV = R.CEC.INWARD.LOG<CEC.ICL.FILE.NAME,NB.LOG.FILES>
                IN.FILE.ID.PREV = R.CEC.INWARD.LOG<CEC.ICL.IN.FILE.ID,NB.LOG.FILES>
                IF PINTAPE NE PINTAPE.PREV OR CEC.INWARD.FILES.ID NE IN.FILE.ID.PREV OR LOG.JUMP THEN
                    I.LOG = NB.LOG.FILES + 1
                END ELSE
                    IF LOT.MESG.ID EQ 'EB-CEC.NO.PROBLEM.FOUND' THEN
                        LOG.MESSAGE = '' ; LOG.LEVEL = '' ; RETURN
                    END ELSE
                        I.LOG = NB.LOG.FILES
                        I.EVENT = DCOUNT(R.CEC.INWARD.LOG<CEC.ICL.EVENT.TIME,I.LOG>,@SM)
                    END
                END
            END
            R.CEC.INWARD.LOG<CEC.ICL.IN.FILE.ID,I.LOG> = CEC.INWARD.FILES.ID
            R.CEC.INWARD.LOG<CEC.ICL.FILE.NAME,I.LOG> = PINTAPE
            R.CEC.INWARD.LOG<CEC.ICL.USER.ID,I.LOG> = OPERATOR
            R.CEC.INWARD.LOG<CEC.ICL.PROCESS.LEVEL,I.LOG> = WORST.LEVEL
            IF LOG.MESSAGE OR LOG.LEVEL THEN
                I.EVENT += 1
                R.CEC.INWARD.LOG<CEC.ICL.EVENT.TIME,I.LOG,I.EVENT> = OCONV(TIME(),"MTS")
                R.CEC.INWARD.LOG<CEC.ICL.EVENT.MESS,I.LOG,I.EVENT> = LOG.MESSAGE
                R.CEC.INWARD.LOG<CEC.ICL.EVENT.LEVEL,I.LOG,I.EVENT> = LOG.LEVEL
            END
            PINTAPE.PREV = PINTAPE
            IN.FILE.ID.PREV = CEC.INWARD.FILES.ID
        END
*     CALL F.WRITE(CEC.INWARD.LOG.FILE,TODAY,R.CEC.INWARD.LOG)
        LOG.MESSAGE = '' ; LOG.LEVEL = '' ; LOG.JUMP = ''
  
        RETURN

************************************************************************
CALCULATE.CHARGES:
************************************************************************

        $INSERT I_LOT.ACCOUNTING

*-----------------------------------------------------------------------
    END
    
