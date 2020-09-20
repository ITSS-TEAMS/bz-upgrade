*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : Commented I_F.CHEQUES.PRESENTED & I_F.CHEQUES.STOPPED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VAL.CHEQUE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------
* Used as validation routine for CEC
*-----------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-ARITHEMTIC OPERATION TO OPERANDS
*-----------------------------------------------------
     $INSERT I_COMMON			
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
$INSERT I_F.CEC.INWARD
$INSERT I_F.CEC.LAYOUT
    $INSERT I_F.PAYMENT.STOP
    $INSERT I_F.CHEQUE.REGISTER

* $INSERT I_COMMON - Not Used anymore;*$INSERT I_F.CHEQUES.PRESENTED
** $INSERT I_EQUATE - Not Used anymore;I_F.CHEQUES.STOPPED
 * $INSERT I_ENQUIRY.COMMON - Not Used anymore;.SUPPLEMENT
*ZIT-UPG-R09-R13/E
    $INSERT I_F.CHEQUE.ISSUE
    $INSERT I_F.CQ.PARAMETER
    $INSERT I_F.ACCOUNT
$INSERT I_LOTERR
$INSERT I_CECFMT
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_SITCOM
$INSERT I_SITCHQ
$INSERT I_CECLIN
$INSERT I_ACT.CECLAY
$INSERT I_NEXT.CECLAY
	EB.SystemTables.getVFunction()CEC.VAL.CHEQUEB.SystemTables.getVFunction()XT = ''

    CHEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCEC.IC.CHEQUE.TYPE)
    CHEQUE.NUMBER = R.NEWFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMBER)
    Y.ACCOUNT = R.NEW(CEC.IC.INITIAL.ACCOUNT)
    Y.AMOUNT = R.NEW(CEC.IC.INITIAL.AMOUNT)
    IF CHEQUE.NUMBER AND Y.ACCOUNT THEN
        CALL CEC.CHEQUE.TYPE(Y.ACCOUNT)
        R.NEW(CEC.IC.CHEQUE.TYPE) = CHEQUE.TYPE
        IF CHEQUE.TYPE EQ '' THEN
            MSG.ERR = 'EB-CEC.CHEQUE.UNKNOWN.TYPE'
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            ETEXT = MSG.ERR
        END ELSE GOSUB CHEQUE.CHECKS
    END

    RETURN



*************************************************************************

END
