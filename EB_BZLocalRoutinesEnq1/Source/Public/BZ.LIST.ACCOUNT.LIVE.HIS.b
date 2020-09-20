* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    :  NO CHANGES                 
*----------------------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.ACCOUNT.LIVE.HIS(Y.LIST.ACCOUNT)
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
    $INSERT I_F.USER
    $INSERT I_F.ACCOUNT


    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

    RETURN

INITIALISATION:

    FN.AC = "F.ACCOUNT"
    F.AC = ""
	AC.REC =''
	FT.ERR =''
* $INSERT I_EQUATE - Not Used anymore;F.AC)

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;    F.AC.HIS = ""
	FT.HIS.REC =''
	FT.HIS.ERR =''
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;S)

    RECORD.FINAL = ""
    Y.LIST.ACCOUNT = ''

    RETURN

MAIN.PROCESS:

    LOCATE "@ID" IN D.FIELDS<1> SETTING POS.ID ELSE NULL
    DATAEB.SystemTables.getVFunction()NGE.AND.VALUEEB.SystemTables.getVFunction()    OPERANDE.ID= DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus<POS.ID>

    DATA.ID = FMT(DATA.ID,"R%10")FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusD(FN.AC,DATA.ID,AC.REC,F.AC,FT.ERR)

    IF AC.REC THEN
        RECORD.FINAL = AC.REC
    END ELSE
        CALL F.READ.HISTORY(FN.AC.HIS,DATA.ID,FT.HIS.REC,F.AC.HIS,FT.HIS.ERR)
        IF FT.HIS.REC THEN
            RECORD.FINAL = FT.HIS.REC
        END
    END

    IF RECORD.FINAL THEN
        Y.RIB  = RECORD.FINAL<AC.ALT.ACCT.ID>
        Y.CUSTOMER   = RECORD.FINAL<AC.CUSTOMER>
        Y.CATEGORY   = RECORD.FINAL<AC.CATEGORY>
        Y.CURRENCY   = RECORD.FINAL<AC.CURRENCY>

        DATA.ID = FIELD(DATA.ID,";",1)
        Y.LIST.ACCOUNT<-1> = DATA.ID:'*':Y.RIB:'*':Y.CUSTOMER:'*':Y.CATEGORY:'*':Y.CURRENCY
    END

    RETURN


END
