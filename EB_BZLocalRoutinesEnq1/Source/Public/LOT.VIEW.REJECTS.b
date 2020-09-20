*-----------------------------------------------------------------------------
* <Rating>4595</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.REJECTS(Y.LIST)
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
* 15/03/2010 - First Release
*              Developed for BZ (Tunisia)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM, SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
* $INSERT I_EQUATE - Not Used anymore;METER
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.INWARD
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA
$INSERT I_LOTDST

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP
AA<-1> = 'DEBUT'

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
     FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLIST
         IF TXT.ER EQ '' THEN
         FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
         END
      END

      IF TXT.ER THEN
	  Y.DCNT = DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.DCNT
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

*WRITE AA TO F.TOOLS,"MVR.txt"

      RETURN

***********************************************************************
SELECT.LIST:
***********************************************************************

      LOCATE 'DATE.FROM' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.FROM = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         EB.DataAccess.OpfE.FROM = ''
      ENDEB.DataAccess.Opf
      LOCATE 'DATE.TO' IN D.FIELDS<1> SETTING ID.POS THEN
         DATE.TO = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         DATE.TO =EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef   IEB.DataAccess.FRead.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN
         TXT.ER = 'DATE.TO > DATE.FROM'
      END

      IF DATE.FROM THEN
 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeremTables.setE()*-----------------------------------------------------------------------------
* <Rating>4595</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.REJECTS(Y.LIST)
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
* 15/03/2010 - First Release
*              Developed for BZ (Tunisia)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM, SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.INWARD
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA
$INSERT I_LOTDST

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP
AA<-1> = 'DEBUT'

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  Y.DCNT = DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.DCNT
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

*WRITE AA TO F.TOOLS,"MVR.txt"

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
 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.FROM EQ TODAY THEN DATE.TO = TODAY
         END
   EB.DataAccess.FWrite

      LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>4595</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.REJECTS(Y.LIST)
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
* 15/03/2010 - First Release
*              Developed for BZ (Tunisia)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM, SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.INWARD
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA
$INSERT I_LOTDST

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP
AA<-1> = 'DEBUT'

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  Y.DCNT = DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.DCNT
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

*WRITE AA TO F.TOOLS,"MVR.txt"

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
         N.FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefGE.AND.VALUE<ID.POS>
      ENEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>4595</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.VIEW.REJECTS(Y.LIST)
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
* 15/03/2010 - First Release
*              Developed for BZ (Tunisia)
*              Edgard Pignon
*
*---------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted FM, VM, SM TO @FM, @VM, @SM.
*                : DCOUNT assigned to varialbe for FOR loop.
*-----------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.LOT.PARAMETER
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.CEC.OUTWARD
$INSERT I_F.CEC.INWARD
$INSERT I_F.LOT.FILES
$INSERT I_LOTFMT
$INSERT I_LOTDET
$INSERT I_LOTPAR
$INSERT I_LOTHEA
$INSERT I_LOTSTA
$INSERT I_LOTDST

*---- Main processing section ----

AA = '' ;* OPEN "","TOOLS" TO F.TOOLS ELSE STOP
AA<-1> = 'DEBUT'

      GOSUB INITIALISE
      IF TXT.ER EQ '' THEN
         GOSUB SELECT.LIST
         IF TXT.ER EQ '' THEN
            GOSUB PROCESS
         END
      END

      IF TXT.ER THEN
	  Y.DCNT = DCOUNT(TXT.ER,@FM)
         FOR IJK = 1 TO Y.DCNT
            Y.LIST<-1> = '[[[[[0[[':TXT.ER<IJK>:'['
         NEXT IJK
      END ELSE
         Y.LIST = RECORD.LIST
      END

*WRITE AA TO F.TOOLS,"MVR.txt"

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

      LOCATE 'CREDITOR.ID' IN D.FIELDS<1> SETTING ID.POS THEN
         N.CREDITOR.ID = D.RANGE.AND.VALUE<ID.POS>
      END ELSE
         N.CREDITOR.ID = ''
      END

      N.FILE.NAME.OPER = ''
      LOCATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
         N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
         IF COUNT(N.FILE.NAME,"...") GT 0 THEN
            N.FILE.NAME.OPER = 'Y'
            CHANGE '...' TO '' IN N.FILE.NAME
         END
      END ELSE
         N.FILE.NAME = ''
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
        Y.LOT.DCNT = DCOUNT(ID.LIST.ALL,@FM)
      FOR CTR = 1 TO Y.LOT.DCNT
         YR.LOT.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
         GOSUB READ.LOT.CONCAT.FILE
         IF NOT(ER) THEN
		 Y.REC.DCNT = DCOUNT(R.LOT.CONCAT<1>,@VM)
            FOR IJK = 1 TO Y.REC.DCNT
               FILE.RECORD.LIST = ''
               FILE.STATUS.OK = ''
               YR.LOT.FILES.ID = R.LOT.CONCAT<1,IJK,1>
               IF N.FILE.ID AND N.FILE.ID NE YR.LOT.FILES.ID THEN CONTINUE 
               GOSUB READ.LOT.FILES.FILE
               IF NOT(ER) THEN
                  IF N.FILE.NAME THEN
                     V.FILE.NAME = R.LOT.FILES<LOT.FIL.FILE.NAME>
                     IF N.FILE.NAME.OPER EQ 'Y' THEN
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
				  Y.FIL.DCNT = DCOUNT(R.LOT.CONCAT<1,IJK>,@SM)
                  FOR IJT = 2 TO Y.FIL.DCNT 
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
       Y.REM.DCNT = DCOUNT(R.LOT.FILES<LOT.FIL.CFONB.LAYOUT>,@VM)
      FOR IJL = 1 TO Y.REM.DCNT 
         REM.RECORD.LIST = ''
         REM.STATUS.OK = ''
         REM.RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'En-tete de remise':'[0[[':R.LOT.FILES<LOT.FIL.REM.HEADER,IJL>:'['
         DATA.LAYOUT.ID = R.LOT.FILES<LOT.FIL.CFONB.LAYOUT,IJL>
         INIT.LOT.DETAIL.ID = R.LOT.FILES<LOT.FIL.LOT.DETAIL.ID,IJL>
         LAST.LOT.DETAIL.ID = ''
         FOR IHH = 1 TO R.LOT.FILES<LOT.FIL.FOUND.NB.OF.REC,IJL>
            BEG.OF.REC = DEB.LIST:DEB.SUIT:INIT.LOT.DETAIL.ID:'\'
            GOSUB PROCESS.ONE.LINE
            N.LAYOUT.ID = DATA.LAYOUT.ID
            IF N.ERR THEN 
               N.REC = N.ERR
               GOSUB FORMAT.ONE.LINE
            END ELSE
               N.REC = R.DATA.RECORD
               GOSUB FORMAT.ONE.LINE
			   Y.AN.DCNT = DCOUNT(ANNEX.LAYOUT.ID,@FM)
               FOR IUW = 1 TO Y.AN.DCNT
			   Y.LAY.DCNT = DCOUNT(R.ANNEX.RECORD(IUW),@VM)
                  FOR ISG = 1 TO Y.LAY.DCNT
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
         MID.OF.REC = N.LAYOUT.ID:'\':FMT(IHH,'6"0"R'):'[1[':N.REJECT.REASON:'['
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
	  Y.SEP.DCNT = DCOUNT(LOT.DETAIL.FIELDS,I.SEP)
      FOR IJF = 16 TO Y.SEP.DCNT 
         DET.ADDITIONAL<1,IJF-15> = FIELD(LOT.DETAIL.FIELDS,I.SEP,IJF)
      NEXT IJF

      LINE.STATUS.OK = '' 
      N.REJECT.REASON = ''
      N.REJECT.DATE = ''

      ANNEX.LAYOUT.ID = ''
      MAT R.ANNEX.RECORD = ''
      R.DATA.RECORD = R.LOT.DETAIL<3*IHH.REL-1,1>
      N.APPL.KEY = R.LOT.DETAIL<3*IHH.REL>

*     Extracts the annexes content and layout and pass them to I_LOTFMT

      CALL Y.LOT.ANNEX.RECORD(R.LOT.DETAIL<3*IHH.REL-1>)

      IF DET.STATUS.CODE THEN
         IF COUNT(DET.STATUS.CODE,".") 
            THEN N.REJECT.REASON = FIELD(DET.STATUS.CODE,".",2)
            ELSE N.REJECT.REASON = DET.STATUS.CODE
         IF LEN(N.REJECT.REASON) LE 2
            THEN N.REJECT.REASON = FMT(N.REJECT.REASON,'2"0"R')
            ELSE N.REJECT.REASON = N.REJECT.REASON[1,2]
         LOCATE DET.STATUS.CODE IN STA.STATUS.ID<1> SETTING FND THEN
            IF STA.BLOCKAGE.LEVEL<FND> EQ 'ERROR' THEN
               GOSUB FLAG.AS.REJECTED.LINE ; RETURN
            END 
         END
      END

      IF DET.DESTINATION THEN
         LOCATE DET.DESTINATION IN DST.DESTINATION.ID<1> SETTING ICI THEN
            BEGIN CASE
               CASE DST.APPLICATION.DEST<ICI> EQ 'FUNDS.TRANSFER'
                  GOSUB CHECK.FT.REJECT
               CASE DST.APPLICATION.DEST<ICI> EQ 'CEC.OUTWARD'
                  GOSUB CHECK.CEC.REJECT
               CASE 1 
                  N.REJECT.REASON = '' 
            END CASE
         END
      END

      IF N.REJECT.REASON THEN 
         GOSUB CALCULATE.STATUS

AA<-1> = '0 LOT.STATUS.KEY ':LOT.STATUS.KEY
AA<-1> = '2 N.REJECT.REASON ':N.REJECT.REASON

         N.REJECT.REASON = LOT.STATUS.KEY
         GOSUB FLAG.AS.REJECTED.LINE
      END
   
      RETURN

***********************************************************************
FLAG.AS.REJECTED.LINE:
***********************************************************************

      FILE.STATUS.OK = 'Y' ; REM.STATUS.OK = 'Y' ; LINE.STATUS.OK = 'Y'
      IF N.REJECT.DATE EQ '' THEN N.REJECT.DATE = TODAY
      IF COUNT(N.REJECT.REASON,".") THEN N.REJECT.REASON = FIELD(N.REJECT.REASON,".",2)
      IF NUM(N.REJECT.REASON) THEN
         IF LEN(N.REJECT.REASON) LE 2
            THEN N.REJECT.REASON = FMT(N.REJECT.REASON,'2"0"R')
            ELSE N.REJECT.REASON = N.REJECT.REASON[1,2]
      END

      RETURN

***********************************************************************
CALCULATE.STATUS:
***********************************************************************

AA<-1> = 'DATA.LAYOUT.ID ':DATA.LAYOUT.ID

    BEGIN CASE
       CASE DATA.LAYOUT.ID EQ 'V2*240' ; N.PREFIXE = '1'
       CASE DATA.LAYOUT.ID EQ '02*160' ; N.PREFIXE = '2'
       CASE 1 ; N.PREFIXE = ''
    END CASE

    LOT.STATUS.KEY = N.REJECT.REASON
    Y.IJ.DCNT =  DCOUNT(STA.STATUS.ID,@FM)
    FOR IJK = 1 TO Y.IJ.DCNT 
       IF COUNT(STA.STATUS.ID<IJK>,".") EQ 1 AND FIELD(STA.STATUS.ID<IJK>,".",1) EQ N.PREFIXE THEN
	   Y.ST.DCNT = DCOUNT(STA.LOCAL.REF<IJK,1>,@SM)
          FOR IJJ = 1 TO Y.ST.DCNT
             IF STA.LOCAL.REF<IJK,1,IJJ> EQ N.REJECT.REASON THEN
                LOT.STATUS.KEY = STA.STATUS.ID<IJK>
                RETURN
             END
          NEXT IJJ
       END
    NEXT IJK

    RETURN

***********************************************************************
CHECK.FT.REJECT:
***********************************************************************

      IF N.APPL.KEY MATCH "'FT'5N0X" THEN
         YR.FUNDS.TRANSFER.ID = N.APPL.KEY
         CALL Y.LOT.READ.APPLICATION(YR.FUNDS.TRANSFER.ID,R.FUNDS.TRANSFER,N.STATUS,N.FILE,N.ERR)
AA<-1> = 'YR.FUNDS.TRANSFER.ID ':YR.FUNDS.TRANSFER.ID
AA<-1> = 'N.FILE ':N.FILE
AA<-1> = 'N.STATUS ':N.STATUS
          IF R.FUNDS.TRANSFER NE '' THEN
             FT.REJ.REASON = R.FUNDS.TRANSFER<FT.LOCAL.REF,R.LOT.FT.LOCREF<4>> 
             BEGIN CASE
                CASE N.FILE EQ '$HIS'
                   IF N.STATUS EQ 'REVE' THEN
                      IF FT.REJ.REASON NE '' 
                         THEN FT.REJ.REASON = ''
                         ELSE FT.REJ.REASON = N.STATUS
                   END 
               CASE N.FILE EQ '$NAU'
                  IF N.STATUS[1,1] EQ 'R' THEN
                     IF FT.REJ.REASON NE '' 
                        THEN FT.REJ.REASON = ''
                        ELSE FT.REJ.REASON = N.STATUS
                  END ELSE
                     IF FT.REJ.REASON EQ '' THEN FT.REJ.REASON = N.STATUS
                  END
            END CASE

            BEGIN CASE
               CASE FT.REJ.REASON EQ '' 
                  N.REJECT.REASON = ''
               CASE FT.REJ.REASON NE '' AND N.REJECT.REASON EQ ''
                  N.REJECT.REASON = FT.REJ.REASON
               CASE 1
                  IF NUM(FT.REJ.REASON) THEN
                     IF LEN(FT.REJ.REASON) LE 2
                        THEN N.REJECT.REASON = FMT(FT.REJ.REASON,'2"0"R')
                        ELSE N.REJECT.REASON = FT.REJ.REASON[1,2]
                  END ELSE
                     IF N.REJECT.REASON EQ '' THEN
                        N.REJECT.REASON = FT.REJ.REASON
                     END
                  END
            END CASE
            IF N.REJECT.REASON THEN N.REJECT.DATE = '20':R.FUNDS.TRANSFER<FT.DATE.TIME,1>:[3,6]
         END ELSE

*           Deleted FT

            N.REJECT.REASON = 'DELE'

         END
      END

AA<-1> = 'FT.REJ.REASON ':FT.REJ.REASON
AA<-1> = 'N.REJECT.REASON ':N.REJECT.REASON

      RETURN

***********************************************************************
CHECK.CEC.REJECT:
***********************************************************************

      CEC.REJ.REASON = ''

      IF N.APPL.KEY AND COUNT(N.APPL.KEY,".") EQ 2 THEN
         YR.CEC.OUTWARD.ID = N.APPL.KEY
         GOSUB READ.CEC.OUTWARD.FILE
         IF R.CEC.OUTWARD THEN
		 Y.CEC.DCNT = DCOUNT(R.CEC.OUTWARD<CEC.OC.HIST.OPE.ID>,@VM)
            FOR IJE = 1 TO Y.CEC.DCNT 
               IF FIELD(R.CEC.OUTWARD<CEC.OC.HIST.OPE.ID,IJE>,".",1) EQ 'I' THEN
                  YR.CEC.INWARD.ID = FIELD(R.CEC.OUTWARD<CEC.OC.HIST.OPE.ID,IJE>,".",2,99)
                  GOSUB READ.CEC.INWARD.FILE
                  IF R.CEC.INWARD THEN 
                     CEC.REJ.REASON = R.CEC.INWARD<CEC.IC.REASON.CODE,1>
                     N.REJECT.DATE = '20':R.CEC.INWARD<CEC.IC.DATE.TIME,1>:[3,6]
                  END
               END
               EXIT
            NEXT IJE
         END
      END

      IF CEC.REJ.REASON 
         THEN N.REJECT.REASON = CEC.REJ.REASON
         ELSE N.REJECT.REASON = ''

      RETURN

***********************************************************************
INITIALISE:
***********************************************************************

      E = '' ; TEXT = '' ; ETEXT = ''
      RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''

      CALL Y.LOAD.LOTPAR(TXT.ER)
      IF TXT.ER THEN RETURN

      CALL Y.LOT.LOCREF.POS('FUNDS.TRANSFER',R.LOT.FT.LOCREF,N.ERR)

      I.SEP = R.LOT.PARAMETER<LOT.PAR.SEPARATOR>

      CLEAR.CCY = R.LOT.PARAMETER<LOT.PAR.CLEAR.CURRENCY>
      CLEAR.CCY.MKT = R.LOT.PARAMETER<LOT.PAR.CLEAR.CCY.MARKET>

      CALL Y.LOAD.LOTDST
      CALL Y.LOAD.LOTSTA(CLEAR.CCY,TXT.ER)
      IF TXT.ER THEN RETURN

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

      FUNDS.TRANSFER.FILE = 'F.FUNDS.TRANSFER'
      F.FUNDS.TRANSFER = ''
      CALL OPF(FUNDS.TRANSFER.FILE, F.FUNDS.TRANSFER)
      YR.FUNDS.TRANSFER.ID = '' ; R.FUNDS.TRANSFER = ''

      CEC.OUTWARD.FILE = 'F.CEC.OUTWARD'
      F.CEC.OUTWARD = ''
      CALL OPF(CEC.OUTWARD.FILE, F.CEC.OUTWARD)
      YR.CEC.OUTWARD.ID = '' ; R.CEC.OUTWARD = ''

      CEC.INWARD.FILE = 'F.CEC.INWARD'
      F.CEC.INWARD = ''
      CALL OPF(CEC.INWARD.FILE, F.CEC.INWARD)
      YR.CEC.INWARD.ID = '' ; R.CEC.INWARD = ''

      RETURN

***********************************************************************
READ.CEC.OUTWARD.FILE:
***********************************************************************

      ER = '' ; R.CEC.OUTWARD = ''
      CALL F.READ(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD,F.CEC.OUTWARD,ER)

      RETURN

***********************************************************************
READ.CEC.INWARD.FILE:
***********************************************************************

      ER = '' ; R.CEC.INWARD = ''
      CALL F.READ(CEC.INWARD.FILE,YR.CEC.INWARD.ID,R.CEC.INWARD,F.CEC.INWARD,ER)

      RETURN

***********************************************************************
READ.FUNDS.TRANSFER.FILE:
***********************************************************************
 
      ER = '' ; R.FUNDS.TRANSFER = ''
      CALL F.READ(FUNDS.TRANSFER.FILE,YR.FUNDS.TRANSFER.ID,R.FUNDS.TRANSFER,F.FUNDS.TRANSFER,ER)

      RETURN

***********************************************************************
READ.LOT.CONCAT.FILE:
***********************************************************************

      ER = '' ; R.LOT.CONCAT = ''
      CALL F.READ(LOT.CONCAT.FILE,YR.LOT.CONCAT.ID,R.LOT.CONCAT,F.LOT.CONCAT,ER)

      RETURN

***********************************************************************
READ.LOT.FILES.FILE:
***********************************************************************

      ER = '' ; R.LOT.FILES = ''
      CALL F.READ(LOT.FILES.FILE,YR.LOT.FILES.ID,R.LOT.FILES,F.LOT.FILES,ER)

      RETURN

*-----------------------------------------------------------------------
   END
