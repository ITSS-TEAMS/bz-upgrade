*-----------------------------------------------------------------------------
* <Rating>300</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13: Commented I_F.CHEQUES.PRESENTED since it is Obselete
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.FT.VAL.CHEQUE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------
* Check routine for a CEC Inward cheque operation.
*--------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-OPERATION TO OPERANDS;ADDED MISSING INSERT 
**************************************************************************
    $INSERT I_COMMON																	  				
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
$INSERT I_F.CEC.INWARD
    $INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.LAYOUT
    $INSERT I_F.PAYMENT.STOP
    $INSERT I_F.CHEQUE.REGISTER
* $INSERT I_COMMON - Not Used anymore;*$INSERT I_F.CHEQUES.PRESENTED
* $INSERT I_EQUATE - Not Used anymore;EGISTER.SUPPLEMENT
*ZIT-UPG-R09-R13/E
*    * $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ES.STOPPED   ;*OBSOLETE										
    $INSERT I_F.CHEQUE.ISSUE
    $INSERT I_F.CQ.PARAMETER
    $INSERT I_F.ACCOUNT
	* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;T ;*ADDED
$INSERT I_LOTERR
$INSERT I_CECFMT
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_SITCOM
$INSERT I_SITCHQ
$INSERT I_CECLIN
$INSERT I_ACT.CECLAY
$INSERT EB.SystemTables.getVFunction()LAY
	$INSERT I_CEC.VAL.CHEQUE
	

    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus BEGIN CASE
    CASE CUSTOMER.SIGN EQ 'DB'
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= R.NEW(FT.DEBIT.ACCT.NO)
        Y.AMOUNT = R.NEW(FT.DEBIT.AMOUNT)
    CASE CUSTOMER.SIGN EQ 'CR'
        Y.ACCOUNT = R.NEW(FT.CREDIT.ACCT.NO)
        Y.AMOUNT = R.NEW(FT.CREDIT.AMOUNT)
    CASE 1
        RETURN
    END CASE

    IF CHEQUE.NUMBER AND Y.ACCOUNT THEN
        IF Y.ACCOUNT MATCH '3A9N' ELSE
            CALL Y.LOAD.SITCHQ
            SAVE.COMI = COMI ; COMI = ''
            CALL CEC.CHEQUE.TYPE(Y.ACCOUNT)
            IF CHEQUE.TYPE EQ '' THEN
                MSG.ERR = 'EB-CEC.CHEQUE.UNKNOWN.TYPE'
                CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                ETEXT = MSG.ERR
            END ELSE GOSUB CHEQUE.CHECKS
            IF ETEXT THEN COMI = ETEXT
            IF COMI THEN E = COMI
         EB.DataAccess.OpfCOMI = SAVE.COMI
        EEB.DataAccess.Opf
    END


    RETURN

    

*******EB.DataFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef*********************************************************

END
