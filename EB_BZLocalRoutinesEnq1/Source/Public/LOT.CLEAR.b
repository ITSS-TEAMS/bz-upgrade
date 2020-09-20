*-----------------------------------------------------------------------------
* <Rating>189</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.CLEAR
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------
* To clear all inward pending related entries
*--------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : NO CHANGES
*--------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.COMPANY
$INSERT I_F.LOCKING

*---- Main processing section -----------------------

      GOSUB PROCESS

      RETURN

* $INSERT I_COMMON - Not Used anymore;***********************************************
PROCESS:
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;***************************************
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;SEP = '-' ELSE N.SEP = '.'

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.PROCESS'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.PROCESS$NAU'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.PROCESS$HIS'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.WORK'
      EXECUTE EXEC.COMMAND

      EXEB.SystemTables.getVFunction() = 'CLEAR':N.EB.SystemTables.getVFunction()FBNK.LOT.PENEB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.LOG'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.DETAIL'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.FILES'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.LOT.PROCESS.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = "DELETE FT.IN.TAPE LOTIN"
      EXECUTE EXEC.COMMAND

      CALL JOURNAL.UPDATE('SYSTEM')

      RETURN

***********************************************************************
   END
