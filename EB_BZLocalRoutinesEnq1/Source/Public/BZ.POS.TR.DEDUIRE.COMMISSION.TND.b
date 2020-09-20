*-----------------------------------------------------------------------------
* <Rating>-31</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted VM to @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.POS.TR.DEDUIRE.COMMISSION.TND
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
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.POS.MVMT.TODAY

    K.FT = R.RECORD<PSE.OUR.REFERENCE>
    IF K.FT[1,2] EQ 'FT' THEN
        GOSUB INITIALISE
        GOSUB OPEN.FILES
        GOSUB PROCESS.DATA
    END

RETURN
*------------------------------------------------
INITIALISE:
*---------

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;R"
    F.FT = ''
    R.FT = ''
    E.FT = ''

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;on FT

RETURN
*-----------------------------------------------
OPEN.FILES:
*----------

    CALL OPF(FN.FT, F.FT)

RETURN
*-------EB.SystemTables.getVFunction()-------------EB.SystemTables.getVFunction()-------
PROCESS.DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus--

    CALL F.READ(FN.FT, K.FT, R.FT, F.FT,FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR.FT<FT.DEBIT.CURRENCY> EQ 'TND' THEN
        DRAWDOWN.CCY = R.FT<FT.CREDIT.CURRENCY>
        AMT.DEBIT = R.FT<FT.CREDIT.AMOUNT>
        CCY.DEBIT = DRAWDOWN.CCY
        CCY.CREDIT = 'TND'
    END ELSE
        DRAWDOWN.CCY = R.FT<FT.DEBIT.CURRENCY>
        AMT.DEBIT = R.FT<FT.DEBIT.AMOUNT>
        CCY.DEBIT = DRAWDOWN.CCY
        CCY.CREDIT = 'TND'
    END

    CALL CALCULATE.CHARGE("1",AMT.DEBIT,CCY.DEBIT,"1",R.FT<FT.TREASURY.RATE>,CCY.CREDIT,DRAWDOWN.CCY,R.FT<FT.COMMISSION.TYPE> : @VM : R.FT<FT.CHARGE.TYPE>,"",FT.COM.LCY,FT.COM.FCY)

    IF O.DATA[1,1] EQ '-' THEN
        O.DATA = O.DATA + FT.COM.LCY
    END ELSE
        O.DATA = O.DATA - FT.COM.LCY
    END


RETURN
*---------------------------------------------
