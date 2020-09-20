*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:FM converted to @FM
*-------------------------------------    
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE BZ.RATING.ENCENGBZ
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
  
    $INSERT	I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
*-----------------------------------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN
*-----------------------------------------------------
INIT:
    FN.LMM.CUSTOMER='F.LMM.CUSTOMER'
    F.LMM.CUSTOMER=''
    ID.CUSTOMER=O.DATA
    R.LMM.CUSTOMER=''
    ERR.LMM.CUSTOMER=''
	
    CALL OPF (FN.LMM.CUSTOMER, F.LMM.CUSTOMER)

* $INSERT I_EQUATE - Not Used anymore;DEPOSITS='F.LD.LOANS.AND.DEPOSITS'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;''
    R.LD.LOANS.AND.DEPOSITS=''
    ERR.LD.LOANS.AND.DEPOSITS=''

    CALL OPF (FN.LD.LOANS.AND.DEPOSITS, F.LD.LOANS.AND.DEPOSITS)
    Y.CONTRACT.NO=''
    Y.AMOUNT=''
    TOT.ENG=0
    RETURN
*------------------------------------------------------------------
MAIN:

    CALL F.READ(    FN.LMM.CUSTOMER,    ID.CUSTOMER,    R.LMM.CUSTOMER,    F.LMM.CUSTOMER,    ERR.LMM.CUSTOMER)

    Y.NB.CONTRACT.NO = DCOUNT(R.LMM.CUSTOMER,@FM)
    FOR EB.SystemTables.getVFunction()B.CONTRACT.NO
tmp.R.NEW.FT.AdhocChargeReFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusquest.ChgRecordStatusANS.AND.DEPOSITS.ERR.LD.LOANS.AND.DEPOSITS = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusANS.AND.DEPOSITS,   ERR.LD.LOANS.AND.DEPOSITS)
        CALL F.READ(    FN.LD.LOANS.AND.DEPOSITS,    R.LMM.CUSTOMER<I>,  R.LD.LOANStmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusANS.AND.DEPOSITS.ERR.LD.LOANS.AND.DEPOSITS
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusANS.AND.DEPOSITS,   ERR.LD.LOANS.AND.DEPOSITS, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusANS.AND.DEPOSITS.ERR.LD.LOANS.AND.DEPOSITS)
        Y.AMOUNT=R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT>
        Y.CATEGORY=R.LD.LOANS.AND.DEPOSITS<LD.CATEGORY>
        IF Y.CATEGORY GE 21050 AND Y.CATEGORY LE 21074 THEN
            Y.ENG=Y.AMOUNT
        END ELSE
            Y.ENG =0
        END
        TOT.ENG=TOT.ENG+Y.ENG
    NEXT I

    O.DATA=TOT.ENG

    RETURN
