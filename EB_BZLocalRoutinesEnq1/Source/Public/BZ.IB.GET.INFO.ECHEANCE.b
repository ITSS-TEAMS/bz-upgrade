*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.IB.GET.INFO.ECHEANCE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R13-R19/E

    K.LD.LOANS.AND.DEPOSITS = O.DATA
	
	SQL.NEXT.IDS=''
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
	
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;S'
    F.SCHEDULE = ''
	ECHEANCE.REC = ''
	ECH.ERR = ''

    CALL OPF(FN.SCHEDULE,F.SCHEDULE)

    SQL.NEXT = "SELECT ":FN.SCHEDULE:" WITH @ID LIKE '":K.LD.LOANS.AND.DEPOSITS:"...'"

    CALL EB.READLIST(SQL.NEXT, SQL.NEXT.IDS, '',SQL.NEXT.COUNT,SQL.NEXT.ERROR)

    IF SQL.NEXT.IDS THEN

        Y.ECHEANCE.NEXT = SQL.NEXT.IDS<1>
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERR = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERR)
        EB.SystemTables.getVFunction()D(FN.SCHEDULE,Y.ECHEANCE.NEXT,ECHEAtmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERR
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERR, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERR)

        IF ECHEANCE.REC THEN
        FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCH = Y.ECHEANCE.NEXT[13,7]
            CALL JULDATE(TOD.DATE,Y.DATE.NEXT.ECH)
            Y.MNT.NEXT.ECH =  ECHEANCE.REC<LD9.SCHED.AMT>
        END

    END

    O.DATA = Y.MNT.NEXT.ECH

    R.RECORD<LD.ANNUITY.PAY.METHOD> = TOD.DATE


    RETURN
