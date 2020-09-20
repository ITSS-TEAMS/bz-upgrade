*-----------------------------------------------------------------------------
* <Rating>200</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : CHEQUES.PRESENTED & CHEQUES.STOPPED is replaced with
*                   CHEQUE.REGISTER.SUPPLEMENT
*
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted Arithmatic operation
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.FUP.VAL.CHEQUE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------
* Used as validation routine for OUWARD.160
*--------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_F.CEC.FOLLOW.UP
    $INSERT I_F.CEC.PARAMETER
    $INSERT I_F.CEC.LAYOUT
    $INSERT I_F.PAYMENT.STOP
    * $INSERT I_COMMON - Not Used anymore;UE.REGISTER
* $INSERT I_EQUATE - Not Used anymore;*$INSERT I_F.CHEQUES.PRESENTED
    * * $INSERT I_ENQUIRY.COMMON - Not Used anymore;REQUEST - Not Used anymore;UPPLEMENT
*$INSERT I_F.CHEQUES.STOPPED
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
    $INSEB.SystemTables.getVFunction().CECLAY

    ETEXT = ''

    IF R.NEWFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusNK) EQ R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE>FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEQUE.TYPE = R.NEW(CEC.FUP.CHEQUE.TYPE)
        CHEQUE.NUMBER = R.NEW(CEC.FUP.CHEQUE.NUMBER)
        Y.ACCOUNT = R.NEW(CEC.FUP.INITIAL.ACCOUNT)
        Y.AMOUNT = R.NEW(CEC.FUP.INITIAL.AMOUNT)
        IF CHEQUE.NUMBER AND Y.ACCOUNT THEN
            IF Y.ACCOUNT MATCH '3A9N' ELSE
                CALL CEC.CHEQUE.TYPE(Y.ACCOUNT)
                R.NEW(CEC.FUP.CHEQUE.TYPE) = CHEQUE.TYPE
                IF CHEQUE.TYPE EQ '' THEN
                    MSG.ERR = 'EB-CEC.CHEQUE.UNKNOWN.TYPE'
                    CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                    COMI = MSG.ERR
                END ELSE GOSUB CHEQUE.CHECKS
            END
        END
    END

RETURN

$INSERT I_CEC.VAL.CHEQUE

*************************************************************************

END
