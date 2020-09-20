*-----------------------------------------------------------------------------
* <Rating>5820</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.STAT(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
* 31/10/2006 - First Release
*              Developed for CMB (Monaco)
*              Edgard Pignon
*
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : OPERATOR TO OPERANDS; FM, VM, SM TO @FM, @VM, @SM; VARIABLE INITIALISED; DCOUNT
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
* $INSERT I_COMMON - Not Used anymore;RY
* $INSERT I_EQUATE - Not Used anymore;METER
$INSERT I_F.LOT.FILES
$INSERT I_F.LOT.PROCESS
$INSERT I_LOTPAR
$INSERT I_LOTERR
*ZIT-UPG-R13-R19/E

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
         Y.CTR = DCOUNT(TXT.ER,@FM)FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusK = 1 TO Y.CTR
            Y.LIST<-1> = '[[[EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************
      ID.POS = 0
      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END
      ID.POS = 0
      LOCATE 'DATE.TO' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.TO = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.TO = ''
      END
      
      IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN
         EB.DataAccess.Opf.ER = 'DATE.TO > DATE.FROM'
      ENDEB.DataAccess.Opf
      IF DATE.FROM THEN
         IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
         END ELSE
     FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefFROM EQ TODAY THEN 
         EB.DataAccess.FRead DATE.TO = TODAY
            END
         END
      END
      ID.POS = 0
      LOCAEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerIELDS<1> SETTING ID.POS THEN
         N.DEB.SystemTables.setE(D.RANGE.AND.VALUE<ID.POS>)
      END ELSE
         N.DETAIL = EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer     CALL EB.REB.DataAccess.FWrite('','','','','')   ; * To reset the desktop bug

      SELECT.CMD = 'SSELECT ':LOT.CONCAT.FILE
      IFEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>5820</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.STAT(Y.LIST)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
* 31/10/2006 - First Release
*              Developed for CMB (Monaco)
*              Edgard Pignon
*
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : OPERATOR TO OPERANDS; FM, VM, SM TO @FM, @VM, @SM; VARIABLE INITIALISED; DCOUNT
*----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.FILES
$INSERT I_F.LOT.PROCESS
$INSERT I_LOTPAR
$INSERT I_LOTERR
*ZIT-UPG-R13-R19/E

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
         Y.CTR = DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.CTR
            Y.LIST<-1> = '[[[ERR[[[[[[[[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************
      ID.POS = 0
      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END
      ID.POS = 0
      LOCATE 'DATE.TO' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.TO = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.TO = ''
      END
      
      IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN
         TXT.ER = 'DATE.TO > DATE.FROM'
      END
 
      IF DATE.FROM THEN
         IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
         END ELSE
            IF DATE.FROM EQ TODAY THEN 
                DATE.TO = TODAY
            END
         END
      END
      ID.POS = 0
      LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
         N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.DETAIL = ''
      END

      CALL EB.READLIST('','','','','')   ; * To reset the desktop bug

      SELECT.CMD = 'SSELECT ':LOT.CONCAT.FILE
      IF DAFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef       EB.SystemTables.setE(EB.SystemTables.getE()SELECT.CMD : ' WITH @ID GE "':DATE.FROM:'"')
         IF DATE.TO THEN
            SELECT.CMD := ' AND @ID LE "':DATE.TO:'"'
         END
      END ELSE
         IF DATE.TO THEN
            SELECT.CMD := ' WITH @ID LE "':DATE.TO:'"'
         END
      END
      SELECT.CMD := ' BY.DSND @ID'

      ID.LIST.ALL = '' ; NB.SELECTED = '' ; SYS.ERROR = ''
      CALL EB.READLIST(SELECT.CMD,ID.LIST.ALL,'',NB.SELECTED,SYS.ERROR)
      IF ID.LIST.ALL EQ '' THEN
         TXT.ER = 'EB-LOT.NOTHING.FOUND'
         CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
      END

      RETURN

***********************************************************************
PROCESS:
***********************************************************************

      Y.CTR1 = DCOUNT(ID.LIST.ALL,@FM)
      FOR CTR = 1 TO Y.CTR1
         YR.LOT.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
         GOSUB READ.LOT.CONCAT.FILE
         IF NOT(ER) THEN
            Y.CTR2 = DCOUNT(R.LOT.CONCAT<1>,@VM)
            FOR IJK = 1 TO Y.CTR2
               YR.LOT.FILES.ID = R.LOT.CONCAT<1,IJK,1>
               GOSUB READ.LOT.FILES.FILE
               IF NOT(ER) THEN
                  DEB.LIST = YR.LOT.FILES.ID:'['
                  DEB.LIST := R.LOT.FILES<LOT.FIL.PROCESS.DATE>:'['
                  DEB.LIST := R.LOT.FILES<LOT.FIL.PROCESS.TIME>:'['
                  GOSUB PROCESS.ONE.REMIT
                  Y.CTR3 = DCOUNT(R.LOT.CONCAT<1,IJK>,@SM)
                  FOR IJT = 2 TO Y.CTR3
                     YR.LOT.FILES.ID = R.LOT.CONCAT<1,IJK,IJT>
                     GOSUB READ.LOT.FILES.FILE
                     IF NOT(ER) THEN 
                         GOSUB PROCESS.ONE.REMIT
                     END
                  NEXT IJT
               END
            NEXT IJK
         END
      NEXT CTR

*     First show the summary :

      NB.REMCODE = DCOUNT(R.SUMMARY.KEY,@FM)
      GOSUB INITIATE.THE.TOTAL
      OLD.RECORD.BEG = 'Resume ':'[[['
      FOR IUR = 1 TO NB.REMCODE
         IF R.SUMMARY.REC<IUR,2> EQ 0 THEN 
             R.SUMMARY.REC<IUR,2> = ''
         END
         IF R.SUMMARY.REC<IUR,3> EQ 0 THEN
             R.SUMMARY.REC<IUR,3> = ''
         END   
         DEBUT.RECORD = OLD.RECORD.BEG:R.SUMMARY.KEY<IUR,1>:'[[':R.SUMMARY.REC<IUR,1>:'[[':R.SUMMARY.REC<IUR,2>:'['
         IF R.SUMMARY.REC<IUR,2> OR R.SUMMARY.REC<IUR,3> THEN 
             DISP.CCY = R.SUMMARY.KEY<IUR,2> 
         END ELSE 
             DISP.CCY = ''
         END
         RECORD.LIST<-1> = DEBUT.RECORD:DISP.CCY:'[':R.SUMMARY.REC<IUR,3>:'[[[['
         BEGIN CASE
            CASE R.SUMMARY.REC<IUR,2> EQ '' AND R.SUMMARY.REC<IUR,3> EQ ''
            CASE R.SUMMARY.REC<IUR,2> GT 0 AND R.SUMMARY.REC<IUR,3> GT 0
               CR.NB.OF.REC += R.SUMMARY.REC<IUR,1>
               CR.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
               CR.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
               IF CR.CURRENCY EQ '' THEN
                  CR.CURRENCY = R.SUMMARY.KEY<IUR,2>
               END ELSE
                  IF CR.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN 
                     CR.CURRENCY = '...'
                  END
               END
            CASE R.SUMMARY.REC<IUR,2> LT 0 AND R.SUMMARY.REC<IUR,3> LT 0
               DB.NB.OF.REC += R.SUMMARY.REC<IUR,1>
               DB.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
               DB.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
               IF DB.CURRENCY EQ '' THEN
                  DB.CURRENCY = R.SUMMARY.KEY<IUR,2>
               END ELSE
                  IF DB.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN 
                     DB.CURRENCY = '...'
                  END
               END
         END CASE
         TOT.NB.OF.REC += R.SUMMARY.REC<IUR,1>
         TOT.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
         TOT.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
         IF TOT.CURRENCY EQ '' THEN
            TOT.CURRENCY = R.SUMMARY.KEY<IUR,2>
         END ELSE
            IF TOT.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN 
               TOT.CURRENCY = '...'
            END
         END
      NEXT IUR
      GOSUB WRITE.THE.TOTAL
     
*     Then detail the files contents if required

      IF N.DETAIL THEN
         NB.FILES = DCOUNT(R.FIRST.KEY,@FM)
         OLD.RECORD.BEG = ''
         FOR IUR = 1 TO NB.FILES
            RECORD.BEG = R.FIRST.KEY<IUR,1>
            IF OLD.RECORD.BEG NE RECORD.BEG THEN 
               IF OLD.RECORD.BEG THEN 
                   GOSUB WRITE.THE.TOTAL
               END
               OLD.RECORD.BEG = RECORD.BEG
               GOSUB INITIATE.THE.TOTAL
            END
            NB.REMITS = DCOUNT(R.SECOND.KEY<IUR>,@VM)
            FOR ICU = 1 TO NB.REMITS 
               RECORD.LIST<-1> = RECORD.BEG:R.FIRST.KEY<IUR,2>:'[':R.SECOND.KEY<IUR,ICU>
               TRAV.FIELD = R.SECOND.KEY<IUR,ICU>
               CHANGE '[' TO @VM IN TRAV.FIELD
               IF TRAV.FIELD<1,5> EQ '' THEN 
                    TRAV.FIELD<1,5> = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
               END
               IF TRAV.FIELD<1,4> EQ 0 THEN 
                    TRAV.FIELD<1,4> = ''
               END
               IF TRAV.FIELD<1,6> EQ 0 THEN 
                    TRAV.FIELD<1,6> = ''
               END
               BEGIN CASE
                  CASE TRAV.FIELD<1,4> EQ '' AND TRAV.FIELD<1,6> EQ ''
                  CASE TRAV.FIELD<1,4> GT 0 AND TRAV.FIELD<1,6> GT 0
                     CR.NB.OF.REC += TRAV.FIELD<1,2>
                     CR.NOSTRO.AMT.FCY += TRAV.FIELD<1,4>
                     CR.NOSTRO.AMT.LCY += TRAV.FIELD<1,6>
                     IF CR.CURRENCY EQ '' THEN
                        CR.CURRENCY = TRAV.FIELD<1,5>
                     END ELSE
                        IF CR.CURRENCY NE TRAV.FIELD<1,5> THEN 
                           CR.CURRENCY = '...'
                        END
                     END
                  CASE TRAV.FIELD<1,4> LT 0 AND TRAV.FIELD<1,6> LT 0
                     DB.NB.OF.REC += TRAV.FIELD<1,2>
                     DB.NOSTRO.AMT.FCY += TRAV.FIELD<1,4>
                     DB.NOSTRO.AMT.LCY += TRAV.FIELD<1,6>
                     IF DB.CURRENCY EQ '' THEN
                        DB.CURRENCY = TRAV.FIELD<1,5>
                     END ELSE
                        IF DB.CURRENCY NE TRAV.FIELD<1,5> THEN 
                           DB.CURRENCY = '...'
                        END
                     END
               END CASE
               TOT.NB.OF.REC += TRAV.FIELD<1,2>
               TOT.NOSTRO.AMT.FCY += TRAV.FIELD<1,4>
               TOT.NOSTRO.AMT.LCY += TRAV.FIELD<1,6>
               IF TOT.CURRENCY EQ '' THEN
                  TOT.CURRENCY = TRAV.FIELD<1,5>
               END ELSE
                  IF TOT.CURRENCY NE TRAV.FIELD<1,5> THEN 
                     TOT.CURRENCY = '...'
                  END
               END
            NEXT ICU
         NEXT IUR
         GOSUB WRITE.THE.TOTAL
      END

      IF RECORD.LIST EQ '' THEN
          TXT.ER = 'NO INWARD FILE WITHIN SELECTION'
      END
      RETURN

***********************************************************************
PROCESS.ONE.REMIT:
***********************************************************************

      DEB.SUIT = YR.LOT.FILES.ID:'['
      Y.CTR4 = DCOUNT(R.LOT.FILES<LOT.FIL.REM.HEADER>,@VM)
      FOR IJL = 1 TO Y.CTR4
         NOSTRO.ACCT.NO = '' ; NOSTRO.VALUE.DATE = '' ; NOSTRO.BOOKING.DATE = ''
         NOSTRO.CURRENCY = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
         NOSTRO.TRANS.REF = ''; NOSTRO.OUR.REF = ''
         REMIT.CODE = R.LOT.FILES<LOT.FIL.CFONB.LAYOUT,IJL>
         NB.OF.REC = R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,IJL>
         NOSTRO.AMT.FCY = R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,IJL,1> 
         NOSTRO.AMT.LCY = R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,IJL,2> 
         IF NOSTRO.AMT.LCY EQ '' THEN 
             NOSTRO.AMT.LCY = R.LOT.FILES<LOT.FIL.FOUND.AMOUNT,IJL,1> 
         END
         IF N.DETAIL THEN
            IF NOSTRO.AMT.FCY OR NOSTRO.AMT.LCY THEN
               IF R.LOT.FILES<LOT.FIL.REM.STMT.NOS,IJL> THEN
                  N.ENTRY.ROOT = R.LOT.FILES<LOT.FIL.REM.STMT.NOS,IJL,1>
                  N.ENTRY.BEG = FIELD(R.LOT.FILES<LOT.FIL.REM.STMT.NOS,IJL,2>,"-",1)
                  N.ENTRY.END = FIELD(R.LOT.FILES<LOT.FIL.REM.STMT.NOS,IJL,2>,"-",2)
                  IF N.ENTRY.END EQ '' THEN 
                      N.ENTRY.END = N.ENTRY.BEG
                  END
                  FOR CUR = N.ENTRY.BEG TO N.ENTRY.END
                     YR.STMT.ENTRY.ID = N.ENTRY.ROOT:FMT(CUR,'4"0"R')
                     ER = '' ; STMT.REC = ''
                     CALL F.READ(FN.STMT.ENTRY,YR.STMT.ENTRY.ID,STMT.REC,F.STMT.ENTRY,ER)
                     IF NOT(ER) THEN 
                        IF STMT.REC<AC.STE.AMOUNT.FCY> EQ NOSTRO.AMT.FCY OR STMT.REC<AC.STE.AMOUNT.LCY> EQ  NOSTRO.AMT.LCY THEN
                           NOSTRO.ACCT.NO = STMT.REC<AC.STE.ACCOUNT.NUMBER>
                           NOSTRO.VALUE.DATE = STMT.REC<AC.STE.VALUE.DATE>
                           NOSTRO.BOOKING.DATE = STMT.REC<AC.STE.BOOKING.DATE>
                           NOSTRO.AMT.FCY = STMT.REC<AC.STE.AMOUNT.FCY>
                           NOSTRO.AMT.LCY = STMT.REC<AC.STE.AMOUNT.LCY>
                           NOSTRO.CURRENCY = STMT.REC<AC.STE.CURRENCY>
                           NOSTRO.TRANS.REF = STMT.REC<AC.STE.TRANS.REFERENCE>
                           NOSTRO.OUR.REF = STMT.REC<AC.STE.OUR.REFERENCE>
                           IF NOSTRO.OUR.REF EQ NOSTRO.TRANS.REF THEN 
                               NOSTRO.OUR.REF = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,IJL>
                           END
                           EXIT
                        END
                     END
                  NEXT CUR
                  IF NOSTRO.ACCT.NO EQ '' OR NOSTRO.ACCT.NO MATCH '3A9N' THEN
                     NOSTRO.TRANS.REF = R.LOT.FILES<LOT.FIL.REM.COMMENT,IJL,1>
                     DETAIL.ID = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,IJL>
                     GOSUB READ.LOT.PROCESS.CONCAT.FILE
                     IF NOT(ER) THEN
                        Y.CTR5 = DCOUNT(R.LOT.PROCESS.CONCAT,@FM)
                        FOR IJZ = 1 TO Y.CTR5
                           YR.LOT.PROCESS.ID = R.LOT.PROCESS.CONCAT<IJZ>
                           GOSUB READ.LOT.PROCESS.FILE
                           IF ER THEN 
                               GOSUB READ.LOT.PROCESS.FILE$NAU
                           END
                           IF R.LOT.PROCESS THEN
                              BEGIN CASE 
                                 CASE NOSTRO.AMT.FCY GT 0 OR NOSTRO.AMT.LCY GT 0 
                                    NOSTRO.ACCT.NO = R.LOT.PROCESS<LOT.PRO.CREDIT.ACCT.NO>
                                    NOSTRO.CURRENCY = R.LOT.PROCESS<LOT.PRO.CREDIT.CURRENCY>
                                    NOSTRO.VALUE.DATE = R.LOT.PROCESS<LOT.PRO.CREDIT.VALUE.DATE>
                                    NOSTRO.TRANS.REF = R.LOT.PROCESS<LOT.PRO.CREDIT.THEIR.REF>
                                 CASE NOSTRO.AMT.FCY LT 0 OR NOSTRO.AMT.LCY LT 0 
                                    NOSTRO.ACCT.NO = R.LOT.PROCESS<LOT.PRO.DEBIT.ACCT.NO>
                                    NOSTRO.CURRENCY = R.LOT.PROCESS<LOT.PRO.DEBIT.CURRENCY>
                                    NOSTRO.VALUE.DATE = R.LOT.PROCESS<LOT.PRO.DEBIT.VALUE.DATE>
                                    NOSTRO.TRANS.REF = R.LOT.PROCESS<LOT.PRO.DEBIT.THEIR.REF>
                              END CASE
                              NOSTRO.OUR.REF = YR.LOT.PROCESS.ID
                            END
                           IF NOSTRO.ACCT.NO THEN
                               EXIT
                           END
                        NEXT IJZ
                     END
                  END
               END
            END
         END 
         GOSUB STORE.ONE.LINE
      NEXT IJL

      RETURN

***********************************************************************
INITIATE.THE.TOTAL:
***********************************************************************

      CR.CURRENCY = ''
      DB.CURRENCY = ''
      TOT.CURRENCY = ''
      CR.NB.OF.REC = 0
      DB.NB.OF.REC = 0
      TOT.NB.OF.REC = 0
      CR.NOSTRO.AMT.FCY = 0
      DB.NOSTRO.AMT.FCY = 0
      TOT.NOSTRO.AMT.FCY = 0
      CR.NOSTRO.AMT.LCY = 0
      DB.NOSTRO.AMT.LCY = 0
      TOT.NOSTRO.AMT.FCY = 0

      RETURN

***********************************************************************
WRITE.THE.TOTAL:
***********************************************************************

      IF TOT.NB.OF.REC THEN
         RECORD.LIST<-1> = OLD.RECORD.BEG:'[[[[[[[[[['
         IF CR.NB.OF.REC THEN
            IF CR.CURRENCY EQ '...' THEN
               IF CR.NOSTRO.AMT.LCY EQ 0 THEN 
                   CR.NOSTRO.AMT.LCY = ''
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TCR[[':CR.NB.OF.REC:'[[':CR.NOSTRO.AMT.LCY:'[':LCCY:'[[[[['
            END ELSE
               IF CR.NOSTRO.AMT.FCY EQ 0 THEN 
                   CR.NOSTRO.AMT.FCY = ''
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TCR[[':CR.NB.OF.REC:'[[':CR.NOSTRO.AMT.FCY:'[':CR.CURRENCY:'[[[[['
            END
         END
         IF DB.NB.OF.REC THEN
            IF DB.CURRENCY EQ '...' THEN
               IF DB.NOSTRO.AMT.LCY EQ 0 THEN 
                   DB.NOSTRO.AMT.LCY = ''
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TDB[[':DB.NB.OF.REC:'[[':DB.NOSTRO.AMT.LCY:'[':LCCY:'[[[[['
            END ELSE
               IF DB.NOSTRO.AMT.FCY EQ 0 THEN 
                   DB.NOSTRO.AMT.FCY = ''
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TDB[[':DB.NB.OF.REC:'[[':DB.NOSTRO.AMT.FCY:'[':DB.CURRENCY:'[[[[['
            END
         END
         IF TOT.NB.OF.REC NE DB.NB.OF.REC + CR.NB.OF.REC OR (DB.NB.OF.REC AND CR.NB.OF.REC) THEN
            IF TOT.CURRENCY EQ '...' THEN
               IF TOT.NOSTRO.AMT.LCY NE 0 THEN 
                   DISP.CCY = LCCY 
               END ELSE 
                   TOT.NOSTRO.AMT.LCY = '' ; 
                   DISP.CCY = ''  
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TOT[[':TOT.NB.OF.REC:'[[':TOT.NOSTRO.AMT.LCY:'[':DISP.CCY:'[[[[['
            END ELSE
               IF TOT.NOSTRO.AMT.FCY NE 0 THEN 
                   DISP.CCY = TOT.CURRENCY 
               END ELSE 
                   TOT.NOSTRO.AMT.FCY = '' ; 
                   DISP.CCY = ''
               END
               RECORD.LIST<-1> = OLD.RECORD.BEG:'TOT[[':TOT.NB.OF.REC:'[[':TOT.NOSTRO.AMT.FCY:'[':DISP.CCY:'[[[[['
            END
         END
      END

      RETURN
***********************************************************************
STORE.ONE.LINE:
***********************************************************************

      IF N.DETAIL THEN
         FIRST.KEY = DEB.LIST:@VM:REMIT.CODE:@VM:NOSTRO.CURRENCY
         FOLLOW.LIST = DEB.SUIT:NB.OF.REC:'[':NOSTRO.ACCT.NO:'[':NOSTRO.AMT.FCY:'['
         IF NOSTRO.AMT.FCY OR NOSTRO.AMT.LCY THEN 
             DISP.CURRENCY = NOSTRO.CURRENCY  
         END ELSE 
             DISP.CURRENCY = ''
         END
         FOLLOW.LIST := DISP.CURRENCY:'[':NOSTRO.AMT.LCY:'[':NOSTRO.VALUE.DATE:'[':NOSTRO.BOOKING.DATE:'['
         SECOND.KEY = FOLLOW.LIST:NOSTRO.TRANS.REF:'[':NOSTRO.OUR.REF
      END 
      GOSUB SORT.ONE.LINE

      RETURN

***********************************************************************
SORT.ONE.LINE:
***********************************************************************

     IF N.DETAIL THEN
        IF R.FIRST.KEY EQ '' THEN
           R.FIRST.KEY = FIRST.KEY
           R.SECOND.KEY = SECOND.KEY
        END ELSE
           FOU = 0
           LOCATE FIRST.KEY IN R.FIRST.KEY<1> SETTING FOU THEN
              R.SECOND.KEY<FOU,-1> = SECOND.KEY
           END ELSE
              NB.KEY = DCOUNT(R.FIRST.KEY,@FM)
              IF FIRST.KEY GT R.FIRST.KEY<NB.KEY> THEN
                 R.FIRST.KEY<NB.KEY+1> = FIRST.KEY
                 R.SECOND.KEY<NB.KEY+1> = SECOND.KEY
              END ELSE
                 FOR IHA = 1 TO NB.KEY
                    IF R.FIRST.KEY<IHA> GT FIRST.KEY THEN
                       R.FIRST.KEY<IHA> = FIRST.KEY:@FM:R.FIRST.KEY<IHA>
                       R.SECOND.KEY<IHA> = SECOND.KEY:@FM:R.SECOND.KEY<IHA>
                       EXIT
                    END
                 NEXT IHA
              END
           END
        END
     END
     GOSUB BUILD.SUMMARY

     RETURN

***********************************************************************
BUILD.SUMMARY:
***********************************************************************

     SUMMARY.KEY = REMIT.CODE:@VM:NOSTRO.CURRENCY
     IF R.SUMMARY.REC EQ '' THEN
        R.SUMMARY.KEY = SUMMARY.KEY
        R.SUMMARY.REC<1,1> = NB.OF.REC
        R.SUMMARY.REC<1,2> = NOSTRO.AMT.FCY
        R.SUMMARY.REC<1,3> = NOSTRO.AMT.LCY
     END ELSE
        FOU = 0
        LOCATE SUMMARY.KEY IN R.SUMMARY.KEY<1> SETTING FOU THEN
           R.SUMMARY.REC<FOU,1> += NB.OF.REC
           R.SUMMARY.REC<FOU,2> += NOSTRO.AMT.FCY
           R.SUMMARY.REC<FOU,3> += NOSTRO.AMT.LCY
        END ELSE
           NB.KEY = DCOUNT(R.SUMMARY.KEY,@FM)
           IF SUMMARY.KEY GT R.SUMMARY.KEY<NB.KEY> THEN
              R.SUMMARY.KEY<NB.KEY+1> = SUMMARY.KEY
              R.SUMMARY.REC<NB.KEY+1,1> = NB.OF.REC
              R.SUMMARY.REC<NB.KEY+1,2> = NOSTRO.AMT.FCY
              R.SUMMARY.REC<NB.KEY+1,3> = NOSTRO.AMT.LCY
           END ELSE
              FOR IHA = 1 TO NB.KEY
                 IF R.SUMMARY.KEY<IHA> GT SUMMARY.KEY THEN
                    R.SUMMARY.KEY<IHA> = SUMMARY.KEY:@FM:R.SUMMARY.KEY<IHA>
                    R.SUMMARY.REC<IHA> = NB.OF.REC:@VM:NOSTRO.AMT.FCY:@VM:NOSTRO.AMT.LCY:@FM:R.SUMMARY.REC<IHA>
                    EXIT
                 END
              NEXT IHA
           END
        END
     END

     RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      REC.DATA = '' ; REC.KEY = ''
      RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''
      R.SUMMARY.KEY = '' ; R.SUMMARY.REC = ''
      R.FIRST.KEY = '' ; R.SECOND.KEY = ''

      CALL Y.LOAD.LOTPAR(N.ERR)
      IF N.ERR THEN
          RETURN
      END

      FN.STMT.ENTRY = 'F.STMT.ENTRY'
      F.STMT.ENTRY = ''
      CALL OPF(FN.STMT.ENTRY, F.STMT.ENTRY)
      YR.STMT.ENTRY.ID = ''
      R.STMT.ENTRY = ''

      LOT.CONCAT.FILE = 'F.LOT.CONCAT'
      F.LOT.CONCAT = ''
      CALL OPF(LOT.CONCAT.FILE, F.LOT.CONCAT)
      YR.LOT.CONCAT.ID = ''
      R.LOT.CONCAT = ''

      LOT.PROCESS.CONCAT.FILE = 'F.LOT.PROCESS.CONCAT'
      F.LOT.PROCESS.CONCAT = ''
      CALL OPF(LOT.PROCESS.CONCAT.FILE, F.LOT.PROCESS.CONCAT)
      DETAIL.ID = ''
      R.LOT.PROCESS.CONCAT = ''

      LOT.PROCESS.FILE = 'F.LOT.PROCESS'
      F.LOT.PROCESS = ''
      CALL OPF(LOT.PROCESS.FILE, F.LOT.PROCESS)

      LOT.PROCESS.FILE$NAU = 'F.LOT.PROCESS$NAU'
      F.LOT.PROCESS$NAU = ''
      CALL OPF(LOT.PROCESS.FILE$NAU, F.LOT.PROCESS$NAU)
      YR.LOT.PROCESS.ID = ''
      R.LOT.PROCESS = ''

      LOT.FILES.FILE = 'F.LOT.FILES'
      F.LOT.FILES = ''
      CALL OPF(LOT.FILES.FILE, F.LOT.FILES)
      YR.LOT.FILES.ID = ''
      R.LOT.FILES = ''

      RETURN

READ.LOT.PROCESS.FILE:

      ER = ''
      CALL F.READ(LOT.PROCESS.FILE,YR.LOT.PROCESS.ID,R.LOT.PROCESS,F.LOT.PROCESS,ER)

      RETURN

READ.LOT.PROCESS.FILE$NAU:

      ER = ''
      CALL F.READ(LOT.PROCESS.FILE$NAU,YR.LOT.PROCESS.ID,R.LOT.PROCESS,F.LOT.PROCESS$NAU,ER)

      RETURN

READ.LOT.CONCAT.FILE:

      ER = ''
      CALL F.READ(LOT.CONCAT.FILE,YR.LOT.CONCAT.ID,R.LOT.CONCAT,F.LOT.CONCAT,ER)

      RETURN

READ.LOT.PROCESS.CONCAT.FILE:

      ER = ''
      CALL F.READ(LOT.PROCESS.CONCAT.FILE,DETAIL.ID,R.LOT.PROCESS.CONCAT,F.LOT.PROCESS.CONCAT,ER)

      RETURN

READ.LOT.FILES.FILE:

      ER = ''
      CALL F.READ(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES,F.LOT.FILES,ER)

      RETURN
*-----------------------------------------------------------------------
   END
