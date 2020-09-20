$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.RATING.TOT.FLUX.CR.M3
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : FM, VM CHANGED TO @FM, @VM
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S 
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.STMT.ENTRY
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R13-R19/E	

    GOSUB INIT
    GOSUB PROCESS

    RETURN
*******************************
INIT:
*******************************
* $INSERT I_COMMON - Not Used anymore;ATA
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;90C')

    TO.DATE = TODAY
    ERR.ACCOUNT=""
    FN.ACCOUNT = "F.ACCOUNT"
    F.ACCOUNT = ""
    R.ACCOUNT=""
    FN.CUSTOMER.ACCOUNT="F.CUSTOMER.ACCOUNT"
    F.CUSTOMER.ACCOUNT=""
    R.CUSTOMER.ACCOUNT=""
    ERR.CUSTOMER.ACCOUNT=""
    RETURN
*******************************
OPENFILES:
*******************************
    CALLEB.SystemTables.getVFunction()COUNT,F.ACCOUNT)
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMER.ACCOUNT = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMER.ACCOUNT)
    CALL OPF(FN.Ctmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMER.ACCOUNT
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMER.ACCOUNT, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMER.ACCOUNT)
    RETURN
********************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus***********************
PROCESS:
************************************************************
    CALL F.READ(    FN.CUSTOMER.ACCOUNT,    Y.CUSTOMER,    R.CUSTOMER.ACCOUNT,    F.CUSTOMER.ACCOUNT,    ERR.CUSTOMER.ACCOUNT)
    ACCOUNT.COUNT=DCOUNT(R.CUSTOMER.ACCOUNT,@FM)
    IF R.CUSTOMER.ACCOUNT THEN
        FOR J=1 TO ACCOUNT.COUNT
            Y.COMPTE.TMP = R.CUSTOMER.ACCOUNT<J>
            CALL F.READ(    FN.ACCOUNT,    Y.COMPTE.TMP,    R.ACCOUNT,    F.ACCOUNT,    ERR.ACCOUNT)
            Y.CATEGORY=R.ACCOUNT<AC.CATEGORY>
            IF (Y.CATEGORY EQ '1002') THEN
                CALL BZ.RATING.FLUX.CREDITEUR(Y.COMPTE.TMP,FROM.DATE,TO.DATE,Y.FLUX.CREDIT.PERIOD)
                LIST.CRD.ACC=LIST.CRD.ACC:@VM:Y.FLUX.CREDIT.PERIOD
            END
        NEXT J
        Y.MAX=MAXIMUM(LIST.CRD.ACC)
        O.DATA=Y.MAX
    END
RETURN
