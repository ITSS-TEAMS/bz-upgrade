*-----------------------------------------------------------------------------
* <Rating>-31</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.POS.TR.DEDUIRE.COMMISSION
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------------
* Modification History :                                                                
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                      VM converted to @VM  
*---------------------------------------------------------------------------
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
* $INSERT I_COMMON - Not Used anymore;-----------------------------
INITIALISE:
*---------

    FN.FT = "F.FUNDS.TRANSFER"
    F.FT = ''
    R.FT = ''
    E.FT = ''


    Y.COM = ""      ;* Commission FT

    RETURN
*-----------------------------------------------
OPEN.FILES:
*----------

    CALLEB.SystemTables.getVFunction(), F.FT)

    RETURN
*-----------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-------------
PROCESS.DATA:
*------------
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusFN.FT, K.FT, R.FT, F.FT, E.FT)

    IF R.FT<FT.DEBIT.CURRENCY> EQ 'TND' THEN
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
       O.DATA = O.DATA + FT.COM.FCY
   END ELSE
       O.DATA = O.DATA - FT.COM.FCY
   END

    RETUREB.DataAccess.Opf*--------EB.DataAccess.Opf----------------------------------
