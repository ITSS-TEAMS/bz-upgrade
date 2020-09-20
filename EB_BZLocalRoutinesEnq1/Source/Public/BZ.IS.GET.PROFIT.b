*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.GET.PROFIT(ID.LD,MNT.PROFIT,TOT.PROFIT,DATE.REF)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------------------------
*ZIT-UPG-R13-R19- CONVERT TO CHANGE
*******************************************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ENQUIRY
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LMM.SCHEDULE.DATES
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.LMM.SCHEDULES.PAST
$INSERT I_F.LMM.SCHEDULES
$INSERT I_F.LD.LOANS.AND.DEPOSITS
$INSERT I_F.PERIODIC.INTEREST
$INSERT I_F.BASIC.RATE.TEXT
$INSERT I_F.LMM.ACCOUNT.BALANCES
$INSERT I_LD.ENQ.COMMON
$INSERT I_F.PD.PAYMENT.DUE
$INSERT I_LD.SCH.LIST
* $INSERT I_COMMON - Not Used anymore;



    ID = ID.LD : '00'
* ENQ.SELECTION  = "TEST77" : @FM : "CONTRACT.ID" : @FM : "EQ" : @FM : "LD1017300002"

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;F.LMM.ACCOUNT.BALANCES'
    F.LMM.ACCOUNT.BALANCES = ''
    K.LMM.ACCOUNT.BALANCES = ID
    R.RECORD = ''                       
    E.LMM.ACCOUNT.BALANCES =''

    CALL OPF(FN.LMM.ACCOUNT.BALANCES,F.LMM.ACCOUNT.BALANCES)

    CALL F.READ(FN.LMM.ACCOUNT.BALANCES,K.LMM.ACCOUNT.BALANCES,R.RECORD,F.LMM.ACCOUNT.BALANCES,E.LMM.ACCOUNT.BALANCES)
    IF R.RECORD NE '' THEN
        EB.SystemTables.getVFunction()Q.INT.I
        CALL E.LD.SCHED.LIST

FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTE.SCH = R.RECORD<15>
    INT.SCH = R.RECORD<FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERT @VM TO @FM IN DATE.SCH
*    CONVERT @VM TO @FM IN INT.SCH	
	CHANGE @VM TO @FM IN DATE.SCH
    CHANGE @VM TO @FM IN INT.SCH
	
    NB.ECH = DCOUNT(DATE.SCH,@FM)

    TOT.PROFIT = SUM(INT.SCH)

    FOR I = 1 TO  NB.ECH
        IF DATE.SCH<I> GE DATE.REF THEN
            MNT.PROFIT = MNT.PROFIT + INT.SCH<I>
        END

    NEXT I



    RETURN
