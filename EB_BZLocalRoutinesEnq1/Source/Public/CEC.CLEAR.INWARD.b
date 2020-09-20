*-----------------------------------------------------------------------------
* <Rating>248</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 OPerands
*               :Noticed CALL JOURNAL.UPDATE,EXECUTE 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CLEAR.INWARD
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

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_CECPAR
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.STANDARD.SELECTION
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.COMPANY
$INSERT I_F.LOCKING

* $INSERT I_EQUATE - Not Used anymore;g section -----------------------

      GOSUB INITIALISE

      GOSUB PROCESS

      RETURN

*******************************************************************
PROCESS:
*******************************************************************
      IF RUNNING.IN.JBASE THEN N.SEP = '-' ELSE N.SEP = '.'

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD'
      EXECUTE EXEC.COMMAND

      EXEB.SystemTables.getVFunction() = 'CLEAR':N.EB.SystemTables.getVFunction()FBNK.CEC.INWEB.SystemTables.getRNew()IFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEARFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusK.CEC.INWARD.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.PENDING'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.TXN.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.MSG.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FT.IN.TAPE'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.FOLLOW.UP$NAU'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.LOG'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = "DELETE FT.IN.TAPE CECIN"
      EXECUTE EXEC.COMMAND

      GOSUB DELETE.RECORDS
      GOSUB UPDATE.PARAMETER

      EEB.DataAccess.OpfataAccess.OpfOURNAL.UPDATE(ID.COMPANY)

      RETURN

***********************************************************************
DELETE.RECORDS:
*******FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef*************************************************

      SEB.DataAccess.FReadCOMMAND = 'SELECT ':FUNDS.TRANSFER.FILE:' WITH RECORD.STATUS LIKE ...HLD '
      SELECT.COMMAND := 'AND CEC.APPL.CODE NE ""'  
      AE.ID.LIST = '' ; NO.SELECTED = ''
      CALL EB.READLIST(SELECEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerST,'',NO.SELECTED,'')
      IE = 0

      GO.OEB.SystemTables.setE('')
      LOOP
        EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerRANSFER.ID FROM AE.ID.LIST SETTING GO.ON
         GOSUB REEB.DataAccess.FWriteS.TRANSFER.FILE
         IF ER EQ '' THEN
            IE += 1
            CALL F.DELETE(FUNDS.TRANSFER.FILE,YR.FUNDS.TRANSFER.ID)
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>248</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 OPerands
*               :Noticed CALL JOURNAL.UPDATE,EXECUTE 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CLEAR.INWARD
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

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_CECPAR
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.STANDARD.SELECTION
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.COMPANY
$INSERT I_F.LOCKING

*---- Main processing section -----------------------

      GOSUB INITIALISE

      GOSUB PROCESS

      RETURN

*******************************************************************
PROCESS:
*******************************************************************
      IF RUNNING.IN.JBASE THEN N.SEP = '-' ELSE N.SEP = '.'

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.FILES'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.PENDING'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.TXN.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.MSG.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FT.IN.TAPE'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.FOLLOW.UP$NAU'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.LOG'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = "DELETE FT.IN.TAPE CECIN"
      EXECUTE EXEC.COMMAND

      GOSUB DELETE.RECORDS
      GOSUB UPDATE.PARAMETER

      CALL JOURNAL.UPDATE(ID.COMPANY)

      RETURN

***********************************************************************
DELETE.RECORDS:
***********************************************************************

      SELECT.COMMAND = 'SELECT ':FUNDS.TRANSFER.FILE:' WITH RECORD.STATUS LIKE ...HLD '
      SELECT.COMMAND := 'AND CEC.APPL.CODE NE ""'  
      AE.ID.LIST = '' ; NO.SELECTED = ''
      CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
      IE = 0

      GO.ON = ''
      LOOP
         REMOVE YR.FUNDS.TRANSFER.ID FROM AE.ID.LIST SETTING GO.ON
         GOSUB READ.FUNDS.TRANSFER.FILE
         IF ER EQ '' THEN
            IE += 1
            CALL F.DELETE(FUNDS.TRANSFER.FILE,YR.FUNDS.TRANSFER.ID)
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef EQ 0 THEN CALL JOURNAL.UPDATE(YR.FUNDS.TRANSFER.ID)
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>248</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Arithmetic operators converted to T24 OPerands
*               :Noticed CALL JOURNAL.UPDATE,EXECUTE 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CLEAR.INWARD
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

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_CECPAR
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.STANDARD.SELECTION
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.COMPANY
$INSERT I_F.LOCKING

*---- Main processing section -----------------------

      GOSUB INITIALISE

      GOSUB PROCESS

      RETURN

*******************************************************************
PROCESS:
*******************************************************************
      IF RUNNING.IN.JBASE THEN N.SEP = '-' ELSE N.SEP = '.'

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.FILES'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.PENDING'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.TXN.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.MSG.CONCAT'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FT.IN.TAPE'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.FOLLOW.UP$NAU'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = 'CLEAR':N.SEP:'FILE FBNK.CEC.INWARD.LOG'
      EXECUTE EXEC.COMMAND

      EXEC.COMMAND = "DELETE FT.IN.TAPE CECIN"
      EXECUTE EXEC.COMMAND

      GOSUB DELETE.RECORDS
      GOSUB UPDATE.PARAMETER

      CALL JOURNAL.UPDATE(ID.COMPANY)

      RETURN

***********************************************************************
DELETE.RECORDS:
***********************************************************************

      SELECT.COMMAND = 'SELECT ':FUNDS.TRANSFER.FILE:' WITH RECORD.STATUS LIKE ...HLD '
      SELECT.COMMAND := 'AND CEC.APPL.CODE NE ""'  
      AE.ID.LIST = '' ; NO.SELECTED = ''
      CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
      IE = 0

      GO.ON = ''
      LOOP
         REMOVE YR.FUNDS.TRANSFER.ID FROM AE.ID.LIST SETTING GO.ON
         GOSUB READ.FUNDS.TRANSFER.FILE
         IF ER EQ '' THEN
            IE += 1
            CALL F.DELETE(FUNDS.TRANSFER.FILE,YR.FUNDS.TRANSFER.ID)
            IF MOD(IE,100) EQ 0 THEN CALL JOURNAL.UPDATE(YR.FUNDS.TRANSFER.ID)
         END
      UNTIL NOT (GO.ON)
      REPEAT

      RETURN

***********************************************************************
UPDATE.PARAMETER:
***********************************************************************

      R.CEC.PARAMETER<CEC.PAR.PROCESS.SWITCH,1> = ''
      CALL F.WRITE(CEC.PARAMETER.FILE,ID.COMPANY,R.CEC.PARAMETER)

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      GO.ON = ''
      TIME.OUT = OCONV(TIME(),'MTS')
      Y.OPCODE = ''

      FUNDS.TRANSFER.FILE = 'F.FUNDS.TRANSFER$NAU' ; F.FUNDS.TRANSFER = ''
      CALL OPF(FUNDS.TRANSFER.FILE, F.FUNDS.TRANSFER)
      YR.FUNDS.TRANSFER.ID = '' ; R.FUNDS.TRANSFER = ''

      CALL Y.LOAD.CECPAR(N.ERR)

      RETURN

***********************************************************************
READ.FUNDS.TRANSFER.FILE:
***********************************************************************

      ER = ''
      CALL F.READ(FUNDS.TRANSFER.FILE,YR.FUNDS.TRANSFER.ID,R.FUNDS.TRANSFER,F.FUNDS.TRANSFER,ER)
      RETURN

***********************************************************************
   END
