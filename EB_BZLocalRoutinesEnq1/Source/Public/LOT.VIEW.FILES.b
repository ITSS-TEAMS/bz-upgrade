*-----------------------------------------------------------------------------
* <Rating>3538</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.FILES(Y.LIST)
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
* 19/06/1998 - First Release
*              Developed for cmb (Monaco)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM TO @FM,@VM
*				  :CONVERT TO CHANGE
*-------------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
* $INSERT I_COMMON - Not Used anymore;S
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;---

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IFEB.SystemTables.getVFunction()EN
	  T.CNT1=DCOUNT(TXT.ER,@FM)
       FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT.CNT1
            Y.LIST<-1> = '[[[[[0[[':TXFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus       NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END

      LOCATE 'DATE.TO' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.TO = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.TO = ''
      END

      IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN
         TXT.ER = 'DATE.TO > DATE.FROM'
      ENDEB.DataAccess.Opf
      IEB.DataAccess.OpfATE.FROM THEN
         IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
         END ELSE
            IF DATEB.SystemTables.getRNew()MFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefDATE.TO = TODAY
         END
      ENDEB.DataAccess.FRead    LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.FEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer END
EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>3538</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.FILES(Y.LIST)
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
* 19/06/1998 - First Release
*              Developed for cmb (Monaco)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM TO @FM,@VM
*				  :CONVERT TO CHANGE
*-------------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  T.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO T.CNT1
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END

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
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY
         END
      END

      LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.FILE.ID = ''
      END

      N.FILE.NAME.OPEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.NEB.DataAccess.FWrite.RANGE.AND.VALUE<ID.POS>
         IF COUNT(N.FILE.NAME,"...") GT 0 THEN
            N.FILE.NAME.OPER = 'Y'
*            CONVERT '...' TO '' IN N.FFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefANGE '...' TO '' IN N.FILE.NAME
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>3538</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.FILES(Y.LIST)
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
* 19/06/1998 - First Release
*              Developed for cmb (Monaco)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM TO @FM,@VM
*				  :CONVERT TO CHANGE
*-------------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  T.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO T.CNT1
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END

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
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY
         END
      END

      LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.FILE.ID = ''
      END

      N.FILE.NAME.OPER = ''
      LOCATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
         IF COUNT(N.FILE.NAME,"...") GT 0 THEN
            N.FILE.NAME.OPER = 'Y'
*            CONVERT '...' TO '' IN N.FFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefANGE '...' TO '' IN N.FILE.NAME
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>3538</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.FILES(Y.LIST)
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
* 19/06/1998 - First Release
*              Developed for cmb (Monaco)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :OPERATIONS TO OPERANDS;EXITED DCOUNT FROM FOR LOOP;FM,VM TO @FM,@VM
*				  :CONVERT TO CHANGE
*-------------------------------------------------------
$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA

*---- Main processing section ----

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  T.CNT1=DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO T.CNT1
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.FROM = ''
      END

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
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY
         END
      END

      LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.FILE.ID = ''
      END

      N.FILE.NAME.OPER = ''
      LOCATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
         IF COUNT(N.FILE.NAME,"...") GT 0 THEN
            N.FILE.NAME.OPER = 'Y'
*            CONVERT '...' TO '' IN N.FILE.NAME
			CHANGE '...' TO '' IN N.FILE.NAME
         END
      END ELSE
         N.FILE.NAME = ''
      END

      LOCATE 'STATUS' IN D.FIELDS<1> SETTING ID.POS THEN
         N.STATUS = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.STATUS = ''
      END

      IF N.STATUS NE '' THEN
         BEGIN CASE
            CASE N.STATUS EQ 'ALL' ;* Full content of files with status set
            CASE N.STATUS EQ 'ONLY' ;* Only the lines with a status
            CASE N.STATUS EQ 'ERROR' ;* Only the lines with an error status
            CASE N.STATUS EQ 'OVERRIDE' ;* Only the lines with an override status
            CASE 1 ;* Only the lines associated with the given status
               LOCATE N.STATUS IN STA.STATUS.ID<1> SETTING FND ELSE
                  TXT.ER = 'EB-LOT.UNKNOWN.STATUS':@FM:N.STATUS
                  CALL LOT.TRANSLATE.ERROR(TXT.ER,'') ; RETURN
               END
         END CASE
      END

      CALL EB.READLIST('','','','','')   ; * To reset the desktop bug

      SELECT.CMD = 'SSELECT ':LOT.CONCAT.FILE
      IF DATE.FROM THEN
         SELECT.CMD := ' WITH @ID GE "':DATE.FROM:'"'
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
		Y.CNT2=DCOUNT(ID.LIST.ALL,@FM)
      FOR CTR = 1 TO Y.CNT2
         YR.LOT.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
         GOSUB READ.LOT.CONCAT.FILE
         IF NOT(ER) THEN
		 Y.CNT3=DCOUNT(R.LOT.CONCAT<1>,@VM)
            FOR IJK = 1 TO Y.CNT3
               FILE.RECORD.LIST = ''
               IF N.STATUS NE '' THEN FILE.STATUS.OK = '' ELSE FILE.STATUS.OK = 'Y' 
               YR.LOT.FILES.ID = R.LOT.CONCAT<1,IJK,1>
               IF N.FILE.ID AND N.FILE.ID NE YR.LOT.FILES.ID THEN CONTINUE 
               GOSUB READ.LOT.FILES.FILE
               IF NOT(ER) THEN
                  IF N.FILE.NAME THEN
                     V.FILE.NAME = R.LOT.FILES<LOT.FIL.FILE.NAME>
                     IF N.FILE.NAME.OPER EQ 'Y' THEN
*                        CONVERT N.FILE.NAME TO '#' IN V.FILE.NAME
						CHANGE N.FILE.NAME TO '#' IN V.FILE.NAME
                        IF COUNT(V.FILE.NAME,"#") GT 0 ELSE CONTINUE
                     END ELSE                        
                        IF N.FILE.NAME NE V.FILE.NAME THEN CONTINUE
                     END
                  END
                  DEB.LIST = R.LOT.FILES<LOT.FIL.FILE.NAME>:'['
                  DEB.LIST := R.LOT.FILES<LOT.FIL.PROCESS.DATE>:'['
                  DEB.LIST := R.LOT.FILES<LOT.FIL.PROCESS.TIME>:'['
                  DEB.SUIT = YR.LOT.FILES.ID:'['
                  IF R.LOT.FILES<LOT.FIL.FILE.HEADER> NE '' THEN
                     MSG.ERR = 'EB-LOT.FILE.HEADER'
                     CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                     FILE.RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:MSG.ERR:'[0[[':R.LOT.FILES<LOT.FIL.FILE.HEADER>:'['
                  END
                  GOSUB PROCESS.ONE.REMIT
				  Y.CNT4=DCOUNT(R.LOT.CONCAT<1,IJK>,@SM)
                  FOR IJT = 2 TO Y.CNT4
                     YR.LOT.FILES.ID = R.LOT.CONCAT<1,IJK,IJT>
                     GOSUB READ.LOT.FILES.FILE
                     IF NOT(ER) THEN
                        DEB.SUIT = YR.LOT.FILES.ID:'['
                        GOSUB PROCESS.ONE.REMIT
                     END
                  NEXT IJT
                  IF R.LOT.FILES<LOT.FIL.FILE.TRAILER> NE '' THEN
                     MSG.ERR = 'EB-LOT.FILE.TRAILER'
                     CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                     FILE.RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:MSG.ERR:'[0[[':R.LOT.FILES<LOT.FIL.FILE.TRAILER>:'['
                  END
                  IF FILE.STATUS.OK EQ 'Y' THEN RECORD.LIST<-1> = FILE.RECORD.LIST
               END
            NEXT IJK
         END
      NEXT CTR

      IF RECORD.LIST EQ '' THEN
         TXT.ER = 'EB-LOT.NOTHING.FOUND'
         CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
      END

      RETURN

***********************************************************************
PROCESS.ONE.REMIT:
***********************************************************************
		Y.CNT5=DCOUNT(R.LOT.FILES<LOT.FIL.CFONB.LAYOUT>,@VM)
      FOR IJL = 1 TO Y.CNT5
         REM.RECORD.LIST = ''
         IF N.STATUS NE '' THEN REM.STATUS.OK = '' ELSE REM.STATUS.OK = 'Y' 
         REM.RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'En-tete de remise':'[0[[':R.LOT.FILES<LOT.FIL.REM.HEADER,IJL>:'['
         CFONB.LAYOUT.ID = R.LOT.FILES<LOT.FIL.CFONB.LAYOUT,IJL>
         INIT.LOT.DETAIL.ID = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,IJL>
         LAST.LOT.DETAIL.ID = ''
         FOR IHH = 1 TO R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,IJL>
            BEG.OF.REC = DEB.LIST:DEB.SUIT:INIT.LOT.DETAIL.ID:'\'
            GOSUB PROCESS.ONE.LINE
            N.LAYOUT.ID = CFONB.LAYOUT.ID
            IF N.ERR THEN 
               N.REC = N.ERR
               GOSUB FORMAT.ONE.LINE
            END ELSE
               N.REC = R.DATA.RECORD
               GOSUB FORMAT.ONE.LINE
			   Y.CNT6=DCOUNT(ANNEX.LAYOUT.ID,@FM)
			   Y.CNT7=DCOUNT(R.ANNEX.RECORD(IUW),@VM)
               FOR IUW = 1 TO Y.CNT6
                  FOR ISG = 1 TO Y.CNT7
                     N.REC = R.ANNEX.RECORD(IUW)<1,ISG>
                     N.LAYOUT.ID = FIELD(ANNEX.LAYOUT.ID<IUW>,".",2,99)
                     GOSUB FORMAT.ONE.LINE
                  NEXT ISG
               NEXT IUW
            END
         NEXT IHH
         REM.RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'Recapitulatif de remise':'[0[[':R.LOT.FILES<LOT.FIL.REM.TRAILER,IJL>:'['
         IF REM.STATUS.OK THEN FILE.RECORD.LIST<-1> = REM.RECORD.LIST
      NEXT IJL

      RETURN

*************************************************************************
FORMAT.ONE.LINE:
*************************************************************************

      IF LINE.STATUS.OK EQ 'Y' THEN 
         MID.OF.REC = N.LAYOUT.ID:'\':FMT(IHH,'5"0"R'):'[1[':DET.STATUS.CODE:'['
         N.REC.LENGTH = LEN(N.REC)
         IF N.REC.LENGTH LE 256 THEN
            REM.RECORD.LIST<-1> = BEG.OF.REC:MID.OF.REC:N.REC:'['
         END ELSE
            REM.RECORD.LIST<-1> = BEG.OF.REC:MID.OF.REC:N.REC[1,256]:'[':N.REC[257,N.REC.LENGTH]
         END
      END

      RETURN

*************************************************************************
PROCESS.ONE.LINE:
*************************************************************************

      LINE.RECORD.LIST = '' ; LINE.STATUS.OK = 'Y' 
      LOT.DETAIL.NUM = IHH/R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>
      LOT.DETAIL.NUM = ICONV(LOT.DETAIL.NUM+0.4999,"MD0T")
      IF LOT.DETAIL.NUM LE 1 THEN LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID ELSE LOT.DETAIL.KEY = INIT.LOT.DETAIL.ID:'.':LOT.DETAIL.NUM
      IF LOT.DETAIL.KEY NE LAST.LOT.DETAIL.KEY THEN
         R.LOT.DETAIL = '' ; ER = ''
         CALL F.READ(LOT.DETAIL.FILE,LOT.DETAIL.KEY,R.LOT.DETAIL,F.LOT.DETAIL,ER)
         IF ER THEN
            N.ERR = 'EB-LOT.DETAIL.MISSING.LINE':@FM:IHH
            CALL LOT.TRANSLATE.ERROR(N.ERR,'') ; RETURN
         END
         LAST.LOT.DETAIL.KEY = LOT.DETAIL.KEY
      END
      IHH.REL = IHH - (LOT.DETAIL.NUM-1)*R.LOT.PARAMETER<LOT.PAR.DETAIL.LENGTH>

      LOT.DETAIL.FIELDS = R.LOT.DETAIL<3*IHH.REL-2>
      DET.STATUS.CODE = FIELD(LOT.DETAIL.FIELDS,I.SEP,1)
      DET.DESTINATION = FIELD(LOT.DETAIL.FIELDS,I.SEP,2)
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
	  Y.CNT8=DCOUNT(LOT.DETAIL.FIELDS,I.SEP)
      FOR IJF = 16 TO Y.CNT8
         DET.ADDITIONAL<1,IJF-15> = FIELD(LOT.DETAIL.FIELDS,I.SEP,IJF)
      NEXT IJF

      IF N.STATUS NE '' THEN
         BEGIN CASE

            CASE N.STATUS EQ 'ALL' ;* Full content of files with status set
               IF DET.STATUS.CODE THEN FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y' 

            CASE N.STATUS EQ 'ONLY' ;* Only the lines with a status
               IF DET.STATUS.CODE THEN
                  FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y'
               END ELSE LINE.STATUS.OK = 'N'

            CASE N.STATUS EQ 'ERROR' ;* Only the lines with an error status
               IF DET.STATUS.CODE THEN
                 LOCATE DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
                    IF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
                       FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y'
                    END ELSE LINE.STATUS.OK = 'N'
                 END ELSE LINE.STATUS.OK = 'N'
               END ELSE LINE.STATUS.OK = 'N'

            CASE N.STATUS EQ 'OVERRIDE' ;* Only the lines with an override status
               IF DET.STATUS.CODE THEN
                 LOCATE DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
                    IF STA.BLOCKAGE.LEVEL<FND> EQ 'OVERRIDE' THEN
                       FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y'
                    END ELSE LINE.STATUS.OK = 'N'
                 END ELSE LINE.STATUS.OK = 'N'
               END ELSE LINE.STATUS.OK = 'N'

            CASE 1 ;* Only the lines associated with the given status
               IF N.STATUS EQ DET.STATUS.CODE THEN
                  FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y'
               END ELSE LINE.STATUS.OK = 'N'

         END CASE
      END

      R.DATA.RECORD = R.LOT.DETAIL<3*IHH.REL-1,1>

*     Extracts the annexes content and layout and pass them to I_LOTFMT

      CALL Y.LOT.ANNEX.RECORD(R.LOT.DETAIL<3*IHH.REL-1>)

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      E = '' ; TEXT = '' ; ETEXT = ''
      RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''

      CALL Y.LOAD.LOTPAR(TXT.ER)
      IF TXT.ER THEN RETURN

      I.SEP = R.LOT.PARAMETER<LOT.PAR.SEPARATOR>

      CLEAR.CCY = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.LOT.PARAMETER<LOT.PAR.CLEAR.CCY.MARKET>

      CALL Y.LOAD.LOTSTA(CLEAR.CCY,N.ERR)

      CALL Y.LOAD.LOTHEA

      LOT.CONCAT.FILE = 'F.LOT.CONCAT'
      F.LOT.CONCAT = ''
      CALL OPF(LOT.CONCAT.FILE, F.LOT.CONCAT)
      YR.LOT.CONCAT.ID = '' ; R.LOT.CONCAT = ''

      LOT.DETAIL.FILE = 'F.LOT.DETAIL'
      F.LOT.DETAIL = ''
      CALL OPF(LOT.DETAIL.FILE, F.LOT.DETAIL)

      LOT.FILES.FILE = 'F.LOT.FILES'
      F.LOT.FILES = ''
      CALL OPF(LOT.FILES.FILE, F.LOT.FILES)
      YR.LOT.FILES.ID = '' ; R.LOT.FILES = ''

      RETURN

***********************************************************************
READ.LOT.CONCAT.FILE:
***********************************************************************

      ER = ''
      CALL F.READ(LOT.CONCAT.FILE,YR.LOT.CONCAT.ID,R.LOT.CONCAT,F.LOT.CONCAT,ER)

      RETURN

***********************************************************************
READ.LOT.FILES.FILE:
***********************************************************************

      ER = ''
      CALL F.READ(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES,F.LOT.FILES,ER)

      RETURN
*-----------------------------------------------------------------------
   END
