$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ETR.SET.DEFAULT.ANNULE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------

*ZIT-UPG-R13-R19 : VM CHANGED TO @VM
*				   VARIABLE INITIALISED
* ----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.FUNDS.TRANSFER


    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

INITIALISATION:

* $INSERT I_COMMON - Not Used anymore;.TRANSFER"
    F.FT = ""
	FT.ERR = ''
	FT.REC = ''
	

    CALL OPF(FN.FT, F.FT)

    FN.FT.HIS = "F.FUNDS.TRANSFER$HIS"
    F.FT.HIS = ""
	FT.HIS.REC = ""
	FT.HIS.ERR = ""

    CALL OPF(FN.FT.HIS, F.FT.HIS)

    RECORD.FINAL = ""
    Y.LIST.TYPE = ''

    RETURN

MAIN.PROCESS:

    DATA.ID = R.NEW(FT.DEBFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus2]

    CALL F.READ(FN.FT,DATA.ID,FT.REC,F.FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusIF FT.REC THEN
        RECORD.FINAL = FT.REC
    END ELSE
        CALL F.READ.HISTORY(FN.FT.HIS,DATA.ID,FT.HIS.REC,F.FT.HIS,FT.HIS.ERR)
        IF FT.HIS.REC THEN
            RECORD.FINAL = FT.HIS.REC
        END
    END

    IF RECORD.FINAL THEN
        RIB.BEN = RECORD.FINAL<FT.IN.BEN.ACCT.NO>
        RIB.BEN.CUS = RECORD.FINAL<FT.IN.BEN.CUSTOMER>
        ORDERING.CUS = RECORD.FINAL<FT.ORDERING.CUST>
        PAYMENT.DETAIL = RECORD.FINAL<FT.PAYMENT.DETAILS>

        R.NEW(FT.BEN.CUSTOMER) = ORDERING.CUS
        R.NEW(FT.ORDERING.CUST) = RIB.BEN:@VM:RIB.BEN.CUS
        R.NEW(FT.PAYMENT.DETAILS) = PAYMENT.DETAIL


        REB.DataAccess.OpfRN

    END
