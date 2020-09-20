*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE LD.SCHEDULES.REPORT
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
    $INSERT I_LD.SCH.LIST
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.LMM.ACCOUNT.BALANCES

    GOSUB INIT
    GOSUB PROCESS

    RETURN

*----
INIT:
*----
    LAVEILLE = TODAY
    CALL CDT('',LAVEILLE,'-1W')

* $INSERT I_EQUATE - Not Used anymore;TE()
    Y.TIME.EXEC = TIME()

    Y.YEAR = OCONV(Y.DATE.EXEC,"DY4")
    Y.MONTH = OCONV(Y.DATE.EXEC,"DM")
    IF LEN(Y.MONTH) EQ 1 THEN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    END

    Y.DAY = OCONV(Y.DATE.EXEC,"DD")
    IF LEN(Y.DAY) EQ 1 THEN
        Y.DAY = '0' : Y.DAY
    END
    Y.TEMP.DATE.PART = Y.YEAR : Y.MONTH : Y.DAY
    Y.TEMP.TIME.PART = OCONV(Y.TIME.EXEC,'MTS')
*    CONVERT ':' TO '-' IN Y.TEMP.TIME.PART
    CHANEB.SystemTables.getVFunction()'-' IN Y.TEMPEB.SystemTables.getVFunction()


    OUT.FILEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT/LD.SCHEDULES.REPORT_' : Y.TEMP.DATE.PART : 'FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPART : '.csv'
    OPENSEQ OUT.FILE TO F.OUTFILE ELSE CRT 'New file ':OUT.FILE:' Opened'

    CALL LD.ENQ.INT.I

    R.LM      = ''
    LM.ERR1   = ''
    SEL.CMD   = ''
    SEL.LIST  = ''
    RET.CODE  = ''
    NO.OF.REC = 0

    FN.LMM.ACCOUNT.BALANCES = "F.LMM.ACCOUNT.BALANCES"
    F.LMM.ACCOUNT.BALANCES  = ""
    CALL OPF(FN.LMM.ACCOUNT.BALANCES,F.LMM.ACCOUNT.BALANCES)

    RETURN

*-------
PROCESS:
*-------
    DEBUG
    SEL.CMD = "SELECT " : FN.LMM.ACCOUNT.BALANCES : " WITH @ID LIKE 'LD1332900005...'"
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    LOOP
        REB.DataAccess.OpfVE Y.ID FROM SEL.LIST SETTING POS
    WHILEEB.DataAccess.OpfID:POS
        CALL F.READ(FN.LMM.ACCOUNT.BALANCES,Y.ID,R.LM,F.LMM.ACCOUNT.BALANCES,LM.ERR1)

        R.RECORD = R.LM
        ID       = Y.ID
        CALL E.LD.EB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.RECORD = R.LM
        IEB.DataAccess.FRead  = Y.ID
        CALL E.LD.SCHED.LIST

        INT.AMOUNT = 0
        EVENT.DATE = ''
   EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
        Y.CUEB.SystemTables.setE(R.RECORD<LD.SL.CUSTOMER.NO>)

        MAX.I   = DCEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerL.EVEEB.SystemTables.getIdNew()
        FOR I = 1 TO MAX.I
            EVENTEB.DataAccess.FWrite R.RECORD<LD.SL.EVENT.DATE,I>
            INT.AMOUNT = R.RECORD<LD.SL.INT.AMOUNT,I>
            PRIN.AMT = R.LM<LD27.TRANS.PRIN.AMT,I>

        EB.SystemTables.setAf(Y.ID:"*":Y.CUSTOMER:"*":EVENT.DATE:"*":INT.AMOUNT:"*":PRIN.AMT)
        EB.SystemTables.setE()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE LD.SCHEDULES.REPORT
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
    $INSERT I_LD.SCH.LIST
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.LMM.ACCOUNT.BALANCES

    GOSUB INIT
    GOSUB PROCESS

    RETURN

*----
INIT:
*----
    LAVEILLE = TODAY
    CALL CDT('',LAVEILLE,'-1W')

    Y.DATE.EXEC = DATE()
    Y.TIME.EXEC = TIME()

    Y.YEAR = OCONV(Y.DATE.EXEC,"DY4")
    Y.MONTH = OCONV(Y.DATE.EXEC,"DM")
    IF LEN(Y.MONTH) EQ 1 THEN
        Y.MONTH = '0' : Y.MONTH
    END

    Y.DAY = OCONV(Y.DATE.EXEC,"DD")
    IF LEN(Y.DAY) EQ 1 THEN
        Y.DAY = '0' : Y.DAY
    END
    Y.TEMP.DATE.PART = Y.YEAR : Y.MONTH : Y.DAY
    Y.TEMP.TIME.PART = OCONV(Y.TIME.EXEC,'MTS')
*    CONVERT ':' TO '-' IN Y.TEMP.TIME.PART
    CHANGE ':' TO '-' IN Y.TEMP.TIME.PART


    OUT.FILE='./RELEVES.HA.OUT/LD.SCHEDULES.REPORT_' : Y.TEMP.DATE.PART : '_' : Y.TEMP.TIME.PART : '.csv'
    OPENSEQ OUT.FILE TO F.OUTFILE ELSE CRT 'New file ':OUT.FILE:' Opened'

    CALL LD.ENQ.INT.I

    R.LM      = ''
    LM.ERR1   = ''
    SEL.CMD   = ''
    SEL.LIST  = ''
    RET.CODE  = ''
    NO.OF.REC = 0

    FN.LMM.ACCOUNT.BALANCES = "F.LMM.ACCOUNT.BALANCES"
    F.LMM.ACCOUNT.BALANCES  = ""
    CALL OPF(FN.LMM.ACCOUNT.BALANCES,F.LMM.ACCOUNT.BALANCES)

    RETURN

*-------
PROCESS:
*-------
    DEBUG
    SEL.CMD = "SELECT " : FN.LMM.ACCOUNT.BALANCES : " WITH @ID LIKE 'LD1332900005...'"
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.REC,RET.CODE)

    LOOP
        REMOVE Y.ID FROM SEL.LIST SETTING POS
    WHILE Y.ID:POS
        CALL F.READ(FN.LMM.ACCOUNT.BALANCES,Y.ID,R.LM,F.LMM.ACCOUNT.BALANCES,LM.ERR1)

        R.RECORD = R.LM
        ID       = Y.ID
        CALL E.LD.SCHED.LIST
        R.RECORD = R.LM
        ID       = Y.ID
        CALL E.LD.SCHED.LIST

        INT.AMOUNT = 0
        EVENT.DATE = ''
        PRIN.AMT = 0
        Y.CUSTOMER = R.RECORD<LD.SL.CUSTOMER.NO>

        MAX.I   = DCOUNT(R.RECORD<LD.SL.EVENT.DATE>,@VM)
        FOR I = 1 TO MAX.I
            EVENT.DATE = R.RECORD<LD.SL.EVENT.DATE,I>
            INT.AMOUNT = R.RECORD<LD.SL.INT.AMOUNT,I>
            PRIN.AMT = R.LM<LD27.TRANS.PRIN.AMT,I>

            LD.DET.ARR<-1>=Y.ID:"*":Y.CUSTOMER:"*":EVENT.DATE:"*":INT.AMOUNT:"*":PRIN.AMT
        NEXT I


    REPEAT
    CRT LD.DET.ARR

    Y.DCOUNTX = DCOUNT(LD.DET.ARR,@FM)
    FOR X=1 TO Y.DCOUNTX
        WRITESEQ LD.DET.ARR<X> ON F.OUTFILE ELSE CRT "Unable de write out" 
    NEXT X

    RETURN

END
