*-----------------------------------------------------------------------------
* <Rating>95</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : CHEQUES.PRESENTED & CHEQUE.STOPPED changed to CHEQUE.REGISTER.SUPPLEMENT
*ZIT-UPG-R13-R19  : ARITHEMATIC OPERATOR CHANGED TO T24 OPERATOR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE LOT.DET.VAL.CHEQUE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------
* Used as validation routine for a remitted cheque.
*--------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_F.CFONB.LAYOUT
    $INSERT I_F.PAYMENT.STOP
    $INSERT I_F.LOT.PARAMETER
    $INSERT I_F.CHEQUE.REGISTER
*ZIT-UPG-R09-R13/S
*$INSERT I_F.CHEQUES.PRESENTED
** $INSERT I_COMMON - Not Used anymore;I_F.CHEQUES.STOPPED
    * $INSERT I_EQUATE - Not Used anymore;UE.REGISTER.SUPPLEMENT
*ZIT-UPG-R09-R13/E
    $INSERT I_F.CHEQUE.ISSUE
    $INSERT I_F.CQ.PARAMETER
    $INSERT I_F.ACCOUNT
    $INSERT I_LOTPAR
    $INSERT I_LOTERR
    $INSERT I_LOTDET
    $INSERT I_SITCOM
    $INSERT I_SITCHQ

    ETEXT = ''

    LOCATE 'CHEQUE.NUM' IN R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,1> SETTING FSA THEN
        CHEQUE.NUMBER = DET.ADDITIONAL<1,FSA-11>
    END

    LOCATE 'CHEQUE.TYPE' IN R.LOT.PARAMETER<LOT.PAR.FT.FIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusNG FSA THEN
        CHEQUE.TYPE = DET.ADDITIOFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  END

    Y.ACCOUNT = ''
    IF DET.THEIR.BANK EQ R.LOT.PARAMETER<LOT.PAR.BANK.PID.CODE> THEN Y.ACCOUNT = DET.THEIR.ACCOUNT

    Y.AMOUNT = DET.AMOUNT

    IF CHEQUE.NUMBER AND Y.ACCOUNT THEN
        CALL LOT.CHEQUE.TYPE(Y.ACCOUNT)
        LOCATE 'CHEQUE.TYPE' IN R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,1> SETTING FSA THEN
            DET.ADDITIONAL<1,FSA-11> = CHEQUE.TYPE
        END
*        IF CHEQUE.TYPE = '' THEN
*           MSG.ERR = 'EB-SIT.CHEQUE.UNKNOWN.TYPE'
*           CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
*           ETEXT = MSG.ERR
*        END ELSE
        GOSUB CHEQUE.CHECKS
    END
*    END

    RETURN

    $INSERT I_SIT.VAL.CHEQUE

*************************************************************************

END
