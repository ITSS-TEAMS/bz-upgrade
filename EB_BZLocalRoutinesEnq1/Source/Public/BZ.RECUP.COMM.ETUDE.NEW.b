*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RECUP.COMM.ETUDE.NEW
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INTIALISED F.READ VARIABLES
********************************************************
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.ACCOUNT

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
	R.ACCOUNT=''
	ERR1=''
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
* $INSERT I_COMMON - Not Used anymore;EPOSITS = O.DATA
* $INSERT I_EQUATE - Not Used anymore;EPOSITS = ''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;= ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS$NAU'
        F.LD.LOANS.AND.DEPOSITS = ''
        K.LD.LOANS.AND.DEPOSITS = O.DATA
        R.LD.LOANS.AND.DEPOSITS = ''
        E.LD.LOANS.AND.DEPOSITS = ''

        CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecorFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusITS)
        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSItmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusITS
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusITS, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusITS)

    END

    Y.DEVISE = R.LD.LOANS.AND.DEPOSITS<LD.CURRENCY>
    Y.COMPTE= R.LD.LOANS.AND.DEPOSITS<LD.PRIN.LIQ.ACCT>

    CALL F.READ(FN.ACCOUNT,Y.COMPTE,R.ACCOUNT,F.ACCOUNT,ERR1)
    IF R.ACCOUNT NE '' THEN
        Y.ACCT.CCY = R.ACCOUNT<AC.CURRENCY>
    END

    Y.MONTANT.CHARGE.CALC = R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT><1,1>

    IF Y.DEVISE EQ Y.ACCT.CCY THEN
        O.DATA = Y.MONTANT.CHARGE.CALC
    END ELSE
        GOSUB CHECK.CHARGE.AMOUNT
    END

    RETURN

**********************************
CHECK.CHARGE.AMOUNT:
**********************************

    CURRENCY.MARKET = 1 ; CHG.AMT = 0 ; BASE.CCY = ""; EXCH.RATE = "" ; LCL.AMT = 0
    CALL EXCHRATE(CURRENCY.MARKET, Y.ACCT.CCY,Y.MONTANT.CHARGE.CALC, Y.DEVISE, CHG.AMT, BASE.CCY, EXCH.RATE, "", LCL.AMT, "")

    O.DEB.DataAccess.OpfB.DataAccess.Opf CHG.AMT


    RETURN
END
