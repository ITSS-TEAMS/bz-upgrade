*-----------------------------------------------------------------------------
* <Rating>2920</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EMPTY.OUTWARD
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
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : Removed JOURNAL.UPDATE for batch/version routine.
*
*-----------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.ACCOUNT.CLASS
$INSERT I_F.CEC.LAYOUT
* $INSERT I_COMMON - Not Used anymore;METER
* $INSERT I_EQUATE - Not Used anymore;ARD.FILES
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.CEC.MSG.CONCAT

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECFMT
$INSERT I_CECREH
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT EB.SystemTables.getVFunction()$INSERT I_CECOCF
$INSERT I_LOTERR
$INSEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERT I_NEXT.CECLAY

*---- Revision History --FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-----------------------------
* 
*---------------------------------------------------------------------

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP

      GOSUB INITIALISE

      IF N.NULL.HEADER.LIST EQ '' THEN RETURN

AA<-1> = 'N.NULL.HEADER.LIST ':N.NULL.HEADER.LIST

      SSTATEMENT = "SSELECT ":CEC.OUTWARD.PENDING.FILE:" WITH @ID LE ":PENDING.DATE:'-z'
      STILL.TO.DO.LIST = ''
      CALL EB.READLIST(SSTATEMENT,STILL.TO.DO.LIST,'','','')
      NB.STILL.TO.DO = DCOUNT(STILL.TO.DO.LIST,@FM)
AA<-1> = 'STILL.TO.DO.LIST ':STILL.TO.DO.LIST

      NB.REH = DCOUNT(N.NULL.HEADER.LIST,@FM)
      FOR KKI = 1 TO NB.REH
         APPL.CODE = '0':N.NULL.HEADER.LIST<KKI>
         EB.DataAccess.OpfT.LAYOUT.ID = 'OUTWARD.':APPL.CODE
         EB.DataAccess.OpfTAPE = Y.PROCESS.DATE:'-':N.NULL.HEADER.LIST<KKI>
         GOSUB CHECK.ALREADY.DONE
         IF SW.ALREADY.DONE ELSE GOSUB PROCESS.NULL.HEADER
AA<-1> = 'APPL.CODE ':APPL.CODE
AA<-1> = 'NEXT.LAYOUT.ID ':NEXT.LAYOUT.ID
AA<-1> = 'PINTAPE EB.SystemTables.getRNew()TFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef KKI
IF NOT(PGEB.DataAccess.FReadION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* UPGRADE R13 TO R19.
      CALL JOURNAL.UPDATE(Y.PROCESS.DATE)
	  END

*WRITE AA TO F.TOOLS,"MP.EMPEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerNEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>2920</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EMPTY.OUTWARD
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
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : Removed JOURNAL.UPDATE for batch/version routine.
*
*-----------------------------------------------------
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
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.CEC.MSG.CONCAT

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECFMT
$INSERT I_CECREH
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

*---- Revision History ------------------------------------------------
* 
*---------------------------------------------------------------------

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP

      GOSUB INITIALISE

      IF N.NULL.HEADER.LIST EQ '' THEN RETURN

AA<-1> = 'N.NULL.HEADER.LIST ':N.NULL.HEADER.LIST

      SSTATEMENT = "SSELECT ":CEC.OUTWARD.PENDING.FILE:" WITH @ID LE ":PENDING.DATE:'-z'
      STILL.TO.DO.LIST = ''
      CALL EB.READLIST(SSTATEMENT,STILL.TO.DO.LIST,'','','')
      NB.STILL.TO.DO = DCOUNT(STILL.TO.DO.LIST,@FM)
AA<-1> = 'STILL.TO.DO.LIST ':STILL.TO.DO.LIST

      NB.REH = DCOUNT(N.NULL.HEADER.LIST,@FM)
      FOR KKI = 1 TO NB.REH
         APPL.CODE = '0':N.NULL.HEADER.LIST<KKI>
         NEXT.LAYOUT.ID = 'OUTWARD.':APPL.CODE
         PINTAPE = Y.PROCESS.DATE:'-':N.NULL.HEADER.LIST<KKI>
         GOSUB CHECK.ALREADY.DONE
         IF SW.ALREADY.DONE ELSE GOSUB PROCESS.NULL.HEADER
AA<-1> = 'APPL.CODE ':APPL.CODE
AA<-1> = 'NEXT.LAYOUT.ID ':NEXT.LAYOUT.ID
AA<-1> = 'PINTAPE ':PINTAPE
      NEXT KKI
IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* UPGRADE R13 TO R19.
      CALL JOURNAL.UPDATE(Y.PROCESS.DATE)
	  END

*WRITE AA TO F.TOOLS,"MP.EMPTY"

      RETURN

********************EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer*****EB.SystemTables.getIdNew()**********************
CHECK.ALREADY.DONE:
*****************EB.DataAccess.FWrite***********************************************

      SW.ALREADY.DONE = 0

*     ChEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>2920</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.EMPTY.OUTWARD
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
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : Removed JOURNAL.UPDATE for batch/version routine.
*
*-----------------------------------------------------
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
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.ACCOUNT
$INSERT I_F.CUSTOMER
$INSERT I_F.FT.TXN.TYPE.CONDITION
$INSERT I_F.FT.GROUP.CONDITION
$INSERT I_F.CUSTOMER.CHARGE
$INSERT I_F.CEC.MSG.CONCAT

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECFMT
$INSERT I_CECREH
$INSERT I_CECPAR
$INSERT I_CECDEF
$INSERT I_CECREC
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_LOTERR
$INSERT I_CECLOC
$INSERT I_NEXT.CECLAY

*---- Revision History ------------------------------------------------
* 
*---------------------------------------------------------------------

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP

      GOSUB INITIALISE

      IF N.NULL.HEADER.LIST EQ '' THEN RETURN

AA<-1> = 'N.NULL.HEADER.LIST ':N.NULL.HEADER.LIST

      SSTATEMENT = "SSELECT ":CEC.OUTWARD.PENDING.FILE:" WITH @ID LE ":PENDING.DATE:'-z'
      STILL.TO.DO.LIST = ''
      CALL EB.READLIST(SSTATEMENT,STILL.TO.DO.LIST,'','','')
      NB.STILL.TO.DO = DCOUNT(STILL.TO.DO.LIST,@FM)
AA<-1> = 'STILL.TO.DO.LIST ':STILL.TO.DO.LIST

      NB.REH = DCOUNT(N.NULL.HEADER.LIST,@FM)
      FOR KKI = 1 TO NB.REH
         APPL.CODE = '0':N.NULL.HEADER.LIST<KKI>
         NEXT.LAYOUT.ID = 'OUTWARD.':APPL.CODE
         PINTAPE = Y.PROCESS.DATE:'-':N.NULL.HEADER.LIST<KKI>
         GOSUB CHECK.ALREADY.DONE
         IF SW.ALREADY.DONE ELSE GOSUB PROCESS.NULL.HEADER
AA<-1> = 'APPL.CODE ':APPL.CODE
AA<-1> = 'NEXT.LAYOUT.ID ':NEXT.LAYOUT.ID
AA<-1> = 'PINTAPE ':PINTAPE
      NEXT KKI
IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN ;* UPGRADE R13 TO R19.
      CALL JOURNAL.UPDATE(Y.PROCESS.DATE)
	  END

*WRITE AA TO F.TOOLS,"MP.EMPTY"

      RETURN

***********************************************************************
CHECK.ALREADY.DONE:
***********************************************************************

      SW.ALREADY.DONE = 0

*     CheckFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefn is still pending for today

      EB.SystemTables.setE(1 TO NB.STILL.TO.DO)
         PENDING.ID = STILL.TO.DO.LIST<ILI>
         IF FIELD(PENDING.ID,".",2) NE 'LOC' THEN
            IF FIELD(PENDING.ID,"-",2)[1,2] EQ N.NULL.HEADER.LIST<KKI> THEN
               SW.ALREADY.DONE = 1
               RETURN
            END
         END
      NEXT ILI

      SCOF.COMMAND = 'SELECT ':CEC.OUTWARD.FILES.FILE:' WITH FILE.NAME LIKE ':FILE.IDENT:PINTAPE:'... BY FILE.NAME'
      SCOF.ID.LIST = '' 
      CALL EB.READLIST(SCOF.COMMAND,SCOF.ID.LIST,'','','')
      IF SCOF.ID.LIST THEN SW.ALREADY.DONE = 1

      RETURN

***********************************************************************
PROCESS.NULL.HEADER:
***********************************************************************

      Y.TOT.CNT = 0
      Y.TOT.CNT.CR = 0
      Y.TOT.CNT.DB = 0
      Y.TOT.AMT = 0
      Y.TOT.AMT.CR = 0
      Y.TOT.AMT.DB = 0
      Y.REMIT.HEADER = 0 ; Y.FILE.HEADER = 0
      Y.REMIT.NUM = 0 ; Y.NB.REMIT = 0
      COUNTER.FOR.COMMITMENT = 0
      TOTAL.FOR.COMMITMENT = 0
      LCCY.FOR.COMMITMENT = 0

      SETTLEMENT.DATE = Y.PROCESS.DATE

      SW.UNKNOWN.MESSAGE = '' ; R.NEXT.LAYOUT = '' 

      GOSUB READ.CODE.LAYOUT

      GOSUB CREATE.REMIT.HEADER

      RETURN

***********************************************************************
CREATE.REMIT.HEADER:
***********************************************************************

      COUNTER.FOR.COMMITMENT = 0
      TOTAL.FOR.COMMITMENT = 0
      LCCY.FOR.COMMITMENT = 0
      Y.NB.REMIT += 1

      Y.REMIT.NUM += 1

      NEXT.CENTER.ID = ''

      GOSUB READ.CEC.OUTWARD.CONCAT.FILE

      CALL Y.LOAD.CECREH('OUTWARD','',NEXT.CENTER.ID,'REH-':APPL.CODE[1,3]:'N')
      IF NEXT.REH.ID EQ '' THEN RETURN

      CEC.OUTWARD.FILES.ID = ''
      R.CEC.OUTWARD.FILES = ''
     
      CALL Y.MAP.CEC.OUTWARD('REH','',N.ERR)

      IF N.ERR THEN
	  Y.DCNT = DCOUNT(N.ERR,@FM)
         FOR JDF = 1 TO Y.DCNT
            LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.REJECT.MSG.REASON':@FM:Y.REMIT.NUM:@VM:N.ERR<JDF>
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
         NEXT JDF
         SW.SKIP = 'Y'
         RETURN
      END

      ALL.FIELDS.ID = 'CDATE':@FM:'SDATE':@FM:'BANKID':@FM:'APPLCD'
      ALL.FIELD.DATA = Y.PROCESS.DATE:@FM:SETTLEMENT.DATE:@FM
      ALL.FIELD.DATA := R.CEC.PARAMETER<CEC.PAR.BANK.SORT.CODE>:@FM:APPL.CODE
      CALL Y.INSERT.CEC.FIELD('NEXT','REH',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
      R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,Y.REMIT.NUM> = NEXT.REH.RECORD
      R.CEC.OUTWARD.FILES<CEC.OCF.CENTER.ID> = NEXT.CENTER.ID 

      CEC.IDS = ''
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
            CHANGE @SM TO '.' IN CEC.OUTWARD.FILES.ID
         END ELSE CEC.OUTWARD.FILES.ID = Y.PROCESS.DATE
         GOSUB READ.CEC.OUTWARD.FILES.FILE
      END 

      R.CEC.OUTWARD.FILES<CEC.OCF.CENTER.ID> = NEXT.CENTER.ID 

      YR.CEC.MSG.CONCAT.ID = '' 
      LOCATE 'MNEW' IN CEC.IDS<1,1> SETTING FIL THEN
         YR.CEC.MSG.CONCAT.ID = CEC.IDS<3,FIL>
         CHANGE @SM TO '\' IN YR.CEC.MSG.CONCAT.ID
      END 
      IF YR.CEC.MSG.CONCAT.ID EQ '' THEN
         LOG.LEVEL = '2' ; LOG.MESSAGE = 'EB-CEC.MISSING.MSG.ID':@FM:Y.REMIT.NUM
         CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
         GOSUB UPDATE.LOG.FILE
         SW.SKIP = 'Y'
         RETURN
      END

      GOSUB CREATE.MSG.CONCAT.FILE

      R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,Y.REMIT.NUM> = YR.CEC.MSG.CONCAT.ID

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
           * R.MSGC<1> = CEC.OUTWARD.FILES.ID
           * R.MSGC<2> = Y.REMIT.NUM
		   R.MSGC<CEC.MSGC.FILE.ID> = CEC.OUTWARD.FILES.ID
		   R.MSGC<CEC.MSGC.MULTI.VALUE> = Y.REMIT.NUM
         END ELSE
            LOG.LEVEL = '' ; LOG.MESSAGE = 'EB-CEC.ALREADY.MSG.ID':@FM:Y.REMIT.NUM
            CALL LOT.TRANSLATE.ERROR(LOG.MESSAGE,LOG.LEVEL)
            GOSUB UPDATE.LOG.FILE
            LOCATE CEC.OUTWARD.FILES.ID IN R.MSGC<1,1> SETTING ALI ELSE
               NB.SIMILAR = DCOUNT(R.MSGC<1>,@VM)
			   R.MSGC<1,NB.SIMILAR+1> = CEC.OUTWARD.FILES.ID
			   R.MSGC<2,NB.SIMILAR+1> = Y.REMIT.NUM
               R.MSGC<CEC.MSGC.FILE.ID,NB.SIMILAR+1> = CEC.OUTWARD.FILES.ID
               R.MSGC<CEC.MSGC.MULTI.VALUE,NB.SIMILAR+1> = Y.REMIT.NUM
            END
         END
         CALL F.WRITE(CEC.MSG.CONCAT.FILE,YR.MSGC.ID,R.MSGC)
      END

      RETURN

***********************************************************************
READ.CODE.LAYOUT:
***********************************************************************

      LAST.LAYOUT.ID = NEXT.LAYOUT.ID
      NEXT.OPCODE = APPL.CODE

*     Extraction du format du message

      ACT.DAT.RECORD = ''
      CALL Y.LOAD.CEC.LAYOUT('OUTWARD','','',NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,LOG.MESSAGE)
      IF LOG.MESSAGE THEN
         LOG.LEVEL = '2' ; GOSUB UPDATE.LOG.FILE
         SW.UNKNOWN.MESSAGE = 'Y'
         SW.SKIP = 'Y'
         RETURN
      END

      RETURN

***********************************************************************
UPDATE.REFERENCE:
***********************************************************************

      CHANGE ',' TO @FM IN L.KEY.RANK
	  Y.KEY.DCNT = DCOUNT(L.KEY.RANK,@FM)
      FOR IRQ = 1 TO Y.KEY.DCNT
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
                CEC.IDS<1> :=@VM:L.KEY.PREFIX
                CEC.IDS<2> :=@VM:L.KEY.SUFFIX
                CEC.IDS<3> :=@VM:L.KEY.DATA
             END
          END
      NEXT IRQ

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
      IF LEN(REGION) EQ 2 THEN REGION = REGION:'00'

      JNL.ID = Y.PROCESS.DATE

      TAPE.FILE.NAME = "FT.IN.TAPE" ; FT.IN.TAPE = ''

      IF R.SPF.SYSTEM<SPF.OPERATING.SYSTEM>[1,4] EQ 'UNIX' THEN SW.UNIX = 'Y' ELSE SW.UNIX = 'N'

      CEC.OUTWARD.CONCAT.FILE = 'F.CEC.OUTWARD.CONCAT'
      F.CEC.OUTWARD.CONCAT = ''
      CALL OPF(CEC.OUTWARD.CONCAT.FILE, F.CEC.OUTWARD.CONCAT)

      CEC.OUTWARD.LOG.FILE = 'F.CEC.OUTWARD.LOG'
      F.CEC.OUTWARD.LOG = ''
      CALL OPF(CEC.OUTWARD.LOG.FILE, F.CEC.OUTWARD.LOG)

      CEC.OUTWARD.FILES.FILE = 'F.CEC.OUTWARD.FILES'
      F.CEC.OUTWARD.FILES = ''
      CALL OPF(CEC.OUTWARD.FILES.FILE, F.CEC.OUTWARD.FILES)

      CEC.OUTWARD.PENDING.FILE = 'F.CEC.OUTWARD.PENDING'
      F.CEC.OUTWARD.PENDING = ''
      CALL OPF(CEC.OUTWARD.PENDING.FILE, F.CEC.OUTWARD.PENDING)

      CEC.MSG.CONCAT.FILE = 'F.CEC.MSG.CONCAT'
      F.CEC.MSG.CONCAT = ''
      CALL OPF(CEC.MSG.CONCAT.FILE, F.CEC.MSG.CONCAT)
      YR.MSGC.ID = '' ; R.MSGC = ''

      CALL Y.LOAD.CECPAR(LOG.MESSAGE)
      IF LOG.MESSAGE THEN RETURN

      CALL Y.LOAD.CECDEF
      CLEAR.CCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.CEC.PARAMETER<CEC.PAR.CLEAR.CCY.MARKET>
      CALL Y.CLEAR.CECFMT
      CALL Y.CLEAR.CECOCF
      CALL Y.CLEAR.CECREC

      PENDING.DATE = R.DATES(EB.DAT.TODAY)
      LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING OUT.POS THEN

*        Calculate the date that decides on the pending of a remit

         NB.PENDING.DAYS = R.CEC.PARAMETER<CEC.PAR.PENDING.DAYS,OUT.POS>
         ADV.DAYS = ''
         IF NB.PENDING.DAYS NE '0' THEN
            BEGIN CASE
               CASE NB.PENDING.DAYS MATCH "0N'W'"
                  ADV.DAYS = FIELD(NB.PENDING.DAYS,"W",1)
                  ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'W'
               CASE NB.PENDING.DAYS MATCH "0N'C'"
                  ADV.DAYS = FIELD(NB.PENDING.DAYS,"C",1)
                  ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
               CASE NB.PENDING.DAYS MATCH "0N"
                  ADV.DAYS = NB.PENDING.DAYS
                  ADV.DAYS = FMT(ADV.DAYS,'3"0"R'):'C'
            END CASE
            IF ADV.DAYS THEN CALL CEC.CDT(REGION,PENDING.DATE,ADV.DAYS)
         END
      END

      CALL Y.LOAD.CECREHN(N.NULL.HEADER.LIST,'')

      RETURN

***********************************************************************
READ.CEC.OUTWARD.FILES.FILE:
***********************************************************************

      CALL F.READ(CEC.OUTWARD.FILES.FILE,CEC.OUTWARD.FILES.ID,R.CEC.OUT.FILES,F.CEC.OUTWARD.FILES,ER)
*     IF NOT(ER) THEN
         SELECT.COMMAND = 'SELECT ':CEC.OUTWARD.FILES.FILE:' WITH FILE.NAME LIKE ':FILE.IDENT:PINTAPE:'... BY FILE.NAME'
         AE.ID.LIST = '' ; NO.SELECTED = ''
         CALL EB.READLIST(SELECT.COMMAND,AE.ID.LIST,'',NO.SELECTED,'')
         IF AE.ID.LIST THEN
            GOSUB SORT.AE.ID.LIST
            NB.ALREADY = DCOUNT(SORTED.LIST,@FM)
            IF NB.ALREADY THEN PINTAPE := '.':SORTED.LIST<NB.ALREADY>+1
         END
*     END

      R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME> = FILE.IDENT:PINTAPE
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.DATE> = Y.PROCESS.DATE
      R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.TIME> = Y.PROCESS.TIME

*     For a given presentation date, the concat file store the remit of the same file in the same sub-value

      NB.MV = NB.ALREADY+1

      SW.BRAND.NEW = 1
	  Y.SO.DCNT = DCOUNT(R.SOCC,@VM)
      FOR IUQ = 1 TO Y.SO.DCNT
	  Y.CE.DCNT = DCOUNT(R.SOCC<1,IUQ>,@SM)
         FOR IUZ = 1 TO Y.CE.DCNT 
            IF R.SOCC<1,IUQ,IUZ> EQ CEC.OUTWARD.FILES.ID THEN SW.BRAND.NEW = 0
         NEXT IUZ
      NEXT IUQ
      IF SW.BRAND.NEW THEN R.SOCC<1,NB.MV,-1> = CEC.OUTWARD.FILES.ID

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

*     CALL F.WRITE(CEC.PARAMETER.FILE,ID.COMPANY,R.CEC.PARAMETER)


     IF NOT(PGM.VERSION) AND NOT(RUNNING.UNDER.BATCH) THEN   ; * UPGRADE R13 TO R19
      CALL JOURNAL.UPDATE(CEC.OUTWARD.FILES.ID)
	  END

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

*-----------------------------------------------------------------------

   END
