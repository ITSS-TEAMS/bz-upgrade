*-----------------------------------------------------------------------------
* <Rating>1719</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CREATE.OUTWARD.FILE(LAST.HEADER.ID,N.ERR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*ZIT_UPG_R13_TO_R19    : Changed Arithematic operators TO T24 operators
*                      : INITIALISE VARIBALE for Dcount in FOR loop 
*                      : Changed FM, VM, SM TO @FM, @VM,@SM; !HUSHIT CHANGED TO HUSHIT
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.HEADER
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECREC
$INSERT I_CECPAR
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_CECLOC
$INSERT I_CECFOU

*---- Main processing section ----

      GOSUB INITIALISE
    IF N.ERR EQ '' THEN  GOSUB PROCESS ;*changed Arithematic operators

      RETURN

********EB.SystemTables.getVFunction()*************EB.SystemTables.getVFunction()************EB.SystemTables.getRNew()*FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCESS:
***************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus***************

      N.FILE.NAME = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME>

      SAVE.PINTAPE = PINTAPE

      FILE.HEADER = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>

      ETEXT = ''

      RTN.ID = TRIM(FIELD(R.NEXT.SUH<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
      IF RTN.ID THEN
         SAVE.COMI = COMI
         COMI = LAST.HEADER.ID
         CALL @RTN.ID
         PRE.HEADER.DEF = COMI
         COMI = SAVE.COMI
        IF PRE.HEADER.DEF NE '' THEN R.OUTPUT.RECORD.COMMIT<-1> = PRE.HEADER.DEF ;*Changed
    END

    IF ETEXT THEN N.ERR = ETEXT ; ETEXT = ''

    IF N.ERR EQ '' THEN
      
        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> NE '' THEN   ;*changed
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>
         END
        EB.DataAccess.Opf       EB.DataAccess.OpfUB PROCESS.THE.REMITS


        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER> NE '' THEN  ;*changed
         
            R.OUTPEB.SystemTables.getRNew()CFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef= R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER>
         END

       EB.DataAccess.FReadID = TRIM(FIELD(R.NEXT.SUT<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
         IF RTN.ID THEN
            SAVE.COMI = COMI
            COMI = ''
     EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerD
            EB.SystemTables.setE(COMI)
            COMI = SAVE.COMI

            IF POSEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer' THEN R.OUTPUT.RECORD.COMMIT<-1> = POST.TRAILER.DEF ;*changed
         END

EB.DataAccess.FWrite  IF ETEXT EQ '' THEN GOSUB WRITE.OUTPUT.RECORD ELSE ETEXT = ''  ;* changed

      EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1719</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CREATE.OUTWARD.FILE(LAST.HEADER.ID,N.ERR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*ZIT_UPG_R13_TO_R19    : Changed Arithematic operators TO T24 operators
*                      : INITIALISE VARIBALE for Dcount in FOR loop 
*                      : Changed FM, VM, SM TO @FM, @VM,@SM; !HUSHIT CHANGED TO HUSHIT
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.HEADER
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECREC
$INSERT I_CECPAR
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_CECLOC
$INSERT I_CECFOU

*---- Main processing section ----

      GOSUB INITIALISE
    IF N.ERR EQ '' THEN  GOSUB PROCESS ;*changed Arithematic operators

      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      N.FILE.NAME = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME>

      SAVE.PINTAPE = PINTAPE

      FILE.HEADER = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>

      ETEXT = ''

      RTN.ID = TRIM(FIELD(R.NEXT.SUH<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
      IF RTN.ID THEN
         SAVE.COMI = COMI
         COMI = LAST.HEADER.ID
         CALL @RTN.ID
         PRE.HEADER.DEF = COMI
         COMI = SAVE.COMI
        IF PRE.HEADER.DEF NE '' THEN R.OUTPUT.RECORD.COMMIT<-1> = PRE.HEADER.DEF ;*Changed
    END

    IF ETEXT THEN N.ERR = ETEXT ; ETEXT = ''

    IF N.ERR EQ '' THEN
      
        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> NE '' THEN   ;*changed
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>
         END
        
         GOSUB PROCESS.THE.REMITS


        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER> NE '' THEN  ;*changed
         
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER>
         END

         RTN.ID = TRIM(FIELD(R.NEXT.SUT<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
         IF RTN.ID THEN
            SAVE.COMI = COMI
            COMI = ''
            CALL @RTN.ID
            POST.TRAILER.DEF = COMI
            COMI = SAVE.COMI

            IF POST.TRAILER.DEF NE '' THEN R.OUTPUT.RECORD.COMMIT<-1> = POST.TRAILER.DEF ;*changed
         END


        IF ETEXT EQ '' THEN GOSUB WRITE.OUTPUT.RECORD ELSE ETEXT = ''  ;* changed

      ENEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>1719</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.CREATE.OUTWARD.FILE(LAST.HEADER.ID,N.ERR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*ZIT_UPG_R13_TO_R19    : Changed Arithematic operators TO T24 operators
*                      : INITIALISE VARIBALE for Dcount in FOR loop 
*                      : Changed FM, VM, SM TO @FM, @VM,@SM; !HUSHIT CHANGED TO HUSHIT
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.HEADER
$INSERT I_CECSUH
$INSERT I_CECREH
$INSERT I_CECRET
$INSERT I_CECSUT
$INSERT I_CECREC
$INSERT I_CECPAR
$INSERT I_CECOUT
$INSERT I_CECOCF
$INSERT I_CECOC
$INSERT I_CECLOC
$INSERT I_CECFOU

*---- Main processing section ----

      GOSUB INITIALISE
    IF N.ERR EQ '' THEN  GOSUB PROCESS ;*changed Arithematic operators

      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      N.FILE.NAME = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME>

      SAVE.PINTAPE = PINTAPE

      FILE.HEADER = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>

      ETEXT = ''

      RTN.ID = TRIM(FIELD(R.NEXT.SUH<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
      IF RTN.ID THEN
         SAVE.COMI = COMI
         COMI = LAST.HEADER.ID
         CALL @RTN.ID
         PRE.HEADER.DEF = COMI
         COMI = SAVE.COMI
        IF PRE.HEADER.DEF NE '' THEN R.OUTPUT.RECORD.COMMIT<-1> = PRE.HEADER.DEF ;*Changed
    END

    IF ETEXT THEN N.ERR = ETEXT ; ETEXT = ''

    IF N.ERR EQ '' THEN
      
        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> NE '' THEN   ;*changed
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>
         END
        
         GOSUB PROCESS.THE.REMITS


        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER> NE '' THEN  ;*changed
         
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER>
         END

         RTN.ID = TRIM(FIELD(R.NEXT.SUT<CEC.HEA.VALIDATE.FILE.RTN>,"@",2))
         IF RTN.ID THEN
            SAVE.COMI = COMI
            COMI = ''
            CALL @RTN.ID
            POST.TRAILER.DEF = COMI
            COMI = SAVE.COMI

            IF POST.TRAILER.DEF NE '' THEN R.OUTPUT.RECORD.COMMIT<-1> = POST.TRAILER.DEF ;*changed
         END


        IF ETEXT EQ '' THEN GOSUB WRITE.OUTPUT.RECORD ELSE ETEXT = ''  ;* changed

      END

      CLOSESEQ UNFORM.FILE


    IF R.OUTPUT.RECORD.COMMIT NE '' THEN    ;*changed

         EXECUTE$CMD2 = "COPY FROM FT.IN.TAPE TO ":DIR.IDENT:" ":UNFORM.FILE.ID:",":FILE.IDENT:PINTAPE:" OVERWRITING DELETING"
 *        CALL !HUSHIT(1)  ;*REMOVED !
		 CALL HUSHIT(1)
         EXECUTE EXECUTE$CMD2 RETURNING RETVAR
*         CALL !HUSHIT(0)
         CALL HUSHIT(0)  ;*REMOVED !
         SW.OKAY = 0
         
*         FOR IIW = 1 TO DCOUNT(RETVAR,FM)
        Y.RETVAR = DCOUNT(RETVAR,@FM)   ;*changed
        FOR IIW = 1 TO Y.RETVAR      ;*changed
            LOCATE '1' IN RETVAR<IIW,1> SETTING GOOD THEN SW.OKAY = 1 ; EXIT
         NEXT IIW

        IF SW.OKAY EQ 0 THEN
         
            MSG.ERR = 'EB-CEC.FAILED.FILE.COPY':@FM:FILE.IDENT:PINTAPE
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            N.ERR = MSG.ERR
         END

         R.OUTPUT.RECORD.COMMIT = ''

      END

      RETURN

***********************************************************************
PROCESS.THE.REMITS:
***********************************************************************

*      FOR IJL = 1 TO DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER>,VM)
    Y.REM.HEADER = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER>,@VM)   ;*changed
    FOR IJL = 1 TO Y.REM.HEADER       ;*changed
         IESL = 0

        IF R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,IJL> NE '' THEN  ;*changed
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,IJL>
         END
         YR.CEC.MSG.CONCAT.ID = R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,IJL>
         NB.ELEM = COUNT(R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,IJL>,'\') + 1

        IF NB.ELEM EQ 1
            THEN LOTNUM.VALUE = R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,IJL>
            ELSE LOTNUM.VALUE = FIELD(R.CEC.OUTWARD.FILES<CEC.OCF.MESSAGE.ID,IJL>,'\',NB.ELEM)
            
*        FOR IJP = 1 TO DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL>,SM)
        Y.TRANS.LAST = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL>,@SM) ;*changed
        FOR IJP = 1 TO Y.TRANS.LAST ;*changed
    
            REM.CODE.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,IJL,IJP>
            REM.FIRST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,IJL,IJP>
            REM.LAST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL,IJP>
            FOR IJZ = REM.FIRST.ID TO REM.LAST.ID
               PROCESSING.DATE = FIELD(SAVE.PINTAPE,"-",1)
               PROCESSING.DATE = FIELD(PROCESSING.DATE,".",1)
               YR.CEC.OUTWARD.ID = PROCESSING.DATE:'.':REM.CODE.ID[1,3]:'.':FMT(IJZ,SEQ.FORMAT)
               ER = '' ; R.CEC.OUTWARD = ''
               CALL F.READ(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD,F.CEC.OUTWARD,ER)
               IF NOT(ER) THEN
                  IESL += 1
                  NEXT.DAT.RECORD = R.CEC.OUTWARD<CEC.OC.OUTWARD.REC>
                    ALL.FIELDS.ID = 'SEQNUM':@FM:'LOTNUM'
                    ALL.FIELD.DATA = IESL:@FM:LOTNUM.VALUE
                  CALL Y.INSERT.CEC.FIELD('NEXT','DAT',ALL.FIELDS.ID,ALL.FIELD.DATA,N.ERR)
                  R.CEC.OUTWARD<CEC.OC.OUTWARD.REC> = NEXT.DAT.RECORD
                  R.CEC.OUTWARD<CEC.OC.CREATION.DATE> = Y.PROCESS.DATE
                  R.CEC.OUTWARD<CEC.OC.CREATION.TIME> = Y.PROCESS.TIME
                  R.CEC.OUTWARD<CEC.OC.HIST.MSG.ID,1> = YR.CEC.MSG.CONCAT.ID
                  CALL F.WRITE(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD)

                    IF MOD(IESL,COMMIT.NUMBER) EQ 0 THEN
                     IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(JNL.ID)
                  END
*                 FOR IWY = 1 TO DCOUNT(R.CEC.OUTWARD<CEC.OC.OUTWARD.REC>,VM)
*                    FOR IWW = 1 TO DCOUNT(R.CEC.OUTWARD<CEC.OC.OUTWARD.REC,IWY>,SM)
 
                    Y.OUTWARD.REC.VM =  DCOUNT(R.CEC.OUTWARD<CEC.OC.OUTWARD.REC>,@VM)       ;* changed
                    Y.OUTWARD.REC.SM = DCOUNT(R.CEC.OUTWARD<CEC.OC.OUTWARD.REC,IWY>,@SM)     ;*changed
                    FOR IWY = 1 TO Y.OUTWARD.REC.VM                                         ;*changed
                        FOR IWW = 1 TO Y.OUTWARD.REC.SM                                         ;*changed
                            IF R.CEC.OUTWARD<CEC.OC.OUTWARD.REC,IWY,IWW> NE '' THEN
                           R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD<CEC.OC.OUTWARD.REC,IWY,IWW>
                        END
                     NEXT IWW
                  NEXT IWY
               END 
            NEXT IJZ
         NEXT IJP

        IF R.CEC.OUTWARD.FILES<CEC.OCF.REM.TRAILER,IJL> NE '' THEN
            R.OUTPUT.RECORD.COMMIT<-1> = R.CEC.OUTWARD.FILES<CEC.OCF.REM.TRAILER,IJL>
         END
      NEXT IJL

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      N.ERR = '' 

      TAPE.FILE.NAME = "FT.IN.TAPE" ; FT.IN.TAPE = ''

      LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING POS THEN
         SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,POS>:'"0"':"R"
         COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,POS>
      END ELSE COMMIT.NUMBER = 1

      CEC.OUTWARD.FILE = 'F.CEC.OUTWARD'
      F.CEC.OUTWARD = ''
      CALL OPF(CEC.OUTWARD.FILE, F.CEC.OUTWARD)
      YR.CEC.OUTWARD.ID = '' ; R.CEC.OUTWARD = ''

      GOSUB OPEN.NEW.OUTPUT.FILE

      R.OUTPUT.RECORD.COMMIT = ''
 
RETURN

***********************************************************************
OPEN.NEW.OUTPUT.FILE:
***********************************************************************

*     OPEN "",TAPE.FILE.NAME TO F.TAPE.FILE.NAME ELSE STOP

      OPENSEQ TAPE.FILE.NAME,UNFORM.FILE.ID TO UNFORM.FILE THEN
        IF SW.RECOVERY EQ 'Y' THEN   ;*changed
            LOOP
               READSEQ R.OUTPUT.EDIT FROM UNFORM.FILE ELSE R.OUTPUT.EDIT = ''
            UNTIL R.OUTPUT.EDIT = ''
            REPEAT
         END
      END ELSE
         CREATE UNFORM.FILE ELSE
            MSG.ERR = 'EB-CEC.FAILED.FILE.CREATE':@FM:UNFORM.FILE.ID
            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
            N.ERR = MSG.ERR 
         END
      END

      RETURN

********************
WRITE.OUTPUT.RECORD:
********************

*     WRITE R.OUTPUT.RECORD.COMMIT TO F.TAPE.FILE.NAME,UNFORM.FILE.ID

    NB.ORC = DCOUNT(R.OUTPUT.RECORD.COMMIT,@FM)
      FOR IRC = 1 TO NB.ORC
        CHANGE @SM TO '' IN R.OUTPUT.RECORD.COMMIT<IRC>
         R.OUTPUT.EDIT = R.OUTPUT.RECORD.COMMIT<IRC>
        IF R.OUTPUT.EDIT NE '' THEN
            WRITESEQ R.OUTPUT.EDIT TO UNFORM.FILE ELSE
                MSG.ERR = 'EB-CEC.FAILED.FILE.WRITE':@FM:UNFORM.FILE.ID
               CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
               N.ERR = MSG.ERR 
            END
         END
      NEXT IRC

      RETURN

*-----------------------------------------------------------------------
END
