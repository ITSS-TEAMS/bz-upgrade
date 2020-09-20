*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*Modification History :  
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TR.POS.GET.RATE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* @desc get FT Record Status
* @author OBenhalima
* @create 22 / 07 / 2010

$INSERT  I_COMMON
$INSERT  I_EQUATE
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_F.FUNDS.TRANSFER
$INSERT  I_F.DATA.CAPTURE
$INSERT  I_F.FOREX


    IF O.DATA[1,2] EQ 'FT' THEN
        FN.FT.NAU = 'F.FUNDS.TRANSFER$NAU'
        FN.FT = 'F.FUNDS.TRANSFER'
    END
* $INSERT I_COMMON - Not Used anymore;Q 'DC' THEN
* $INSERT I_EQUATE - Not Used anymore;"F.DATA.CAPTURE$NAU"
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;URE"
    END
    IF O.DATA[1,2] EQ 'DC' OR O.DATA[1,2] EQ 'FT' THEN
        F.FT = ''
        K.FT = ''
        R.FT = ''
        E.FT = ''
        F.FT.NAU = ''
        K.FT.NAU = ''
        R.FT.NAU = ''
        E.FT.NAU = ''

        CALL OPF(FN.FT.NAU, F.FT.NAU)
        CALL OPF(FN.FT, F.FT)

        EB.SystemTables.getVFunction()ATA

tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus)
        CALL F.READ(FN.FT, Otmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus)
        IF E.FT THEN
            CALL F.REFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusATA, R.FT, F.FT.NAU, E.FT.NAU)
        END
        IF O.DATA[1,2] EQ 'FT' THEN
            POS.RATE = FT.TREASURY.RATE
        END
        IF O.DATA[1,2] EQ 'DC' THEN
            POS.RATE = DC.DC.EXCHANGE.RATE
        END
        O.DATA = R.FT<POS.RATE>
        O.DATA = DROUND(O.DATA,"4")
    END
    RETURN
