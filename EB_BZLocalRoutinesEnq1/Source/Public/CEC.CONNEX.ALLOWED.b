*
*-----------------------------------------------------------------------------
* <Rating>1009</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM TO @FM, @VM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE CEC.CONNEX.ALLOWED(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Automatic proposal for a connex operation to follow up a given one
  
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
* $INSERT I_COMMON - Not Used anymore;METER
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
PROCESS.EB.SystemTables.getVFunction()*****************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus***************   
    
      LOCATE 'REC.IDFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSETTING ID.POS THEN
         ACT.TRANS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         Y.LIST = 'EB-CEC.MISSING.OPERATION.ID':@FM:ACT.TRANS
         CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
      END

      ACT.OPCODE = FIELD(ACT.TRANS,".",2)

      LOCATE 'APPLYING.ON' IN D.FIELDS<1> SETTING ID.POS
         THEN APPLYING.ON = D.RANGE.AND.VALUE<ID.POS>
         ELSE APPLYING.ON = 'INWARD' 

      IF APPLYING.ON EQ 'OUTWARD' THEN
         YR.CEC.OUTWARD.ID = ACT.TRANS
         GOSUB READ.CEC.OUTWARD.FILE
         IF ER THEN
            Y.LIST = 'EB-CEC.MISSING.OUT.OPERATION':@FM:ACT.TRANS
            CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
         END
         ACT.DAT.RECORD = R.CEC.OUTWARD<CEC.OC.OUTWARD.REC>
         ACT.OPCODE = R.CEC.OUTWARD<CEC.OC.APPLICATION.CODE>
         R.ACT.HISTORY = R.CEC.OUTWARD<CEC.OC.HIST.OPE.ID>
      END ELSE
         YR.CEC.INWARD.ID = ACT.TRANS
         GOSUB READ.CEC.INWARD.FILE
         EB.DataAccess.OpfER THEN
         EB.DataAccess.OpfY.LIST = 'EB-CEC.MISSING.IN.OPERATION':@FM:ACT.TRANS
            CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
         END
         ACT.DAT.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC>
         ACT.OPCODE = R.CEC.INWARD<CEC.IC.APPLICATION.CODE>
         R.ACT.HISEB.SystemTables.getRNew()=FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEC.IC.HIST.OPE.ID>
      END

      NEB.DataAccess.FReadCODE = '' ; NEXT.SUBCODE = ''
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,E)
      IF E EQ '' THEN
         CALL Y.LOAD.NEXT.CEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerD,R.NEXT.LAYOUT,'',E)
         IF E NE '' THEN Y.LIST = E ; E = '' ; RETURN
      END ELEB.SystemTables.setE(E); E = '' ; RETURN

      IE = 0 
	  Y.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerXT<1>,@VM)
      FOR IJK = 1EB.DataAccess.FWriteCNT
         ALREADY.DONE = '' 
		 Y.IHA.DCNT = DCOUNT(R.ACT.HISTORY,@VM)     ;*DCOUNT assigned to varialbe for FOR loop.
         FOR IHA = 1 TO Y.IHA.DCNT 
        EB.SystemTables.setAf()*
*-----------------------------------------------------------------------------
* <Rating>1009</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM TO @FM, @VM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE CEC.CONNEX.ALLOWED(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Automatic proposal for a connex operation to follow up a given one
  
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

      LOCATE 'APPLYING.ON' IN D.FIELDS<1> SETTING ID.POS
         THEN APPLYING.ON = D.RANGE.AND.VALUE<ID.POS>
         ELSE APPLYING.ON = 'INWARD' 

      IF APPLYING.ON EQ 'OUTWARD' THEN
         YR.CEC.OUTWARD.ID = ACT.TRANS
         GOSUB READ.CEC.OUTWARD.FILE
         IF ER THEN
            Y.LIST = 'EB-CEC.MISSING.OUT.OPERATION':@FM:ACT.TRANS
            CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
         END
         ACT.DAT.RECORD = R.CEC.OUTWARD<CEC.OC.OUTWARD.REC>
         ACT.OPCODE = R.CEC.OUTWARD<CEC.OC.APPLICATION.CODE>
         R.ACT.HISTORY = R.CEC.OUTWARD<CEC.OC.HIST.OPE.ID>
      END ELSE
         YR.CEC.INWARD.ID = ACT.TRANS
         GOSUB READ.CEC.INWARD.FILE
         IF ER THEN
            Y.LIST = 'EB-CEC.MISSING.IN.OPERATION':@FM:ACT.TRANS
            CALL LOT.TRANSLATE.ERROR(Y.LIST,'') ; RETURN
         END
         ACT.DAT.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC>
         ACT.OPCODE = R.CEC.INWARD<CEC.IC.APPLICATION.CODE>
         R.ACT.HISTORY = R.CEC.INWARD<CEC.IC.HIST.OPE.ID>
      END

      NEXT.OPCODE = '' ; NEXT.SUBCODE = ''
      CALL Y.LOAD.CEC.LAYOUT(APPLYING.ON,'',ACT.OPCODE,NEXT.OPCODE,N.HIST,N.NEXT,N.ALTN,E)
      IF E EQ '' THEN
         CALL Y.LOAD.NEXT.CECLAY(NEXT.LAYOUT.ID,R.NEXT.LAYOUT,'',E)
         IF E NE '' THEN Y.LIST = E ; E = '' ; RETURN
      END ELSE Y.LIST = E ; E = '' ; RETURN

      IE = 0 
	  Y.DCNT = DCOUNT(N.NEXT<1>,@VM)
      FOR IJK = 1 TO Y.DCNT
         ALREADY.DONE = '' 
		 Y.IHA.DCNT = DCOUNT(R.ACT.HISTORY,@VM)     ;*DCOUNT assigned to varialbe for FOR loop.
         FOR IHA = 1 TO Y.IHA.DCNT 
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefFIELD(R.ACT.HISTORY<1,IHA>,".",3)
        EB.SystemTables.setE(FIELD(R.ACT.HISTORY<1,IHA>,".",1))
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
         IF ALREADY.DONE EQ '' AND APPLYING.ON EQ 'INWARD' THEN
            IF R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID> THEN
               SW.ALREADY = 0
               CALL Y.CEC.READ.APPLICATION(R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>,FUP.REC,N.STATUS,N.FILE,N.ERR)
               BEGIN CASE
                  CASE N.FILE EQ '$HIS'
                     IF N.STATUS EQ 'REVE' ELSE SW.ALREADY = 1
                  CASE N.FILE EQ '$NAU'
                     SW.ALREADY = 1
                  CASE N.FILE EQ ''
                     IF N.STATUS EQ '' THEN SW.ALREADY = 1
               END CASE
               IF SW.ALREADY THEN
                  IF FUP.REC<CEC.FUP.APPLICATION.CODE> EQ N.NEXT<2,IJK> THEN
                     ALREADY.DONE = R.CEC.INWARD<CEC.IC.FOLLOW.UP.ID>
                  END
               END
            END
         END
         IE += 1
         Y.LIST<IE> = N.NEXT<1,IJK>:']':N.NEXT<2,IJK>:']':N.NEXT<3,IJK>:']':N.NEXT<4,IJK>:']'
         Y.LIST<IE> := N.NEXT<5,IJK>:']':APPLYING.ON:']':ALREADY.DONE
      NEXT IJK

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
