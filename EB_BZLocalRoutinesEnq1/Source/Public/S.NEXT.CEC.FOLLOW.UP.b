*-----------------------------------------------------------------------------
* <Rating>76</Rating>
*-----------------------------------------------------------------------------
*---- Revision History ------------------------------------------------
* ZIT_UPG_R13_TO_R19 - changed Arithematic Operator
*----------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE S.NEXT.CEC.FOLLOW.UP(CALLID)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.CEC.FOLLOW.UP
$INSERT I_F.DATES
$INSERT I_F.USER
$INSERT I_CECDEF
$INSERT I_CECFMT
$INSERT I_NEXT.CECLAY

      CALLID = ''

*     The operation code must be given at the end of the header first line
* $INSERT I_COMMON - Not Used anymore; nofile ENQUIRY

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ATIC.HEADER<1,1,1>)
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;1,1>
      IF N.OPCODE EQ '' THEN    ;*changed 
         CALLID = 'EB-CEC.UNKNOWN.OPERATION.CODE':@FM:N.OPCODE
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
      END 

      CALL Y.CLEAR.CECFMT
      CALL Y.LOAD.CECDEF
      ACT.DAT.RECORD = ''

*     Message layout extraction

      CALL Y.LOAD.CEC.LAYOUT('OUTWARD','','',N.OPCODE,N.HIST,N.NEXT,N.ALTN,Y.REJECT.REASON)
      IFEB.SystemTables.getVFunction()REASON THEN CEB.SystemTables.getVFunction()REJECT.REASOEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus Extract the accounting conditions

      CAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',Y.REJECT.REASON)
      IF Y.REJECT.REASON THEN CALLID = Y.REJECT.REASON:'[' ; RETURN

      CALL Y.CEC.FUP.FROM.SCRATCH(CALLID,N.ERR)
      IF N.ERR THEN
         CALLID = N.ERR
      END ELSE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(CALLID)
      END

      RETURN

   END
