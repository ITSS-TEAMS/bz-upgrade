*-----------------------------------------------------------------------------
* <Rating>83</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CRASH.TEST
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This program is called manually by the operators whenever he wants
* to crash his jBase session.
*
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: STOP TO RETURN, READU TO F.READU; OPEN TO CALL OPF

*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE

AA = '' 
* OPEN "","TOOLS" TO F.TOOLS ELSE RETURN ;*STOP 

* $INSERT I_EQUATE - Not Used anymore;SG.CONCAT' TO F.CEC.MSG.CONCAT ELSE CRT "NO FBNK.CEC.MSG.CONCAT" ; STOP
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;CEC.MSG.CONCAT'
   FN.CEC.MSG.CONCAT = ''
   CALL OPF(F.CEC.MSG.CONCAT,FN.CEC.MSG.CONCAT)

   YR.MSGC.ID = 'RTR\2009011401\060201\1680'
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;C.ID
   CHANGE '\' TO '.' IN CEC.INWARD.FILES.ID

   AA<-1> = 'CEC.INWARD.FILES.ID ':CEC.INWARD.FILES.ID
*  WRITE AA TO F.TOOLS,"MP.CRASH"

   Y.REMIT.NUM = 1
   GOSUB UPDATE.CONCAT

   AA<-1> = 'CEC.INWARD.FILES.ID ':CEC.INWARD.FILES.ID
*  WRITEEB.SystemTables.getVFunction()OOLS,"MP.CRASEB.SystemTables.getVFunction().REMIT.NUM = 2
  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCAT

   RETURN

*-------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------------------
UPDATE.CONCAT:
*----------------------------------------------------------------------

   ER = '' R.MSGC = ''
*   READU R.MSGC FROM F.CEC.MSG.CONCAT,YR.MSGC.ID ELSE
   CALL F.READU(F.CEC.MSG.CONCAT, YR.MSGC.ID, R.MSGC, FN.CEC.MSG.CONCAT, ER, RETRY.MSGC)
	IF NOT(R.MSGC) THEN      
	ER = 'ERROR IN READ'
      RELEASE F.CEC.MSG.CONCAT,YR.MSGC.ID
   END
*  CALL F.READ(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC,F.CEC.MSG.CONCAT,ER)
   AA<-1> = 'ER : ':ER
*  WRITE AA TO F.TOOLS,"MP.CRASH"
   IF ER THEN
      R.MSGC<1> = CEC.INWARD.FILES.ID
      R.MSGC<2> = Y.REMIT.NUM
   END ELSE
      NB.SIMILAR = DCOUNT(R.MSGC<1>,@VM)
      R.MSGC<1,NB.SIMILAR+1> = CEC.INWARD.FILES.ID
      R.MSGC<2,NB.SIMILAR+1> = Y.REMIT.NUM
   END
   AA<-1>EB.DataAccess.OpfR.MSGC
*  WRITE EB.DataAccess.OpfTO F.TOOLS,"MP.CRASH"
*  CALL F.WRITE(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC)
   WRITE R.MSGC ON F.CEC.MSG.CONCAT,YR.MSGC.ID

   RETURN

*---------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef-----------------------------------
   END
