*
*-----------------------------------------------------------------------------
* <Rating>1403</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.VIEW.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :EXITED DCOUNT;FM,VM TO @FM,@VM;OPERATIONS TO OPERANDS
*-------------------------------------------------------
* Automatic proposal for a connex operation to follow up a given one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
      END

      IF TXT.ER THEN
	  Y.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CNT1 
            Y.LIST<-1> = '[':TXT.ER<IJK>
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      REEB.SystemTables.getVFunction() 
**************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus******************
PROCESS.EXTRACT:
********FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus************************************************   
    
      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

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

      YR.EB.DataAccess.OpfNB.LAYOUT.ID = 'INWARD.':CD.LAYOUT.ID
      GOSEB.DataAccess.OpfREAD.DATA.LAYOUT
      IF TXT.ER THEN RETURN

*     Display of the line decomposition

      IHH = FIELD(EB.SystemTables.getRNew()IFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef   GOSUB PROCESS.ONE.LINE

      REB.DataAccess.FRead

*************************************************************************
PROCESS.ONE.LINE:
*********EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer**********************************************

      LOT.EB.SystemTables.setE(IHH/R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>)
      LOT.DETAIL.NUMEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerL.NUMEB.SystemTables.getIdNew()
      IF LOT.DETAIL.NUM LE 1 THEN LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID ELSE LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID:'.':LOT.DETAIL.NUM

      R.LOT.DETEB.DataAccess.FWrite' ; ER = ''
      CALL F.READ(LOT.DETAIL.FILE,LOT.DETAIL.KEY,R.LOT.DETAIL,F.LOT.DETAIL,ER)
      IF ER THEN
        EB.SystemTables.setAf()*
*-----------------------------------------------------------------------------
* <Rating>1403</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.VIEW.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :EXITED DCOUNT;FM,VM TO @FM,@VM;OPERATIONS TO OPERANDS
*-------------------------------------------------------
* Automatic proposal for a connex operation to follow up a given one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
      END

      IF TXT.ER THEN
	  Y.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CNT1 
            Y.LIST<-1> = '[':TXT.ER<IJK>
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   
    
      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

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
      IF ER THEN
         N.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefETAIL.MISSING.LINE':@FM:IHH
        EB.SystemTables.setE()*
*-----------------------------------------------------------------------------
* <Rating>1403</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
  SUBROUTINE LOT.VIEW.LINE.DETAIL(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :EXITED DCOUNT;FM,VM TO @FM,@VM;OPERATIONS TO OPERANDS
*-------------------------------------------------------
* Automatic proposal for a connex operation to follow up a given one
  
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DE.MESSAGE
$INSERT I_F.COMPANY
$INSERT I_F.CFONB.LAYOUT
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.DESTINATION
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB PROCESS.EXTRACT
      END

      IF TXT.ER THEN
	  Y.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CNT1 
            Y.LIST<-1> = '[':TXT.ER<IJK>
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN
     
*************************************************************************
PROCESS.EXTRACT:
*************************************************************************   
    
      LOCATE 'LINE.ID' IN D.FIELDS<1> SETTING ID.POS
         THEN LINE.ID = D.RANGE.AND.VALUE<ID.POS>
         ELSE TXT.ER = 'Operation non identifiee' ; RETURN

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
      IF ER THEN
         N.ERR = 'EB-LOT.DETAIL.MISSING.LINE':@FM:IHH
         CALL LOT.TRANSLATE.ERROR(N.ERR,'') ; RETURN
      END

      IHH.REL = IHH - (LOT.DETAIL.NUM-1)*R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>

      LOT.DETAIL.FIELDS = R.LOT.DETAIL<3*IHH.REL-2>
      DET.STATUS.CODE = FIELD(LOT.DETAIL.FIELDS,I.SEP,1)
      DET.DESTINATION = FIELD(LOT.DETAIL.FIELDS,I.SEP,2)

      EXT.STATUS = ''
      EXT.APPL = '' ; EXT.LIVE = ''
      EXT.KEY = R.LOT.DETAIL<3*IHH.REL>
      GOSUB FIND.APPLICATION

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

      DEB.LIGNE = EXT.KEY:'[':EXT.APPL:'[':EXT.VERSION:'[':EXT.ACTION:'[':EXT.LIVE:'[':EXT.STATUS

      RECORD.LIST<-1> = DEB.LIGNE:'[(':CD.LAYOUT.ID:') : ':R.DATA.LAYOUT<CFB.LAY.DESCRIPTION,1> 

      RECORD.LIST<-1> = DEB.LIGNE:'[ '
      RECORD.LIST<-1> = DEB.LIGNE:'[Ligne de detail ':LINE.ID
      RECORD.LIST<-1> = DEB.LIGNE:'[-----------------------------------------------------'
      RECORD.LIST<-1> = DEB.LIGNE:'[Code statut              : ':DET.STATUS.CODE
      RECORD.LIST<-1> = DEB.LIGNE:'[Destination              : ':DET.DESTINATION 
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
FIND.APPLICATION:
***********************************************************************

      EXT.APPL = '' ; EXT.VERSION = '' ; EXT.ACTION = ' S '

      R.LOT.DESTINATION = '' ; ER = '' ; SW.ENFORCE = ''

      IF DET.DESTINATION THEN
         CALL F.READ(LOT.DESTINATION.FILE,DET.DESTINATION,R.LOT.DESTINATION,F.LOT.DESTINATION,ER)
         EXT.APPL = R.LOT.DESTINATION<LOT.DES.APPLICATION.DEST>
         IF FIELD(EXT.APPL,",",2) THEN EXT.VERSION = ',':FIELD(EXT.APPL,",",2)
         EXT.APPL = FIELD(EXT.APPL,",",1)
      END

      BEGIN CASE
         CASE DET.DESTINATION[1,3] EQ 'SIT'
            EXT.APPL = 'SIT.OUTWARD.CLEARING'
            EXT.VERSION = ','
         CASE EXT.KEY MATCH "'FT'5N0X"
            IF EXT.APPL NE 'FUNDS.TRANSFER' AND R.LOT.DESTINATION<LOT.DES.LINKED.FT.VERSION> THEN
               EXT.VERSION = ',':FIELD(R.LOT.DESTINATION<LOT.DES.LINKED.FT.VERSION>,',',2)
            END 
            EXT.APPL = 'FUNDS.TRANSFER' ; GOSUB ADD.STATUS
         CASE EXT.KEY MATCH "'LOT'5N0X"
            EXT.APPL = 'LOT.PROCESS' ; GOSUB ADD.STATUS
         CASE EXT.APPL MATCH "'FUP'5N0X"
            EXT.APPL = 'SIT.FOLLOW.UP' ; GOSUB ADD.STATUS
         CASE EXT.KEY MATCH "'LD'5N0N"
            EXT.APPL = 'LD.LOANS.AND.DEPOSITS' ; GOSUB ADD.STATUS
         CASE NUM(FIELD(EXT.KEY<1,1>,".",1)) AND NUM(FIELD(EXT.KEY<1,1>,".",2)) AND COUNT(EXT.KEY,".") EQ 1
            EXT.KEY = EXT.KEY<1,1>
            EXT.APPL = 'EB.ACCOUNTING'
            EXT.VERSION = '' ; EXT.ACTION = ''
         CASE EXT.APPL EQ 'EB.ACCOUNTING'
            EXT.KEY = EXT.KEY<1,1>
            EXT.VERSION = '' ; EXT.ACTION = ''
         CASE 1
            IF EXT.VERSION EQ '' THEN EXT.VERSION = ','
      END CASE

      IF EXT.VERSION NE '' THEN GOSUB CHECK.VERSION

      RETURN

***********************************************************************
ADD.STATUS:
***********************************************************************

      CALL Y.LOT.READ.APPLICATION(EXT.KEY,APPL.REC,EXT.STATUS,EXT.LIVE,N.ERR)
      IF EXT.VERSION EQ '' THEN EXT.VERSION = ','
      BEGIN CASE
         CASE EXT.STATUS[2,3] EQ 'HLD' 
            EXT.ACTION = ' I '
         CASE EXT.STATUS[2,2] EQ 'NA' 
            EXT.ACTION = ' A '
      END CASE
      
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

*     CALL Y.LOAD.LOTLAY(CLEAR.CCY,TXT.ER)
*     IF TXT.ER THEN RETURN 

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
CHECK.VERSION:
***********************************************************************

      VERSION.FILE = 'F.VERSION' ; F.VERSION = ''
      CALL OPF(VERSION.FILE, F.VERSION)
      ER = '' ; R.VERS = ''
      CALL F.READ(VERSION.FILE,EXT.APPL:EXT.VERSION,R.VERS,F.VERSION,ER)
      IF ER THEN EXT.VERSION = ''

      RETURN

***********************************************************************
READ.CFONB.LAYOUT.FILE:
***********************************************************************

      ER = ''
      CALL F.READ(CFONB.LAYOUT.FILE,YR.CFONB.LAYOUT.ID,R.CFONB.LAYOUT,F.CFONB.LAYOUT,ER)

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

      LOT.DETAIL.FILE = 'F.LOT.DETAIL'
      F.LOT.DETAIL = ''
      CALL OPF(LOT.DETAIL.FILE, F.LOT.DETAIL)

      CFONB.LAYOUT.FILE = 'F.CFONB.LAYOUT'
      F.CFONB.LAYOUT = ''
      CALL OPF(CFONB.LAYOUT.FILE, F.CFONB.LAYOUT)
      YR.CFONB.LAYOUT.ID = '' ; R.CFONB.LAYOUT = ''

      LOT.DESTINATION.FILE = 'F.LOT.DESTINATION'
      F.LOT.DESTINATION = ''
      CALL OPF(LOT.DESTINATION.FILE, F.LOT.DESTINATION)
      
      RETURN
           
*************************************************************************
END         
