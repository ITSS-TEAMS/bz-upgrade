*-------------------------------
*Author ameni younes
*-------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.DTE.OUV.ANC
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

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; FM CHANGED TO @FM
*-----------------------------------------------------------------------------	
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
*ZIT-UPG-R13-R19/E
*-------------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN

*-------------------------------

INIT:

    Y.CUS=O.DATA

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
	ACCOUNT.REC = ''
	ERR.ACCOUNT = ''
    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
	CUSTOMER.REC = ''
	ERR.CUSTOMER = ''
    FN.CUSTOMER.ACCOUNT = 'F.CUSTOMER.ACCOUNT'
    F.CUSTOMER.ACCOUNT = ''
	CUSTOMER.ACCOUNT.REC = ''
	ERR.CUSTOMER.ACCOUNT = ''
tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction()STOMER.ACCOUNtmp.V$FUNCTIONER.ACCOUNT)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    CFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT,F.ACCOUNT)

    CALL OPF(FN.CUSTOMER,F.CUSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN
*----------------------------------------------------------
MAIN:
    CALL F.READ(FN.CUSTOMER.ACCOUNT, Y.CUS,  CUSTOMER.ACCOUNT.REC,  F.CUSTOMER.ACCOUNT, ERR.CUSTOMER.ACCOUNT)
    IF CUSTOMER.ACCOUNT.REC EQ '' THEN
        CALL F.READ(FN.CUSTOMER, Y.CUS,  CUSTOMER.REC,  F.CUSTOMER, ERR.CUSTOMER)

        Y.CONT.DTA=CUSTOMER.REC<EB.CUS.CONTACT.DATE>
        O.DATA=Y.CONT.DTA

    END ELSE
        ACC.COUNT = DCOUNT(CUSTOMER.ACCOUNT.REC,@FM)

        FOR COMPTEUR.ACC=1 TO ACC.COUNT
            ACC.ID = CUSTOMER.ACCOUNT.REC<COMPTEUR.ACC>
            CALL F.READ(FN.ACCOUNT, ACC.ID,  ACCOUNT.REC,  F.ACCOUNT, ERR.ACCOUNT)

            Y.DTE=ACCOUNT.REC<AC.OPENING.DATE>
            LIST.OP.ACC<-1>=Y.DTE
        NEXT COMPTEUR.ACC
        Y.MIN=MINIMUM(LIST.OP.ACC)
        O.DATA=Y.MIN
    END
    RETURN
