*
*-----------------------------------------------------------------------------
* <Rating>2292</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Removed JOURNAL.UPDATE.
*                : Converted FM TO @FM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : RELEASE converted to F.RELEASE.
*-----------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE S.CEC.REJECT(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Automatic production of a reject operation to follow up a received original one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.FOLLOW.UP
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.FIELDS
* $INSERT I_COMMON - Not Used anymore;RD
* $INSERT I_EQUATE - Not Used anymore;ARD
$INSERT I_F.CEC.PARAMETER
$INSERT I_CECPAR
$INSERT I_CECFIL
$INSERT I_CECFMT
$INSERT I_NEXT.CECLAY
$INSERT I_ACT.CECLAY

* RECUPERATION DE DONNEES
*
      Y.LIST = '' 

      GOSUB INITIATE.FILES 
      GOSUB PROCESS.EXTRACT

      RETURN
     
****************************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus****
PROCESS.EXTRACT:
**********************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus**********************************   
    
      LOCATE 'REC.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         Y.LIST = 'EB-CEC.MISSING.OPERATION.ID':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END

      ACT.OPCODE = FIELD(ACT.TRANS,".",2)

      YR.CEC.INWARD.ID = ACT.TRANS
      GOSUB READ.CEC.INWARD.FILE
      IF ER THEN
         Y.LIST = 'EB-CEC.MISSING.IN.OPERATION':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END
      ACT.DAT.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC>
      ACT.OPCODE = R.CEC.INWARD<CEC.IC.APPLICATION.CODE>
      R.ACT.HISTORY = R.CEC.INWARD<CEC.IC.HIST.OPE.ID>

      NEXT.OPCODE = '' ; NEXT.SUBCODE = ''
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,E)
      IF E EQ '' THEN
         CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',E)
         IF E NE '' THEN Y.LIST = E:'[[[' ; E = '' ; RETURN
      ENDEB.DataAccess.OpfSE Y.LIST = E:'[[[' ; E = '' ; RETURN

      LEB.DataAccess.OpfTE 'REJ' IN N.NEXT<1> SETTING IJK THEN
         ALREADY.DONE = ''
		 Y.DCNT = DCOUNT(R.ACT.HISTORY,@VM)
         FOR IHA = 1 TO Y.DCNT 
            HIST.OEB.SystemTables.getRNew(T.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefISTORY<1,IHA>,".",3)
            HIST.WAY = FIELD(R.ACT.HISTORY<1,IHA>,".",1)
         EB.DataAccess.FReadHIST.OPCODE EQ N.NEXT<2,IJK>[1,3] AND HIST.WAY EQ N.NEXT<5,IJK>[1,1] THEN
               ALREADY.DONE = R.ACT.HISTORY<1,IHA>
               IF HIST.WAY[1,1] EQ 'O' THEN
                  YR.CEC.OUTWARD.ID = FIELD(ALREADY.DONE,".",2,99)
                  GOSUB READEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
                  IF R.CEC.OUTWARD<CEC.OC.GENERATED.BY> MATCH "'CFU'5N0X" THEN
            EB.SystemTables.setE(R.CEC.OUTWARD<CEC.OC.GENERATED.BY>)
                  END
               END EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerIT
            END
EB.DataAccess.FWrite  NEXT IHA
         ALREADY.EXIST = ''
         IF ALREADY.DONE EQ '' THEN
        EB.SystemTables.setAf()*
*-----------------------------------------------------------------------------
* <Rating>2292</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Removed JOURNAL.UPDATE.
*                : Converted FM TO @FM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : RELEASE converted to F.RELEASE.
*-----------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE S.CEC.REJECT(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Automatic production of a reject operation to follow up a received original one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.FOLLOW.UP
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.FIELDS
$INSERT I_F.CEC.INWARD
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.PARAMETER
$INSERT I_CECPAR
$INSERT I_CECFIL
$INSERT I_CECFMT
$INSERT I_NEXT.CECLAY
$INSERT I_ACT.CECLAY

* RECUPERATION DE DONNEES
*
      Y.LIST = '' 

      GOSUB INITIATE.FILES 
      GOSUB PROCESS.EXTRACT

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   
    
      LOCATE 'REC.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         Y.LIST = 'EB-CEC.MISSING.OPERATION.ID':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END

      ACT.OPCODE = FIELD(ACT.TRANS,".",2)

      YR.CEC.INWARD.ID = ACT.TRANS
      GOSUB READ.CEC.INWARD.FILE
      IF ER THEN
         Y.LIST = 'EB-CEC.MISSING.IN.OPERATION':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END
      ACT.DAT.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC>
      ACT.OPCODE = R.CEC.INWARD<CEC.IC.APPLICATION.CODE>
      R.ACT.HISTORY = R.CEC.INWARD<CEC.IC.HIST.OPE.ID>

      NEXT.OPCODE = '' ; NEXT.SUBCODE = ''
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,E)
      IF E EQ '' THEN
         CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',E)
         IF E NE '' THEN Y.LIST = E:'[[[' ; E = '' ; RETURN
      END ELSE Y.LIST = E:'[[[' ; E = '' ; RETURN

      LOCATE 'REJ' IN N.NEXT<1> SETTING IJK THEN
         ALREADY.DONE = ''
		 Y.DCNT = DCOUNT(R.ACT.HISTORY,@VM)
         FOR IHA = 1 TO Y.DCNT 
            HIST.OPCODE = FIELD(R.ACT.HISTORY<1,IHA>,".",3)
            HIST.WAY = FIELD(R.ACT.HISTORY<1,IHA>,".",1)
            IF HIST.OPCODE EQ N.NEXT<2,IJK>[1,3] AND HIST.WAY EQ N.NEXT<5,IJK>[1,1] THEN
               ALREADY.DONE = R.ACT.HISTORY<1,IHA>
               IF HIST.WAY[1,1] EQ 'O' THEN
                  YR.CEC.OUTWARD.ID = FIELD(ALREADY.DONE,".",2,99)
                  GOSUB READ.CEC.OUTWARD.FILE
                  IF R.CEC.OUTWARD<CEC.OC.GENERATED.BY> MATCH "'CFU'5N0X" THEN
                     ALREADY.DONE = R.CEC.OUTWARD<CEC.OC.GENERATED.BY>
                  END
               END 
               EXIT
            END
         NEXT IHA
         ALREADY.EXIST = ''
         IF ALREADY.DONE EQ '' THEN
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
        EB.SystemTables.setE()*
*-----------------------------------------------------------------------------
* <Rating>2292</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Removed JOURNAL.UPDATE.
*                : Converted FM TO @FM.
*                : DCOUNT assigned to varialbe for FOR loop.
*                : RELEASE converted to F.RELEASE.
*-----------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE S.CEC.REJECT(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Automatic production of a reject operation to follow up a received original one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.FOLLOW.UP
$INSERT I_F.CEC.LAYOUT
$INSERT I_F.CEC.FIELDS
$INSERT I_F.CEC.INWARD
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.PARAMETER
$INSERT I_CECPAR
$INSERT I_CECFIL
$INSERT I_CECFMT
$INSERT I_NEXT.CECLAY
$INSERT I_ACT.CECLAY

* RECUPERATION DE DONNEES
*
      Y.LIST = '' 

      GOSUB INITIATE.FILES 
      GOSUB PROCESS.EXTRACT

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   
    
      LOCATE 'REC.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         Y.LIST = 'EB-CEC.MISSING.OPERATION.ID':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END

      ACT.OPCODE = FIELD(ACT.TRANS,".",2)

      YR.CEC.INWARD.ID = ACT.TRANS
      GOSUB READ.CEC.INWARD.FILE
      IF ER THEN
         Y.LIST = 'EB-CEC.MISSING.IN.OPERATION':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END
      ACT.DAT.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC>
      ACT.OPCODE = R.CEC.INWARD<CEC.IC.APPLICATION.CODE>
      R.ACT.HISTORY = R.CEC.INWARD<CEC.IC.HIST.OPE.ID>

      NEXT.OPCODE = '' ; NEXT.SUBCODE = ''
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,E)
      IF E EQ '' THEN
         CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',E)
         IF E NE '' THEN Y.LIST = E:'[[[' ; E = '' ; RETURN
      END ELSE Y.LIST = E:'[[[' ; E = '' ; RETURN

      LOCATE 'REJ' IN N.NEXT<1> SETTING IJK THEN
         ALREADY.DONE = ''
		 Y.DCNT = DCOUNT(R.ACT.HISTORY,@VM)
         FOR IHA = 1 TO Y.DCNT 
            HIST.OPCODE = FIELD(R.ACT.HISTORY<1,IHA>,".",3)
            HIST.WAY = FIELD(R.ACT.HISTORY<1,IHA>,".",1)
            IF HIST.OPCODE EQ N.NEXT<2,IJK>[1,3] AND HIST.WAY EQ N.NEXT<5,IJK>[1,1] THEN
               ALREADY.DONE = R.ACT.HISTORY<1,IHA>
               IF HIST.WAY[1,1] EQ 'O' THEN
                  YR.CEC.OUTWARD.ID = FIELD(ALREADY.DONE,".",2,99)
                  GOSUB READ.CEC.OUTWARD.FILE
                  IF R.CEC.OUTWARD<CEC.OC.GENERATED.BY> MATCH "'CFU'5N0X" THEN
                     ALREADY.DONE = R.CEC.OUTWARD<CEC.OC.GENERATED.BY>
                  END
               END 
               EXIT
            END
         NEXT IHA
         ALREADY.EXIST = ''
         IF ALREADY.DONE EQ '' THEN
            INWARD.FUP = R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
            IF R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID> THEN
               CALL Y.CEC.READ.APPLICATION(R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>,FUP.REC,N.STATUS,N.FILE,N.ERR)
               IF FUP.REC THEN
                  BEGIN CASE
                     CASE N.FILE EQ '$HIS'
                        IF N.STATUS EQ 'REVE' ELSE ALREADY.DONE = R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
                     CASE N.FILE EQ '$NAU'
                        ALREADY.EXIST = R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
                     CASE N.FILE EQ ''
                        IF N.STATUS EQ '' THEN ALREADY.DONE = R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
                  END CASE
               END
            END
         END
         IF ALREADY.DONE EQ '' AND ALREADY.EXIST EQ '' THEN
            KEY1.LIST = '' ; IE = 0 
            RSTATEMENT = "SELECT ":FN.FUP:' BY.DSND WITH INITIAL.CLEAR.ID EQ ':ACT.TRANS:' AND APPLYING.ON EQ "INWARD"'
            CALL EB.READLIST(RSTATEMENT,KEY1.LIST,'','','')

*           Find any unprocessed generated FUP 

            LOOP
               REMOVE FUP.ID FROM KEY1.LIST SETTING POINT1
            WHILE FUP.ID:POINT1
               GOSUB READ.FUP.FILE
               IF NOT(ER) THEN
                  IF IE EQ 1 THEN
                     ALREADY.EXIST = FUP.ID
                  END ELSE
                     CALL F.DELETE(FN.FUP,FUP.ID)
                  END
               END
            REPEAT
         END
         IF ALREADY.DONE THEN
            CALLID = 'EB-CEC.ALREADY.DONE.BY'
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            Y.LIST = CALLID:'[':N.NEXT<4,IJK>:'[S[':ALREADY.DONE  
         END ELSE
            IF ALREADY.EXIST THEN
               MAT R.NEW = '' ; ER = ''
               CALL F.MATREAD(FN.FUP,ALREADY.EXIST,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
               CALLID = 'EB-CEC.ALREADY.STARTED.BY'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               Y.LIST = CALLID:'[':N.NEXT<4,IJK>:'[I[':ALREADY.EXIST
            END ELSE
               CALLID = ''
               CALL Y.CEC.FUP.FROM.SCRATCH(CALLID,N.ERR)
               IF N.ERR THEN
                  CALLID = 'EB-CEC.TO.BE.REINITIATED'
                  CALL LOT.TRANSLATE.ERROR(CALLID,'')
                  Y.LIST = CALLID:'[[[['
               END ELSE
                  IF RUNNING.UNDER.BATCH OR PGM.VERSION ELSE CALL JOURNAL.UPDATE(CALLID)
                  ID.NEW = CALLID
                  MAT R.NEW = '' ; ER = ''
                  CALL F.MATREAD(FN.FUP,ID.NEW,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
                  IF NOT(ER) THEN
                     R.NEW(CEC.FUP.APPLYING.ON) = APPLYING.ON
                     R.NEW(CEC.FUP.INITIAL.CLEAR.ID) = ACT.TRANS
                     CALL F.MATWRITE(FN.FUP,ID.NEW,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME)
                     IF RUNNING.UNDER.BATCH OR PGM.VERSION ELSE CALL JOURNAL.UPDATE(CALLID)
                     CALLID = 'EB-CEC.TO.BE.CODED'
                     CALL LOT.TRANSLATE.ERROR(CALLID,'') 
                     Y.LIST = CALLID:'[':N.NEXT<4,IJK>:'[I[':ID.NEW  
                  END ELSE
                  *  IF ID.NEW THEN RELEASE FP.FUP,ID.NEW ; *CALL JOURNAL.UPDATE(ID.NEW)
					 IF ID.NEW THEN CALL F.RELEASE(FN.FUP,ID.NEW,FP.FUP) ;*RELEASE converted to F.RELEASE.
                     CALLID = 'EB-CEC.TO.BE.REINITIATED'
                     CALL LOT.TRANSLATE.ERROR(CALLID,'') 
                     Y.LIST = CALLID:'[':N.NEXT<4,IJK>:'[I[':ID.NEW  
                  END
               END
            END
         END
      END ELSE
         CALLID = 'EB-CEC.REJECT.NOT.ALLOWED'
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         Y.LIST = CALLID:'[[['
      END

      RETURN

*************************************************************************
READ.FUP.FILE:
*************************************************************************

      ER = '' ; R.FUP = ''
      CALL F.READ(FN.FUP,FUP.ID,R.FUP,FP.FUP,ER)

      RETURN

*************************************************************************
READ.CEC.INWARD.FILE:
*************************************************************************

      ER = '' ; R.CEC.INWARD = ''
      CALL F.READ(CEC.INWARD.FILE,YR.CEC.INWARD.ID,R.CEC.INWARD,F.CEC.INWARD,ER)

      RETURN

*************************************************************************
READ.CEC.OUTWARD.FILE:
*************************************************************************

      ER = '' ; R.CEC.OUTWARD = ''
      CALL F.READ(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD,F.CEC.OUTWARD,ER)

      RETURN
      
*************************************************************************
INITIATE.FILES:
*************************************************************************

      E = '' ; TEXT = '' ; ETEXT = ''

      REGION = R.COMPANY(EB.COM.LOCAL.COUNTRY):R.COMPANY(EB.COM.LOCAL.REGION)
      IF LEN(REGION) EQ 2 THEN REGION = REGION:'00'

      NB.WRITE = 0

      CALL Y.LOAD.CECPAR(N.ERR)

      CALL Y.CLEAR.CECFMT
      CALL Y.LOAD.CECDEF

      CEC.INWARD.FILE = 'F.CEC.INWARD'
      F.CEC.INWARD = ''
      CALL OPF(CEC.INWARD.FILE, F.CEC.INWARD)
      YR.CEC.INWARD.ID = '' ; R.CEC.INWARD = ''

      CEC.OUTWARD.FILE = 'F.CEC.OUTWARD'
      F.CEC.OUTWARD = ''
      CALL OPF(CEC.OUTWARD.FILE, F.CEC.OUTWARD)
      YR.CEC.OUTWARD.ID = '' ; R.CEC.OUTWARD = ''

      FN.FUP = 'F.CEC.FOLLOW.UP$NAU' ; FP.FUP = ''
      CALL OPF(FN.FUP, FP.FUP)     
      
      RETURN
           
*************************************************************************
END         
