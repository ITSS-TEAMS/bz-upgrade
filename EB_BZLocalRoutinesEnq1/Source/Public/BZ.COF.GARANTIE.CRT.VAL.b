*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.GARANTIE.CRT.VAL
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

*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.CONTRAT

*ZIT-UPG-R09-R13/E

    IF MESSAGE EQ 'VAL' THEN RETURN

* $INSERT I_EQUATE - Not Used anymore;MI


    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ''
    R.CT= ''
    ERR.CT = ''

    R.NEW(FT.CREDIT.THEIR.REF)=""
    R.NEW(FT.DEBIT.THEIR.REF)=""

    CALL OPF(FN.CT,F.CT)

    CALL F.READ(FN.CT,V.NUM.CONTRAT,R.CT,F.CT,ERR.CT)

    IF R.CT NE "" THEN

        R.NEW(FT.CREDIT.THEIR.REF)=R.CT<CF.CT.NUMERO.COFFFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusW(FT.DEBIT.THEIR.REF)=R.CT<CF.CT.NUMERO.COFFREFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSE
        AF=FT.PAYMENT.DETAILS
        ETEXT="Contrat Coffre inexistant"
        CALL STORE.END.ERROR

    END

******************************



*****
    RETURN
END
