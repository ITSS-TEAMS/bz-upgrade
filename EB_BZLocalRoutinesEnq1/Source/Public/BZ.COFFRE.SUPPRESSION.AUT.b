*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*** Modification History:
*** "ZIT-UPG-R13-R19"
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.SUPPRESSION.AUT
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
*ZIT-UPG-R09-R13/S
*  $INSERT BP I_F.BZ.COFFRE.EVENEMENT
*  $INSERT BP I_F.BZ.COFFRE.REGISTRE

$INSERT I_F.BZ.COFFRE.EVENEMENT
$INSERT I_F.BZ.COFFRE.REGISTRE

* $INSERT I_COMMON - Not Used anymore;

    IF (V* $INSERT I_ENQUIRY.COMMON - Not Used anymore;R (V$FUNCTION EQ 'A' AND R.NEW(CF.REG.RECORD.STATUS) EQ 'INAU') OR ( V$FUNCTION EQ 'A' AND R.NEW(CF.REG.RECORD.STATUS) EQ 'INAO') THEN



        Y.TIME = OCONV(TIME(), "MTS")
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;IME


        DATE.EVENT=TODAY
        DETAILS='AUTHORISER: ' : R.USER<EB.USE.USER.NAME>
        NUMERO.COFFRE=ID.NEW
        TYPE.EVENT='1'
        ID.CONTRAT=''
        REF.OPERATION=ID.NEW
        EB.SystemTables.getVFunction()  NUMERO.COFFEB.SystemTables.getVFunction()TE.EVENT:'.'EB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus

tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERO.COFFRE.TYPE.EVENT.ID.CONTRAT.REF.OPERATION.Y.TIME = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME)
        CALL BZ.COFFRE.EVENT(ID.EVENTtmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERO.COFFRE.TYPE.EVENT.ID.CONTRAT.REF.OPERATION.Y.TIME
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERO.COFFRE.TYPE.EVENT.ID.CONTRAT.REF.OPERATION.Y.TIME)

        RETURN

    END

END
