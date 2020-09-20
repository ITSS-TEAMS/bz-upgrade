*
*-----------------------------------------------------------------------------
* <Rating>4416</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.UPDT.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Allows to modify automatically the status of a detail line 
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM,SM TO @FM,@VM,@SM
*				  :INTIALISED F.READ VARIABLES 
*-------------------------------------------------------  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.PROCESS
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
* $INSERT I_COMMON - Not Used anymore;
$INSERT I_LOTFMT
$INSERT I_LOTDEF
$INSERT I_LOTLAY
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTSTA
$INSERT I_LOTHEA
$INSERT I_LOTWORK

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
         Y.LIST = RECORD.LIST
      END ELSE DEB.LIGNE = '[[[[[['

      IF TXT.ER THEN
	EB.SystemTables.getVFunction()COUNT(TXT.ER,EB.SystemTables.getVFunction()     FOR IJK = 1 TFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus     Y.LIST<-1> = DEB.LIGNE:'[':TXT.ER<IJK>
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
      END ELSE

      END

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   

      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

      LOCATE 'DET.STATUS.CODE' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.STATUS.CODE = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.STATUS = ''

      LOCATE 'DET.DESTINATION' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.DESTINATION = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.DESTINATION = ''


      IF NEW.DET.STATUS.CODE THEN
         LOCATE NEW.DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
*        EB.DataAccess.OpfIF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
*        EB.DataAccess.Opf   TXT.ER = 'New status should not be ERROR' ; RETURN
*           END
            IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' THEN
               TXT.ER = 'New status should not affect whole file' ; RETURN
            END
            IF STAEB.SystemTables.getRNew()AFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEQ 'NO' THEN   
               TXT.ER = 'EB-LOT.NON.MANUAL.STATUS'
         EB.DataAccess.FReadCALL LOT.TRANSLATE.ERROR(TXT.ER,'')
            END
         END ELSE
            TXT.ER = 'Unknown new status ':NEW.DET.STATUS.CODE ; RETURN
         END
      END

*EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTables.setE('' AND NEW.DET.STATUS = '' THEN)
*        TXT.ER = 'NEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerationEB.SystemTables.getIdNew()TURN
*     END

      INIT.LOT.EB.DataAccess.FWriteID = FIELD(LINE.ID,"\",1)
      LAYOUT.ID = FIELD(LINE.ID,"\",2)
      CD.LAYOUT.ID = LAYOUT.ID

*     EB.SystemTables.setAf()*
*-----------------------------------------------------------------------------
* <Rating>4416</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.UPDT.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Allows to modify automatically the status of a detail line 
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM,SM TO @FM,@VM,@SM
*				  :INTIALISED F.READ VARIABLES 
*-------------------------------------------------------  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.PROCESS
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
$INSERT I_F.LOT.WORK
$INSERT I_LOTFMT
$INSERT I_LOTDEF
$INSERT I_LOTLAY
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTSTA
$INSERT I_LOTHEA
$INSERT I_LOTWORK

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
         Y.LIST = RECORD.LIST
      END ELSE DEB.LIGNE = '[[[[[['

      IF TXT.ER THEN
	  Y.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CNT1
            Y.LIST<-1> = DEB.LIGNE:'[':TXT.ER<IJK>
         NEXT IJK
      END ELSE

      END

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   

      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

      LOCATE 'DET.STATUS.CODE' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.STATUS.CODE = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.STATUS = ''

      LOCATE 'DET.DESTINATION' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.DESTINATION = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.DESTINATION = ''


      IF NEW.DET.STATUS.CODE THEN
         LOCATE NEW.DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
*           IF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
*              TXT.ER = 'New status should not be ERROR' ; RETURN
*           END
            IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' THEN
               TXT.ER = 'New status should not affect whole file' ; RETURN
            END
            IF STA.MANUAL.SETTING<FND> EQ 'NO' THEN   
               TXT.ER = 'EB-LOT.NON.MANUAL.STATUS'
               CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
            END
         END ELSE
            TXT.ER = 'Unknown new status ':NEW.DET.STATUS.CODE ; RETURN
         END
      END

*     IF NEW.DET.DESTINATION = '' AND NEW.DET.STATUS = '' THEN
*        TXT.ER = 'Ni statut ni destination' ; RETURN
*     END

      INIT.LOT.DETAIL.ID = FIELD(LINE.ID,"\",1)
      LAYOUT.ID = FIELD(LINE.ID,"\",2)
      CD.LAYOUT.ID = LAYOUT.ID

*     FiEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*
*-----------------------------------------------------------------------------
* <Rating>4416</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.UPDT.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* Allows to modify automatically the status of a detail line 
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM,SM TO @FM,@VM,@SM
*				  :INTIALISED F.READ VARIABLES 
*-------------------------------------------------------  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.PROCESS
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
$INSERT I_F.LOT.WORK
$INSERT I_LOTFMT
$INSERT I_LOTDEF
$INSERT I_LOTLAY
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTSTA
$INSERT I_LOTHEA
$INSERT I_LOTWORK

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
         Y.LIST = RECORD.LIST
      END ELSE DEB.LIGNE = '[[[[[['

      IF TXT.ER THEN
	  Y.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CNT1
            Y.LIST<-1> = DEB.LIGNE:'[':TXT.ER<IJK>
         NEXT IJK
      END ELSE

      END

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   

      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

      LOCATE 'DET.STATUS.CODE' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.STATUS.CODE = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.STATUS = ''

      LOCATE 'DET.DESTINATION' IN D.FIELDS<1> SETTING ID.POS
         THEN NEW.DET.DESTINATION = D.RANGE.AND.VALUE<ID.POS>
         ELSE NEW.DET.DESTINATION = ''


      IF NEW.DET.STATUS.CODE THEN
         LOCATE NEW.DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
*           IF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
*              TXT.ER = 'New status should not be ERROR' ; RETURN
*           END
            IF STA.AFFECT.WHOLE.FILE<FND> EQ 'Y' THEN
               TXT.ER = 'New status should not affect whole file' ; RETURN
            END
            IF STA.MANUAL.SETTING<FND> EQ 'NO' THEN   
               TXT.ER = 'EB-LOT.NON.MANUAL.STATUS'
               CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
            END
         END ELSE
            TXT.ER = 'Unknown new status ':NEW.DET.STATUS.CODE ; RETURN
         END
      END

*     IF NEW.DET.DESTINATION = '' AND NEW.DET.STATUS = '' THEN
*        TXT.ER = 'Ni statut ni destination' ; RETURN
*     END

      INIT.LOT.DETAIL.ID = FIELD(LINE.ID,"\",1)
      LAYOUT.ID = FIELD(LINE.ID,"\",2)
      CD.LAYOUT.ID = LAYOUT.ID

*     Find the key of the principal record data line (CD.LAYOUT.ID) 
*     if this routine is called from an annex line.

      HEA = ''
	  Y.CNT2=DCOUNT(HEA.ENR.ID,@FM)
      FOR IHE = 1 TO Y.CNT2
         LOCATE CD.LAYOUT.ID IN HEA.OPE.ID<IHE,1> SETTING HEA THEN EXIT ELSE HEA = ''
      NEXT IHE
      IF HEA NE '' THEN
         IF HEA.NATURE<IHE,HEA>[1,2] EQ 'AN' THEN CD.LAYOUT.ID = HEA.LINKED.ENR<IHE,HEA>
      END ELSE
         TXT.ER = 'Transaction inconnue : ':CD.LAYOUT.ID
         RETURN
      END

      YR.CFONB.LAYOUT.ID = 'INWARD.':CD.LAYOUT.ID
      GOSUB READ.DATA.LAYOUT
      IF TXT.ER THEN RETURN

*     Display of the line decomposition

      IHH = FIELD(LINE.ID,"\",3)+0
      GOSUB PROCESS.ONE.LINE

      RETURN

*************************************************************************
PROCESS.ONE.LINE:
*************************************************************************

      LOT.DETAIL.NUM = IHH/R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>
      LOT.DETAIL.NUM = ICONV(LOT.DETAIL.NUM+0.4999,"MD0T")
      IF LOT.DETAIL.NUM LE 1 THEN LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID ELSE LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID:'.':LOT.DETAIL.NUM

      R.LOT.DETAIL = '' ; ER = ''
      CALL F.READ(LOT.DETAIL.FILE,LOT.DETAIL.KEY,R.LOT.DETAIL,F.LOT.DETAIL,ER)
      IF ER THEN N.ERR = 'Ligne non trouvee ':IHH ; RETURN

      IHH.REL = IHH - (LOT.DETAIL.NUM-1)*R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>

      LOT.DETAIL.FIELDS = R.LOT.DETAIL<3*IHH.REL-2>
      DET.STATUS.CODE = FIELD(LOT.DETAIL.FIELDS,I.SEP,1)
      DET.DESTINATION = FIELD(LOT.DETAIL.FIELDS,I.SEP,2)

      EXT.STATUS = ''
      EXT.APPL = '' ; EXT.LIVE = ''
      EXT.ACTION = '' ; EXT.VERSION = ''
      EXT.KEY = R.LOT.DETAIL<3*IHH.REL>

      DET.CONTRACT.ID = FIELD(LOT.DETAIL.FIELDS,I.SEP,3)
      DET.CUST.BANK = FIELD(LOT.DETAIL.FIELDS,I.SEP,4)
      DET.CUST.GUICHET = FIELD(LOT.DETAIL.FIELDS,I.SEP,5)
      DET.CUST.RIB.ACCOUNT = FIELD(LOT.DETAIL.FIELDS,I.SEP,6)
      DET.CUST.ACCOUNT = FIELD(LOT.DETAIL.FIELDS,I.SEP,7)
      DET.VALUE.DATE = FIELD(LOT.DETAIL.FIELDS,I.SEP,8)
      DET.CURRENCY = FIELD(LOT.DETAIL.FIELDS,I.SEP,9)
      DET.SORT.FIELD = FIELD(LOT.DETAIL.FIELDS,I.SEP,10)
      DET.AMOUNT = FIELD(LOT.DETAIL.FIELDS,I.SEP,11)
      DET.THEIR.BANK = FIELD(LOT.DETAIL.FIELDS,I.SEP,12)
      DET.THEIR.GUICHET = FIELD(LOT.DETAIL.FIELDS,I.SEP,13)
      DET.THEIR.RIB.ACCOUNT = FIELD(LOT.DETAIL.FIELDS,I.SEP,14)
      DET.THEIR.ACCOUNT = FIELD(LOT.DETAIL.FIELDS,I.SEP,15)
      DET.ADDITIONAL = ''

      GOSUB FIND.LOT.PROCESS

      DEB.LIGNE = EXT.KEY:'[':EXT.APPL:'[':EXT.VERSION:'[':EXT.ACTION:'[':EXT.LIVE:'[':EXT.STATUS

      RECORD.LIST<-1> = DEB.LIGNE:'[(':CD.LAYOUT.ID:') : ':R.DATA.LAYOUT<CFB.LAY.DESCRIPTION,1> 

      RECORD.LIST<-1> = DEB.LIGNE:'[ '
      RECORD.LIST<-1> = DEB.LIGNE:'[Ligne de detail ':LINE.ID
      RECORD.LIST<-1> = DEB.LIGNE:'[-----------------------------------------------------'
      IF NEW.DET.DESTINATION THEN
         RECORD.LIST<-1> = DEB.LIGNE:'[Code statut              : ':DET.STATUS.CODE
         IF TXT.ER THEN
            RECORD.LIST<-1> = DEB.LIGNE:'[Destination              : ':DET.DESTINATION
         END ELSE
            RECORD.LIST<-1> = DEB.LIGNE:'[Destination              : ':DET.DESTINATION:' devient ':NEW.DET.DESTINATION
         END
      END ELSE
         IF TXT.ER THEN
            RECORD.LIST<-1> = DEB.LIGNE:'[Code statut              : ':DET.STATUS.CODE
         END ELSE
            RECORD.LIST<-1> = DEB.LIGNE:'[Code statut              : ':DET.STATUS.CODE:' devient ':NEW.DET.STATUS.CODE
         END
         RECORD.LIST<-1> = DEB.LIGNE:'[Destination              : ':DET.DESTINATION
      END
      RECORD.LIST<-1> = DEB.LIGNE:'[No de contrat            : ':DET.CONTRACT.ID
      RECORD.LIST<-1> = DEB.LIGNE:'[Banque du remettant      : ':DET.CUST.BANK
      RECORD.LIST<-1> = DEB.LIGNE:'[Guichet du remettant     : ':DET.CUST.GUICHET
      RECORD.LIST<-1> = DEB.LIGNE:'[Cpte RIB du remettant    : ':DET.CUST.RIB.ACCOUNT
      RECORD.LIST<-1> = DEB.LIGNE:'[Compte du remettant      : ':DET.CUST.ACCOUNT
      RECORD.LIST<-1> = DEB.LIGNE:'[Date de reglement        : ':DET.VALUE.DATE
      RECORD.LIST<-1> = DEB.LIGNE:'[Devise de reference      : ':DET.CURRENCY
      RECORD.LIST<-1> = DEB.LIGNE:'[Cle de rupture           : ':DET.SORT.FIELD
      RECORD.LIST<-1> = DEB.LIGNE:'[Montant brut             : ':DET.AMOUNT 
      RECORD.LIST<-1> = DEB.LIGNE:'[Banque du destinataire   : ':DET.THEIR.BANK
      RECORD.LIST<-1> = DEB.LIGNE:'[Guichet du destinataire  : ':DET.THEIR.GUICHET
      RECORD.LIST<-1> = DEB.LIGNE:'[Cpte RIB du destinataire : ':DET.THEIR.RIB.ACCOUNT 
      RECORD.LIST<-1> = DEB.LIGNE:'[Compte du destinataire   : ':DET.THEIR.ACCOUNT
      RECORD.LIST<-1> = DEB.LIGNE:'[-----------------------------------------------------'
      NB.PARAM.FIELDS = R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,1>
	  Y.CNT3=DCOUNT(LOT.DETAIL.FIELDS,I.SEP)
      FOR IJF = 16 TO Y.CNT3
         DET.ADDITIONAL<1,IJF-15> = FIELD(LOT.DETAIL.FIELDS,I.SEP,IJF)
         IF DET.ADDITIONAL<1,IJF-15> NE '' THEN
            LIBELLE = R.LOT.PARAMETER<LOT.PAR.FT.FIELD.NAME,IJF-4>
            LEN.LIBELLE = LEN(LIBELLE)
            IF LEN.LIBELLE GT 24 THEN
               LIBELLE = LIBELLE[1,24]
            END ELSE LIBELLE = FMT(LIBELLE,'24L')
            RECORD.LIST<-1> = DEB.LIGNE:'[':LIBELLE:' : ':DET.ADDITIONAL<1,IJF-15>
         END
      NEXT IJF
      RECORD.LIST<-1> = DEB.LIGNE:'[----------------------------------------------------'

      R.DATA.RECORD = R.LOT.DETAIL<3*IHH.REL-1,1>

*     Extracts the annexes content and layout and pass them to I_LOTFMT

      CALL Y.LOT.ANNEX.RECORD(R.LOT.DETAIL<3*IHH.REL-1>)

      RETURN

***********************************************************************
FIND.LOT.PROCESS:
***********************************************************************

      LOT.DETAIL.ID = INIT.LOT.DETAIL.ID ; R.LOT.WORK = '' ; ER = ''
      CALL F.READ(LOT.WORK.FILE,LOT.DETAIL.ID,R.LOT.WORK,F.LOT.WORK,ER)
      IF NOT(ER) THEN
         YR.LOT.PROCESS.CONCAT.ID = INIT.LOT.DETAIL.ID ; R.LOT.PROCESS.CONCAT = '' ; ER = ''
         GOSUB READ.LOT.PROCESS.CONCAT.FILE
         IF NOT(ER) THEN
            NB.LOT.PROCESS = DCOUNT(R.LOT.PROCESS.CONCAT,@FM)
            SW.LOT.PROCESS.FOUND = 0
            FOR IJZ = 1 TO NB.LOT.PROCESS
               YR.LOT.PROCESS.ID = R.LOT.PROCESS.CONCAT<IJZ>
               GOSUB CHECK.LOT.PROCESS
               IF SW.LOT.PROCESS.FOUND THEN RETURN
            NEXT IJZ
            IF SW.LOT.PROCESS.FOUND EQ 0 THEN TXT.ER = 'Pas de LOT.PROCESS associe'
         END ELSE TXT.ER = 'Pas de LOT.PROCESS.CONCAT associe'
      END ELSE TXT.ER = 'Pas de LOT.WORK associe'

      RETURN

***********************************************************************
CHECK.LOT.PROCESS:
***********************************************************************

      CALL Y.LOT.READ.APPLICATION(YR.LOT.PROCESS.ID,APPL.REC,N.STATUS,N.FILE,N.ERR)
      IF APPL.REC THEN
         GOSUB CHECK.LINE.OWNERSHIP
         IF SW.LOT.PROCESS.FOUND THEN
            BEGIN CASE
               CASE N.FILE EQ '$HIS'
                  IF N.STATUS EQ 'REVE' 
                     THEN TXT.ER = 'Le LOT.PROCESS associe a ete extourne'
                     ELSE TXT.ER = 'Le LOT.PROCESS associe a ete archive' 
               CASE N.FILE EQ '$NAU'
                  BEGIN CASE
                     CASE N.STATUS[1,1] EQ 'R'
                        TXT.ER = 'Le LOT.PROCESS associe est presque extourne'
                     CASE N.STATUS[2,2] EQ 'NA'
                        TXT.ER = 'Le LOT.PROCESS associe est presque autorise' 
                     CASE N.STATUS[2,3] EQ 'HLD'
                        GOSUB UPDATE.ALL
                  END CASE
               CASE N.FILE EQ ''
                  IF N.STATUS EQ '' THEN TXT.ER = 'Le LOT.PROCESS associe a ete autorise'
            END CASE
         END
      END
    
      RETURN

***********************************************************************
CHECK.LINE.OWNERSHIP:
***********************************************************************

      SW.LOT.PROCESS.FOUND = 0

      IF APPL.REC<LOT.PRO.RANGE.BEG> NE '' AND APPL.REC<LOT.PRO.RANGE.END> NE '' THEN
         NB.DEST = DCOUNT(APPL.REC<LOT.PRO.DESTINATION>,@VM)
         FOR IJK = 1 TO NB.DEST
            NB.RANGE = DCOUNT(APPL.REC<LOT.PRO.RANGE.BEG,IJK>,@SM)
            FOR IZE = 1 TO NB.RANGE
               IF IHH GE APPL.REC<LOT.PRO.RANGE.BEG,IJK,IZE> AND IHH LE APPL.REC<LOT.PRO.RANGE.END,IJK,IZE> THEN
                  SW.LOT.PROCESS.FOUND = 1 ; RETURN
               END
            NEXT IZE
         NEXT IJK
      END

      RETURN

***********************************************************************
UPDATE.ALL:
***********************************************************************

      ID.NEW = YR.LOT.PROCESS.ID
      CALL F.MATREAD(LOT.PROCESS.FILE$NAU,ID.NEW,MAT R.NEW,LOT.PRO.AUDIT.DATE.TIME,F.LOT.PROCESS$NAU,ER)
      IF NOT(ER) THEN
         GOSUB BUILD.SCALE.FROM.FIELDS
         R.NEW(LOT.PRO.CHANGE.RANGE.BEG) = IHH
         R.NEW(LOT.PRO.CHANGE.RANGE.END) = IHH
         R.NEW(LOT.PRO.NEW.STATUS.CODE) = ''
         R.NEW(LOT.PRO.NEW.DESTINATION) = ''
         IF NEW.DET.DESTINATION THEN
            IF DET.DESTINATION NE NEW.DET.DESTINATION 
               THEN R.NEW(LOT.PRO.NEW.DESTINATION) = NEW.DET.DESTINATION
               ELSE RETURN
         END ELSE
            IF DET.STATUS.CODE AND NEW.DET.STATUS.CODE EQ '' OR DET.STATUS.CODE NE NEW.DET.STATUS.CODE
               THEN R.NEW(LOT.PRO.NEW.STATUS.CODE) = NEW.DET.STATUS.CODE
               ELSE RETURN
         END
         GOSUB BUILD.SCALE.FROM.FIELDS
         GOSUB UPDATE.SCALE
         GOSUB BUILD.FIELDS.FROM.SCALE
         GOSUB CHECK.OVERALL.STATUS
         IF CALC.OVERALL.BLOCKAGE.LEVEL NE 'ERROR' THEN
            CALL Y.LOT.PROCESS.FROM.ADJUSTMENT('GEN',TXT.ER)
            IF TXT.ER EQ '' THEN
               IF R.NEW(LOT.PRO.RANGE.BEG) EQ '' THEN
                  CALL F.DELETE(LOT.PROCESS.FILE$NAU,ID.NEW)
                  CALL Y.LOT.PROCESS.CONCAT('DEL',ID.NEW)
               END ELSE
                  CALL F.MATWRITE(LOT.PROCESS.FILE$NAU,ID.NEW,MAT R.NEW,LOT.PRO.AUDIT.DATE.TIME)
               END
               CALL JOURNAL.UPDATE(ID.NEW)
            END
         END
      END
   
      RETURN

*************************************************************************
CHECK.OVERALL.STATUS:
*************************************************************************

      CALC.OVERALL.BLOCKAGE.LEVEL = ''
      YR.LSC.ID = R.NEW(LOT.PRO.OVERALL.STATUS)
      IF YR.LSC.ID NE '' THEN
         LOCATE YR.LSC.ID IN STA.STATUS.ID<1> SETTING FND THEN
            IF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
               CALC.OVERALL.BLOCKAGE.LEVEL = 'ERROR'
            END
         END
      END

      RETURN

*************************************************************************
UPDATE.SCALE:
*************************************************************************

      NEW.SCALE = '' ; IE = 0
      NB.STEP = DCOUNT(SCALE<1>,@VM)
      FOR IYT = 1 TO NB.STEP
         IF R.NEW(LOT.PRO.CHANGE.RANGE.BEG) GT SCALE<2,IYT> OR R.NEW(LOT.PRO.CHANGE.RANGE.END) LE SCALE<1,IYT> THEN
*
*           Range untouched by the update
*
            IE += 1
            NEW.SCALE<1,IE> = SCALE<1,IYT>
            NEW.SCALE<2,IE> = SCALE<2,IYT>
            NEW.SCALE<3,IE> = SCALE<3,IYT>
            NEW.SCALE<4,IE> = SCALE<4,IYT>
            NEW.SCALE<5,IE> = SCALE<3,IYT>
            NEW.SCALE<6,IE> = SCALE<4,IYT>
         END ELSE
*
*           Range Overlaps with existing one(s) - Split/Update/Gaps filling
*
            IF R.NEW(LOT.PRO.CHANGE.RANGE.BEG) LE SCALE<1,IYT> THEN
               BEG.NUM = SCALE<1,IYT>
            END ELSE
               IE += 1
               BEG.NUM = R.NEW(LOT.PRO.CHANGE.RANGE.BEG)
               NEW.SCALE<1,IE> = SCALE<1,IYT>
               NEW.SCALE<2,IE> = R.NEW(LOT.PRO.CHANGE.RANGE.BEG)-1
               NEW.SCALE<3,IE> = SCALE<3,IYT>
               NEW.SCALE<4,IE> = SCALE<4,IYT>
               NEW.SCALE<5,IE> = SCALE<3,IYT>
               NEW.SCALE<6,IE> = SCALE<4,IYT>
            END
            IF R.NEW(LOT.PRO.CHANGE.RANGE.END) GE SCALE<2,IYT> THEN
               IE += 1
               NEW.SCALE<1,IE> = BEG.NUM
               NEW.SCALE<2,IE> = SCALE<2,IYT>
               NEW.SCALE<3,IE> = SCALE<3,IYT>
               NEW.SCALE<4,IE> = SCALE<4,IYT>
               IF SCALE<3,IYT> AND R.NEW(LOT.PRO.NEW.STATUS.CODE) NE SCALE<3,IYT> THEN
                  LOCATE SCALE<3,IYT> IN STA.STATUS.ID<1> SETTING FND THEN
                     IF STA.REVERSIBLE<FND> EQ 'NO' THEN     ; * Not reversible
                        NEW.SCALE<5,IE> = SCALE<3,IYT>
                     END ELSE
                        NEW.SCALE<5,IE> = R.NEW(LOT.PRO.NEW.STATUS.CODE)
                     END
                  END
               END ELSE
                  NEW.SCALE<5,IE> = R.NEW(LOT.PRO.NEW.STATUS.CODE)
               END
               IF R.NEW(LOT.PRO.NEW.DESTINATION) THEN
                  NEW.SCALE<6,IE> = R.NEW(LOT.PRO.NEW.DESTINATION)
               END ELSE
                  NEW.SCALE<6,IE> = SCALE<4,IYT>
               END
            END ELSE
               IE += 1
               END.NUM = R.NEW(LOT.PRO.CHANGE.RANGE.END)
               NEW.SCALE<1,IE> = BEG.NUM
               NEW.SCALE<2,IE> = END.NUM
               NEW.SCALE<3,IE> = SCALE<3,IYT>
               NEW.SCALE<4,IE> = SCALE<4,IYT>
               IF SCALE<3,IYT> AND R.NEW(LOT.PRO.NEW.STATUS.CODE) NE SCALE<3,IYT> THEN
                  LOCATE SCALE<3,IYT> IN STA.STATUS.ID<1> SETTING FND THEN
                     IF STA.REVERSIBLE<FND> EQ 'NO' THEN     ; * Not reversible
                        NEW.SCALE<5,IE> = SCALE<3,IYT>
                     END ELSE
                        NEW.SCALE<5,IE> = R.NEW(LOT.PRO.NEW.STATUS.CODE)
                     END
                  END
               END ELSE
                  NEW.SCALE<5,IE> = R.NEW(LOT.PRO.NEW.STATUS.CODE)
               END
               IF R.NEW(LOT.PRO.NEW.DESTINATION) THEN
                  NEW.SCALE<6,IE> = R.NEW(LOT.PRO.NEW.DESTINATION)
               END ELSE
                  NEW.SCALE<6,IE> = SCALE<4,IYT>
               END
               IE += 1
               NEW.SCALE<1,IE> = END.NUM+1
               NEW.SCALE<2,IE> = SCALE<2,IYT>
               NEW.SCALE<3,IE> = SCALE<3,IYT>
               NEW.SCALE<4,IE> = SCALE<4,IYT>
               NEW.SCALE<5,IE> = SCALE<3,IYT>
               NEW.SCALE<6,IE> = SCALE<4,IYT>
            END
         END
      NEXT IYT

*     Check and concatenates the fields

      SCALE = '' ; IE = 0
      NB.STEP = DCOUNT(NEW.SCALE<1>,@VM)
      FOR IYT = 1 TO NB.STEP
         IF IYT GT 1 THEN
            IF NEW.SCALE<5,IYT> EQ SCALE<3,IE> AND NEW.SCALE<6,IYT> EQ SCALE<4,IE> AND SCALE<2,IE> + 1 EQ NEW.SCALE<1,IYT> THEN
               SCALE<2,IE> = NEW.SCALE<2,IYT> ; CONTINUE
            END
         END
         IE += 1
         SCALE<1,IE> = NEW.SCALE<1,IYT>
         SCALE<2,IE> = NEW.SCALE<2,IYT>
         SCALE<3,IE> = NEW.SCALE<5,IYT>
         SCALE<4,IE> = NEW.SCALE<6,IYT>
      NEXT IYT

      RETURN

*************************************************************************
BUILD.SCALE.FROM.FIELDS:
*************************************************************************

      SCALE = ''

      NB.DEST = DCOUNT(R.NEW(LOT.PRO.DESTINATION),@VM)
      FOR IJK = 1 TO NB.DEST
		Y.CNT5=DCOUNT(R.NEW(LOT.PRO.RANGE.BEG)<1,IJK>,@SM)
         FOR IZE = 1 TO Y.CNT5
            NB.STEP = DCOUNT(SCALE<1>,@VM)
            IF R.NEW(LOT.PRO.RANGE.BEG)<1,IJK,IZE> GT SCALE<1,NB.STEP> THEN
               SCALE<1,NB.STEP+1> = R.NEW(LOT.PRO.RANGE.BEG)<1,IJK,IZE>
               SCALE<2,NB.STEP+1> = R.NEW(LOT.PRO.RANGE.END)<1,IJK,IZE>
               SCALE<3,NB.STEP+1> = R.NEW(LOT.PRO.RANGE.STATUS)<1,IJK,IZE>
               SCALE<4,NB.STEP+1> = R.NEW(LOT.PRO.DESTINATION)<1,IJK>
            END ELSE
               FOR IYT = 1 TO NB.STEP
                  IF R.NEW(LOT.PRO.RANGE.BEG)<1,IJK,IZE> LT SCALE<1,IYT> THEN
                     SCALE<1,IYT> = R.NEW(LOT.PRO.RANGE.BEG)<1,IJK,IZE>:@VM:SCALE<1,IYT>
                     SCALE<2,IYT> = R.NEW(LOT.PRO.RANGE.END)<1,IJK,IZE>:@VM:SCALE<2,IYT>
                     SCALE<3,IYT> = R.NEW(LOT.PRO.RANGE.STATUS)<1,IJK,IZE>:@VM:SCALE<3,IYT>
                     SCALE<4,IYT> = R.NEW(LOT.PRO.DESTINATION)<1,IJK>:@VM:SCALE<4,IYT>
                     EXIT
                  END
               NEXT IYT
            END
         NEXT IZE
      NEXT IJK
     
      RETURN

*************************************************************************
BUILD.FIELDS.FROM.SCALE:
*************************************************************************

      R.NEW(LOT.PRO.DESTINATION) = ''
      R.NEW(LOT.PRO.GEN.TRANS) = ''
      R.NEW(LOT.PRO.RANGE.BEG) = ''
      R.NEW(LOT.PRO.RANGE.END) = ''
      R.NEW(LOT.PRO.RANGE.STATUS) = ''
      NB.STEP = DCOUNT(SCALE<1>,@VM)
      FOR IYT = 1 TO NB.STEP
         LOCATE SCALE<4,IYT> IN R.NEW(LOT.PRO.DESTINATION)<1,1> SETTING FND THEN
            NB.RANGE = DCOUNT(R.NEW(LOT.PRO.RANGE.BEG)<1,FND>,@SM)
            R.NEW(LOT.PRO.RANGE.BEG)<1,FND,NB.RANGE+1> = SCALE<1,IYT>
            R.NEW(LOT.PRO.RANGE.END)<1,FND,NB.RANGE+1> = SCALE<2,IYT>
            R.NEW(LOT.PRO.RANGE.STATUS)<1,FND,NB.RANGE+1> = SCALE<3,IYT>
         END ELSE
            NB.DEST = DCOUNT(R.NEW(LOT.PRO.DESTINATION),@VM)
            IF SCALE<4,IYT> GT R.NEW(LOT.PRO.DESTINATION)<1,NB.DEST> THEN
               R.NEW(LOT.PRO.RANGE.BEG)<1,NB.DEST+1> = SCALE<1,IYT>
               R.NEW(LOT.PRO.RANGE.END)<1,NB.DEST+1> = SCALE<2,IYT>
               R.NEW(LOT.PRO.RANGE.STATUS)<1,NB.DEST+1> = SCALE<3,IYT>
               R.NEW(LOT.PRO.DESTINATION)<1,NB.DEST+1> = SCALE<4,IYT>
               R.NEW(LOT.PRO.GEN.TRANS)<1,NB.DEST+1> = ''
            END ELSE
               FOR IZE = 1 TO NB.DEST
                  IF SCALE<4,IYT> LE R.NEW(LOT.PRO.DESTINATION)<1,IZE> THEN
                     R.NEW(LOT.PRO.RANGE.BEG)<1,IZE> = SCALE<1,IYT>:@VM:R.NEW(LOT.PRO.RANGE.BEG)<1,IZE>
                     R.NEW(LOT.PRO.RANGE.END)<1,IZE> = SCALE<2,IYT>:@VM:R.NEW(LOT.PRO.RANGE.END)<1,IZE>
                     R.NEW(LOT.PRO.RANGE.STATUS)<1,IZE> = SCALE<3,IYT>:@VM:R.NEW(LOT.PRO.RANGE.STATUS)<1,IZE>
                     R.NEW(LOT.PRO.DESTINATION)<1,IZE> = SCALE<4,IYT>:@VM:R.NEW(LOT.PRO.DESTINATION)<1,IZE>
                     R.NEW(LOT.PRO.GEN.TRANS)<1,IZE> = @VM:R.NEW(LOT.PRO.GEN.TRANS)<1,IZE>
                     EXIT
                  END
               NEXT IZE
            END
         END
      NEXT IYT
      R.NEW(LOT.PRO.CHANGE.RANGE.BEG) = ''
      R.NEW(LOT.PRO.CHANGE.RANGE.END) = ''
      R.NEW(LOT.PRO.NEW.STATUS.CODE) = ''
      R.NEW(LOT.PRO.NEW.DESTINATION) = ''
      COMI = '' ; COMI.ENRI = ''

      RETURN

***********************************************************************
READ.DATA.LAYOUT:
***********************************************************************

      GOSUB READ.CFONB.LAYOUT.FILE
      IF R.CFONB.LAYOUT EQ '' THEN
         Y.LIST = 'Transaction inconnue : ':DATA.LAYOUT.ID
         RETURN
      END

      DATA.LAYOUT.ID = YR.CFONB.LAYOUT.ID
      R.DATA.LAYOUT = R.CFONB.LAYOUT

*     Extraction des conditions de compabilisation actuelles

      CALL Y.LOAD.LOTLAY(CLEAR.CCY,TXT.ER)
      IF TXT.ER THEN RETURN 

      GOSUB READ.ANNEX.LAYOUT

      RETURN

***********************************************************************
READ.ANNEX.LAYOUT:
***********************************************************************

      IEX = 0
      ANNEX.LAYOUT.ID = ''
      MAT R.ANNEX.LAYOUT = ''
      MAT R.ANNEX.RECORD = ''
	  Y.CNT4=DCOUNT(R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT>,@VM)
      FOR IJP = 1 TO Y.CNT4
         YR.CFONB.LAYOUT.ID = R.DATA.LAYOUT<CFB.LAY.LINKED.LAYOUT,IJP>
         GOSUB READ.CFONB.LAYOUT.FILE
         IF R.CFONB.LAYOUT NE '' THEN
            IEX += 1
            ANNEX.LAYOUT.ID<1,IEX> = YR.CFONB.LAYOUT.ID
            R.ANNEX.LAYOUT(IEX) = R.CFONB.LAYOUT
         END
      NEXT IJP

      RETURN

***********************************************************************
READ.CFONB.LAYOUT.FILE:
***********************************************************************

      ER = ''
	  R.CFONB.LAYOUT=''
      CALL F.READ(CFONB.LAYOUT.FILE,YR.CFONB.LAYOUT.ID,R.CFONB.LAYOUT,F.CFONB.LAYOUT,ER)

      RETURN

***********************************************************************
READ.LOT.PROCESS.CONCAT.FILE:
***********************************************************************

      ER = ''
	  R.LOT.PROCESS.CONCAT=''
      CALL F.READ(LOT.PROCESS.CONCAT.FILE,YR.LOT.PROCESS.CONCAT.ID,R.LOT.PROCESS.CONCAT,F.LOT.PROCESS.CONCAT,ER)

      RETURN

*************************************************************************
INITIALISE:
*************************************************************************

      E = '' ; TEXT = '' ; ETEXT = ''
      RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''

      CALL Y.LOAD.LOTPAR(TXT.ER)
      IF TXT.ER THEN RETURN

      I.SEP = R.LOT.PARAMETER<LOT.PAR.SEPARATOR>

      CALL Y.LOAD.LOTHEA

      CALL Y.LOAD.LOTDEF

      CALL Y.LOAD.LOTSTA(CLEAR.CCY,TXT.ER)
      IF TXT.ER THEN RETURN

      LOT.PROCESS.FILE$NAU = 'F.LOT.PROCESS$NAU'
      F.LOT.PROCESS$NAU = ''
      CALL OPF(LOT.PROCESS.FILE$NAU, F.LOT.PROCESS$NAU)

      LOT.DETAIL.FILE = 'F.LOT.DETAIL'
      F.LOT.DETAIL = ''
      CALL OPF(LOT.DETAIL.FILE, F.LOT.DETAIL)
      R.LOT.DETAIL = ''

      LOT.WORK.FILE = 'F.LOT.WORK'
      F.LOT.WORK = ''
      CALL OPF(LOT.WORK.FILE, F.LOT.WORK)
      YR.LOT.WORK.ID = ''
      R.WORK = ''

      CFONB.LAYOUT.FILE = 'F.CFONB.LAYOUT'
      F.CFONB.LAYOUT = ''
      CALL OPF(CFONB.LAYOUT.FILE, F.CFONB.LAYOUT)
      YR.CFONB.LAYOUT.ID = '' ; R.CFONB.LAYOUT = ''

      LOT.PROCESS.CONCAT.FILE = 'F.LOT.PROCESS.CONCAT'
      F.LOT.PROCESS.CONCAT = ''
      CALL OPF(LOT.PROCESS.CONCAT.FILE, F.LOT.PROCESS.CONCAT)
      YR.LOT.PROCESS.CONCAT.ID = ''
      R.LOT.PROCESS.CONCAT = ''

      RETURN
           
*************************************************************************
END         
