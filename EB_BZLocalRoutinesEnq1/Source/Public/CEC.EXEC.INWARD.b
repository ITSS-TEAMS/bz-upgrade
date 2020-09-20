
*-----------------------------------------------------------------------------
* <Rating>61062</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATORS REPLACED WITH OPERANDS; !HUSHIT(1), !HUSHIT(0) CHANGED TO HUSHIT(1), HUSHIT(0)
*                 VARIABLE INITIALISED; VARIABLE ASSIGNED TO DCOUNT
*                 REPALCED SM TO @SM, VM TO @VM, FM TO @FM                
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.EXEC.INWARD
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
* This program is called manually by the operators whenever an Inward
* CEC file has been received from the provider center.
*
* First it validates the file. Any problem with the header is
* reported and the process skips it.
*
* The transactions booked into the CEC.INWARD.PENDING messages that
* have reached their maturity date are processed prior to any new file
* dowload.
*
* $INSERT I_EQUATE - Not Used anymore;lso runs during the start of day to process the
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;new file processing.
*
*---- Revision History ------------------------------------------------
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
* 07/04/2010 - Allowing FUP generation with PROCESS.TYPE = 'OFT'
*              by setting REC.PROCESS.TYPE to 'MAN', 'FUP' or 'REJ'
*
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT EB.SystemTables.getVFunction()
$INSERT I_F.COMPANY
$INSERT I_F.USER
$FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT.CLASS
$INSERT I_F.CEC.LOG.LEVEL
$INSERT I_FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSERT I_F.CEC.PARAMETER
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
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_OVE.COMMON

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_SITCOM
$INSERT I_SITCHQ
$INSERT I_SITOVA
$INSERT I_CECLOC
$INSERT I_CECLIN
$INSERT I_CECFMT
$INSERT I_CECSUH
$INSERT IEB.DataAccess.OpfCREH
$INSERT IEB.DataAccess.OpfCRET
$INSERT I_CECSUT
$INSERT I_CECHEA
*$INSERT I_CECLAY
$INSERT I_CECREC
$INSERT I_CECDEF
$INSERFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
$INSERT IEB.DataAccess.FReadCECLAY
$INSERT I_CECDIR
$INSERT I_CECICF
$INSERT I_CECOC
$INSERT I_CECVAR
$INSERT I_EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerLOEB.SystemTables.setE()
*-----------------------------------------------------------------------------
* <Rating>61062</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATORS REPLACED WITH OPERANDS; !HUSHIT(1), !HUSHIT(0) CHANGED TO HUSHIT(1), HUSHIT(0)
*                 VARIABLE INITIALISED; VARIABLE ASSIGNED TO DCOUNT
*                 REPALCED SM TO @SM, VM TO @VM, FM TO @FM                
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.EXEC.INWARD
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
* This program is called manually by the operators whenever an Inward
* CEC file has been received from the provider center.
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
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
* 07/04/2010 - Allowing FUP generation with PROCESS.TYPE = 'OFT'
*              by setting REC.PROCESS.TYPE to 'MAN', 'FUP' or 'REJ'
*
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
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
$INSERT I_F.FUNDS.TRANSFER
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

* Equate the fieldEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer generic ones for include I_CEC.ACCOUNTING

$INSERT I_SIT.AEB.DataAccess.FWriteNG.FIELDS
$INSERT I_CEC.ACCOUNTING.IC

*ZIT-UPGEB.SystemTables.setAf()
*-----------------------------------------------------------------------------
* <Rating>61062</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATORS REPLACED WITH OPERANDS; !HUSHIT(1), !HUSHIT(0) CHANGED TO HUSHIT(1), HUSHIT(0)
*                 VARIABLE INITIALISED; VARIABLE ASSIGNED TO DCOUNT
*                 REPALCED SM TO @SM, VM TO @VM, FM TO @FM                
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.EXEC.INWARD
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
* This program is called manually by the operators whenever an Inward
* CEC file has been received from the provider center.
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
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
* 07/04/2010 - Allowing FUP generation with PROCESS.TYPE = 'OFT'
*              by setting REC.PROCESS.TYPE to 'MAN', 'FUP' or 'REJ'
*
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
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
$INSERT I_F.FUNDS.TRANSFER
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

*ZIT-UPG-R1FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef  EB.SystemTables.setE('');* 
		Y.TOOLS = "TOOLS" 
        OPEN "",Y.TOOLS TO F.TOOLS ELSE RETURN   ;*STOP 
        SW.HEADER.EXPECTED = 'Y'

        APPLICATION = 'CEC.INWARD'
        V = CEC.IC.AUDIT.DATE.TIME          ;* To simulate the template of CEC.INWARD

        TEXT = '' ; ETEXT = '' ; SW.COMMIT = ''
        SW.UNKNOWN.MESSAGE = '' ; SW.RECOVERY = ''
        ACT.OPCODE = '' ; LAST.OPCODE = ''
        CEC.LOCAL.FIELDS = ''
        SUH.CEC.IDS = ''
        SUT.CEC.IDS = ''
        REH.CEC.IDS = ''
        RET.CEC.IDS = ''

        R.ANNEX.RECORD = ''
        CEC.CENTER.ID = ''

        LOG.JUMP = '' ; LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''
        PINTAPE = '' ; PINTAPE.PREV = '' ; IN.FILE.ID.PREV = ''; IN.POS=0

        GOSUB INITIALISE

        IF LOG.MESSAGE THEN
            LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
            IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
            RETURN
        END
        
        IN.POS = ''
        LOCATE 'INWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING IN.POS THEN

*        Load specific treatment constraints from parameter

        DUPLICATE.PROC = R.CEC.PARAMETER<CEC.PAR.DUPLICATE.PROC,IN.POS>
        COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,IN.POS>
        SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,IN.POS>:'"0"':"R"
        DEF.VAL.RTN = '' ; DEF.NB.VAL.RTN = 0
        Y.CTR = DCOUNT(R.CEC.PARAMETER<CEC.PAR.VALIDATE.RTN,IN.POS>,@SM)
        FOR ILD = 1 TO Y.CTR
            RTN.ID = TRIM(FIELD(R.CEC.PARAMETER<CEC.PAR.VALIDATE.RTN,IN.POS,ILD>,"@",2))
            IF RTN.ID THEN
                DEF.NB.VAL.RTN += 1
                DEF.VAL.RTN<1,DEF.NB.VAL.RTN> = RTN.ID
            END
        NEXT ILD
        DEF.AUTH.RTN = '' ; DEF.NB.AUTH.RTN = 0
        Y.CTR1 = DCOUNT(R.CEC.PARAMETER<CEC.PAR.AFT.AUTH.RTN,IN.POS>,@SM)
        FOR ILD = 1 TO Y.CTR1
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
        *        Take over the matured message from the CEC.INWARD.PENDING file
        IF LOAD.PENDING NE 'NO' THEN
            PSTATEMENT = "SELECT ":CEC.INWARD.PENDING.FILE
            IF PENDING.DATE THEN PSTATEMENT := " WITH @ID LE ":PENDING.DATE
            PENDING.LIST = '' ; PINTAPE = ''; YR.CEC.INWARD.PENDING.ID = ''; POINT0 = ''
            CALL EB.READLIST(PSTATEMENT,PENDING.LIST,'','','')
            IF PENDING.LIST THEN
                SW.EXTRACT.FROM.PENDING = 'Y'
                LAST.OPCODE = ''; POINT0=0
                LOOP
                    REMOVE YR.CEC.INWARD.PENDING.ID FROM PENDING.LIST SETTING POINT0
                WHILE YR.CEC.INWARD.PENDING.ID:POINT0
                    SETTLEMENT.DATE = YR.CEC.INWARD.PENDING.ID
                    SW.PENDING.USED = ''
                    GOSUB READ.CEC.INWARD.PENDING.FILE
                    R.SICP = R.CEC.INWARD.PENDING
                    R.SICP.NON.TREATED = ''
                    NB.FILE.PENDING = DCOUNT(R.SICP<CEC.ICP.FILE.ID>,@VM)
                    FOR IHU = 1 TO NB.FILE.PENDING
                        SW.UNKNOWN.MESSAGE = ''
                        CEC.INWARD.FILES.ID = R.SICP<CEC.ICP.FILE.ID,IHU>
                        R.CEC.INWARD.FILES = '' ; ER = ''
                        CALL F.READ(CEC.INWARD.FILES.FILE,CEC.INWARD.FILES.ID,R.CEC.INWARD.FILES,F.CEC.INWARD.FILES,ER)
                        IF NOT(ER) THEN
                            CEC.LOCAL.FIELDS = ''
                            CALL Y.LOAD.CECSUH('INWARD','',R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID>,'')
                            CALL Y.LOAD.CECREH('INWARD','',R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID>,'')
                            CEC.CENTER.ID = R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID>
                            ACT.SUH.RECORD = R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER>
                            Y.CTR2 = DCOUNT(R.SICP<CEC.ICP.REMIT.NUM,IHU>,@SM)
                            FOR IJJ = 1 TO Y.CTR2
                                Y.REMIT.NUM = R.SICP<CEC.ICP.REMIT.NUM,IHU,IJJ>
                                ACT.REH.RECORD = R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,Y.REMIT.NUM>
                                IF R.SICP<CEC.ICP.BLOCK.STATUS,IHU,IJJ> EQ 'Y' THEN
                                    GOSUB KEEP.REMIT.IN.PENDING
                                END ELSE
                                        IF R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> NE '' AND NUM(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM,1>[1,1]) ELSE
*                                To avoid a double treatment of an already processed message

                                        COUNTER.FOR.COMMITMENT = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                                        TOTAL.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                                        IF LCCY NE CLEAR.CCY
                                        THEN LCCY.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2>+0)
                                        ELSE LCCY.FOR.COMMITMENT = TOTAL.FOR.COMMITMENT
                                        N.PROCESS.DATE = R.CEC.INWARD.FILES<CEC.ICF.PROCESS.DATE>
                                        IF R.CEC.INWARD.FILES<CEC.ICF.FILE.NAME> THEN
                                            PINTAPE = R.CEC.INWARD.FILES<CEC.ICF.FILE.NAME>
                                        END ELSE PINTAPE = ''
                                        
                                        IGU = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,Y.REMIT.NUM>,@SM)
                                        FOR ITU = 1 TO IGU
                                                    ACT.OPCODE = R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM,ITU>
                                                    ACT.LAYOUT.ID = 'INWARD.':ACT.OPCODE
                                                    ISU.BEG = R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,Y.REMIT.NUM,ITU>
                                                    ISU.END = R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,Y.REMIT.NUM,ITU>
                                                    FOR ISU = ISU.BEG TO ISU.END
                                                        ID.NEW = N.PROCESS.DATE:'.':ACT.OPCODE[1,3]:'.':FMT(ISU,SEQ.FORMAT)
                                                        MAT R.NEW = '' ; ER = ''
                                                        CALL F.MATREAD(CEC.INWARD.FILE,ID.NEW,MAT R.NEW,CEC.IC.AUDIT.DATE.TIME,F.CEC.INWARD,ER)
                                                        IF ER THEN
                                                            LOG.LEVEL = ' ' ; LOG.MESSAGE = 'EB-CEC.FAILED.EXTRACT':@FM:ID.NEW
                                                            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                                                            GOSUB UPDATE.LOG.FILE
                                                        END ELSE
                                                            IF R.NEW(CEC.IC.STATEMENT.NOS) ELSE   ;* Record already processed
                                                            ACT.DAT.RECORD = R.NEW(CEC.IC.INWARD.REC)
                                                            IF ACT.OPCODE NE LAST.OPCODE THEN
                                                                GOSUB READ.CODE.LAYOUT
                                                            END
                                                            R.ACCOUNT = '' ; ACCT.ID = ''
                                                            IF SW.UNKNOWN.MESSAGE EQ '' THEN
                                                                GOSUB GENERATE.ACCOUNTING.ENTRIES
                                                                GOSUB STORE.INWARD.LINE
                                                            END ELSE
                                                                GOSUB KEEP.REMIT.IN.PENDING
                                                            END
                                                        END
                                                    END
                                                NEXT ISU
                                                * Make here the nostro entries if not already included at CEC.INWARD level
                                                IF ACT.NOSTRO.CATEGORY EQ '' AND SW.UNKNOWN.MESSAGE EQ '' THEN
                                                    GOSUB POST.REMIT.NOSTRO.ENTRY
                                                    IF LCCY NE CLEAR.CCY AND LCCY.FOR.COMMITMENT THEN
                                                        BEGIN CASE
                                                            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                                                                R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2> = LCCY.FOR.COMMITMENT
                                                            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                                                                R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2> = -1 * LCCY.FOR.COMMITMENT
                                                        END CASE
                                                    END
                                                END
                                            NEXT ITU
                                            CALL F.WRITE(CEC.INWARD.FILES.FILE,CEC.INWARD.FILES.ID,R.CEC.INWARD.FILES)
                                        END
                                    END
                                NEXT IJJ
                            END
                        NEXT IHU
                        IF R.SICP.NON.TREATED<CEC.ICP.FILE.ID> NE '' THEN
                            CALL F.WRITE(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID,R.SICP.NON.TREATED)
                        END ELSE
                            CALL F.DELETE(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID)
                        END
                        IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
                    REPEAT
                END

                *           Load and process the inward SIT files available

                SW.EXTRACT.FROM.PENDING = ''
                GOSUB SELECT.WAITING.FILES
            END
        END

        * WRITE AA TO F.TOOLS,"MP.CECTEST"

        RETURN

***********************************************************************
KEEP.REMIT.IN.PENDING:
***********************************************************************
        IF R.SICP.NON.TREATED<CEC.ICP.FILE.ID> EQ '' THEN
            R.SICP.NON.TREATED<CEC.ICP.FILE.ID> = R.SICP<CEC.ICP.FILE.ID,IHU>
            R.SICP.NON.TREATED<CEC.ICP.REMIT.NUM> = R.SICP<CEC.ICP.REMIT.NUM,IHU,IJJ>
            R.SICP.NON.TREATED<CEC.ICP.BLOCK.STATUS> = R.SICP<CEC.ICP.BLOCK.STATUS,IHU,IJJ>
        END ELSE
            DEJA = 0
            LOCATE R.SICP<CEC.ICP.FILE.ID,IHU> IN R.SICP.NON.TREATED<CEC.ICP.FILE.ID,1> SETTING DEJA THEN
            R.SICP.NON.TREATED<CEC.ICP.REMIT.NUM,IHU> := @SM:R.SICP<CEC.ICP.REMIT.NUM,IHU,IJJ>
            R.SICP.NON.TREATED<CEC.ICP.BLOCK.STATUS,IHU> := @SM:R.SICP<CEC.ICP.BLOCK.STATUS,IHU,IJJ>
        END ELSE
            R.SICP.NON.TREATED<CEC.ICP.FILE.ID> := @VM:R.SICP<CEC.ICP.FILE.ID,IHU>
            R.SICP.NON.TREATED<CEC.ICP.REMIT.NUM> := @VM:R.SICP<CEC.ICP.REMIT.NUM,IHU,IJJ>
            R.SICP.NON.TREATED<CEC.ICP.BLOCK.STATUS> := @VM:R.SICP<CEC.ICP.BLOCK.STATUS,IHU,IJJ>
        END
    END
    R.SICP.NON.TREATED<CEC.ICP.LOCAL.REF> = R.SICP<CEC.ICP.LOCAL.REF>
    RETURN

***********************************************************************
SELECT.WAITING.FILES:
***********************************************************************

    UNFORM.FILE.ID = "CECIN"

*     Check if previous execution has crashed then reexecute it first

    PINTAPE = '' ; KEY.ADD = ''
    RSTATEMENT = "SELECT FT.IN.TAPE WITH @ID EQ ":UNFORM.FILE.ID
    CALL EB.READLIST(RSTATEMENT,KEY.ADD,'','','')

    IF KEY.ADD NE '' THEN
        IF KEY.LIST NE '' THEN
            KEY.LIST = 'Reexecution':@FM:KEY.LIST
        END ELSE
            KEY.LIST = 'Reexecution'
        END
    END
    IF KEY.LIST NE '' THEN
        POINT1 = 0; PINTAPE = ''
        LOOP
            REMOVE PINTAPE FROM KEY.LIST SETTING POINT1
        WHILE PINTAPE:POINT1
            WORST.LEVEL = '0'
            IF PINTAPE NE 'Reexecution' THEN
                CEC.INWARD.FILES.ID = ''
EXECUTE$CMD1 = "COPY FROM ":DIR.IDENT:" TO FT.IN.TAPE ":PINTAPE:",":UNFORM.FILE.ID:" OVERWRITING DELETING"
*               CALL !HUSHIT(1)           
                CALL HUSHIT(1)
                EXECUTE EXECUTE$CMD1 RETURNING RETVAR
*                CALL !HUSHIT(0)
                CALL HUSHIT(0)
                SW.OKAY = 0; 
                Y.COUNT = DCOUNT(RETVAR,@FM)
                FOR IIW = 1 TO Y.COUNT
                GOOD = 0
                    LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                NEXT IIW
                IF SW.OKAY EQ 0 THEN
                    IF KEY.LIST EQ FILE.IDENT THEN
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.CALLED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END ELSE
                        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.LOADED':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    END
                    GOSUB UPDATE.LOG.FILE
                END
            END
            GOSUB PROCESS.INWARD.FILE
            YR.CEC.LOG.LEVEL.ID = WORST.LEVEL
            GOSUB READ.CEC.LOG.LEVEL.FILE
            IF ER THEN
                BEGIN CASE

                    CASE WORST.LEVEL EQ '0'
                        *Process normally completed, erase the copy of the file from FT.IN.TAPE
                        EXECUTE$CMD2 = "DELETE FT.IN.TAPE ":UNFORM.FILE.ID
*                        CALL !HUSHIT(1)
                        CALL HUSHIT(1)
                        EXECUTE EXECUTE$CMD2
*                        CALL !HUSHIT(0)
                        CALL HUSHIT(0)

                    CASE WORST.LEVEL EQ 1
                        *In case of a unknown operation, Restore the file in its original directory for a new treatment
                        EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO ":DIR.IDENT:" ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
*                        CALL !HUSHIT(1)
                        CALL HUSHIT(1)
                        EXECUTE EXECUTE$CMD2 RETURNING RETVAR
*                        CALL !HUSHIT(0)
                        CALL HUSHIT(0)
                        SW.OKAY = 0; GOOD = '';
                        Y.COUNT1 = DCOUNT(RETVAR,@FM)
                        FOR IIW = 1 TO Y.COUNT1
                            LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                        NEXT IIW
                        IF SW.OKAY EQ 0 THEN
                            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.NO.INWARD.RESTORE':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END
                    CASE WORST.LEVEL EQ 2
                        *Store the rejected file under its original name in the FT.IN.TAPE directory
                        EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO FT.IN.TAPE ":UNFORM.FILE.ID:",":PINTAPE:" OVERWRITING DELETING"
*                        CALL !HUSHIT(1)
                        CALL HUSHIT(0)
                        EXECUTE EXECUTE$CMD2 RETURNING RETVAR
*                        CALL !HUSHIT(0)
                        CALL HUSHIT(0)
                        SW.OKAY = 0; GOOD = '';
                        Y.COUNT3 = DCOUNT(RETVAR,@FM)
                        FOR IIW = 1 TO Y.COUNT3
                            LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                        NEXT IIW
                       
                    IF SW.OKAY EQ 0 THEN
                        LOG.LEVEL = '2' ;
                        LOG.MESSAGE = 'EB-CEC.NO.INWARD.SUSPEND':@FM:PINTAPE
                        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                        GOSUB UPDATE.LOG.FILE
                    END
            END CASE
        END ELSE
            FINAL.DIR = ''
            IF R.CEC.LOG.LEVEL<CEC.LGL.FINAL.DIRECTORY> NE '' THEN
*                 Send the file to the given archive directory
                FINAL.DIR = R.CEC.LOG.LEVEL<CEC.LGL.FINAL.DIRECTORY>
            END ELSE
                IF R.CEC.LOG.LEVEL<CEC.LGL.RESTORE.FILE> EQ 'Y' THEN
*                    Put the file back to its inward library
                    FINAL.DIR = DIR.IDENT
                END
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
*                CALL !HUSHIT(1)
                CALL HUSHIT(1)
                EXECUTE EXECUTE$CMD2 RETURNING RETVAR
*                CALL !HUSHIT(0)
                CALL HUSHIT(0)
                SW.OKAY = 0; GOOD = '';
                Y.COUNT2 = DCOUNT(RETVAR,@FM)
                FOR IIW = 1 TO Y.COUNT2
                    LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
                NEXT IIW
                IF SW.OKAY EQ 0 THEN
                    LOG.LEVEL = '2' ;
                    LOG.MESSAGE = 'EB-CEC.NO.INWARD.COPY':@FM:PINTAPE
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                END
            END ELSE
                EXECUTE$CMD2 = "DELETE FT.IN.TAPE ":UNFORM.FILE.ID
*                CALL !HUSHIT(1)
                CALL HUSHIT(1)
                EXECUTE EXECUTE$CMD2
*                CALL !HUSHIT(0)
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
    CEC.LOCAL.FIELDS = ''
    CEC.PRE.HEADER = ''
    R.ANNEX.RECORD = ''
    R.DATA.RECORD = ''
    R.SEQ.NEXT = ''
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
    LAST.ENR.ARRAY = ''       ;* Record the actual ENR values
    LAST.OPE.ARRAY = ''       ;* Record the actual OPE values
    R.ACT.RECORD = ''         ;* 20/04/2010
    OPENSEQ TAPE.FILE.NAME,UNFORM.FILE.ID TO UNFORM.FILE THEN
        MY.SUM.TRAILER = ""
        LOOP
            *Svu start - 20070510 - Make sure lines longer than 1024 char are not truncated. ---------
            * READSEQ R.ACT.RECORD FROM UNFORM.FILE ELSE R.ACT.RECORD = ''
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
            * Svu End - 20070510 ---------------------------------------------------------------------
        UNTIL SW.EOF EQ 1 AND R.ACT.RECORD EQ ''
            R.TEST.RECORD = TRIM(R.ACT.RECORD)
            IF R.TEST.RECORD THEN
                *IF R.ACT.RECORD <> '' THEN
                REC.LENGTH = LEN(R.ACT.RECORD)
                HEA = ''
                Y.CTR3 = DCOUNT(HEA.ENR.ID,@FM)
                FOR IHE = 1 TO Y.CTR3
                    IF REC.LENGTH GT HEA.REC.LENGTH<IHE> THEN CONTINUE
                    GOOD.ENR.FOUND = 1
                    ACT.ENR.VALUE = ''
                    Y.CTR4 = DCOUNT(HEA.ENR.START<IHE>,@VM)
                    FOR IEN = 1 TO Y.CTR4
                        IF HEA.ENR.START<IHE,IEN> EQ '#' OR HEA.ENR.LENGTH<IHE,IEN> EQ '#' THEN
                            IF HEA.ENR.VALUE<IHE,IEN> EQ '#' THEN
                                * The register code is in another record
                                IF LAST.ENR.ARRAY<1,IEN> NE '' THEN ACT.ENR.VALUE<1,IEN> = LAST.ENR.ARRAY<1,IEN>
                            END
                        END ELSE
                            FIELD.ENR.START = HEA.ENR.START<IHE,IEN>
                            FIELD.ENR.LENGTH = HEA.ENR.LENGTH<IHE,IEN>
                            IF FIELD.ENR.START + FIELD.ENR.LENGTH - 1 LE REC.LENGTH THEN
                                TRAV.FIELD =  R.ACT.RECORD[FIELD.ENR.START,FIELD.ENR.LENGTH]
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
                    AA<-1> = IHE:' ':HEA.ENR.START<IHE>:' ':HEA.ENR.LENGTH<IHE>:' ':HEA.ENR.VALUE<IHE>:' ':ACT.ENR.VALUE
                    IF GOOD.ENR.FOUND THEN
                        * The ENR code is compatible, now let's consider the OPE code if any
                        IF HEA.OPE.START<IHE> EQ '' THEN     ;* No operation code used
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
                            Y.CTR5 = DCOUNT(HEA.OPE.START<IHE>,@VM)
                            FOR IEN = 1 TO Y.CTR5
                                IF HEA.OPE.START<IHE,IEN> EQ '#' OR HEA.OPE.LENGTH<IHE,IEN> EQ '#' THEN
                                    * The operation code is in another record
                                    IF LAST.OPE.ARRAY<1,IEN> NE '' THEN ACT.OPE.VALUE<1,IEN> = LAST.OPE.ARRAY<1,IEN>
                                END ELSE
                                    FIELD.OPE.START = HEA.OPE.START<IHE,IEN>
                                    FIELD.OPE.LENGTH = HEA.OPE.LENGTH<IHE,IEN>
                                    IF FIELD.OPE.START + FIELD.OPE.LENGTH - 1 LE REC.LENGTH THEN
                                        TRAV.FIELD =  R.ACT.RECORD[FIELD.OPE.START,FIELD.OPE.LENGTH]
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
                            AA<-1> = IHE:' ':HEA.OPE.START<IHE>:' ':HEA.OPE.LENGTH<IHE>:' ':HEA.OPE.VALUE<IHE>:' ':ACT.OPE.VALUE
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
                            AA<-1> = NOW.LAYOUT.ID
                            IHE.REH = HEA
                            CALL Y.LOAD.CECREH('INWARD','','',NOW.LAYOUT.ID)
                            AA<-1> = '================'
                            AA<-1> = ACT.REH.ID
                            AA<-1> = R.ACT.REH
                            AA<-1> = '================'
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
                IF ACT.SUH.RECORD THEN  ;* No report if file header is also missing
                    LOG.LEVEL = '' ;
                    LOG.MESSAGE = 'EB-CEC.MISSING.REM.HEADER':@FM:Y.REMIT.NUM
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
    CEC.INWARD.FILES.ID = TRIM(Y.PROCESS.DATE," ","A")      ;* CEC working date
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
                GOSUB REMOVE.EMPTY.CEC.INWARD.FILES ; RETURN
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
            GOSUB REMOVE.EMPTY.CEC.INWARD.FILES
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
    CEC.LOCAL.FIELDS = ''

*     Unmap the File Header fields

    R.CEC.INWARD.FILES = ''
    CEC.INWARD.FILES.ID = ''
    CALL Y.MAP.CEC.INWARD('SUH',R.ACT.RECORD,N.ERR)
    IF N.ERR THEN
        Y.CTR6 = DCOUNT(N.ERR,@FM)
        FOR JDF = 1 TO Y.CTR6
            LOG.LEVEL = '2' ; LOG.MESSAGE = N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        NEXT JDF
        SW.SKIP = 'Y'
        RETURN
    END

*     Building up the CEC.INWARD.FILES key.

    CEC.IDS = ''; NB.KEYS = 0; FIL = 0
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
    FIL = ''
    LOCATE 'BANKID' IN CEC.IDS<1,1> SETTING FIL THEN
    IF R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE> NE CEC.IDS<3,FIL,1> THEN
        LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.BANK.NOT.RECEIVER':@FM:CEC.IDS<3,FIL,1>
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
        SW.SKIP = 'Y'
        RETURN
    END
    END

    FIL= 0
    LOCATE 'FILE' IN CEC.IDS<1,1> SETTING FIL THEN
    CEC.INWARD.FILES.ID = CEC.IDS<3,FIL>
    CHANGE @SM TO '.' IN CEC.INWARD.FILES.ID
    END

    IF CEC.INWARD.FILES.ID EQ '' THEN SW.TO.FILES.ID = 'Y'    ;*CEC.INWARD.FILES.ID = TODAY
    SUH.CEC.IDS = CEC.IDS

    IF SW.TO.FILES.ID NE 'Y' THEN GOSUB READ.CEC.INWARD.FILES.FILE
    IF NOT(LOG.LEVEL) THEN
        R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID> = CEC.CENTER.ID
        FIL = 0
        LOCATE 'CREAD' IN CEC.IDS<1,1> SETTING FIL THEN
        R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE> = CEC.IDS<3,FIL,1>
    END
    FIL = 0
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
        CEC.LOCAL.FIELDS = ''
        R.DATA.RECORD = ''

        IF SW.SKIP EQ 'M' THEN SW.SKIP = ''

*     Unmap the Remit header fields

        CALL Y.MAP.CEC.INWARD('REH',R.ACT.RECORD,N.ERR)
        IF N.ERR THEN
            Y.CTR7= DCOUNT(N.ERR,@FM)
            FOR JDF = 1 TO Y.CTR7
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
            L.KEY.DATA = TRIM(ACT.REH.FIELDS<9,IDW>)  ;*," ","A")
            L.KEY.RANK = ACT.REH.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
        NEXT IDW
        REH.CEC.IDS = CEC.IDS
        RET.CEC.IDS = ''
        FIL= 0
        LOCATE 'SDATE' IN CEC.IDS<1,1> SETTING FIL THEN
        SETTLEMENT.DATE = CEC.IDS<3,FIL,1>
    END

    R.CEC.INWARD.FILES<CEC.ICF.CENTER.ID> = CEC.CENTER.ID
    FIL= 0
    LOCATE 'CREAD' IN CEC.IDS<1,1> SETTING FIL THEN
    R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE> = CEC.IDS<3,FIL,1>
    END
    FIL= 0
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
        FIL= 0
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
        FIL= 0
        LOCATE 'FILE' IN CEC.IDS<1,1> SETTING FIL THEN
        CEC.INWARD.FILES.ID = CEC.IDS<3,FIL>
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
    FIL=0
    LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
    IN.STRING = CEC.IDS<3,FIL,3>
    CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
    CEC.IDS<3,FIL,3> = OUT.STRING
    NEW.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
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
    FIL=0 
    LOCATE 'MOLD' IN CEC.IDS<1,1> SETTING FIL THEN
    IN.STRING = CEC.IDS<3,FIL,3>
    CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
    CEC.IDS<3,FIL,3> = OUT.STRING
    OLD.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
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

    REMIT.HEADER.UPDATE:* To process the remit even though its header is missing
********************
    SW.FILE.TRAILER = ''
    SW.REMIT.TRAILER = 'N'
    TOTAL.FOR.COMMITMENT = 0
    LCCY.FOR.COMMITMENT = 0
    COUNTER.FOR.COMMITMENT = 0
    COUNTER.FOR.RECOVERY = 0
    IF SW.SKIP EQ 'Y' THEN RETURN
    NB.REMIT =0
    NB.REMIT = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER>,@VM)
    IF SW.RECOVERY EQ 'Y' THEN
        IF Y.REMIT.NUM ELSE NB.REMIT.INIT = NB.REMIT
        IF Y.REMIT.NUM LE NB.REMIT.INIT THEN
            Y.REMIT.NUM += 1
            IF R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> NE '' THEN
                SW.SKIP = 'R' ;* Message already processed to the end not to be recovere
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
                SW.SKIP = ''  ;* Message partially processed to be recovered
                COUNTER.FOR.RECOVERY = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,Y.REMIT.NUM>
                TOTAL.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                IF LCCY NE CLEAR.CCY THEN LCCY.FOR.COMMITMENT = ABS(R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,Y.REMIT.NUM,2>+0)
            END
            SETTLEMENT.DATE = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>,":",1)
            SW.PENDING.USED = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>,":",2)
        END ELSE    ;* Message still not processed when the crash occurred
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
                    GOSUB REMOVE.EMPTY.CEC.INWARD.FILES ; RETURN
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
                Y.CTR8 = DCOUNT(N.ERR,@FM)
                FOR JDF = 1 TO Y.CTR8
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM+1:@VM:N.ERR<JDF>
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                NEXT JDF
*           SW.SKIP = 'M'
            END

            CEC.IDS = REH.CEC.IDS
            NB.KEYS = DCOUNT(ACT.RET.FIELDS<1>,@VM)
            FOR IDW = 1 TO NB.KEYS
                L.KEY.DATA = TRIM(ACT.RET.FIELDS<9,IDW>)        ;*," ","A")
                L.KEY.RANK = ACT.RET.FIELDS<7,IDW>
                GOSUB UPDATE.REFERENCE
            NEXT IDW
            RET.CEC.IDS = CEC.IDS

        END

        R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,Y.REMIT.NUM> = ACT.RET.RECORD

        CALC.FILE.REMIT += 1

        SW.REMIT.HEADER = ''

REMIT.TRAILER.UPDATE:         * To commit a message even though its trailer is missing
*********************

        IF SW.SKIP THEN RETURN

        IGU = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM>,@SM)

*     IF IGU >= 1 THEN SW.JOINT.DONE = 0 ELSE SW.JOINT.DONE = 1
        ITU = 0;
        Y.CTR10 = DCOUNT(R.SEQ.NEXT<1>,@VM)
        FOR ITU = 1 TO Y.CTR10
            Y.CTR9 = DCOUNT(R.SEQ.NEXT<3,ITU>,@SM)
            FOR ITL = 1 TO Y.CTR9
                IF R.SEQ.NEXT<5,ITU,ITL> GE R.SEQ.NEXT<4,ITU,ITL> THEN
                    IF R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM> EQ '' THEN
                        R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM> = R.SEQ.NEXT<3,ITU,ITL>
                        R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,Y.REMIT.NUM> = R.SEQ.NEXT<4,ITU,ITL>
                        R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,Y.REMIT.NUM> = R.SEQ.NEXT<5,ITU,ITL>
                    END ELSE
                        SW.JOINT.DONE = 0
                        FOR IZU = 1 TO IGU
                            IF R.SEQ.NEXT<3,ITU,ITL> EQ R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM,IZU> THEN
                                IF R.SEQ.NEXT<4,ITU,ITL> EQ R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,Y.REMIT.NUM,IZU> + 1 THEN
                                    R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,Y.REMIT.NUM,IZU> = R.SEQ.NEXT<5,ITU,ITL>
                                    SW.JOINT.DONE = 1
                                END
                            END
                        NEXT IZU
                        IF SW.JOINT.DONE EQ 0 THEN
                            IGU += 1
                            R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,Y.REMIT.NUM,IGU> = R.SEQ.NEXT<3,ITU,ITL>
                            R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,Y.REMIT.NUM,IGU> = R.SEQ.NEXT<4,ITU,ITL>
                            R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,Y.REMIT.NUM,IGU> = R.SEQ.NEXT<5,ITU,ITL>
                        END
                    END
                END
                R.SEQ.NEXT<4,ITU,ITL> = R.SEQ.NEXT<5,ITU,ITL> + 1
            NEXT ITL
        NEXT ITU

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

            AA<-1> = '++++++++++++++++++++++++++++++++++'
            AA<-1> = CEC.IDS
            AA<-1> = '++++++++++++++++++++++++++++++++++'
            FIL = 0
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

            IF (PENDING.DATE AND SW.PENDING.USED EQ 'Y') OR SW.UNKNOWN.MESSAGE EQ 'Y' THEN

                YR.CEC.INWARD.PENDING.ID = SETTLEMENT.DATE
                GOSUB READ.CEC.INWARD.PENDING.FILE

*           Store the message identification in the inward pending file to allow further treatment
                OKF=0; JKF=0;
                LOCATE CEC.INWARD.FILES.ID IN R.CEC.INWARD.PENDING<CEC.ICP.FILE.ID,1> SETTING OKF THEN
                LOCATE Y.REMIT.NUM IN R.CEC.INWARD.PENDING<CEC.ICP.REMIT.NUM,OKF,1> SETTING JKF ELSE
                R.CEC.INWARD.PENDING<CEC.ICP.REMIT.NUM,OKF> := @SM:Y.REMIT.NUM
                R.CEC.INWARD.PENDING<CEC.ICP.BLOCK.STATUS,OKF> := @SM
                CALL F.WRITE(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID,R.CEC.INWARD.PENDING)
            END
        END ELSE
            IF R.CEC.INWARD.PENDING<CEC.ICP.FILE.ID> EQ '' THEN
                R.CEC.INWARD.PENDING<CEC.ICP.FILE.ID> = CEC.INWARD.FILES.ID
                R.CEC.INWARD.PENDING<CEC.ICP.REMIT.NUM> = Y.REMIT.NUM
                R.CEC.INWARD.PENDING<CEC.ICP.BLOCK.STATUS> = ''
            END ELSE
                R.CEC.INWARD.PENDING<CEC.ICP.FILE.ID> := @VM:CEC.INWARD.FILES.ID
                R.CEC.INWARD.PENDING<CEC.ICP.REMIT.NUM> := @VM:Y.REMIT.NUM
                R.CEC.INWARD.PENDING<CEC.ICP.BLOCK.STATUS> := @VM
            END
            CALL F.WRITE(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID,R.CEC.INWARD.PENDING)
        END
        SET.DATE.EDITED = OCONV(ICONV(SETTLEMENT.DATE,"D"),"D4/E")
        IF SW.UNKNOWN.MESSAGE EQ 'Y' THEN
            MSG.ERR = 'EB-CEC.REJECT.IN.PENDING':@FM:SET.DATE.EDITED
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = MSG.ERR
        END ELSE
            MSG.ERR = 'EB-CEC.DELAY.IN.PENDING':@FM:SET.DATE.EDITED
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = MSG.ERR
        END
    END ELSE

*           Make here the nostro entries if not already included at CEC.INWARD level

        R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = ''
        IF ACT.NOSTRO.CATEGORY EQ '' THEN GOSUB POST.REMIT.NOSTRO.ENTRY
    END
    LAST.OPCODE = ''
    REH.CEC.IDS = ''
    RET.CEC.IDS = ''
    END ELSE
    R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM>  = SETTLEMENT.DATE:':':SW.PENDING.USED
    END

    R.CEC.INWARD.FILES<CEC.ICF.MESSAGE.ID,Y.REMIT.NUM> = NEW.CEC.MSG.CONCAT.ID

    IF SW.COMMIT EQ '' THEN CEC.LOCAL.FIELDS = '' ; R.DATA.RECORD = ''

    GOSUB WRITE.CEC.INWARD.FILES.FILE

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
                Y.CTR11 = DCOUNT(N.ERR,@FM)
                FOR JDF = 1 TO Y.CTR11
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:N.ERR<JDF>
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                NEXT JDF
*           SW.SKIP = 'M'
            END

*2009    CEC.IDS = RET.CEC.IDS
            CEC.IDS = SUH.CEC.IDS; NB.KEYS = 0
            NB.KEYS = DCOUNT(ACT.SUT.FIELDS<1>,@VM)
            FOR IDW = 1 TO NB.KEYS
                L.KEY.DATA = TRIM(ACT.SUT.FIELDS<9,IDW>)        ;*," ","A")
                L.KEY.RANK = ACT.SUT.FIELDS<7,IDW>
                GOSUB UPDATE.REFERENCE
            NEXT IDW
            SUT.CEC.IDS = CEC.IDS

            FILE.TRAILER.UPDATE:* To commit a file even though its trailer is missing
********************

            IF NOT(SW.SKIP) THEN

                IF SUT.CEC.IDS EQ '' THEN CEC.IDS = SUH.CEC.IDS
                FIL = 0
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

            GOSUB WRITE.CEC.INWARD.FILES.FILE

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
POST.REMIT.NOSTRO.ENTRY:
***********************************************************************

            *     No entries if all entries have already been settled at line level

            IF R.CEC.PARAMETER<CEC.PAR.ENTRIES.BY.LINE> THEN RETURN

            R.ACCOUNT = R.ACT.NOSTRO.ACCT
            ACCT.ID = ACT.NOSTRO.ACCT.NO

            MAT R.NEW = ''

            SAVE.R.FTTC = R.FTTC
            CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
            CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
            CALL Y.CLEAR.SITCOM
            R.FTTC = SAVE.R.FTTC

            BEGIN CASE
                CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                    CUSTOMER.SIGN = 'CR'        ;*
                    ACCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
                    R.CREDIT.ACCT = R.ACCOUNT
                    CREDIT.ACCT.NO = ACCT.ID
                    IF LCCY NE R.CREDIT.ACCT<AC.CURRENCY>
                        THEN LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
                    ELSE LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
                    CREDIT.VALUE.DATE = SETTLEMENT.DATE
                    MSG.REF = 'EB-CEC.MESSAGE.REFERENCE':@FM:Y.REMIT.NUM
                    CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
                    CREDIT.THEIR.REF = MSG.REF
* EPI 21/02/2010 <
                    IF ACT.PROCESS.TYPE EQ 'OFT' OR ACT.PROCESS.TYPE EQ 'FUP' THEN
                        R.DEBIT.ACCT = R.ACT.TRANSIT.ACCT
                        DEBIT.ACCT.NO = ACT.TRANSIT.ACCT.NO
                        DEBIT.VALUE.DATE = SETTLEMENT.DATE
                        ACCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
                        IF LCCY NE R.DEBIT.ACCT<AC.CURRENCY>
                            THEN LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
                        ELSE LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
                    END
* EPI 21/02/2010 >
                CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                    CUSTOMER.SIGN = 'DB'
                    ACCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
                    R.DEBIT.ACCT = R.ACCOUNT
                    DEBIT.ACCT.NO = ACCT.ID
                    IF LCCY NE R.DEBIT.ACCT<AC.CURRENCY>
                        THEN LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
                    ELSE LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
                    DEBIT.VALUE.DATE = SETTLEMENT.DATE
                    MSG.REF = 'EB-CEC.MESSAGE.REFERENCE':@FM:Y.REMIT.NUM
                    CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
                    DEBIT.THEIR.REF = MSG.REF
                    * EPI 21/02/2010 <
                    IF ACT.PROCESS.TYPE EQ 'OFT' OR ACT.PROCESS.TYPE EQ 'FUP' THEN
                        R.CREDIT.ACCT = R.ACT.TRANSIT.ACCT
                        CREDIT.ACCT.NO = ACT.TRANSIT.ACCT.NO
                        CREDIT.VALUE.DATE = SETTLEMENT.DATE
                        ACCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
                        IF LCCY NE R.CREDIT.ACCT<AC.CURRENCY>
                            THEN LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
                        ELSE LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
                    END
* EPI 21/02/2010 >
                CASE 1
                    RETURN
            END CASE
            IF COUNTER.FOR.COMMITMENT GT 1 THEN
                MSG.REF = 'EB-CEC.MESSAGE.NARRN':@FM:COUNTER.FOR.COMMITMENT:@VM:LAST.OPCODE
                CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
            END ELSE
                MSG.REF = 'EB-CEC.MESSAGE.NARR1':@FM:LAST.OPCODE
                CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
            END
            PAYMENT.DETAILS = MSG.REF
            TRANS.ID = CEC.INWARD.FILES.ID:'-':Y.REMIT.NUM
            OHY = 0
            LOCATE 'CEC.INWARD.FILES' IN R.CEC.PARAMETER<CEC.PAR.APPLICATION.ID,1> SETTING OHY THEN
            TRANS.ID := @FM:R.CEC.PARAMETER<CEC.PAR.EB.SYSTEM.ID,OHY>
        END
* EPI 21/02/2010 <
*     CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
*     CONVERT VM TO SM IN R.NEW(V-10)
*     R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = R.NEW(V-10)
        IF ACT.PROCESS.TYPE EQ 'OFT' OR ACT.PROCESS.TYPE EQ 'FUP' THEN
            SAVE.ID.NEW = ID.NEW
            ID.NEW = CEC.INWARD.FILES.ID:'-':Y.REMIT.NUM
            GOSUB POST.FT.ENTRY
            ID.NEW = SAVE.ID.NEW
        END ELSE
            CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
            CHANGE @VM TO @SM IN R.NEW(V-10)
            R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = R.NEW(V-10)
        END
* EPI 21/02/2010 >

        RETURN

* EPI 21/02/2010 <

***********************************************************************
POST.FT.ENTRY:
***********************************************************************

        R.NEW(CEC.IC.TRANSACTION.TYPE) = ACT.FTTC.ID
        R.NEW(CEC.IC.PROCESSING.DATE)= SETTLEMENT.DATE
        R.NEW(CEC.IC.INITIAL.ACCOUNT) = ACCT.ID
        R.NEW(CEC.IC.COMMISSION.CODE) = 'WAIVE'
        R.NEW(CEC.IC.CHARGE.CODE) = 'WAIVE'

        BEGIN CASE
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
                CUSTOMER.SIGN = 'CR'
                R.NEW(CEC.IC.DEBIT.AMOUNT) = TOTAL.FOR.COMMITMENT
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACCT.ID
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACCOUNT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACT.TRANSIT.ACCT.NO
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACT.TRANSIT.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.VALUE.DATE) = SETTLEMENT.DATE
                IF LCCY NE R.CREDIT.ACCT<AC.CURRENCY>
                    THEN LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
                ELSE LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
            CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
                CUSTOMER.SIGN = 'DB'
                R.NEW(CEC.IC.CREDIT.AMOUNT) = TOTAL.FOR.COMMITMENT
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACCT.ID
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACCOUNT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACT.TRANSIT.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACT.TRANSIT.ACCT.NO
                R.NEW(CEC.IC.CREDIT.VALUE.DATE) = SETTLEMENT.DATE
                IF LCCY NE R.DEBIT.ACCT<AC.CURRENCY>
                    THEN LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
                ELSE LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
        END CASE

*     Check value dates

        GOSUB CHECK.VALUE.DATES

*     Check accounts and calculate fees

        GOSUB CALCULATE.CHARGES

        CURR.NO = 0; FDD = 0

*     Generation of a FT in 'IHLD' to make this GLOBAL.ACCOUNTING

        LOCATE 'IN.FT.GLOBAL' IN R.CEC.PARAMETER<CEC.PAR.DIRECTION.TYPE,1> SETTING FDD THEN
        FT.GEN.RTN = FIELD(R.CEC.PARAMETER<CEC.PAR.GENERATION.RTN,FDD>,"@",2)
    END ELSE FT.GEN.RTN = ''
        IF FT.GEN.RTN EQ '' THEN FT.GEN.RTN = 'CEC.SICF.GEN.OFT'
        SAVE.COMI = COMI
        COMI = ''
        CALL @FT.GEN.RTN(FT.REC.ID,R.FT.REC,N.ERR)
        IF FT.REC.ID NE '' THEN

*        Attempt to validate and authorize the generated FT

            IF COMI EQ '' THEN CALL Y.FT.AUTH(FT.REC.ID,R.FT.REC)
            R.NEW(CEC.IC.LINKED.FT.ID) = FT.REC.ID
            R.NEW(V-10) = R.FT.REC<FT.STMT.NOS>
            R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,Y.REMIT.NUM> = FT.REC.ID
        END
        COMI = SAVE.COMI

        RETURN

* EPI 21/02/2010 >

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
                    SAVE.ACT.LAYOUT.ID = ACT.LAYOUT.ID      ;*EPI 2009/10/31
                    SAVE.ACT.OPCODE = ACT.OPCODE  ;*EPI 2009/10/31
                    GOSUB POPULATE.IC.FIELDS
                    ACT.LAYOUT.ID = SAVE.ACT.LAYOUT.ID      ;*EPI 2009/10/31
                    ACT.OPCODE = SAVE.ACT.OPCODE  ;*EPI 2009/10/31
                END ELSE GOSUB STORE.INWARD.LINE
                END
            END

            IF LAST.LAYOUT.ID EQ '' OR LAST.LAYOUT.ID NE ACT.LAYOUT.ID THEN GOSUB READ.CODE.LAYOUT

            IF SW.RECOVERY AND COUNTER.FOR.COMMITMENT LE COUNTER.FOR.RECOVERY THEN RETURN

            GOSUB CALC.SEQ.NEXT
            ID.NEW = Y.PROCESS.DATE:'.':ACT.OPCODE[1,3]:'.':FMT(Y.SEQ.NEXT,SEQ.FORMAT)

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
                Y.CT = DCOUNT(R.ACT.LAYOUT<CEC.LAY.VALIDATION.RTN>,@VM)
                FOR ILD = 1 TO Y.CT
                    RTN.ID = TRIM(FIELD(R.ACT.LAYOUT<CEC.LAY.VALIDATION.RTN,ILD>,"@",2))
                    IF RTN.ID THEN
                       NB.VAL.RTN += 1
                        VAL.RTN<1,NB.VAL.RTN> = RTN.ID
                    END
                NEXT ILD
            END

            AUTH.RTN = DEF.AUTH.RTN ; NB.AUTH.RTN = DEF.NB.AUTH.RTN
            IF R.ACT.LAYOUT<CEC.LAY.AFTER.AUTH.RTN> NE '' THEN
                Y.CT1=  DCOUNT(R.ACT.LAYOUT<CEC.LAY.AFTER.AUTH.RTN>,@VM)
                FOR ILD = 1 TO Y.CT1
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
            SW.ANNEX.FOUND = ''; Y.COUNT4 = DCOUNT(ACT.ANNEX.LAYOUT.ID,@VM)
            FOR IJK = 1 TO Y.COUNT4
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
STORE.INWARD.LINE:
***********************************************************************

            CALL F.MATWRITE(CEC.INWARD.FILE,ID.NEW,MAT R.NEW,CEC.IC.AUDIT.DATE.TIME)

            IF MOD(COUNTER.FOR.COMMITMENT,COMMIT.NUMBER) EQ 0 THEN
                IF RUNNING.UNDER.BATCH ELSE
                    IF SW.EXTRACT.FROM.PENDING EQ '' THEN
                        SW.COMMIT = 'Y'
                        GOSUB REMIT.TRAILER.UPDATE
                        SW.COMMIT = ''
                    END
                        CALL JOURNAL.UPDATE(ID.NEW)
                END
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
            IF R.ANNEX.RECORD NE '' THEN ACT.DAT.RECORD := @VM:R.ANNEX.RECORD ; R.ANNEX.RECORD = '';

            CALL Y.MAP.CEC.INWARD('DAT',ACT.DAT.RECORD,N.ERR)
            IF N.ERR THEN
                Y.CT3 = DCOUNT(N.ERR,@FM)
                FOR JDF = 1 TO Y.CT3
                    LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.REJECT.TXN.REASON':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT:@VM:N.ERR<JDF>
                    CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                    GOSUB UPDATE.LOG.FILE
                NEXT JDF
            END

*     Extraction of useful fields data from the 3 layout sequences.

            CEC.IDS = REH.CEC.IDS; NB.KEYS = 0
            NB.KEYS = DCOUNT(ACT.LAYOUT.FIELDS<1>,@VM)
            FOR IDW = 1 TO NB.KEYS
                L.KEY.DATA = TRIM(ACT.LAYOUT.FIELDS<9,IDW>)     ;*," ","A")
                L.KEY.RANK = ACT.LAYOUT.FIELDS<7,IDW>
                GOSUB UPDATE.REFERENCE
            NEXT IDW

            OLD.CEC.TXN.CONCAT.ID = ''

            IF R.ACT.LAYOUT<CEC.LAY.PREVIOUS.OPER> THEN
                OLD.CEC.MSG.CONCAT.ID = ''
                FIL = 0
                LOCATE 'MOLD' IN CEC.IDS<1,1> SETTING FIL THEN
                IN.STRING = CEC.IDS<3,FIL,3>
                CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
                CEC.IDS<3,FIL,3> = OUT.STRING
                OLD.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
                CHANGE @SM TO '\' IN OLD.CEC.MSG.CONCAT.ID
            END
*        IF OLD.CEC.MSG.CONCAT.ID EQ '' THEN
*            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.REM.ORIG.ID':@FM:Y.REMIT.NUM
*           CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
*           GOSUB UPDATE.LOG.FILE
*        END
            FIL = 0; NB.SM.VAL = 0
            LOCATE 'TOLD' IN CEC.IDS<1,1> SETTING FIL THEN
            NB.SM.VAL = DCOUNT(CEC.IDS<3,FIL>,@SM)
            IN.STRING = CEC.IDS<3,FIL,4>
            CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
            CEC.IDS<3,FIL,4> = OUT.STRING
            OLD.CEC.TXN.CONCAT.ID = CEC.IDS<3,FIL>
            CHANGE @SM TO '\' IN OLD.CEC.TXN.CONCAT.ID
        END
        IF OLD.CEC.TXN.CONCAT.ID EQ '' THEN
            LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.TXN.ORIG.ID':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
        END
    END

    NEW.CEC.TXN.CONCAT.ID = ''; FIL = 0
    LOCATE 'TNEW' IN CEC.IDS<1,1> SETTING FIL THEN
    IN.STRING = CEC.IDS<3,FIL,4>
    CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
    CEC.IDS<3,FIL,4> = OUT.STRING
    NEW.CEC.TXN.CONCAT.ID = CEC.IDS<3,FIL>
    CHANGE @SM TO '\' IN NEW.CEC.TXN.CONCAT.ID
    END

    IF NEW.CEC.TXN.CONCAT.ID EQ '' THEN
        LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.MISSING.TXN.ID':@FM:Y.REMIT.NUM:@VM:COUNTER.FOR.COMMITMENT
        CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
        GOSUB UPDATE.LOG.FILE
    END
    FIL = 0
    LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
    IN.STRING = CEC.IDS<3,FIL,3>
    CALL Y.REPLACE.CHAR.IN.KEY(IN.STRING,OUT.STRING)
    CEC.IDS<3,FIL,3> = OUT.STRING
    NEW.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
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

*     LOCATE 'REASON' IN CEC.IDS<1,1> SETTING FIL THEN
*        R.NEW(CEC.IC.REASON.CODE) = CEC.IDS<3,FIL,1>
*     END

    IF R.NEW(CEC.IC.PAYMENT.DETAILS) EQ '' THEN
        N.NARRATIVE = ''; FIL = 0
        LOCATE 'NARR' IN CEC.IDS<1,1> SETTING FIL THEN
        N.NARRATIVE = CEC.IDS<3,FIL>
        CHANGE @SM TO @VM IN N.NARRATIVE
        IEB = 0
        Y.CT4 = DCOUNT(N.NARRATIVE,@VM)
        FOR IQJ = 1 TO Y.CT4
            IF N.NARRATIVE<1,IQJ> NE '' THEN
                IEB += 1 
                R.NEW(CEC.IC.PAYMENT.DETAILS)<1,IEB> = N.NARRATIVE<1,IQJ>
            END
        NEXT IEB
    END
    END

    IF R.NEW(CEC.IC.THEIR.ADDRESS) EQ '' THEN
        N.ADDRESSE = ''; FIL = 0
        LOCATE 'ADDR' IN CEC.IDS<1,1> SETTING FIL THEN
        N.ADDRESSE = CEC.IDS<3,FIL>
        CHANGE @SM TO @VM IN N.ADDRESSE
        IEB = 0
        Y.CT5 = DCOUNT(N.ADDRESSE,@VM)
        FOR IQJ = 1 TO Y.CT5
            IF N.ADDRESSE<1,IQJ> NE '' THEN
                IEB += 1 ;
                R.NEW(CEC.IC.THEIR.ADDRESS)<1,IEB> = N.ADDRESSE<1,IQJ>
            END
        NEXT IEB
    END
    END

*     Verify, complete and adjust the already mapped R.NEW fields
    NB.KEYS = 0
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
        CASE 1        ;* No entries except fees
            IF ACT.COMMISSION.CODE EQ 'DEBIT PLUS CHARGES' OR ACT.CHARGE.CODE EQ 'DEBIT PLUS CHARGES' THEN
                IF ACCT.ID MATCH '3A9N' ELSE R.NEW(CEC.IC.CHARGE.ACCT.NO) = ACCT.ID
            END
    END CASE

    CUSTOMER.SIGN = R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN>

    GOSUB CHECK.VALUE.DATES
    IF E THEN GOSUB UPDATE.OVERRIDE

    R.NEW(CEC.IC.TRANSACTION.TYPE) = YR.FTTC.ID
    R.NEW(CEC.IC.CURR.NO) = 1
    R.NEW(CEC.IC.CO.CODE) = ID.COMPANY
    R.NEW(CEC.IC.DATE.TIME) = DT
    R.NEW(CEC.IC.INPUTTER) = TNO:"_":OPERATOR
    R.NEW(CEC.IC.AUTHORISER) = TNO:"_":OPERATOR
    R.NEW(CEC.IC.DEPT.CODE) = R.USER<EB.USE.DEPARTMENT.CODE>

    IF PENDING.DATE AND SW.PENDING.USED EQ 'Y' ELSE
        IF SW.EXTRACT.FROM.PENDING EQ '' THEN GOSUB GENERATE.ACCOUNTING.ENTRIES
    END

    GOSUB STORE.INWARD.LINE

    RETURN

***********************************************************************
UPDATE.REFERENCE:
***********************************************************************

    CHANGE ',' TO @FM IN L.KEY.RANK
    Y.CT6 = DCOUNT(L.KEY.RANK,@FM)
    FOR IRQ = 1 TO CT6
        L.KEY.PREFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",1)
        L.KEY.SUFFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",2)
        L.KEY.WRAP = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",3)
        LFI = 0; ITW = 0
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
            NB.IDENT = 0
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

*     R.NEW(CEC.IC.INITIAL.BBAN) = ACCT.ID
*     IF BBAN.TO.ACCOUNT.RTN <> '' THEN
*        SAVE.COMI = COMI ; COMI = ACCT.ID ; ETEXT = ''
*        CALL @BBAN.TO.ACCOUNT.RTN
*        IF COMI THEN ACCT.ID = COMI
*        COMI = SAVE.COMI ; ETEXT = ''
*     END
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
CALC.SEQ.NEXT:
***********************************************************************
    FGH=0
    LOCATE ACT.OPCODE[1,3] IN R.SEQ.NEXT<1,1> SETTING FGH THEN
    R.SEQ.NEXT<2,FGH> += 1
    Y.SEQ.NEXT = R.SEQ.NEXT<2,FGH>
    NB.OPCD = DCOUNT(R.SEQ.NEXT<3,FGH>,@SM)
    IF ACT.OPCODE EQ R.SEQ.NEXT<3,FGH,NB.OPCD> THEN
        R.SEQ.NEXT<5,FGH,NB.OPCD> = Y.SEQ.NEXT
    END ELSE
        R.SEQ.NEXT<3,FGH,NB.OPCD+1> = ACT.OPCODE
        R.SEQ.NEXT<4,FGH,NB.OPCD+1> = Y.SEQ.NEXT
        R.SEQ.NEXT<5,FGH,NB.OPCD+1> = Y.SEQ.NEXT
    END
    END ELSE
    Y.SEQ.NEXT = 0 ; ER = ''; R.CEC.INWARD = ""

*        See if (an)other tape(s) have been already processed TODAY

    CALL F.READ(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE,R.CEC.INWARD.CONCAT,F.CEC.INWARD.CONCAT,ER)
    IF NOT(ER) THEN
        Y.CTR12 = DCOUNT(R.CEC.INWARD.CONCAT<1>,@VM)
        FOR ITU = 1 TO Y.CTR12
            R.SICF = '' ; ER = ''
            CALL F.READ(CEC.INWARD.FILES.FILE,R.CEC.INWARD.CONCAT<1,ITU>,R.SICF,F.CEC.INWARD.FILES,ER)
            IF NOT(ER) THEN
                Y.CTR13 = DCOUNT(R.SICF<CEC.ICF.REM.HEADER>,@VM)
                FOR ILU = 1 TO Y.CTR13
                    IF ACT.OPCODE[1,3] EQ R.SICF<CEC.ICF.TRANS.CODE,ILU>[1,3] THEN
                        OUF = DCOUNT(R.SICF<CEC.ICF.TRANS.LAST,ILU>,@SM)
                        Y.SEQ.LAST = R.SICF<CEC.ICF.TRANS.LAST,ILU,OUF>
                        IF Y.SEQ.LAST AND Y.SEQ.LAST GT Y.SEQ.NEXT THEN Y.SEQ.NEXT = Y.SEQ.LAST
                    END
                NEXT ILU
            END
        NEXT ITU
    END
    Y.SEQ.NEXT += 1
    R.SEQ.NEXT<1,-1> = ACT.OPCODE[1,3]
    R.SEQ.NEXT<2,-1> = Y.SEQ.NEXT
    R.SEQ.NEXT<3,-1> = ACT.OPCODE
    R.SEQ.NEXT<4,-1> = Y.SEQ.NEXT
    R.SEQ.NEXT<5,-1> = Y.SEQ.NEXT
    END

    RETURN

***********************************************************************
CREATE.MSG.CONCAT.FILE:
***********************************************************************

*     Create an entry in the CEC.MSG.CONCAT file to retrieve the linked CEC messages

    IF NEW.CEC.MSG.CONCAT.ID NE '' THEN

* An original message key is stored in a concat file

        YR.MSGC.ID = NEW.CEC.MSG.CONCAT.ID
        ER = '' ; R.MSGC = ''
        CALL F.READ(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC,F.CEC.MSG.CONCAT,ER)
        IF ER THEN
            R.MSGC<1> = CEC.INWARD.FILES.ID
            R.MSGC<2> = Y.REMIT.NUM
        END ELSE
            LOG.LEVEL = '' ;
            LOG.MESSAGE = 'EB-CEC.ALREADY.MSG.ID':@FM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            NB.SIMILAR = DCOUNT(R.MSGC<1>,@VM)
            R.MSGC<1,NB.SIMILAR+1> = CEC.INWARD.FILES.ID
            R.MSGC<2,NB.SIMILAR+1> = Y.REMIT.NUM
        END
        CALL F.WRITE(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC)
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
        SW.ALREADY = 1; NB.SIMILAR = 0
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
    IF OLD.CEC.TXN.CONCAT.ID NE NEW.CEC.TXN.CONCAT.ID THEN        ;* EPI 2009.11.15
        CALL F.WRITE(CEC.TXN.CONCAT.FILE,YR.TXNC.ID,R.TXNC)
    END         ;* EPI 2009.11.15

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
        CALL Y.CEC.HIST.UPDATE('INWARD',ID.NEW,N.MSG,N.TXN,N.AMT,N.ALTN,'UPDATE',N.EXTRACT,N.HISTORY,N.ERR)
        IF N.ERR THEN R.NEW(CEC.IC.IN.REASON.OVE)<1,-1> = N.ERR

*        To complete the unmapped fields absent from the connex message

        FOR IDM = CEC.IC.THEIR.NAME TO CEC.IC.PROFIT.CENTRE.DEPT
            R.NEW(IDM) = N.EXTRACT<IDM-CEC.IC.THEIR.NAME+1>
        NEXT IDM
        IF N.HISTORY THEN R.NEW(CEC.IC.HIST.OPE.ID) = N.HISTORY
        R.NEW(CEC.IC.HIST.MSG.ID)<1,2> = OLD.CEC.MSG.CONCAT.ID
        R.NEW(CEC.IC.HIST.TXN.ID)<1,2> = OLD.CEC.TXN.CONCAT.ID
    END

    RETURN

***********************************************************************
GENERATE.ACCOUNTING.ENTRIES:
***********************************************************************

    SW.OFT = 0  ;* 21/02/2010

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
    Y.COUNT5 = DCOUNT(T.IN.REASON.OVE,@VM)
    FOR IUF = 1 TO Y.COUNT5
        DUPLICATE.MSG = 'EB-CEC.ALREADY.PROCESSED.TXN'
        CALL LOT.TRANSLATE.ERROR(DUPLICATE.MSG,'')
        IF T.IN.REASON.OVE<1,IUF> EQ DUPLICATE.MSG THEN
            REC.PROCESS.TYPE = DUPLICATE.PROC
*           IF DUPLICATE.PROC EQ 'REJ' OR DUPLICATE.PROC EQ 'MAN' THEN
            IF DUPLICATE.PROC[1,2] EQ 'RE' OR DUPLICATE.PROC EQ 'MAN' THEN
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
            IF SW.EXTRACT.FROM.PENDING EQ '' THEN R.DEBIT.ACCT = R.ACCOUNT      ;*EPI 04.01.2008
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
            IF SW.EXTRACT.FROM.PENDING EQ '' THEN R.CREDIT.ACCT = R.ACCOUNT    ;*EPI 04.01.2008
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

    IF R.NEW(CEC.IC.FOLLOW.UP.ID) NE '' THEN
        IF REC.PROCESS.TYPE[1,2] EQ 'RE' OR (REC.PROCESS.TYPE EQ 'OFT' AND ACT.PROCESS.TYPE EQ 'FUP') THEN

*           Attempt to validate and authorise a CEC.FOLLOW.UP of technical reject or 'FUP' ACCEPT

            CALL F.MATWRITE(CEC.INWARD.FILE,ID.NEW,MAT R.NEW, CEC.IC.AUDIT.DATE.TIME)
            CALL CEC.FOLLOW.UP.AUTH(R.NEW(CEC.IC.FOLLOW.UP.ID))
        END
    END

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

    IF ACCY.AMOUNT.CREDITED+0 LT 0 THEN
        MSG.ERR = 'EB-CEC.FEES.ABOVE.CREDIT.AMT'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        E = MSG.ERR
        GOSUB UPDATE.OVERRIDE
    END
    IF ACCY.AMOUNT.DEBITED+0 LT 0 THEN
        MSG.ERR = 'EB-CEC.FEES.ABOVE.DEBIT.AMT'
        CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
        TEXT = MSG.ERR
        GOSUB UPDATE.OVERRIDE
    END

*     Produce accounting entries

    SW.GEN.FT = '' ; SW.GEN.FUP = ''
    OVERRIDE.BEFORE.EB.ACCOUNTING = R.NEW(CEC.IC.OVERRIDE)
    IF LCCY.AMOUNT.CREDITED OR LCCY.AMOUNT.DEBITED OR LCCY.AMOUNT.CHARGED THEN
        TRANS.ID = ID.NEW:@VM:CEC.INWARD.FILES.ID:'-':Y.REMIT.NUM
        OHY = 0
        LOCATE 'CEC.INWARD' IN R.CEC.PARAMETER<CEC.PAR.APPLICATION.ID,1> SETTING OHY THEN
        TRANS.ID := @FM:R.CEC.PARAMETER<CEC.PAR.EB.SYSTEM.ID,OHY>
    END
    IF ACT.NOSTRO.CATEGORY EQ '' AND R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ CUSTOMER.SIGN THEN GOSUB PREVENT.NOSTRO.ENTRY
    IF ACT.PROCESS.TYPE NE 'OFT' AND ACT.PROCESS.TYPE NE 'FUP' AND (REC.PROCESS.TYPE EQ 'SNP' OR REC.PROCESS.TYPE EQ 'ALL') THEN
        SW.EB.ACCOUNTING = ''
        CURR.NO.BEFORE.EB.ACCOUNTING = CURR.NO
        CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SNP')
        IF E THEN
            FIRST.TEXT = TEXT<1,1>
            SW.EB.ACCOUNTING = 'Y'
            GOSUB UPDATE.OVERRIDE
            IF E EQ '' THEN

* See if any other EB.ACCOUNTING override is blocking the operator

                SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
                RUNNING.UNDER.BATCH = 1
*                 SAVE.OVE$FORCE.OVERRIDES = OVE$FORCE.OVERRIDES
*                 OVE$FORCE.OVERRIDES = 1
                CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','VAL')
                RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH
*                 OVE$FORCE.OVERRIDES = SAVE.OVE$FORCE.OVERRIDES
                E.BLOKAGE = ''
                Y.COUNT6 = DCOUNT(R.NEW(CEC.IC.OVERRIDE),@VM)
                FOR IGG = CURR.NO.BEFORE.EB.ACCOUNTING+1 TO Y.COUNT6
                    TEXT = R.NEW(CEC.IC.OVERRIDE)<1,IGG>
                    CHANGE '{' TO @FM IN TEXT
                    CHANGE '}' TO @VM IN TEXT
                    IF TEXT<1,1> NE FIRST.TEXT THEN
                        GOSUB UPDATE.OVERRIDE
                        IF E AND E.BLOKAGE EQ '' THEN E.BLOKAGE = E; 
                    END
                NEXT IGG
                IF E.BLOKAGE NE '' THEN
                    E = E.BLOKAGE
                    SAVE.RUNNING.UNDER.BATCH = RUNNING.UNDER.BATCH
                    RUNNING.UNDER.BATCH = 1
                    CALL EB.ACCOUNTING("ACC","DEL","","")
                    RUNNING.UNDER.BATCH = SAVE.RUNNING.UNDER.BATCH
                    R.NEW(CEC.IC.STATEMENT.NOS) = ''
                END ELSE SW.EB.ACCOUNTING = ''
                END
            END
            IF E THEN
*              BEGIN CASE
*                CASE CUSTOMER.SIGN = 'CR'
*                   ACCT.TO.RELEASE = R.NEW(CEC.IC.CREDIT.ACCT.NO)
*                CASE CUSTOMER.SIGN = 'DB'
*                   ACCT.TO.RELEASE = R.NEW(CEC.IC.DEBIT.ACCT.NO)
*                CASE 1
*                   ACCT.TO.RELEASE = ''
*              END CASE
*              IF ACCT.TO.RELEASE <> '' THEN RELEASE FBNK.ACCOUNT,ACCT.TO.RELEASE
                E = '' ; GOSUB REPLACE.CUST.ACCOUNT
                R.NEW(CEC.IC.OVERRIDE) = OVERRIDE.BEFORE.EB.ACCOUNTING
                SW.GEN.FT = 'Y' ;
                IF REC.PROCESS.TYPE EQ 'ALL' THEN SW.GEN.FUP = 'Y'
            END ELSE
                IF SW.EB.ACCOUNTING EQ '' THEN
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','AUT')
                END ELSE
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
                END
                BEGIN CASE
                    CASE CUSTOMER.SIGN EQ 'DB'
*                    IF R.NEW(CEC.IC.DEBIT.ACCT.NO) MATCH '3A9N' THEN
                        IF R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO THEN
                            SW.GEN.FT = 'Y' ;
                            IF REC.PROCESS.TYPE EQ 'ALL' THEN SW.GEN.FUP = 'Y'
                        END
                    CASE CUSTOMER.SIGN EQ 'CR'
*                    IF R.NEW(CEC.IC.CREDIT.ACCT.NO) MATCH '3A9N' THEN
                        IF R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO THEN
                            SW.GEN.FT = 'Y' ;
                            IF REC.PROCESS.TYPE EQ 'ALL' THEN SW.GEN.FUP = 'Y'
                        END
                END CASE
            END
            SW.EB.ACCOUNTING = ''
        END ELSE
            BEGIN CASE
                CASE REC.PROCESS.TYPE[1,2] EQ 'RE'
                    IF ACT.PROCESS.TYPE EQ 'OFT' OR ACT.PROCESS.TYPE EQ 'FUP' THEN SW.OFT = 1
                    GOSUB REPLACE.CUST.ACCOUNT
                    SW.GEN.FUP = 'Y'
                CASE REC.PROCESS.TYPE EQ 'MAN'
                    IF ACT.PROCESS.TYPE NE 'OFT' AND ACT.PROCESS.TYPE NE 'FUP' THEN
                        GOSUB REPLACE.CUST.ACCOUNT
                    END
                    SW.GEN.FUP = 'Y'
                    IF ACT.PROCESS.TYPE NE 'FUP' THEN SW.GEN.FT = 'Y'
                CASE REC.PROCESS.TYPE EQ 'FUP'
                    IF ACT.PROCESS.TYPE NE 'FUP' THEN
                        IF ACT.PROCESS.TYPE EQ 'OFT' THEN SW.OFT = 1
                        GOSUB REPLACE.CUST.ACCOUNT
                    END
                    SW.GEN.FUP = 'Y'
                CASE REC.PROCESS.TYPE EQ 'OFT'     ;* EPI 21/02/2010
                    IF ACT.PROCESS.TYPE EQ 'FUP'
                        THEN SW.GEN.FUP = 'Y'         ;* 'ACCEPT'
                    ELSE SW.GEN.FT = 'Y'
                CASE 1
                    CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
            END CASE
        END
    END

*     Generate an acceptation FT and/or a reject SIT.FOLLOW.UP
*************************************************************************************************************************
************************************************************************************************************************

    IF R.ACT.LAYOUT<CEC.LAY.REJECT.OPER> EQ '' THEN SW.GEN.FUP = ''

    BEGIN CASE
        CASE SW.GEN.FT EQ 'Y' AND SW.GEN.FUP EQ 'Y'
            CALL Y.CEC.FUP.FROM.IC('FCH',N.KEY,N.ERR)
            IF N.ERR EQ '' THEN
                IF ACT.PROCESS.TYPE EQ 'OFT'
                    THEN GOSUB GENERATE.DETAIL.FT
                ELSE CALL Y.CEC.FT.FROM.IC('GEN','',N.ERR)
                IF N.ERR EQ '' THEN CALL Y.CEC.FUP.FROM.IC('MOD',N.KEY,N.ERR)
            END
        CASE SW.GEN.FT EQ 'Y'
            IF ACT.PROCESS.TYPE EQ 'OFT'
                THEN GOSUB GENERATE.DETAIL.FT
            ELSE CALL Y.CEC.FT.FROM.IC('GEN','',N.ERR)
        CASE SW.GEN.FUP EQ 'Y'
            IF ACT.PROCESS.TYPE EQ 'FUP'
                THEN GOSUB GENERATE.DETAIL.FUP
            ELSE CALL Y.CEC.FUP.FROM.IC('GEN','',N.ERR)
    END CASE

*     Create delivery entry

    MAPPING.KEY = R.ACT.LAYOUT<CEC.LAY.MAPPING.KEY>     ;*"1996.EB.1"
    IF MAPPING.KEY NE '' AND R.ACT.LAYOUT<CEC.LAY.APPLICATION.FORMAT> NE '' THEN
        MAPPING.KEY<1,2> = R.ACT.LAYOUT<CEC.LAY.APPLICATION.FORMAT>
    END
    FLG = '' ; DEL.REF = '' ; TEXT = ''
    IF MAPPING.KEY NE '' THEN
        DEL.RTN = TRIM(FIELD(R.ACT.LAYOUT<CEC.LAY.DELIVERY.ROUTINE>,"@",2))
        IF DEL.RTN EQ '' THEN DEL.RTN = TRIM(FIELD(R.CEC.PARAMETER<CEC.PAR.DELIVERY.ROUTINE>,"@",2))
        IF DEL.RTN THEN
            CALL @DEL.RTN(MAPPING.KEY,FLG,DEL.REF,TEXT)
            IF TEXT THEN
                GOSUB UPDATE.OVERRIDE
            END ELSE
                R.NEW(CEC.IC.DELIVERY.REF) = DEL.REF
            END
        END
    END

*     After authorisation routines are run from here (e.g. answer to received request)

    FOR ILD = 1 TO NB.AUTH.RTN
        SAVE.COMI = COMI ; COMI = ''
        Y.AUTH.RTN = AUTH.RTN<1,ILD>
        CALL @Y.AUTH.RTN
        IF ETEXT
            THEN E = ETEXT
        ELSE IF COMI THEN TEXT = COMI
    GOSUB UPDATE.OVERRIDE
    COMI = SAVE.COMI
    NEXT ILD

    RETURN

* EPI 21/02/2010 <

***********************************************************************
GENERATE.DETAIL.FT:
***********************************************************************

*     Generation of a FT in 'IHLD' to make this DETAIL.ACCOUNTING

    SW.OFT = 1

*     GOSUB REPLACE.CUST.ACCOUNT
    FDD = 0
    LOCATE 'IN.FT.DETAIL' IN R.CEC.PARAMETER<CEC.PAR.DIRECTION.TYPE,1> SETTING FDD THEN
    FT.GEN.RTN = FIELD(R.CEC.PARAMETER<CEC.PAR.GENERATION.RTN,FDD>,"@",2)
    END ELSE FT.GEN.RTN = ''
    IF FT.GEN.RTN EQ '' THEN FT.GEN.RTN = 'Y.CEC.FT.GEN.OFT'
    SAVE.COMI = COMI
    COMI = ''
    CALL @FT.GEN.RTN(FT.REC.ID,R.FT.REC,N.ERR)
    IF FT.REC.ID NE '' THEN

*        Attempt to validate and authorize the generated FT

* EPI 07/04/2010 <
*        IF COMI = '' THEN CALL Y.FT.AUTH(FT.REC.ID,R.FT.REC)
    IF COMI EQ '' AND R.NEW(CEC.IC.FOLLOW.UP.ID) EQ '' THEN CALL Y.FT.AUTH(FT.REC.ID,R.FT.REC)
* EPI 07/04/2010 >
    R.NEW(CEC.IC.LINKED.FT.ID) = FT.REC.ID
*           R.NEW(CEC.IC.STATEMENT.NOS) = R.FT.REC<FT.STMT.NOS> ;* EPI 20100524

    END
    COMI = SAVE.COMI

    GOSUB REPLACE.CUST.ACCOUNT

    RETURN

* EPI 21/02/2010 >

***********************************************************************
GENERATE.DETAIL.FUP:
***********************************************************************

*     Generation of a CEC.FOLLOW.UP in 'IHLD' to make this DETAIL.ACCOUNTING

    SW.OFT = 1

*     GOSUB REPLACE.CUST.ACCOUNT
    FDD = 0
    LOCATE 'IN.FUP.DETAIL' IN R.CEC.PARAMETER<CEC.PAR.DIRECTION.TYPE,1> SETTING FDD THEN
    FUP.GEN.RTN = FIELD(R.CEC.PARAMETER<CEC.PAR.GENERATION.RTN,FDD>,"@",2)
    END ELSE FUP.GEN.RTN = ''
    IF FUP.GEN.RTN EQ '' THEN FUP.GEN.RTN = 'Y.CEC.FUP.FROM.IC'
    SAVE.COMI = COMI
    COMI = ''

    AA<-1> = 'FUP.GEN.RTN ':FUP.GEN.RTN

    CALL @FUP.GEN.RTN('GEN','',N.ERR)
    COMI = SAVE.COMI

    GOSUB REPLACE.CUST.ACCOUNT

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
RECALCULATE.CHARGES:
***********************************************************************

    SAVE.R.FTTC = R.FTTC
    SAVE.CUSTOMER.SIGN = CUSTOMER.SIGN
    CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
    CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
    CALL Y.CLEAR.SITCOM
    R.FTTC = SAVE.R.FTTC
    CUSTOMER.SIGN = SAVE.CUSTOMER.SIGN
    ACCY.AMOUNT.CREDITED = SAVE.ACCY.AMOUNT.CREDITED
    LCCY.AMOUNT.CREDITED = SAVE.LCCY.AMOUNT.CREDITED
    ACCY.AMOUNT.DEBITED = SAVE.ACCY.AMOUNT.DEBITED
    LCCY.AMOUNT.DEBITED = SAVE.LCCY.AMOUNT.DEBITED

    GOSUB CHECK.VALUE.DATES
    IF E THEN TEXT = E ; E = ''
    GOSUB UPDATE.OVERRIDE

    GOSUB CALCULATE.CHARGES
    IF E THEN TEXT = E ; E = ''
    GOSUB UPDATE.OVERRIDE

    RETURN

***********************************************************************
REPLACE.CUST.ACCOUNT:
***********************************************************************

    GOSUB CALCULATE.ACT.TRANSIT.ACCT
    BEGIN CASE
        CASE CUSTOMER.SIGN EQ 'CR'
*           IF R.NEW(CEC.IC.CREDIT.ACCT.NO) MATCH '3A9N' ELSE
            IF R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.CREDIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO ELSE
                R.NEW(CEC.IC.CREDIT.ACCT.NO) = ACT.TRANSIT.ACCT.NO
                R.NEW(CEC.IC.CREDIT.CURRENCY) = R.ACT.TRANSIT.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.CREDIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
                SAVE.ACCY.AMOUNT.DEBITED = ACCY.AMOUNT.DEBITED
                SAVE.LCCY.AMOUNT.DEBITED = LCCY.AMOUNT.DEBITED
                SAVE.ACCY.AMOUNT.CREDITED = ''
                SAVE.LCCY.AMOUNT.CREDITED = ''
                R.NEW(CEC.IC.CREDIT.AMOUNT) = ''
                R.NEW(CEC.IC.AMOUNT.CREDITED) = ''
                R.NEW(CEC.IC.AMOUNT.DEBITED) = ''
                R.NEW(CEC.IC.COMMISSION.CODE) = 'WAIVE'
                R.NEW(CEC.IC.COMMISSION.TYPE) = ''
                R.NEW(CEC.IC.COMMISSION.AMT) = ''
                R.NEW(CEC.IC.CHARGE.CODE) = 'WAIVE'
                R.NEW(CEC.IC.CHARGE.TYPE) = ''
                R.NEW(CEC.IC.CHARGE.AMT) = ''
                R.NEW(CEC.IC.AMOUNT.CHARGED) = ''
                GOSUB RECALCULATE.CHARGES
            END
        CASE CUSTOMER.SIGN EQ 'DB'
*           IF R.NEW(CEC.IC.DEBIT.ACCT.NO) MATCH '3A9N' ELSE
            IF R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.SUSPENS.ACCT.NO OR R.NEW(CEC.IC.DEBIT.ACCT.NO) EQ ACT.TRANSIT.ACCT.NO ELSE
                R.NEW(CEC.IC.DEBIT.ACCT.NO) = ACT.TRANSIT.ACCT.NO
                R.NEW(CEC.IC.DEBIT.CURRENCY) = R.ACT.TRANSIT.ACCT<AC.CURRENCY>
                R.NEW(CEC.IC.DEBIT.VALUE.DATE) = R.NEW(CEC.IC.PROCESSING.DATE)
                SAVE.ACCY.AMOUNT.CREDITED = ACCY.AMOUNT.CREDITED
                SAVE.LCCY.AMOUNT.CREDITED = LCCY.AMOUNT.CREDITED
                SAVE.ACCY.AMOUNT.DEBITED = ''
                SAVE.LCCY.AMOUNT.DEBITED = ''
                R.NEW(CEC.IC.DEBIT.AMOUNT) = ''
                R.NEW(CEC.IC.AMOUNT.CREDITED) = ''
                R.NEW(CEC.IC.AMOUNT.DEBITED) = ''
                R.NEW(CEC.IC.COMMISSION.CODE) = 'WAIVE'
                R.NEW(CEC.IC.COMMISSION.TYPE) = ''
                R.NEW(CEC.IC.COMMISSION.AMT) = ''
                R.NEW(CEC.IC.CHARGE.CODE) = 'WAIVE'
                R.NEW(CEC.IC.CHARGE.TYPE) = ''
                R.NEW(CEC.IC.CHARGE.AMT) = ''
                R.NEW(CEC.IC.AMOUNT.CHARGED) = ''
                GOSUB RECALCULATE.CHARGES
            END
    END CASE

    IF SW.OFT THEN RETURN ;* 21/02/2010

    IF ACT.NOSTRO.CATEGORY EQ '' AND R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ CUSTOMER.SIGN THEN GOSUB PREVENT.NOSTRO.ENTRY
    CALL SIT.FUP.ACCOUNTING(TRANS.ID,R.NEW(CEC.IC.STATEMENT.NOS),'A','SAO')

    RETURN

***********************************************************************
PREVENT.NOSTRO.ENTRY:
***********************************************************************

*     A global nostro entry is done during the message trailer process not here

    IF R.CEC.PARAMETER<CEC.PAR.ENTRIES.BY.LINE> THEN RETURN

    BEGIN CASE
        CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            ACCY.AMOUNT.CREDITED = 0
        CASE R.ACT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            ACCY.AMOUNT.DEBITED = 0
    END CASE


    RETURN

***********************************************************************
UPDATE.OVERRIDE:
***********************************************************************

*     An override should come in the 'TEXT' variable and an error in 'E'
*     If user's profile cannot bypass override it is turned into error.

    SAVE.E = ''
    SAVE.TEXT = TEXT

    IF TEXT THEN
        CALL SIT.STORE.OVERRIDE(CURR.NO,'',YTEXT)
        IF TEXT EQ 'Y' OR TEXT EQ SAVE.TEXT THEN          ;* User authorised to bypass the override
            IF SW.EB.ACCOUNTING THEN          ;* Automatically reported by EB.ACCOUNTING
                E = ''
            END ELSE
                TRO = 0
                LOCATE YTEXT IN R.NEW(CEC.IC.OVERRIDE)<1,1> SETTING TRO ELSE
                CURR.NO += 1 ; R.NEW(CEC.IC.OVERRIDE)<1,CURR.NO> = YTEXT
            END
        END
    END ELSE
        IF SW.EB.ACCOUNTING EQ 'Y' ELSE    ;* Otherwise reported by EB.ACCOUNTING
        TEXT = SAVE.TEXT
        SW.REFUSAL = 'Y'
        CALL SIT.STORE.OVERRIDE(CURR.NO,'Y',YTEXT)
    END
    IF E EQ '' THEN
        TEXT = SAVE.TEXT
        IF INDEX(TEXT,@FM,1) THEN
            OVERRIDE.ID = TEXT<1>
            CALL EB.BUILD.OVERRIDE.TEXT
            CALL TXT(TEXT)
        END
        E = TEXT
    END
    SAVE.E = E
    END
    END ELSE SAVE.E = E
    IF E THEN   ;* Error message trigerring a manual acceptance
        IF REC.PROCESS.TYPE EQ 'SAO' OR REC.PROCESS.TYPE EQ 'SNP' OR REC.PROCESS.TYPE EQ 'ALL' THEN
            REC.PROCESS.TYPE = 'MAN'
        END
        TR0 = 0
        LOCATE E IN R.NEW(CEC.IC.IN.REASON.OVE)<1,1> SETTING TRO ELSE
        IF R.NEW(CEC.IC.IN.REASON.OVE) EQ '' THEN
            R.NEW(CEC.IC.IN.REASON.OVE) = E
        END ELSE R.NEW(CEC.IC.IN.REASON.OVE)<1,-1> = E
        END
    END

    E = SAVE.E ; V$ERROR = '' ; ETEXT = '' ; TEXT = ''

    RETURN

***********************************************************************
REMOVE.EMPTY.CEC.INWARD.FILES:
***********************************************************************

    IF R.CEC.INWARD.FILES NE '' THEN
        IF R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,1> THEN RETURN  ;* Previous remit already processed to the end
        IF R.CEC.INWARD.FILES<CEC.ICF.FILE.TRAILER> THEN RETURN   ;* Previous file processed to the end
        SW.FILE.EMPTY = 'Y'
        FOR IRD = CEC.ICF.REM.HEADER TO CEC.ICF.REM.TRAILER
            IF R.CEC.INWARD.FILES<IRD> NE '' THEN SW.FILE.EMPTY = 'N'
        NEXT IRD
        IF SW.FILE.EMPTY EQ 'Y' THEN
            CALL F.DELETE(CEC.INWARD.FILES.FILE,CEC.INWARD.FILES.ID)
            R.CEC.INWARD.CONCAT = '' ; ER = ''
            CALL F.READ(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE,R.CEC.INWARD.CONCAT,F.CEC.INWARD.CONCAT,ER)
            IF NOT(ER) THEN
                IF R.CEC.INWARD.CONCAT EQ CEC.INWARD.FILES.ID THEN
                    CALL F.DELETE(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE)
                END ELSE
                    R.CEC.INWARD.CONCAT.SAVE = R.CEC.INWARD.CONCAT
                    R.CEC.INWARD.CONCAT = '' ; IEC = 0
                    NB.CON.FIL = DCOUNT(R.CEC.INWARD.CONCAT.SAVE,@VM)
                    FOR IRD = 1 TO NB.CON.FIL
                        IF R.CEC.INWARD.CONCAT.SAVE<1,IRD> NE CEC.INWARD.FILES.ID THEN
                            IEC += 1 ; R.CEC.INWARD.CONCAT<1,IEC> = R.CEC.INWARD.CONCAT.SAVE<1,IRD>
                        END
                    NEXT IRD
                    IF IEC LT NB.CON.FIL THEN
                        CALL F.WRITE(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE,R.CEC.INWARD.CONCAT)
                    END
                END
            END
        END
    END

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

    ER = ''; R.CUSTOMER = ''
    CALL F.READ(CUSTOMER.FILE,YR.CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,ER)

    RETURN

***********************************************************************
READ.CEC.HEADER.FILE:
***********************************************************************

    ER = ''; R.CEC.HEADER = ''
    CALL F.READ(CEC.HEADER.FILE,YR.CEC.HEADER.ID,R.CEC.HEADER,F.CEC.HEADER,ER)

    RETURN

***********************************************************************
READ.CEC.INWARD.PENDING.FILE:
***********************************************************************

    ER = ''; R.CEC.INWARD.PENDING = ''
    CALL F.READ(CEC.INWARD.PENDING.FILE,YR.CEC.INWARD.PENDING.ID,R.CEC.INWARD.PENDING,F.CEC.INWARD.PENDING,ER)

    RETURN

***********************************************************************
READ.CEC.INWARD.FILE:
***********************************************************************

    ER = ''; R.CEC.INWARD = ''
    CALL F.READ(CEC.INWARD.FILE,YR.CEC.INWARD.ID,R.CEC.INWARD,F.CEC.INWARD,ER)

    RETURN

***********************************************************************
READ.CEC.LOG.LEVEL.FILE:
***********************************************************************

    ER = ''; R.CEC.LOG.LEVEL = ''
    CALL F.READ(CEC.LOG.LEVEL.FILE,YR.CEC.LOG.LEVEL.ID,R.CEC.LOG.LEVEL,F.CEC.LOG.LEVEL,ER)

    RETURN

***********************************************************************
READ.CEC.INWARD.FILES.FILE:
***********************************************************************

*     Check if a file with a similar header already exist
*     Preference goes to an identical header, otherwise, the last one is incremented by 1
    SW.RECOVERY = ''; NB.DOTS = 0; GO.ON = 0
    NB.DOTS = COUNT(CEC.INWARD.FILES.ID,".")
    SELECT.COMMAND = 'SELECT ':CEC.INWARD.FILES.FILE:' WITH @ID LIKE ':CEC.INWARD.FILES.ID:'... BY @ID'
    AE.ID.LIST = '' ; NO.SELECTED = ''; YR.SICF.ID = ''
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
                        IF R.SICF<CEC.ICF.FILE.TRAILER> THEN      ;* Already processed to the end
                            LOG.LEVEL = '2' ;
                            LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
                            LOG.JUMP = 'Y' ; RETURN
                        END ELSE    ;* Recovery from a crash
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
                            LOG.LEVEL = '' ;
                            LOG.MESSAGE = 'EB-CEC.ALREADY.SIMILAR.FILE':@FM:LAST.PROCESS.DATE
                        END
                        IF YR.SICF.ID EQ CEC.INWARD.FILES.ID THEN
                            YR.SICF.ID.CALC = YR.SICF.ID:'.0'
                        END ELSE
                            YR.SICF.ID.CALC = YR.SICF.ID
                        END
                    END
                END ELSE
                    IF SW.HEADER.EXPECTED EQ '' THEN     ;* No file header required
                        IF ACT.REH.RECORD EQ R.SICF<CEC.ICF.REM.HEADER,1> THEN         ;* Same message being treated again
                            IF R.SICF<CEC.ICF.STMT.NOS,1> THEN    ;* Already processed to the end
                                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.MSG':@FM:LAST.PROCESS.DATE
                                LOG.JUMP = 'Y' ; RETURN
                            END ELSE          ;* Recovery from a crash
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
                        IF ACT.SUH.RECORD EQ R.SICF<CEC.ICF.FILE.HEADER> THEN          ;* Same File being treated again
                            IF R.SICF<CEC.ICF.FILE.TRAILER> THEN  ;* Already processed to the end
                                LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.ALREADY.PROCESSED.FILE':@FM:LAST.PROCESS.DATE
                            END ELSE          ;* Recovery from a crash
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
            FOUN = 0
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
WRITE.CEC.INWARD.FILES.FILE:
***********************************************************************

    R.CEC.INWARD.FILES<CEC.ICF.PROCESS.DATE> = Y.PROCESS.DATE
    R.CEC.INWARD.FILES<CEC.ICF.PROCESS.TIME> = Y.PROCESS.TIME
    R.CEC.INWARD.FILES<CEC.ICF.FILE.NAME> = PINTAPE
    CALL F.WRITE(CEC.INWARD.FILES.FILE,CEC.INWARD.FILES.ID,R.CEC.INWARD.FILES)

*     Creation of the concat file that links the processed files for a given date
    R.CEC.INWARD.CONCAT = ''; ER = ''
    CALL F.READ(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE,R.CEC.INWARD.CONCAT,F.CEC.INWARD.CONCAT,ER)
    IF ER THEN
        R.CEC.INWARD.CONCAT = CEC.INWARD.FILES.ID
    END ELSE
        DEJA = 0; NB.CON = 0
        LOCATE CEC.INWARD.FILES.ID IN R.CEC.INWARD.CONCAT<1,1> SETTING DEJA ELSE
        NB.CON = DCOUNT(R.CEC.INWARD.CONCAT<1>,@VM)
        IF R.CEC.INWARD.CONCAT<1,NB.CON> LT CEC.INWARD.FILES.ID THEN
            R.CEC.INWARD.CONCAT<1,NB.CON+1> = CEC.INWARD.FILES.ID
        END ELSE
            FOR IUP = 1 TO NB.CON
                IF R.CEC.INWARD.CONCAT<1,IUP> GT CEC.INWARD.FILES.ID THEN
                    R.CEC.INWARD.CONCAT<1,IUP> = CEC.INWARD.FILES.ID:@VM:R.CEC.INWARD.CONCAT<1,IUP>
                    EXIT
                END
            NEXT IUP
        END
    END
    END
    CALL F.WRITE(CEC.INWARD.CONCAT.FILE,Y.PROCESS.DATE,R.CEC.INWARD.CONCAT)

   ITB += 1


    IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(CEC.INWARD.FILES.ID)

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
    CALL F.WRITE(CEC.INWARD.LOG.FILE,TODAY,R.CEC.INWARD.LOG)
    LOG.MESSAGE = '' ; LOG.LEVEL = '' ; LOG.JUMP = ''

    RETURN

************************************************************************ 
CALCULATE.CHARGES:
************************************************************************

$INSERT I_LOT.ACCOUNTING

*-----------------------------------------------------------------------
    END
