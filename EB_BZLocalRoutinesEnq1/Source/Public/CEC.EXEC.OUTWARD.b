*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : ARITHEAMTIC OPERATOR CHANGED TO T24 OPERATOR
*                   FM,VM,SM CONVERTED TO @FM,@VM,@SM
*                   CONVERT CHANGED TO CHANGE 
*-----------------------------------------------------------------------------
* <Rating>14630</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EXEC.OUTWARD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-------------------------------------------------------
*
*---- Revision History --------------------------------
*
*----------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
* $INSERT I_COMMON - Not Used anymore;CLASS
* $INSERT I_EQUATE - Not Used anymore;UT
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD.PENDING
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.FUNDS.TRANSFER

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_SITCOM
$INSERT EB.SystemTables.getVFunction()$INSERT I_CECSUH
$INSERT I_CECREH
$INSEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERT I_CECSUT
$INSERT I_CECPAR
$INSERT I_CECDFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

* Equate the fields of CEC.OUTWARD to generic ones for include I_LOT.ACCOUNTING

$INSERT I_SIT.ACCOUNTING.FIELDS
$INSERT I_CEC.ACCOUNTING.OC

*---- Revision History ------------------------------------------------
*
* 17/12/2009 - Only one occurence of each file in CEC.OUTWARD.CONCAT. 
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
*---------------------------------------------------------------------

*---- Main processing section ----

      AEB.DataAccess.OpfB.DataAccess.OpfATION = 'CEC.OUTWARD'
      V = CEC.OC.AUDIT.DATE.TIME         ; * To simulate the template of CEC.OUTWARD

      TEXT = '' ; ETEXT = ''

      LOG.MESSAGE EB.SystemTables.getRNew();FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef ; WORST.LEVEL = ''

      GOSEB.DataAccess.FReadTIALISE
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
         RETURN
      END
EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyertemTables.setE()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : ARITHEAMTIC OPERATOR CHANGED TO T24 OPERATOR
*                   FM,VM,SM CONVERTED TO @FM,@VM,@SM
*                   CONVERT CHANGED TO CHANGE 
*-----------------------------------------------------------------------------
* <Rating>14630</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EXEC.OUTWARD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-------------------------------------------------------
*
*---- Revision History --------------------------------
*
*----------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.ACCOUNT.CLASS
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD.PENDING
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.FUNDS.TRANSFER

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_SITCOM
$INSERT I_CECFMT
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

* Equate the fields of CEC.OUTWARD to generic ones for include I_LOT.ACCOUNTING

$INSERT I_SIT.ACCOUNTING.FIELDS
$INSERT I_CEC.ACCOUNTING.OC

*---- Revision History ------------------------------------------------
*
* 17/12/2009 - Only one occurence of each file in CEC.OUTWARD.CONCAT. 
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
*---------------------------------------------------------------------

*---- Main processing section ----

      APPLICATION = 'CEC.OUTWARD'
      V = CEC.OC.AUDIT.DATE.TIME         ; * To simulate the template of CEC.OUTWARD

      TEXT = '' ; ETEXT = ''

      LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''

      GOSUB INITIALISE
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
         RETURN
      END

      LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING OUT.POS THEN
           
*      EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyereatment constraints from parameter

         DUPLICEB.DataAccess.FWriteC = R.CEC.PARAMETER<CEC.PAR.DUPLICATE.PROC,OUT.POS>
         COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,OUT.POS>
         SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,OUT.POS>:'"0"':"R"

      EB.SystemTables.setAf()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : ARITHEAMTIC OPERATOR CHANGED TO T24 OPERATOR
*                   FM,VM,SM CONVERTED TO @FM,@VM,@SM
*                   CONVERT CHANGED TO CHANGE 
*-----------------------------------------------------------------------------
* <Rating>14630</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EXEC.OUTWARD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-------------------------------------------------------
*
*---- Revision History --------------------------------
*
*----------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.ACCOUNT.CLASS
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD.PENDING
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.FUNDS.TRANSFER

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_SITCOM
$INSERT I_CECFMT
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

* Equate the fields of CEC.OUTWARD to generic ones for include I_LOT.ACCOUNTING

$INSERT I_SIT.ACCOUNTING.FIELDS
$INSERT I_CEC.ACCOUNTING.OC

*---- Revision History ------------------------------------------------
*
* 17/12/2009 - Only one occurence of each file in CEC.OUTWARD.CONCAT. 
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
*---------------------------------------------------------------------

*---- Main processing section ----

      APPLICATION = 'CEC.OUTWARD'
      V = CEC.OC.AUDIT.DATE.TIME         ; * To simulate the template of CEC.OUTWARD

      TEXT = '' ; ETEXT = ''

      LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''

      GOSUB INITIALISE
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
         RETURN
      END

      LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING OUT.POS THEN
           
*        Load specific treatment constraints from parameter

         DUPLICATE.PROC = R.CEC.PARAMETER<CEC.PAR.DUPLICATE.PROC,OUT.POS>
         COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,OUT.POS>
         SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,OUT.POS>:'"0"':"R"

        EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : ARITHEAMTIC OPERATOR CHANGED TO T24 OPERATOR
*                   FM,VM,SM CONVERTED TO @FM,@VM,@SM
*                   CONVERT CHANGED TO CHANGE 
*-----------------------------------------------------------------------------
* <Rating>14630</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EXEC.OUTWARD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-------------------------------------------------------
*
*---- Revision History --------------------------------
*
*----------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.ACCOUNT.CLASS
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD.PENDING
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.FUNDS.TRANSFER

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_SITCOM
$INSERT I_CECFMT
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

* Equate the fields of CEC.OUTWARD to generic ones for include I_LOT.ACCOUNTING

$INSERT I_SIT.ACCOUNTING.FIELDS
$INSERT I_CEC.ACCOUNTING.OC

*---- Revision History ------------------------------------------------
*
* 17/12/2009 - Only one occurence of each file in CEC.OUTWARD.CONCAT. 
*
* 21/02/2010 - New PROCESS.TYPE "OFT" to issue Only FT entries.
*
*---------------------------------------------------------------------

*---- Main processing section ----

      APPLICATION = 'CEC.OUTWARD'
      V = CEC.OC.AUDIT.DATE.TIME         ; * To simulate the template of CEC.OUTWARD

      TEXT = '' ; ETEXT = ''

      LOG.MESSAGE = '' ; LOG.LEVEL = '' ; WORST.LEVEL = ''

      GOSUB INITIALISE
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
         RETURN
      END

      LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING OUT.POS THEN
           
*        Load specific treatment constraints from parameter

         DUPLICATE.PROC = R.CEC.PARAMETER<CEC.PAR.DUPLICATE.PROC,OUT.POS>
         COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,OUT.POS>
         SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,OUT.POS>:'"0"':"R"

         GOSUB PROCESS.OUTWARD.FILE

         IF NOT(RUNNING.UNDER.BATCH) THEN CALL JOURNAL.UPDATE(TODAY)
      END

      RETURN

***********************************************************************
PROCESS.OUTWARD.FILE:
***********************************************************************

      Y.TOT.CNT = 0
      Y.TOT.CNT.CR = 0
      Y.TOT.CNT.DB = 0
      Y.TOT.AMT = 0
      Y.TOT.AMT.CR = 0
      Y.TOT.AMT.DB = 0
      Y.REMIT.HEADER = 0 ; Y.FILE.HEADER = 0
      Y.REMIT.NUM = 0 ; Y.NB.REMIT = 0
      R.SEQ.NEXT = ''
      COUNTER.FOR.COMMITMENT = 0
      TOTAL.FOR.COMMITMENT = 0
      LCCY.FOR.COMMITMENT = 0
      HDR.CEC.IDS = ''

      SW.UNKNOWN.MESSAGE = '' ; R.NEXT.LAYOUT = '' 

      NEXT.OPCODE = '' ; NEXT.REASON.CODE = '' ; NEXT.CURRENCY = '' ; NEXT.CENTER.ID = ''
      NEXT.LAYOUT.ID = '' ; R.NEXT.LAYOUT = '' ; NEXT.COMP.KEY = '' ; NEXT.SUH.ID = ''
      NEXT.PREVIOUS.MSG.ID = '' 

      LAST.OPCODE = '' ; LAST.REASON.CODE = '' ; LAST.CURRENCY = '' ; LAST.CENTER.ID = ''
      LAST.LAYOUT.ID = '' ; R.LAST.LAYOUT = '' ; LAST.COMP.KEY = '' ; LAST.SUH.ID = ''
      LAST.PREVIOUS.MSG.ID = '' 
      
      IDC.DEB = '' ; IDO.BEG = 1 ; IDR.BEG = 1

      R.CEC.OUTWARD.PENDING.RESTORE = ''
      GOSUB READ.CEC.OUTWARD.PENDING.FILE
      IF ER THEN
         LOG.LEVEL = '1' ; LOG.MESSAGE = 'EB-CEC.FAILED.READ':@FM:UNFORM.FILE.ID
         CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
         GOSUB UPDATE.LOG.FILE
      END ELSE
         IF PINTAPE EQ 'Reexecution' THEN   ;*changed

*           Restore the presentation date in PINTAPE in case of a reexecution :

            PINTAPE = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANSMISSION.ID>
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.CRASH.RECOVERY'
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE

            IDC.PREV = '' ; 
            NB.OPER = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.CODE>,@VM)
            SW.RESTORE.OK = ''
            FOR IDO = NB.OPER TO 1 STEP - 1
               IF R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,IDO> EQ '' THEN  ;*changed
                  CONTINUE
               END ELSE

*                 Calculate how many records have been processed before the crash

                  NB.FILES = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,IDO>,@SM)
                  ALREADY.PROCESSED = 0
                  FOR IDT = 1 TO NB.FILES
                     YR.SOCF.ID = FIELD(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,IDO,IDT>,"\",1)
                     Y.REM.NUM = FIELD(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,IDO,IDT>,"\",2)
                     R.SOCF = '' ; ER = ''
                     CALL F.READ(CEC.OUTWARD.FILES.FILE,YR.SOCF.ID,R.SOCF,F.CEC.OUTWARD.FILES,ER)
                     Y.NB.REMIT += 1
                     ALREADY.PROCESSED += R.SOCF<CEC.OCF.TRANS.NUMBER,Y.REM.NUM>
                     IF R.SOCF<CEC.OCF.COMMENT,Y.REM.NUM> EQ '' THEN   ;* changed
                        EXIT             ; *crashed before being completed
                     END ELSE
                          Y.TOT.CNT += R.SOCF<CEC.OCF.TRANS.NUMBER,Y.REM.NUM>
                        Y.TOT.AMT += ABS(R.SOCF<CEC.OCF.TOT.AMOUNT,Y.REM.NUM,1>)+0
                        IF R.SOCF<CEC.OCF.TOT.AMOUNT,Y.REM.NUM,1>+0 GT 0 THEN      ;*changed
                          Y.TOT.AMT.CR += R.SOCF<CEC.OCF.TOT.AMOUNT,Y.REM.NUM,1>+0
                           Y.TOT.CNT.CR += R.SOCF<CEC.OCF.TRANS.NUMBER,Y.REM.NUM>
                        END ELSE
                          Y.TOT.AMT.DB -= R.SOCF<CEC.OCF.TOT.AMOUNT,Y.REM.NUM,1>+0
                           Y.TOT.CNT.DB += R.SOCF<CEC.OCF.TRANS.NUMBER,Y.REM.NUM>
                        END
                     END
                  NEXT IDT

                  IF SW.RESTORE.OK EQ 'Y' THEN CONTINUE       ; * Recovery instruction already stated

                  SW.RESTORE.OK = 'Y'
                  CEC.OUTWARD.FILES.ID = YR.SOCF.ID
                  R.CEC.OUTWARD.FILES = R.SOCF
                  Y.REMIT.NUM = Y.REM.NUM
                  IF R.CEC.OUTWARD.FILES<CEC.OCF.COMMENT,Y.REMIT.NUM> EQ '' THEN  ;*changed
                     COUNTER.FOR.COMMITMENT = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.NUMBER,Y.REMIT.NUM>
                     TOTAL.FOR.COMMITMENT = ABS(R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM,1>+0)
                     LCCY.FOR.COMMITMENT = ABS(R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM,2>+0)
                     Y.FILE.HEADER = 1 ; Y.REMIT.HEADER = 1
                  END

*                 Calculate where the recovery point is

                  NUMBER.REACHED = 0
                  NB.RANGE = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FIRST,IDO>,@SM)
                  FOR IDR = 1 TO NB.RANGE
                     IDC1 = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FIRST,IDO,IDR>
                     IDC2 = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.LAST,IDO,IDR>
                     RANGE.NUMBER = IDC2-IDC1+1
                     IF NUMBER.REACHED + RANGE.NUMBER GT ALREADY.PROCESSED THEN  ;*changed
                        IDC.DEB = ALREADY.PROCESSED - NUMBER.REACHED + IDC1
                        IDO.BEG = IDO
                        IDR.BEG = IDR
                        IF IDC.DEB GT IDC1 THEN IDC.PREV = IDC.DEB-1  ;*changed
                        EXIT
                     END ELSE
                        NUMBER.REACHED += RANGE.NUMBER
                        IDC.PREV = IDC2
                     END
                  NEXT IDR

*                 Read last commited outward record

                  ID.NEW = FIELD(PINTAPE,"-",1):'.':R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.CODE,IDO>[1,3]:'.':FMT(IDC.PREV,SEQ.FORMAT)
                  MAT R.NEW = '' ; ER = ''
                  CALL F.MATREAD(CEC.OUTWARD.FILE,ID.NEW,MAT R.NEW,CEC.OC.AUDIT.DATE.TIME,F.CEC.OUTWARD,ER)

                  GOSUB CALCULATE.NEXT.FIELDS

                  IF R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR' ;*changed
                     THEN SETTLEMENT.DATE = R.NEW(CEC.OC.CREDIT.VALUE.DATE)
                     ELSE SETTLEMENT.DATE = R.NEW(CEC.OC.DEBIT.VALUE.DATE)
                   
                  GOSUB MOVE.NEXT.TO.LAST

                  IF NUMBER.REACHED EQ ALREADY.PROCESSED THEN   ;*changed

*                    The previous remit has been entirely completed a new one must be issued

                     IDC.DEB = ''
                     IDO.BEG = IDO + 1
                     IDR.BEG = 1
                     Y.REMIT.HEADER = 0 ; Y.FILE.HEADER = 1
                  END
*                 EXIT
               END
            NEXT IDO
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.NO.PROBLEM.FOUND'
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         END

         PINTAPE = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANSMISSION.ID>

         GOSUB READ.CEC.OUTWARD.CONCAT.FILE
         NB.OPER = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.CODE>,@VM)
         LAST.IDO = IDO.BEG
         FOR IDO = IDO.BEG TO NB.OPER
            NB.RANGE = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FIRST,IDO>,@SM)
            FOR IDR = IDR.BEG TO NB.RANGE
               IF IDC.DEB EQ '' THEN IDC.BEG = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FIRST,IDO,IDR>   ;*changed
                  ELSE IDC.BEG = IDC.DEB ; IDC.DEB = ''
               FOR IDC = IDC.BEG TO R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.LAST,IDO,IDR>
                  ID.NEW = FIELD(PINTAPE,"-",1):'.':R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.CODE,IDO>[1,3]:'.':FMT(IDC,SEQ.FORMAT)
                  MAT R.NEW = '' ; ER = ''
                  CALL F.MATREAD(CEC.OUTWARD.FILE,ID.NEW,MAT R.NEW,CEC.OC.AUDIT.DATE.TIME,F.CEC.OUTWARD,ER)
                  IF ER THEN
                     LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.FAILED.READ':@FM:ID.NEW
                     CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
                     GOSUB UPDATE.LOG.FILE
                  END ELSE
                     GOSUB CALCULATE.NEXT.FIELDS
                     IF R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'   ;*changed
                        THEN SETTLEMENT.DATE = R.NEW(CEC.OC.CREDIT.VALUE.DATE)
                        ELSE SETTLEMENT.DATE = R.NEW(CEC.OC.DEBIT.VALUE.DATE)
                     IF LAST.COMP.KEY NE NEXT.COMP.KEY THEN		;*changed
                        IF LAST.COMP.KEY EQ '' THEN			;*changed 
                           SW.NEW.FILE = 1
                        END ELSE
                           SW.NEW.FILE = 0
                           IF Y.REMIT.HEADER EQ 1 THEN GOSUB CREATE.REMIT.TRAILER  ;*changed
                           IF LAST.SUH.ID NE NEXT.SUH.ID THEN						;*changed
                              IF Y.FILE.HEADER EQ 1 THEN GOSUB CREATE.FILE.TRAILER     ;*changed
                              SW.NEW.FILE = 1
                           END
                        END
                        IF SW.NEW.FILE EQ 1 THEN 			;*changed
                           GOSUB CREATE.FILE.HEADER
                           IF TEXT THEN
                              LOG.MESSAGE = TEXT
                              LOG.LEVEL = '' ; GOSUB UPDATE.LOG.FILE
                           END
                           Y.FILE.HEADER = 1
                        END
                        GOSUB CREATE.REMIT.HEADER

                        LAST.IDO = IDO
                        GOSUB MOVE.NEXT.TO.LAST
                        ACT.PREVIOUS.MSG.ID = NEXT.PREVIOUS.MSG.ID
                     END

                     IF R.SEQ.NEXT EQ '' THEN		;*changed
                        R.SEQ.NEXT<1> = IDC
*                       R.SEQ.NEXT<2> = R.NEW(CEC.OC.THEIR.BBAN)
                        R.SEQ.NEXT<2> = IDC
                        R.SEQ.NEXT<3> = R.NEW(CEC.OC.APPLICATION.CODE)
                     END ELSE
                        NB.SEQ = DCOUNT(R.SEQ.NEXT<1>,@VM)
                        R.SEQ.NEXT<1,NB.SEQ+1> = IDC
*                       R.SEQ.NEXT<2,NB.SEQ+1> = R.NEW(CEC.OC.THEIR.BBAN)
                        R.SEQ.NEXT<2,NB.SEQ+1> = IDC
                        R.SEQ.NEXT<3,NB.SEQ+1> = R.NEW(CEC.OC.APPLICATION.CODE)
                     END

                     GOSUB STORE.OUTWARD.LINE

                  END
               NEXT IDC
            NEXT IDR
         NEXT IDO

         IF Y.REMIT.HEADER EQ 1 THEN GOSUB CREATE.REMIT.TRAILER
         IF Y.FILE.HEADER EQ 1  THEN GOSUB CREATE.FILE.TRAILER
         IF NOT(RUNNING.UNDER.BATCH) THEN CALL JOURNAL.UPDATE(TODAY)

      END

      RETURN

***********************************************************************
MOVE.NEXT.TO.LAST:
***********************************************************************

      LAST.SUH.ID = NEXT.SUH.ID
      LAST.OPCODE = NEXT.OPCODE
      LAST.CURRENCY = NEXT.CURRENCY
      LAST.CENTER.ID = NEXT.CENTER.ID
      LAST.COMP.KEY = NEXT.COMP.KEY
      LAST.REASON.CODE = NEXT.REASON.CODE
      LAST.FTTC.ID = NEXT.FTTC.ID ; R.LAST.FTTC = R.NEXT.FTTC
      LAST.NOSTRO.CATEGORY = NEXT.NOSTRO.CATEGORY
      LAST.NOSTRO.ACCT.NO = NEXT.NOSTRO.ACCT.NO
      R.LAST.NOSTRO.ACCT = R.NEXT.NOSTRO.ACCT
      LAST.TRANSIT.CATEGORY = NEXT.TRANSIT.CATEGORY
      LAST.TRANSIT.ACCT.NO = NEXT.TRANSIT.ACCT.NO
      R.LAST.TRANSIT.ACCT = R.NEXT.TRANSIT.ACCT
      LAST.LAYOUT.ID = NEXT.LAYOUT.ID
      R.LAST.LAYOUT = R.NEXT.LAYOUT

      RETURN

***********************************************************************
CALCULATE.NEXT.FIELDS:
***********************************************************************

      NEXT.OPCODE = R.NEW(CEC.OC.APPLICATION.CODE)
      NEXT.PREVIOUS.MSG.ID = R.NEW(CEC.OC.HIST.MSG.ID)<1,2>
      NEXT.REASON.CODE = R.NEW(CEC.OC.REASON.CODE)
      NEXT.CURRENCY = R.NEW(CEC.OC.INITIAL.CURRENCY)
      IF NEXT.CURRENCY EQ '' THEN NEXT.CURRENCY = CLEAR.CCY
      NEXT.CENTER.ID = R.NEW(CEC.OC.CENTER.ID)

      IF NEXT.OPCODE NE LAST.OPCODE THEN GOSUB READ.CODE.LAYOUT

      NEXT.COMP.KEY = R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.CODE,IDO>:'\':NEXT.CURRENCY:'\':NEXT.CENTER.ID

      RETURN

*==================
CREATE.FILE.HEADER:
*==================

      Y.REMIT.NUM = 0

*     Map the File Header fields

      CEC.OUTWARD.FILES.ID = ''
      R.CEC.OUTWARD.FILES = ''

      R.CEC.OUTWARD.FILES<CEC.OCF.CENTER.ID> = NEXT.CENTER.ID 
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.DATE> = Y.PROCESS.DATE
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.TIME> = Y.PROCESS.TIME

      CALL Y.LOAD.CECSUH('OUTWARD','',NEXT.CENTER.ID,'')
      IF NEXT.SUH.ID EQ '' THEN RETURN

      CALL Y.MAP.CEC.OUTWARD('SUH','',N.ERR)
      IF N.ERR THEN
Y.N.ERR = DCOUNT(N.ERR,@FM)  
         FOR JDF = 1 TO Y.N.ERR
*         FOR JDF = 1 TO DCOUNT(N.ERR,@FM)
            LOG.LEVEL = '2' ; LOG.MESSAGE = N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         NEXT JDF
         SW.SKIP = 'Y'
         RETURN
      END
      ALL.FIELDS.ID = 'CDATE':@FM:'SDATE':@FM:'BANKID':@FM:'APPLCD'
      ALL.FIELD.DATA = Y.PROCESS.DATE:@FM:SETTLEMENT.DATE:@FM
      ALL.FIELD.DATA := R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE>:@FM:R.NEW(CEC.OC.APPLICATION.CODE)[1,3]
      CALL Y.INSERT.CEC.FIELD('NEXT','SUH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> = NEXT.SUH.RECORD

*     Building up the CEC.OUTWARD.FILES key.

      CEC.IDS = ''
      NB.KEYS = DCOUNT(NEXT.SUH.FIELDS<1>,@VM)
      FOR IDW = 1 TO NB.KEYS
         L.KEY.DATA = TRIM(NEXT.SUH.FIELDS<9,IDW>," ","A")
         L.KEY.RANK = NEXT.SUH.FIELDS<7,IDW>
         GOSUB UPDATE.REFERENCE
         IF NEXT.SUH.FIELDS<7,IDW> MATCH '"FILE"1N0X' THEN 
            L.FILE.ID = TRIM(NEXT.SUH.FIELDS<9,IDW>," ","A")  
            L.FILE.RK = NEXT.SUH.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
         END
      NEXT IDW

      HDR.CEC.IDS = CEC.IDS

      RETURN

*===================
CREATE.REMIT.HEADER:
*===================

      COUNTER.FOR.COMMITMENT = 0
      TOTAL.FOR.COMMITMENT = 0
      LCCY.FOR.COMMITMENT = 0
      Y.NB.REMIT += 1
      R.SEQ.NEXT = ''

      Y.REMIT.NUM += 1

*     CALL Y.LOAD.CECREH('OUTWARD','',NEXT.CENTER.ID,'')
      CALL Y.LOAD.CECREH('OUTWARD','',NEXT.CENTER.ID,'REH-':NEXT.OPCODE[1,3])
      IF NEXT.REH.ID EQ '' THEN RETURN
    
      CALL Y.MAP.CEC.OUTWARD('REH','',N.ERR)
      IF N.ERR THEN
Y.N.ERR = DCOUNT(N.ERR,@FM)  
         FOR JDF = 1 TO Y.N.ERR	  
*         FOR JDF = 1 TO DCOUNT(N.ERR,@FM)
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM:@VM:N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         NEXT JDF
         SW.SKIP = 'Y'
         RETURN
      END

      ALL.FIELDS.ID = 'CDATE':@FM:'SDATE':@FM:'BANKID':@FM:'APPLCD'
      ALL.FIELD.DATA = Y.PROCESS.DATE:@FM:SETTLEMENT.DATE:@FM
      ALL.FIELD.DATA := R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE>:@FM:R.NEW(CEC.OC.APPLICATION.CODE)[1,3]
      CALL Y.INSERT.CEC.FIELD('NEXT','REH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,Y.REMIT.NUM> = NEXT.REH.RECORD
      R.CEC.OUTWARD.FILES<CEC.OCF.CENTER.ID> = NEXT.CENTER.ID 

      CEC.IDS = HDR.CEC.IDS
      NB.KEYS = DCOUNT(NEXT.REH.FIELDS<1>,@VM)
      FOR IDW = 1 TO NB.KEYS
         L.KEY.DATA = TRIM(NEXT.REH.FIELDS<9,IDW>," ","A")
         L.KEY.RANK = NEXT.REH.FIELDS<7,IDW>
         GOSUB UPDATE.REFERENCE
         IF NEXT.REH.FIELDS<7,IDW> MATCH '"FILE"1N0X' THEN 
            L.FILE.ID = TRIM(NEXT.REH.FIELDS<9,IDW>," ","A")  
            L.FILE.RK = NEXT.REH.FIELDS<7,IDW>
            GOSUB UPDATE.REFERENCE
         END
      NEXT IDW
*     HDR.CEC.IDS = CEC.IDS

      IF Y.REMIT.NUM EQ 1 THEN
         LOCATE 'LOTNUM' IN CEC.IDS<1,1> SETTING FIL THEN
            ALL.FIELDS.ID = 'LOTNUM'
            ALL.FIELD.DATA = CEC.IDS<3,FIL>
            CALL Y.INSERT.CEC.FIELD('NEXT','SUH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
            R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> = NEXT.SUH.RECORD
         END
      END

      IF CEC.OUTWARD.FILES.ID EQ '' THEN 
         LOCATE 'FILE' IN CEC.IDS<1,1> SETTING FIL THEN
            CEC.OUTWARD.FILES.ID = CEC.IDS<3,FIL>
        *    CONVERT @SM TO '.' IN CEC.OUTWARD.FILES.ID
            CHANGE @SM TO '.' IN CEC.OUTWARD.FILES.ID
         END ELSE CEC.OUTWARD.FILES.ID = Y.PROCESS.DATE
         GOSUB READ.CEC.OUTWARD.FILES.FILE
      END 

      R.CEC.OUTWARD.FILES<CEC.OCF.CENTER.ID> = NEXT.CENTER.ID 

      YR.CEC.MSG.CONCAT.ID = '' 
      LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
         YR.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
      *   CONVERT @SM TO '\' IN YR.CEC.MSG.CONCAT.ID
         CHANGE @SM TO '\' IN YR.CEC.MSG.CONCAT.ID
      END 
      IF YR.CEC.MSG.CONCAT.ID EQ '' THEN
         LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.MISSING.MSG.ID':@FM:Y.REMIT.NUM
         CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
         GOSUB UPDATE.LOG.FILE
         SW.SKIP = 'Y'
         RETURN
      END

      R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,Y.REMIT.NUM> = YR.CEC.MSG.CONCAT.ID

      GOSUB CREATE.MSG.CONCAT.FILE

      Y.REMIT.HEADER = 1

      RETURN

*====================
CREATE.REMIT.TRAILER:
*====================

*     R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM> = LAST.OPCODE ;* EPI 20100519

      Y.TOT.CNT += COUNTER.FOR.COMMITMENT
      Y.TOT.AMT += TOTAL.FOR.COMMITMENT
      NB.CR.FOUND = 0 ; AMT.CR.FOUND = 0
      NB.DB.FOUND = 0 ; AMT.DB.FOUND = 0
      BEGIN CASE
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            Y.TOT.CNT.CR += COUNTER.FOR.COMMITMENT
            Y.TOT.AMT.CR += TOTAL.FOR.COMMITMENT
            NB.CR.FOUND = COUNTER.FOR.COMMITMENT
            AMT.CR.FOUND = TOTAL.FOR.COMMITMENT
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            Y.TOT.CNT.DB += COUNTER.FOR.COMMITMENT
            Y.TOT.AMT.DB += TOTAL.FOR.COMMITMENT
            NB.DB.FOUND = COUNTER.FOR.COMMITMENT
            AMT.DB.FOUND = TOTAL.FOR.COMMITMENT
      END CASE

      GOSUB POST.REMIT.NOSTRO.ENTRY

      IF R.CEC.OUTWARD.FILES<CEC.OCF.COMMENT,Y.REMIT.NUM> EQ '' THEN
         R.CEC.OUTWARD.FILES<CEC.OCF.COMMENT,Y.REMIT.NUM> = 'Y'
      END

      CALL Y.MAP.CEC.OUTWARD('RET','',N.ERR)
      IF N.ERR THEN
Y.N.ERR = DCOUNT(N.ERR,@FM)  
         FOR JDF = 1 TO Y.N.ERR
*         FOR JDF = 1 TO DCOUNT(N.ERR,@FM)
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM:@VM:N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         NEXT JDF
         SW.SKIP = 'Y'
         RETURN
      END

      ALL.FIELDS.ID = 'TXNNB':@FM:'TXNAMT':@FM:'TXNNBCR':@FM:'TXNNBDB':@FM:'TXNAMTCR':@FM:'TXNAMTDB'
      ALL.FIELD.DATA = COUNTER.FOR.COMMITMENT:@FM:TOTAL.FOR.COMMITMENT:@FM:NB.CR.FOUND:@FM:NB.DB.FOUND:@FM:AMT.CR.FOUND:@FM:AMT.DB.FOUND
      CALL Y.INSERT.CEC.FIELD('NEXT','RET',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      R.CEC.OUTWARD.FILES<CEC.OCF.REM.TRAILER,Y.REMIT.NUM> = NEXT.RET.RECORD
      CALL Y.INSERT.CEC.FIELD('NEXT','REH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,Y.REMIT.NUM> = NEXT.REH.RECORD

      LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.NO.PROBLEM.FOUND'
      CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
      GOSUB UPDATE.LOG.FILE

      Y.REMIT.HEADER = 0

*********************
REMIT.TRAILER.UPDATE:
*********************

      NB.SEQU = DCOUNT(R.SEQ.NEXT<1>,@VM)

      FOR ITU = 1 TO NB.SEQU
         IF R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM> EQ '' THEN
            R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM> = R.SEQ.NEXT<3,ITU>
            R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM> = R.SEQ.NEXT<1,ITU>
            R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM> = R.SEQ.NEXT<2,ITU>
         END ELSE
            ACT.SEQ.KEY = FMT(R.SEQ.NEXT<2,ITU>,SEQ.FORMAT):'.':R.SEQ.NEXT<3,ITU>
            NB.DEJA = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM>,@SM)
            ANC.SEQ.KEY = FMT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM,NB.DEJA>,SEQ.FORMAT)
            ANC.SEQ.KEY := '.':R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,NB.DEJA>
            IF ACT.SEQ.KEY GE ANC.SEQ.KEY THEN
               R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,NB.DEJA+1> = R.SEQ.NEXT<3,ITU>
               R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM,NB.DEJA+1> = R.SEQ.NEXT<1,ITU>
               R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM,NB.DEJA+1> = R.SEQ.NEXT<2,ITU>
            END ELSE
               FOR IXU = 1 TO NB.DEJA
                  ANC.SEQ.KEY = FMT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM,IXU>,SEQ.FORMAT)
                  ANC.SEQ.KEY := '.':R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,IXU>
                  IF ACT.SEQ.KEY LT ANC.SEQ.KEY THEN
                     R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,IXU> = R.SEQ.NEXT<3,ITU>:@SM:R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,IXU>
                     R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM,IXU> = R.SEQ.NEXT<1,ITU>:@SM:R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM,IXU>
                     R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM,IXU> = R.SEQ.NEXT<2,ITU>:@SM:R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM,IXU>
                     EXIT                 
                  END
               NEXT IXU
            END
         END
      NEXT ITU

      IF R.CEC.OUTWARD.FILES<CEC.OCF.COMMENT,Y.REMIT.NUM> NE '' THEN

*        Time to change the sorted destinator BBAN against the real end of range

         ITE = 0 ; TRAV.FIRST = '' ; TRAV.LAST = '' ; TRAV.CODE = ''
         NB.DEJA = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM>,@SM)
         FOR ITU = 1 TO NB.DEJA
            ACT.NUM = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM,ITU>
            ACT.COD = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM,ITU>
            IF ITU EQ 1 THEN
               ITE = 1
               TRAV.CODE<1,Y.REMIT.NUM> = ACT.COD
               TRAV.FIRST<1,Y.REMIT.NUM> = ACT.NUM
               TRAV.LAST<1,Y.REMIT.NUM> = ACT.NUM
            END ELSE
               IF TRAV.LAST<1,Y.REMIT.NUM,ITE> + 1 EQ ACT.NUM AND TRAV.CODE<1,Y.REMIT.NUM,ITE> EQ ACT.COD THEN
                  TRAV.LAST<1,Y.REMIT.NUM,ITE> = ACT.NUM
               END ELSE
                  ITE += 1
                  TRAV.CODE<1,Y.REMIT.NUM,ITE> = ACT.COD
                  TRAV.FIRST<1,Y.REMIT.NUM,ITE> = ACT.NUM
                 TRAV.LAST<1,Y.REMIT.NUM,ITE> = ACT.NUM
               END
            END
         NEXT ITU
         R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,Y.REMIT.NUM> = TRAV.CODE<1,Y.REMIT.NUM>
         R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,Y.REMIT.NUM> = TRAV.FIRST<1,Y.REMIT.NUM>
         R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,Y.REMIT.NUM> = TRAV.LAST<1,Y.REMIT.NUM>
      END

      R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.NUMBER,Y.REMIT.NUM> = COUNTER.FOR.COMMITMENT
      BEGIN CASE
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM> = TOTAL.FOR.COMMITMENT
            IF LCCY NE CLEAR.CCY THEN R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM,2> = LCCY.FOR.COMMITMENT
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM> = -1 * TOTAL.FOR.COMMITMENT
            IF LCCY NE CLEAR.CCY THEN R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,Y.REMIT.NUM,2> = -1 * LCCY.FOR.COMMITMENT
      END CASE

      GOSUB WRITE.CEC.OUTWARD.FILES.FILE

      R.SEQ.NEXT = ''

      RETURN

*===================
CREATE.FILE.TRAILER:
*===================

      CALL Y.MAP.CEC.OUTWARD('SUT','',N.ERR)
      IF N.ERR THEN
Y.N.ERR = DCOUNT(N.ERR,@FM)  
         FOR JDF = 1 TO Y.N.ERR
*         FOR JDF = 1 TO DCOUNT(N.ERR,@FM)
            LOG.LEVEL = '2' ; LOG.MESSAGE = N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         NEXT JDF
         SW.SKIP = 'Y'
         RETURN
      END

      ALL.FIELDS.ID = 'TOTNB':@FM:'TOTAMT':@FM:'TOTNBCR':@FM:'TOTNBDB':@FM:'TOTAMTCR':@FM:'TOTAMTDB'
      ALL.FIELD.DATA = Y.TOT.CNT:@FM:Y.TOT.AMT:@FM:Y.TOT.CNT.CR:@FM:Y.TOT.CNT.DB:@FM:Y.TOT.AMT.CR:@FM:Y.TOT.AMT.DB
      CALL Y.INSERT.CEC.FIELD('NEXT','SUT',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)

      IF NEXT.SUT.RECORD THEN
         R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER> = NEXT.SUT.RECORD
      END

      CALL Y.INSERT.CEC.FIELD('NEXT','SUH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      IF NEXT.SUH.RECORD THEN 
         R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> = NEXT.SUH.RECORD
      END

      SAVE.FILE.IDENT = FILE.IDENT
      SAVE.PINTAPE = PINTAPE

      CALL CEC.CREATE.OUTWARD.FILE(LAST.SUH.ID,N.ERR)
      IF N.ERR THEN
         LOG.MESSAGE = N.ERR
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
      END

      IF SAVE.FILE.IDENT NE FILE.IDENT OR SAVE.PINTAPE NE PINTAPE THEN
         NB.LOG.FILES = DCOUNT(R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME>,@VM)
         IF R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME,NB.LOG.FILES> EQ SAVE.FILE.IDENT:SAVE.PINTAPE THEN
            R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME,NB.LOG.FILES> = FILE.IDENT:PINTAPE
            CALL F.WRITE(CEC.OUTWARD.LOG.FILE,Y.PROCESS.DATE,R.CEC.OUTWARD.LOG)
         END
         R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME> = FILE.IDENT:PINTAPE
      END

      GOSUB WRITE.CEC.OUTWARD.FILES.FILE

      FILE.IDENT = SAVE.FILE.IDENT  
      PINTAPE = SAVE.PINTAPE

      Y.FILE.HEADER = 0

      RETURN

***********************************************************************
POST.REMIT.NOSTRO.ENTRY:
***********************************************************************

*     Already done at CEC.OUTWARD level for account class

      IF LAST.NOSTRO.CATEGORY AND LAST.TRANSIT.CATEGORY THEN RETURN

*     No entries generation for same DB/CR account

      IF LAST.NOSTRO.ACCT.NO EQ LAST.TRANSIT.ACCT.NO THEN RETURN

*     No entries if all entries have already been settled at line level

      IF R.CEC.PARAMETER<CEC.PAR.ENTRIES.BY.LINE> THEN RETURN

      SAVE.R.FTTC = R.FTTC
      CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
      CALL Y.CLEAR.SITCOM
      R.FTTC = SAVE.R.FTTC

      MSG.REF = 'EB-CEC.MESSAGE.REFERENCE':@FM:Y.REMIT.NUM
      CALL LOT.TRANSLATE.ERROR(MSG.REF,'')

      BEGIN CASE
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            IF LAST.NOSTRO.CATEGORY EQ '' THEN
               ACCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
               IF LCCY NE R.LAST.NOSTRO.ACCT<AC.CURRENCY> THEN
                  LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
               END ELSE
                  LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
               END
               CREDIT.VALUE.DATE = SETTLEMENT.DATE
               R.CREDIT.ACCT = R.LAST.NOSTRO.ACCT
               CREDIT.ACCT.NO = LAST.NOSTRO.ACCT.NO
               CREDIT.THEIR.REF = MSG.REF
            END
            IF LAST.TRANSIT.CATEGORY EQ '' THEN
               ACCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
               IF LCCY NE R.LAST.TRANSIT.ACCT<AC.CURRENCY> THEN
                  LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
               END ELSE
                  LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
               END
               DEBIT.VALUE.DATE = SETTLEMENT.DATE
               R.DEBIT.ACCT = R.LAST.TRANSIT.ACCT
               DEBIT.ACCT.NO = LAST.TRANSIT.ACCT.NO
               DEBIT.THEIR.REF = MSG.REF
            END
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            IF LAST.TRANSIT.CATEGORY EQ '' THEN
               ACCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
               IF LCCY NE R.LAST.TRANSIT.ACCT<AC.CURRENCY> THEN
                  LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
               END ELSE
                  LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
               END
               CREDIT.VALUE.DATE = SETTLEMENT.DATE
               R.CREDIT.ACCT = R.LAST.TRANSIT.ACCT
               CREDIT.ACCT.NO = LAST.TRANSIT.ACCT.NO
               CREDIT.THEIR.REF = MSG.REF
            END
            IF LAST.NOSTRO.CATEGORY EQ '' THEN
               ACCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
               IF LCCY NE R.LAST.NOSTRO.ACCT<AC.CURRENCY> THEN
                  LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
               END ELSE
                  LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
               END
               DEBIT.VALUE.DATE = SETTLEMENT.DATE
               R.DEBIT.ACCT = R.LAST.NOSTRO.ACCT
               DEBIT.ACCT.NO = LAST.NOSTRO.ACCT.NO
               DEBIT.THEIR.REF = MSG.REF
            END
      END CASE
      IF COUNTER.FOR.COMMITMENT GT 1 THEN
         MSG.REF = 'EB-CEC.MESSAGE.NARRN':@FM:COUNTER.FOR.COMMITMENT:@VM:LAST.OPCODE
         CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
      END ELSE
         MSG.REF = 'EB-CEC.MESSAGE.NARR1':@FM:LAST.OPCODE
         CALL LOT.TRANSLATE.ERROR(MSG.REF,'')
      END
      PAYMENT.DETAILS = MSG.REF
      TRANS.ID = CEC.OUTWARD.FILES.ID:'-':Y.REMIT.NUM
      LOCATE 'CEC.OUTWARD.FILES' IN R.CEC.PARAMETER<CEC.PAR.APPLICATION.ID,1> SETTING OHY THEN
         TRANS.ID := @FM:R.CEC.PARAMETER<CEC.PAR.EB.SYSTEM.ID,OHY>
      END
      MAT R.SAVE = MAT R.NEW 
      MAT R.NEW = '' 

* EPI 21/02/2010 <
*     CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
*     CONVERT @VM TO @SM IN R.NEW(V-10)
*     R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,Y.REMIT.NUM> = R.NEW(V-10)
      IF NEXT.PROCESS.TYPE EQ 'OFT' THEN
         SAVE.ID.NEW = ID.NEW
         ID.NEW = CEC.OUTWARD.FILES.ID:'-':Y.REMIT.NUM
         GOSUB POST.FT.ENTRY
         ID.NEW = SAVE.ID.NEW 
      END ELSE
         CALL SIT.FUP.ACCOUNTING(TRANS.ID,'','A','SAO')
     *    CONVERT @VM TO @SM IN R.NEW(V-10)
         CHANGE @VM TO @SM IN R.NEW(V-10)
         R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,Y.REMIT.NUM> = R.NEW(V-10)
      END
* EPI 21/02/2010 >
      MAT R.NEW = MAT R.SAVE 

      RETURN

* EPI 21/02/2010 <

***********************************************************************
POST.FT.ENTRY:
***********************************************************************

      R.NEW(CEC.OC.TRANSACTION.TYPE) = NEXT.FTTC.ID
      R.NEW(CEC.OC.PROCESSING.DATE)= SETTLEMENT.DATE

       BEGIN CASE
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            CUSTOMER.SIGN = 'CR'
            R.NEW(CEC.OC.DEBIT.AMOUNT) = TOTAL.FOR.COMMITMENT
            R.NEW(CEC.OC.CREDIT.ACCT.NO) = LAST.NOSTRO.ACCT.NO
            R.NEW(CEC.OC.CREDIT.CURRENCY) = R.LAST.NOSTRO.ACCT<AC.CURRENCY>
            R.NEW(CEC.OC.DEBIT.ACCT.NO) = LAST.TRANSIT.ACCT.NO
            R.NEW(CEC.OC.DEBIT.CURRENCY) = R.LAST.TRANSIT.ACCT<AC.CURRENCY>
            R.NEW(CEC.OC.DEBIT.VALUE.DATE) = SETTLEMENT.DATE
            IF LCCY NE R.CREDIT.ACCT<AC.CURRENCY> 
               THEN LCCY.AMOUNT.CREDITED = LCCY.FOR.COMMITMENT
               ELSE LCCY.AMOUNT.CREDITED = TOTAL.FOR.COMMITMENT
         CASE R.LAST.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            CUSTOMER.SIGN = 'DB'
            R.NEW(CEC.OC.CREDIT.AMOUNT) = TOTAL.FOR.COMMITMENT
            R.NEW(CEC.OC.DEBIT.ACCT.NO) = LAST.NOSTRO.ACCT.NO
            R.NEW(CEC.OC.DEBIT.CURRENCY) = R.LAST.NOSTRO.ACCT<AC.CURRENCY>
            R.NEW(CEC.OC.CREDIT.ACCT.NO) = LAST.TRANSIT.ACCT.NO
            R.NEW(CEC.OC.CREDIT.CURRENCY) = R.LAST.TRANSIT.ACCT<AC.CURRENCY>
            R.NEW(CEC.OC.CREDIT.VALUE.DATE) = SETTLEMENT.DATE
            IF LCCY NE R.DEBIT.ACCT<AC.CURRENCY>
               THEN LCCY.AMOUNT.DEBITED = LCCY.FOR.COMMITMENT
               ELSE LCCY.AMOUNT.DEBITED = TOTAL.FOR.COMMITMENT
      END CASE

*     Check value dates

      GOSUB CHECK.VALUE.DATES

*     Check accounts and calculate fees

      GOSUB CALCULATE.CHARGES

      CURR.NO = 0

*     Generation of a FT in 'IHLD' to make this GLOBAL.ACCOUNTING

      LOCATE 'OUT.FT.GLOBAL' IN R.CEC.PARAMETER<CEC.PAR.DIRECTION.TYPE,1> SETTING FDD THEN
         FT.GEN.RTN = FIELD(R.CEC.PARAMETER<CEC.PAR.GENERATION.RTN,FDD>,"@",2)
      END ELSE FT.GEN.RTN = ''
      IF FT.GEN.RTN EQ '' THEN FT.GEN.RTN = 'CEC.SOCF.GEN.OFT'
      SAVE.COMI = COMI
      COMI = ''
      CALL @FT.GEN.RTN(FT.REC.ID,R.FT.REC,N.ERR)
      IF FT.REC.ID NE '' THEN

*        Attempt to validate and authorize the generated FT

         IF COMI EQ '' THEN CALL Y.FT.AUTH(FT.REC.ID,R.FT.REC)
         R.NEW(V-10) = R.FT.REC<FT.STMT.NOS>
         R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,Y.REMIT.NUM> = FT.REC.ID
      END
      COMI = SAVE.COMI

      RETURN

* EPI 21/02/2010 >

***********************************************************************
READ.CODE.LAYOUT:
***********************************************************************

      LAST.LAYOUT.ID = NEXT.LAYOUT.ID

*     Extraction du format du message

      ACT.DAT.RECORD = ''
      CALL Y.LOAD.CEC.LAYOUT('OUTWARD','','',NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,LOG.MESSAGE)
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         SW.UNKNOWN.MESSAGE = 'Y'
         SW.SKIP = 'Y'
         RETURN
      END

*     Extraction des conditions de compabilisation

      CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,CLEAR.CCY,LOG.MESSAGE)
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         SW.UNKNOWN.MESSAGE = 'Y'
         SW.SKIP = 'Y'
         RETURN
      END

*     CALL Y.CLEAR.CECHDR

      R.FTTC = R.NEXT.FTTC ; YR.FTTC.ID = NEXT.FTTC.ID

      SW.UNKNOWN.MESSAGE = ''

      RETURN

***********************************************************************
STORE.OUTWARD.LINE:
***********************************************************************

      GOSUB GENERATE.ACCOUNTING.ENTRIES
      IF MOD(COUNTER.FOR.COMMITMENT,COMMIT.NUMBER) EQ 0 THEN
         GOSUB REMIT.TRAILER.UPDATE
      END

      RETURN

***********************************************************************
GENERATE.ACCOUNTING.ENTRIES:
***********************************************************************

      E = '' ; V$ERROR = '' ; ETEXT = '' ; TEXT = '' ; CURR.NO = 0

      COUNTER.FOR.COMMITMENT += 1

      SAVE.R.FTTC = R.FTTC
      CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
      CALL Y.CLEAR.SITCOM
      R.FTTC = SAVE.R.FTTC

*     To avoid a double read on the account file for non pending operations

      BEGIN CASE
         CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            IF R.NEW(CEC.OC.DEBIT.ACCT.NO) EQ NEXT.TRANSIT.ACCT.NO THEN R.DEBIT.ACCT = R.NEXT.TRANSIT.ACCT
            IF R.NEW(CEC.OC.CREDIT.ACCT.NO) EQ NEXT.NOSTRO.ACCT.NO THEN R.CREDIT.ACCT = R.NEXT.NOSTRO.ACCT
            TOTAL.FOR.COMMITMENT += R.NEW(CEC.OC.CREDIT.AMOUNT)
            SETTLEMENT.DATE = R.NEW(CEC.OC.DEBIT.VALUE.DATE)
         CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            IF R.NEW(CEC.OC.DEBIT.ACCT.NO) EQ NEXT.NOSTRO.ACCT.NO THEN R.DEBIT.ACCT = R.NEXT.NOSTRO.ACCT
            IF R.NEW(CEC.OC.CREDIT.ACCT.NO) EQ NEXT.TRANSIT.ACCT.NO THEN R.CREDIT.ACCT = R.NEXT.TRANSIT.ACCT
            TOTAL.FOR.COMMITMENT += R.NEW(CEC.OC.DEBIT.AMOUNT)
            SETTLEMENT.DATE = R.NEW(CEC.OC.CREDIT.VALUE.DATE)
         CASE 1
            RETURN
      END CASE
      R.NEW(SIT.AF.COMMISSION.CODE) = 'WAIVE'
      R.NEW(SIT.AF.CHARGE.CODE) = 'WAIVE'

      CUSTOMER.SIGN = R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN>

      GOSUB CHECK.VALUE.DATES
      IF E THEN GOSUB UPDATE.OVERRIDE

*     Check accounts and calculate fees

      GOSUB CALCULATE.CHARGES
      IF E THEN GOSUB UPDATE.OVERRIDE

      BEGIN CASE
         CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
            LCCY.FOR.COMMITMENT += LCCY.AMOUNT.CREDITED
         CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR'
            LCCY.FOR.COMMITMENT += LCCY.AMOUNT.DEBITED
      END CASE

      IF ACCY.AMOUNT.CREDITED+0 LT 0 THEN
         MSG.ERR = 'EB-CEC.FEES.ABOVE.CREDIT.AMT'
         CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
         TEXT = MSG.ERR 
         GOSUB UPDATE.OVERRIDE
      END
      IF ACCY.AMOUNT.DEBITED+0 LT 0 THEN
         MSG.ERR = 'EB-CEC.FEES.ABOVE.DEBIT.AMT'
         CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
         TEXT = MSG.ERR
         GOSUB UPDATE.OVERRIDE
      END

      IF R.CEC.PARAMETER<CEC.PAR.ENTRIES.BY.LINE> ELSE
         BEGIN CASE
            CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'DB'
               IF NEXT.NOSTRO.CATEGORY EQ '' THEN CREDIT.ACCT.NO = ''  ; ACCY.AMOUNT.CREDITED = 0
               IF NEXT.TRANSIT.CATEGORY EQ '' THEN DEBIT.ACCT.NO = ''  ; ACCY.AMOUNT.DEBITED = 0
            CASE R.NEXT.LAYOUT<CEC.LAY.CUSTOMER.SIGN> EQ 'CR' 
               IF NEXT.TRANSIT.CATEGORY EQ '' THEN CREDIT.ACCT.NO = '' ; ACCY.AMOUNT.CREDITED = 0
               IF NEXT.NOSTRO.CATEGORY EQ '' THEN DEBIT.ACCT.NO = ''   ; ACCY.AMOUNT.DEBITED = 0
         END CASE
      END

*     Produce accounting entry(ies) in case of account class only

      IF CREDIT.ACCT.NO NE DEBIT.ACCT.NO THEN
         TRANS.ID = ID.NEW:@VM:CEC.OUTWARD.FILES.ID:'-':Y.REMIT.NUM 
         LOCATE 'CEC.OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.APPLICATION.ID,1> SETTING OHY THEN
            TRANS.ID := @FM:R.CEC.PARAMETER<CEC.PAR.EB.SYSTEM.ID,OHY>
         END
         CALL SIT.FUP.ACCOUNTING(TRANS.ID,R.NEW(CEC.OC.STATEMENT.NOS),'A','SAO')
         IF E THEN GOSUB UPDATE.OVERRIDE
      END

      RETURN

***********************************************************************
UPDATE.OVERRIDE:
***********************************************************************

      IF E THEN
         LOCATE E IN R.NEW(CEC.OC.OVERRIDE)<1,1> SETTING TRO ELSE
            CURR.NO += 1 ; R.NEW(CEC.OC.OVERRIDE)<1,CURR.NO> = E
         END
         E = '' ; V$ERROR = '' ; ETEXT = '' ; TEXT = ''
      END

      RETURN

***********************************************************************
UPDATE.REFERENCE:
***********************************************************************

 *     CONVERT ',' TO @FM IN L.KEY.RANK
      CHANGE ',' TO @FM IN L.KEY.RANK
Y.L.KEY.RANK = DCOUNT(L.KEY.RANK,@FM)  
         FOR IRQ = 1 TO Y.L.KEY.RANK
*      FOR IRQ = 1 TO DCOUNT(L.KEY.RANK,@FM)
         L.KEY.PREFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",1)
         L.KEY.SUFFIX = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",2)
         L.KEY.WRAP = MATCHFIELD(L.KEY.RANK<IRQ>,"0A0N0X",3)
         LOCATE L.KEY.PREFIX IN CEC.IDS<1,1> SETTING LFI THEN
            IF CEC.IDS<2,LFI> EQ '' THEN
               CEC.IDS<2,LFI> = L.KEY.SUFFIX
               CEC.IDS<3,LFI> = L.KEY.DATA
            END ELSE
               LOCATE L.KEY.SUFFIX IN CEC.IDS<2,LFI,1> SETTING ITW THEN
                   IF L.KEY.WRAP EQ '' THEN
                      CEC.IDS<3,LFI,ITW> = L.KEY.DATA
                   END ELSE
                      IF L.KEY.DATA THEN CEC.IDS<3,LFI,ITW> := ' ':L.KEY.DATA
                   END
               END ELSE 
                   NB.IDENT = COUNT(CEC.IDS<2,LFI>,@SM) + 1
                   IF L.KEY.SUFFIX GT CEC.IDS<2,LFI,NB.IDENT> THEN
                      CEC.IDS<2,LFI,NB.IDENT+1> = L.KEY.SUFFIX
                      CEC.IDS<3,LFI,NB.IDENT+1> = L.KEY.DATA
                   END ELSE
                      FOR ITD = 1 TO NB.IDENT
                         IF L.KEY.SUFFIX LT CEC.IDS<2,LFI,ITD> THEN
                            CEC.IDS<2,LFI,ITD> = L.KEY.SUFFIX:@SM:CEC.IDS<2,LFI,ITD>
                            CEC.IDS<3,LFI,ITD> = L.KEY.DATA:@SM:CEC.IDS<3,LFI,ITD>
                            EXIT
                         END
                      NEXT ITD
                   END
                END
             END
          END ELSE
             IF CEC.IDS EQ '' THEN
                CEC.IDS<1> = L.KEY.PREFIX
                CEC.IDS<2> = L.KEY.SUFFIX
                CEC.IDS<3> = L.KEY.DATA
             END ELSE
                CEC.IDS<1> := @VM:L.KEY.PREFIX
                CEC.IDS<2> := @VM:L.KEY.SUFFIX
                CEC.IDS<3> := @VM:L.KEY.DATA
             END
          END
      NEXT IRQ

      RETURN

***********************************************************************
CREATE.MSG.CONCAT.FILE:
***********************************************************************

*     Create an entry in the CEC.MSG.CONCAT file to retrieve the linked CEC messages

      IF YR.CEC.MSG.CONCAT.ID NE '' THEN

*        An original message key is stored in a concat file

         YR.MSGC.ID = YR.CEC.MSG.CONCAT.ID
*        ER = '' R.MSGC = ''
         ER = '' ; R.MSGC = ''
         CALL F.READ(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC,F.CEC.MSG.CONCAT,ER)
         IF ER THEN
            R.MSGC<1> = CEC.OUTWARD.FILES.ID
            R.MSGC<2> = Y.REMIT.NUM
         END ELSE
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.MSG.ID':@FM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            LOCATE CEC.OUTWARD.FILES.ID IN R.MSGC<1,1> SETTING ALI ELSE
               NB.SIMILAR = DCOUNT(R.MSGC<1>,@VM)
               R.MSGC<1,NB.SIMILAR+1> = CEC.OUTWARD.FILES.ID
               R.MSGC<2,NB.SIMILAR+1> = Y.REMIT.NUM
            END
         END
         CALL F.WRITE(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC)
      END

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      DIM R.SAVE(V)

      REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
      IF LEN(REGION) EQ 2 THEN REGION = REGION:'00'

      JNL.ID = Y.PROCESS.DATE

      TAPE.FILE.NAME = "FT.IN.TAPE" ; FT.IN.TAPE = ''

      IF R.SPF.SYSTEM<SPF.OPERATING.SYSTEM>[1,4] EQ 'UNIX' THEN SW.UNIX = 'Y' ELSE SW.UNIX = 'N'

      CEC.OUTWARD.FILE = 'F.CEC.OUTWARD' ; F.CEC.OUTWARD = ''
      CALL OPF(CEC.OUTWARD.FILE, F.CEC.OUTWARD)

      CEC.OUTWARD.CONCAT.FILE = 'F.CEC.OUTWARD.CONCAT'
      F.CEC.OUTWARD.CONCAT = ''
      CALL OPF(CEC.OUTWARD.CONCAT.FILE, F.CEC.OUTWARD.CONCAT)

      CEC.MSG.CONCAT.FILE = 'F.CEC.MSG.CONCAT'
      F.CEC.MSG.CONCAT = ''
      CALL OPF(CEC.MSG.CONCAT.FILE, F.CEC.MSG.CONCAT)
      YR.MSGC.ID = '' ; R.MSGC = ''

      CEC.OUTWARD.PENDING.FILE = 'F.CEC.OUTWARD.PENDING'
      F.CEC.OUTWARD.PENDING = ''
      CALL OPF(CEC.OUTWARD.PENDING.FILE, F.CEC.OUTWARD.PENDING)

      CEC.OUTWARD.LOG.FILE = 'F.CEC.OUTWARD.LOG'
      F.CEC.OUTWARD.LOG = ''
      CALL OPF(CEC.OUTWARD.LOG.FILE, F.CEC.OUTWARD.LOG)

      CEC.OUTWARD.FILES.FILE = 'F.CEC.OUTWARD.FILES'
      F.CEC.OUTWARD.FILES = ''
      CALL OPF(CEC.OUTWARD.FILES.FILE, F.CEC.OUTWARD.FILES)

      CALL Y.LOAD.CECPAR(LOG.MESSAGE)
      IF LOG.MESSAGE THEN RETURN

      FT.TXN.TYPE.CONDITION.FILE = 'F.FT.TXN.TYPE.CONDITION'
      F.FT.TXN.TYPE.CONDITION = ''
      CALL OPF(FT.TXN.TYPE.CONDITION.FILE, F.FT.TXN.TYPE.CONDITION)
      YR.FTTC.ID = '' ; R.FTTC = ''

      ACCOUNT.FILE = 'F.ACCOUNT' ; FBNK.ACCOUNT = ''
      CALL OPF(ACCOUNT.FILE, FBNK.ACCOUNT)

      CALL Y.LOAD.CECDEF
      CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
      CALL Y.CLEAR.SITCOM
      CALL Y.CLEAR.CECFMT
      CALL Y.CLEAR.CECOCF
      CALL Y.CLEAR.CECREC

      RETURN

***********************************************************************
READ.CEC.OUTWARD.PENDING.FILE:
***********************************************************************

      R.CEC.OUTWARD.PENDING = '' ; ER = ''
      CALL F.READ(CEC.OUTWARD.PENDING.FILE,UNFORM.FILE.ID,R.CEC.OUTWARD.PENDING,F.CEC.OUTWARD.PENDING,ER)

      RETURN

***********************************************************************
READ.CEC.OUTWARD.FILES.FILE:
***********************************************************************

      CALL F.READ(CEC.OUTWARD.FILES.FILE,CEC.OUTWARD.FILES.ID,R.CEC.OUT.FILES,F.CEC.OUTWARD.FILES,ER)
*     IF NOT(ER) THEN
         IF SW.RECOVERY NE 'Y' THEN
            SELECT.COMMAND = 'SELECT ':CEC.OUTWARD.FILES.FILE:' WITH FILE.NAME LIKE ':FILE.IDENT:PINTAPE:'... BY FILE.NAME'
            AE.ID.LIST = '' ; NO.SELECTED = ''
            CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
            IF AE.ID.LIST THEN
               GOSUB SORT.AE.ID.LIST
               NB.ALREADY = DCOUNT(SORTED.LIST,@FM)
               IF NB.ALREADY THEN PINTAPE := '.':SORTED.LIST<NB.ALREADY>+1
            END
         END
*     END

      R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME> = FILE.IDENT:PINTAPE
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.DATE> = Y.PROCESS.DATE
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.TIME> = Y.PROCESS.TIME

*     For a given presentation date, the concat file store the remit of the same file in the same sub-value

      IF SW.RECOVERY EQ 'Y' THEN NB.MV = NB.ALREADY ELSE NB.MV = NB.ALREADY+1
* EPI 17/12/2009 <
      SW.BRAND.NEW = 1
Y.R.SOCC = DCOUNT(R.SOCC,@VM)
Y.R.SOCC.1 = DCOUNT(R.SOCC<1,IUQ>,@SM)
      FOR IUQ = 1 TO Y.R.SOCC
	  FOR IUZ = 1 TO Y.R.SOCC.1
*      FOR IUQ = 1 TO DCOUNT(R.SOCC,@VM)
*         FOR IUZ = 1 TO DCOUNT(R.SOCC<1,IUQ>,@SM)
            IF R.SOCC<1,IUQ,IUZ> EQ CEC.OUTWARD.FILES.ID THEN SW.BRAND.NEW = 0
         NEXT IUZ
      NEXT IUQ
      IF SW.BRAND.NEW THEN R.SOCC<1,NB.MV,-1> = CEC.OUTWARD.FILES.ID
*     R.SOCC<1,NB.MV,-1> = CEC.OUTWARD.FILES.ID
* EPI 17/12/2009 >

*     The rewrite of CEC.PARAMETER is done at next commitment for not loosing a number in case of crash recovery

      RETURN

***********************************************************************
SORT.AE.ID.LIST:
***********************************************************************

*     Ascending sort on the key suffix number

      NB.AE.ID.LIST = DCOUNT(AE.ID.LIST,@FM)
      SORTED.KEY3 = ""
      SORTED.LIST = ""
      FOR ITR = 1 TO NB.AE.ID.LIST
         R.SOCFIL = '' ; ER = ''
         YR.SOCFIL.ID = AE.ID.LIST<ITR>
         CALL F.READ(CEC.OUTWARD.FILES.FILE,YR.SOCFIL.ID,R.SOCFIL,F.CEC.OUTWARD.FILES,ER)
         IF NOT (ER) THEN
            TST.NAME = R.SOCFIL<CEC.OCF.FILE.NAME>
            TST.DATE = R.SOCFIL<CEC.OCF.CREATION.DATE>
            TST.TIME = R.SOCFIL<CEC.OCF.CREATION.TIME>
            IF TST.NAME EQ FILE.IDENT:PINTAPE AND TST.DATE EQ Y.PROCESS.DATE AND TST.TIME EQ Y.PROCESS.TIME ELSE

*              The remit is not an additional one for the same file but should start a new one

               LENGTH.PINTAPE = LEN(FILE.IDENT:PINTAPE)
               LENGTH.FILNAME = LEN(R.SOCFIL<CEC.OCF.FILE.NAME>)
               SOCFIL.TRAV = R.SOCFIL<CEC.OCF.FILE.NAME>[LENGTH.PINTAPE+1,LENGTH.FILNAME-LENGTH.PINTAPE]
               SOCFIL.KEY3 = FIELD(SOCFIL.TRAV,".",2)
               IF SOCFIL.KEY3 EQ '' THEN SOCFIL.KEY3 = 0
               IF SORTED.LIST EQ '' THEN
                  SORTED.LIST = SOCFIL.KEY3
               END ELSE
                  LOCATE SOCFIL.KEY3 IN SORTED.LIST<1> SETTING FOUN ELSE
                     NB.SORTED.LIST = DCOUNT(SORTED.LIST,@FM)
                     IF SOCFIL.KEY3 GT SORTED.LIST<NB.SORTED.LIST> THEN
                        SORTED.LIST := @FM:SOCFIL.KEY3
                     END ELSE
                        FOR ITZ = 1 TO NB.SORTED.LIST
                           IF SOCFIL.KEY3 LT SORTED.LIST<ITZ> THEN
                              SORTED.LIST<ITZ> = SOCFIL.KEY3:@FM:SORTED.LIST<ITZ>
                              EXIT
                           END
                        NEXT ITZ
                     END
                  END
               END
            END
         END
      NEXT ITR

      RETURN

***********************************************************************
WRITE.CEC.OUTWARD.FILES.FILE:
***********************************************************************

      R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.DATE> = Y.PROCESS.DATE
      R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.TIME> = Y.PROCESS.TIME
      CALL F.WRITE(CEC.OUTWARD.FILES.FILE,CEC.OUTWARD.FILES.ID,R.CEC.OUTWARD.FILES)

*     Creation/update of the concat file that links the processed files for a given presentation date

      CALL F.WRITE(CEC.OUTWARD.CONCAT.FILE,FIELD(PINTAPE,"-",1),R.SOCC)

*     Update the CEC.OUTWARD.PENDING range with the remit id for further crash recovery

      IF R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO> EQ '' THEN
         R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO> = CEC.OUTWARD.FILES.ID:'\':Y.REMIT.NUM
      END ELSE
         SW.TROUVE = 0
         NB.DEJA = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO>,@SM)
Y.PENDING = DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO>,@SM)
         FOR ILZ = 1 TO Y.PENDING
*         FOR ILZ = 1 TO DCOUNT(R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO>,@SM)
            IF CEC.OUTWARD.FILES.ID:'\':Y.REMIT.NUM EQ R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO,ILZ> THEN
               SW.TROUVE = 1 ; EXIT
            END
         NEXT ILZ
         IF SW.TROUVE EQ 0 THEN
            R.CEC.OUTWARD.PENDING<CEC.OCP.TRANS.FILES,LAST.IDO,NB.DEJA + 1> = CEC.OUTWARD.FILES.ID:'\':Y.REMIT.NUM
         END
      END

      CALL F.WRITE(CEC.OUTWARD.PENDING.FILE,UNFORM.FILE.ID,R.CEC.OUTWARD.PENDING)

*     CALL F.WRITE(CEC.PARAMETER.FILE,ID.COMPANY,R.CEC.PARAMETER)

      CALL JOURNAL.UPDATE(CEC.OUTWARD.FILES.ID)

      RETURN

***********************************************************************
READ.CEC.OUTWARD.CONCAT.FILE:
***********************************************************************

      R.SOCC = '' ; ER = ''
      CALL F.READ(CEC.OUTWARD.CONCAT.FILE,FIELD(PINTAPE,"-",1),R.SOCC,F.CEC.OUTWARD.CONCAT,ER)
      IF R.SOCC NE '' THEN NB.ALREADY = DCOUNT(R.SOCC<1>,@VM) ELSE NB.ALREADY = 0

      RETURN

***********************************************************************
UPDATE.LOG.FILE:
***********************************************************************

      IF LOG.LEVEL EQ '' THEN LOG.LEVEL = 0

      IF LOG.LEVEL GT WORST.LEVEL THEN WORST.LEVEL = LOG.LEVEL

      IF PINTAPE EQ '' THEN

*        General problem not linked to a given file

         NB.LOG.PROBLEMS = DCOUNT(R.CEC.OUTWARD.LOG<CEC.OCL.PROBLEM.TIME>,@VM)
         R.CEC.OUTWARD.LOG<CEC.OCL.PROBLEM.TIME,NB.LOG.PROBLEMS+1> = OCONV(TIME(),"MTS")
         R.CEC.OUTWARD.LOG<CEC.OCL.PROBLEM.MESS,NB.LOG.PROBLEMS+1> = LOG.MESSAGE
         R.CEC.OUTWARD.LOG<CEC.OCL.PROBLEM.LEVEL,NB.LOG.PROBLEMS+1> = LOG.LEVEL
      END ELSE

*        Specific problem linked to a given file

         I.EVENT = 0
         NB.LOG.FILES = DCOUNT(R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME>,@VM)
         IF NB.LOG.FILES EQ 0 THEN
            I.LOG = 1
         END ELSE
            PINTAPE.PREV = R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME,NB.LOG.FILES>
            OUT.FILE.ID.PREV = R.CEC.OUTWARD.LOG<CEC.OCL.OUT.FILE.ID,NB.LOG.FILES>
            IF FILE.IDENT:PINTAPE NE PINTAPE.PREV OR CEC.OUTWARD.FILES.ID NE OUT.FILE.ID.PREV THEN
               I.LOG = NB.LOG.FILES + 1
            END ELSE
               IF LOT.MESG.ID EQ 'EB-CEC.NO.PROBLEM.FOUND' THEN 
                  LOG.MESSAGE = '' ; LOG.LEVEL = '' 
               END ELSE
                  I.LOG = NB.LOG.FILES
                  I.EVENT = DCOUNT(R.CEC.OUTWARD.LOG<CEC.OCL.EVENT.TIME,I.LOG>,@SM)
               END
            END
         END
         R.CEC.OUTWARD.LOG<CEC.OCL.FILE.NAME,I.LOG> = FILE.IDENT:PINTAPE
         R.CEC.OUTWARD.LOG<CEC.OCL.OUT.FILE.ID,I.LOG> = CEC.OUTWARD.FILES.ID
         R.CEC.OUTWARD.LOG<CEC.OCL.USER.ID,I.LOG> = OPERATOR
         IF LOG.MESSAGE OR LOG.LEVEL THEN
            I.EVENT += 1
            R.CEC.OUTWARD.LOG<CEC.OCL.EVENT.TIME,I.LOG,I.EVENT> = OCONV(TIME(),"MTS")
            R.CEC.OUTWARD.LOG<CEC.OCL.EVENT.MESS,I.LOG,I.EVENT> = LOG.MESSAGE
            R.CEC.OUTWARD.LOG<CEC.OCL.EVENT.LEVEL,I.LOG,I.EVENT> = LOG.LEVEL
         END
         PINTAPE.PREV = PINTAPE
         OUT.FILE.ID.PREV = FILE.IDENT:PINTAPE
      END
      CALL F.WRITE(CEC.OUTWARD.LOG.FILE,Y.PROCESS.DATE,R.CEC.OUTWARD.LOG)
      LOG.MESSAGE = '' ; LOG.LEVEL = ''

      RETURN

************************************************************************
CALCULATE.CHARGES:
************************************************************************

$INSERT I_LOT.ACCOUNTING

*-----------------------------------------------------------------------

   END
