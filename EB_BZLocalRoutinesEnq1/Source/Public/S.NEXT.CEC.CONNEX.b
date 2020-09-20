*-----------------------------------------------------------------------------
* <Rating>663</Rating>
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: OPERATORS CHANGED TO OPERANDS
*				  FM CHANGED TO @FM
*                 RELEASE TO F.RELEASE
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE S.NEXT.CEC.CONNEX(CALLID)
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

* 2009.11.14 Release the CEC.FOLLOW.UP$NAU whenever locked 

* $INSERT I_EQUATE - Not Used anymore;D.POS = 0

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;given at the end of the header first line
*     of the calling nofile ENQUIRY

      LOCATE 'INIT.ID' IN D.FIELDS<1> SETTING ID.POS THEN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;D.VALUE<ID.POS>
      END ELSE
         CALLID = 'EB-CEC.MISSING.PREV.OPERATION'
         CALL LOT.TRANSLATE.ERROR(CALLID,'')
         CALLID := '[' ; RETURN
      END
      ID.POS = 0
      LOCATE 'NEXT.OPCODE' IN D.FIELDS<1> SETTING ID.POS THEN
         NEXT.OPCODE = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
        EB.SystemTables.getVFunction()'EB-CEC.MISSIEB.SystemTables.getVFunction()YOUT'
         CAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusERROR(CALLID,'')
         CALLID = V$FUNCTION : '[' ; RETFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
      N.SUBCODE = '' ; N.OPCODE = FIELD(NEXT.OPCODE,".",2)
      IF NUM(N.OPCODE[1,3]) ELSE
         CALLID = 'EB-CEC.UNKNOWN.OPERATION.CODE':@FM:N.OPCODE
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      IF FIELD(NEXT.OPCODE,".",1) NE 'OUTWARD' THEN
         CALLID = 'EB-CEC.ONLY.FOR.CORRESPONDANT'
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      GOSUB INITIATE.FILES
      ID.POS = 0
      LOCATE 'APPLYING.ON' IN D.FIELDS<1> SETTING ID.POS
         THEN APPLYING.ON = D.RANGE.AND.VALUE<ID.POS>
         ELSE APPLYING.ON = 'INWARD'
         
      ID.POS = 0
      LOCATE 'ALREADY.EXIST' IN D.FIELDS<1> SETTING ID.POS 
         THEN ALREADY.EXIST = D.RANGE.AND.VALUE<ID.POS>
         ELSE ALREADY.EXIST = ''

      IF EB.DataAccess.OpfEADY.EXIST THEN
         EB.DataAccess.OpfALREADY.EXIST MATCH "'CFU'5N0X" THEN
            MAT R.NEW = '' ; ER = ''
            CALL F.MATREAD(FN.FUP,ALREADY.EXIST,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
            IF ER THEN
               CALLID = 'EB-CEC.ALREADY.STARTED.BY'
               CALEB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
         EB.DataAccess.FRead ELSE ;*Operation still unvalidated
               CALLID = 'EB-CEC.TO.BE.VALIDATED'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
            END
         ENEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer  EB.SystemTables.setE('EB-CEC.ALREADY.DONE.BY')
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            CALLID :EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerST  ;EB.SystemTables.getIdNew()N
         END 
      END

    EB.DataAccess.FWriteY.CLEAR.CECFMT
      CALL Y.LOAD.CECDEF
      ACEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>663</Rating>
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: OPERATORS CHANGED TO OPERANDS
*				  FM CHANGED TO @FM
*                 RELEASE TO F.RELEASE
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE S.NEXT.CEC.CONNEX(CALLID)
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

* 2009.11.14 Release the CEC.FOLLOW.UP$NAU whenever locked 

      CALLID = ''; ID.POS = 0

*     The operation code must be given at the end of the header first line
*     of the calling nofile ENQUIRY

      LOCATE 'INIT.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         CALLID = 'EB-CEC.MISSING.PREV.OPERATION'
         CALL LOT.TRANSLATE.ERROR(CALLID,'')
         CALLID := '[' ; RETURN
      END
      ID.POS = 0
      LOCATE 'NEXT.OPCODE' IN D.FIELDS<1> SETTING ID.POS THEN
         NEXT.OPCODE = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         CALLID = 'EB-CEC.MISSING.NEXT.LAYOUT'
         CALL LOT.TRANSLATE.ERROR(CALLID,'')
         CALLID := '[' ; RETURN
      END

      N.SUBCODE = '' ; N.OPCODE = FIELD(NEXT.OPCODE,".",2)
      IF NUM(N.OPCODE[1,3]) ELSE
         CALLID = 'EB-CEC.UNKNOWN.OPERATION.CODE':@FM:N.OPCODE
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      IF FIELD(NEXT.OPCODE,".",1) NE 'OUTWARD' THEN
         CALLID = 'EB-CEC.ONLY.FOR.CORRESPONDANT'
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      GOSUB INITIATE.FILES
      ID.POS = 0
      LOCATE 'APPLYING.ON' IN D.FIELDS<1> SETTING ID.POS
         THEN APPLYING.ON = D.RANGE.AND.VALUE<ID.POS>
         ELSE APPLYING.ON = 'INWARD'
         
      ID.POS = 0
      LOCATE 'ALREADY.EXIST' IN D.FIELDS<1> SETTING ID.POS 
         THEN ALREADY.EXIST = D.RANGE.AND.VALUE<ID.POS>
         ELSE ALREADY.EXIST = ''

      IF ALREADY.EXIST THEN
         IF ALREADY.EXIST MATCH "'CFU'5N0X" THEN
            MAT R.NEW = '' ; ER = ''
            CALL F.MATREAD(FN.FUP,ALREADY.EXIST,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
            IF ER THEN
               CALLID = 'EB-CEC.ALREADY.STARTED.BY'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
            END ELSE ;*Operation still unvalidated
               CALLID = 'EB-CEC.TO.BE.VALIDATED'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
            END
         END ELSE
            CALLID = 'EB-CEC.ALREADY.DONE.BY'
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            CALLID := ' [':ALREADY.EXIST  ; RETURN
         END 
      END

      CALL Y.CLEAR.CECFMT
      CALL Y.LOAD.CECDEF
      ACT.DFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef

*     EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>663</Rating>
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: OPERATORS CHANGED TO OPERANDS
*				  FM CHANGED TO @FM
*                 RELEASE TO F.RELEASE
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE S.NEXT.CEC.CONNEX(CALLID)
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

* 2009.11.14 Release the CEC.FOLLOW.UP$NAU whenever locked 

      CALLID = ''; ID.POS = 0

*     The operation code must be given at the end of the header first line
*     of the calling nofile ENQUIRY

      LOCATE 'INIT.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         CALLID = 'EB-CEC.MISSING.PREV.OPERATION'
         CALL LOT.TRANSLATE.ERROR(CALLID,'')
         CALLID := '[' ; RETURN
      END
      ID.POS = 0
      LOCATE 'NEXT.OPCODE' IN D.FIELDS<1> SETTING ID.POS THEN
         NEXT.OPCODE = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         CALLID = 'EB-CEC.MISSING.NEXT.LAYOUT'
         CALL LOT.TRANSLATE.ERROR(CALLID,'')
         CALLID := '[' ; RETURN
      END

      N.SUBCODE = '' ; N.OPCODE = FIELD(NEXT.OPCODE,".",2)
      IF NUM(N.OPCODE[1,3]) ELSE
         CALLID = 'EB-CEC.UNKNOWN.OPERATION.CODE':@FM:N.OPCODE
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      IF FIELD(NEXT.OPCODE,".",1) NE 'OUTWARD' THEN
         CALLID = 'EB-CEC.ONLY.FOR.CORRESPONDANT'
         CALL LOT.TRANSLATE.ERROR(CALLID,'') 
         CALLID := '[' ; RETURN
      END

      GOSUB INITIATE.FILES
      ID.POS = 0
      LOCATE 'APPLYING.ON' IN D.FIELDS<1> SETTING ID.POS
         THEN APPLYING.ON = D.RANGE.AND.VALUE<ID.POS>
         ELSE APPLYING.ON = 'INWARD'
         
      ID.POS = 0
      LOCATE 'ALREADY.EXIST' IN D.FIELDS<1> SETTING ID.POS 
         THEN ALREADY.EXIST = D.RANGE.AND.VALUE<ID.POS>
         ELSE ALREADY.EXIST = ''

      IF ALREADY.EXIST THEN
         IF ALREADY.EXIST MATCH "'CFU'5N0X" THEN
            MAT R.NEW = '' ; ER = ''
            CALL F.MATREAD(FN.FUP,ALREADY.EXIST,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
            IF ER THEN
               CALLID = 'EB-CEC.ALREADY.STARTED.BY'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
            END ELSE ;*Operation still unvalidated
               CALLID = 'EB-CEC.TO.BE.VALIDATED'
               CALL LOT.TRANSLATE.ERROR(CALLID,'') 
               CALLID := ' [':ALREADY.EXIST  ; RETURN
            END
         END ELSE
            CALLID = 'EB-CEC.ALREADY.DONE.BY'
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            CALLID := ' [':ALREADY.EXIST  ; RETURN
         END 
      END

      CALL Y.CLEAR.CECFMT
      CALL Y.LOAD.CECDEF
      ACT.DAT.RECORD = ''

*     Extraction du format du message

*     CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,N.OPCODE,N.SUBCODE,N.HIST,N.NEXT,N.ALTN,Y.REJECT.REASON)
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'','',N.OPCODE,N.HIST,N.NEXT,N.ALTN,Y.REJECT.REASON)
      IF Y.REJECT.REASON THEN CALLID = Y.REJECT.REASON:'[' ; RETURN

*     Extraction des conditions de compabilisation actuelles

      CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',Y.REJECT.REASON)
      IF Y.REJECT.REASON THEN CALLID = Y.REJECT.REASON:'[' ; RETURN

      CALL Y.CEC.FUP.FROM.SCRATCH(CALLID,N.ERR)
      IF N.ERR THEN
         CALLID = N.ERR:'['
      END ELSE
         IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(CALLID)
         ID.NEW = CALLID
         MAT R.NEW = '' ; ER = ''
         CALL F.MATREAD(FN.FUP,ID.NEW,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME,FP.FUP,ER)
         IF NOT(ER) THEN
            R.NEW(CEC.FUP.APPLYING.ON) = APPLYING.ON
            R.NEW(CEC.FUP.INITIAL.CLEAR.ID) = ACT.TRANS
            CALL F.MATWRITE(FN.FUP,ID.NEW,MAT R.NEW,CEC.FUP.AUDIT.DATE.TIME)
            IF RUNNING.UNDER.BATCH ELSE CALL JOURNAL.UPDATE(CALLID)
            CALLID = 'EB-CEC.TO.BE.CODED'
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            CALLID := ' [':ID.NEW  
         END ELSE
            IF ID.NEW THEN CALL F.RELEASE(FN.FUP, ID.NEW, FP.FUP);*RELEASE FP.FUP,ID.NEW ; CALL JOURNAL.UPDATE(ID.NEW) ;* 2009.11.14
            CALLID = 'EB-CEC.TO.BE.REINITIATED'
            CALL LOT.TRANSLATE.ERROR(CALLID,'') 
            CALLID := '['
         END
      END

      RETURN

*************************************************************************
INITIATE.FILES:
*************************************************************************

      E = '' ; TEXT = '' ; ETEXT = ''

      FN.FUP = 'F.CEC.FOLLOW.UP$NAU' ; FP.FUP = ''
      CALL OPF(FN.FUP, FP.FUP) 

      RETURN

   END
