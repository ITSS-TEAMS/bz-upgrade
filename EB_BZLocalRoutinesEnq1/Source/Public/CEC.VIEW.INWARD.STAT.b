*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.STAT(Y.LIST)
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
* 02/06/2007 - First Release
*              Developed by Edgard Pignon
* ZIT_UPG_R13_TO_R19 - changed Arithematic Operator 
*                      changed DCOUNT in FOR LOOP
*----------------------------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
* $INSERT I_COMMON - Not Used anymore;RD
$INSERT I_CECPAR

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;-

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN    ;*changed
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN   ;*changed
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
	Y.TXT.ER = DCOUNT(TXT.ER,@FM)
	FOR IJK = 1 TO Y.TXT.ER	
*        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)

            Y.LIST<-1> = '[[[[[ERR[[[[[[[[[':TXT.ER<IJK>:FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus IJK
    END ELSE
        Y.LIST = RECORD.LIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  RETURN

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

    IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN  ;*changed
        TXT.ER = 'DATE.TO > DATE.FROM'
    END

    IF DAEB.DataAccess.OpfFROM THEN
        IEB.DataAccess.OpfATE.FROM GT TODAY THEN			;*changed
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY 		;*changed
        END
    END

    LOCATEB.DFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.EB.SyEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.STAT(Y.LIST)
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
* 02/06/2007 - First Release
*              Developed by Edgard Pignon
* ZIT_UPG_R13_TO_R19 - changed Arithematic Operator 
*                      changed DCOUNT in FOR LOOP
*----------------------------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN    ;*changed
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN   ;*changed
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
	Y.TXT.ER = DCOUNT(TXT.ER,@FM)
	FOR IJK = 1 TO Y.TXT.ER	
*        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)

            Y.LIST<-1> = '[[[[[ERR[[[[[[[[[':TXT.ER<IJK>:'['
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

    IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN  ;*changed
        TXT.ER = 'DATE.TO > DATE.FROM'
    END

    IF DATE.FROM THEN
        IF DATE.FROM GT TODAY THEN			;*changed
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY 		;*changed
        END
    END

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'SSEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.CONCEB.SystemTables.getIdNew()E
    IF DATE.FROM THEN
        SELECT.CMEB.DataAccess.FWriteWITH @ID GE "':DATE.FROM:'"'
        IF DATE.TO THEN
            SELECT.CMD := ' AND @ID LE "':DATE.TO:'"'
        END
    END EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.STAT(Y.LIST)
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
* 02/06/2007 - First Release
*              Developed by Edgard Pignon
* ZIT_UPG_R13_TO_R19 - changed Arithematic Operator 
*                      changed DCOUNT in FOR LOOP
*----------------------------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN    ;*changed
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN   ;*changed
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
	Y.TXT.ER = DCOUNT(TXT.ER,@FM)
	FOR IJK = 1 TO Y.TXT.ER	
*        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)

            Y.LIST<-1> = '[[[[[ERR[[[[[[[[[':TXT.ER<IJK>:'['
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

    IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN  ;*changed
        TXT.ER = 'DATE.TO > DATE.FROM'
    END

    IF DATE.FROM THEN
        IF DATE.FROM GT TODAY THEN			;*changed
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY 		;*changed
        END
    END

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'SSELECT ':CEC.INWARD.CONCAT.FILE
    IF DATE.FROM THEN
        SELECT.CMD := ' WITH @ID GE "':DATE.FROM:'"'
        IF DATE.TO THEN
            SELECT.CMD := ' AND @ID LE "':DATE.TO:'"'
        END
    END ELSFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.STAT(Y.LIST)
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
* 02/06/2007 - First Release
*              Developed by Edgard Pignon
* ZIT_UPG_R13_TO_R19 - changed Arithematic Operator 
*                      changed DCOUNT in FOR LOOP
*----------------------------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN    ;*changed
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN   ;*changed
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
	Y.TXT.ER = DCOUNT(TXT.ER,@FM)
	FOR IJK = 1 TO Y.TXT.ER	
*        FOR IJK = 1 TO DCOUNT(TXT.ER,FM)

            Y.LIST<-1> = '[[[[[ERR[[[[[[[[[':TXT.ER<IJK>:'['
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

    IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN  ;*changed
        TXT.ER = 'DATE.TO > DATE.FROM'
    END

    IF DATE.FROM THEN
        IF DATE.FROM GT TODAY THEN			;*changed
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY 		;*changed
        END
    END

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'SSELECT ':CEC.INWARD.CONCAT.FILE
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
    IF ID.LIST.ALL EQ '' THEN    ;*changed
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END

    RETURN

***********************************************************************
PROCESS:
***********************************************************************
Y.ID.LIST.ALL = DCOUNT(ID.LIST.ALL,@FM)   ;*changed
FOR CTR = 1 TO Y.ID.LIST.ALL   ;*changed
*    FOR CTR = 1 TO DCOUNT(ID.LIST.ALL,FM)

        YR.CEC.INWARD.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
        GOSUB READ.CEC.INWARD.CONCAT.FILE
        IF NOT(ER) THEN
		
Y.EC.INWARD.CONCAT = DCOUNT(R.CEC.INWARD.CONCAT<1>,@VM)		 ;*changed
 FOR IJK = 1 TO Y.EC.INWARD.CONCAT			 ;*changed
 *          FOR IJK = 1 TO DCOUNT(R.CEC.INWARD.CONCAT<1>,VM)
 
Y.CEC.INWARD.CONCAT.IJK = DCOUNT(R.CEC.INWARD.CONCAT<1,IJK>,@SM)			 ;*changed
FOR IJT = 1 TO Y.CEC.INWARD.CONCAT.IJK				 ;*changed
*              FOR IJT = 1 TO DCOUNT(R.CEC.INWARD.CONCAT<1,IJK>,SM)

                 YR.CEC.INWARD.FILES.ID = R.CEC.INWARD.CONCAT<1,IJK,IJT>       
                 GOSUB READ.CEC.INWARD.FILES.FILE
                 IF NOT(ER) THEN
                    DEB.LIST = YR.CEC.INWARD.FILES.ID:'['
                    DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.PROCESS.DATE>:'['
                    DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.PROCESS.TIME>:'['
                    DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE>:'['
                    DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.CREATION.TIME>:'['
                    GOSUB PROCESS.ONE.REMIT
                 END
              NEXT IJT
           NEXT IJK
        END
    NEXT CTR

*     First show the summary :

    NB.REMCODE = DCOUNT(R.SUMMARY.KEY,@FM)
    GOSUB INITIATE.THE.TOTAL
    
   OLD.RECORD.BEG = 'Resume ':'[[[[['

    FOR IUR = 1 TO NB.REMCODE
        IF R.SUMMARY.REC<IUR,2> EQ 0 THEN R.SUMMARY.REC<IUR,2> = ''		 ;*changed
        IF R.SUMMARY.REC<IUR,3> EQ 0 THEN R.SUMMARY.REC<IUR,3> = ''		 ;*changed
        DEBUT.RECORD = OLD.RECORD.BEG:R.SUMMARY.KEY<IUR,1>:'[[':R.SUMMARY.REC<IUR,1>:'[[':R.SUMMARY.REC<IUR,2>:'['
        IF R.SUMMARY.REC<IUR,2> OR R.SUMMARY.REC<IUR,3> THEN DISP.CCY = R.SUMMARY.KEY<IUR,2> ELSE DISP.CCY = ''
        RECORD.LIST<-1> = DEBUT.RECORD:DISP.CCY:'[':R.SUMMARY.REC<IUR,3>:'[[[['
        BEGIN CASE
        CASE R.SUMMARY.REC<IUR,2> EQ '' AND R.SUMMARY.REC<IUR,3> EQ ''		 ;*changed
        CASE R.SUMMARY.REC<IUR,2> GT 0 AND R.SUMMARY.REC<IUR,3> GT 0		 ;*changed
            CR.NB.OF.REC += R.SUMMARY.REC<IUR,1>
            CR.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
            CR.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
            IF CR.CURRENCY EQ '' THEN		;*changed
                CR.CURRENCY = R.SUMMARY.KEY<IUR,2>
            END ELSE
                IF CR.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN		;*changed
                    CR.CURRENCY = '...'
                END
            END
        CASE R.SUMMARY.REC<IUR,2> LT 0 AND R.SUMMARY.REC<IUR,3> LT 0		;*changed

            DB.NB.OF.REC += R.SUMMARY.REC<IUR,1>
            DB.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
            DB.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
 
            IF DB.CURRENCY EQ '' THEN		;*changed
                DB.CURRENCY = R.SUMMARY.KEY<IUR,2>
            END ELSE
                IF DB.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN  ;*changed
                    DB.CURRENCY = '...'
                END
            END
        END CASE
        TOT.NB.OF.REC += R.SUMMARY.REC<IUR,1>
        TOT.NOSTRO.AMT.FCY += R.SUMMARY.REC<IUR,2>
        TOT.NOSTRO.AMT.LCY += R.SUMMARY.REC<IUR,3>
		
        IF TOT.CURRENCY EQ '' THEN		;*changed	
            TOT.CURRENCY = R.SUMMARY.KEY<IUR,2>
        END ELSE
            IF TOT.CURRENCY NE R.SUMMARY.KEY<IUR,2> THEN		;*changed	
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
            IF OLD.RECORD.BEG NE RECORD.BEG THEN		;*changed	
                IF OLD.RECORD.BEG THEN GOSUB WRITE.THE.TOTAL
                OLD.RECORD.BEG = RECORD.BEG
                GOSUB INITIATE.THE.TOTAL
            END
            NB.REMITS = DCOUNT(R.SECOND.KEY<IUR>,@VM)
            FOR ICU = 1 TO NB.REMITS
                RECORD.LIST<-1> = RECORD.BEG:R.FIRST.KEY<IUR,2>:'[':R.SECOND.KEY<IUR,ICU>
                TRAV.FIELD = R.SECOND.KEY<IUR,ICU>
                CHANGE '[' TO @VM IN TRAV.FIELD
                IF TRAV.FIELD<1,5> EQ '' THEN TRAV.FIELD<1,5> = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>  ;*changed	
                IF TRAV.FIELD<1,4> EQ 0 THEN TRAV.FIELD<1,4> = ''
                IF TRAV.FIELD<1,6> EQ 0 THEN TRAV.FIELD<1,6> = ''
                BEGIN CASE
                CASE TRAV.FIELD<1,4> EQ '' AND TRAV.FIELD<1,6> EQ ''
                CASE TRAV.FIELD<1,4> GT 0 AND TRAV.FIELD<1,6> GT 0		;*changed	
                    CR.NB.OF.REC += TRAV.FIELD<1,2>
                    CR.NOSTRO.AMT.FCY += TRAV.FIELD<1,4>
                    CR.NOSTRO.AMT.LCY += TRAV.FIELD<1,6>
                    IF CR.CURRENCY EQ '' THEN		;*changed	
                        CR.CURRENCY = TRAV.FIELD<1,5>
                    END ELSE
                        IF CR.CURRENCY NE TRAV.FIELD<1,5> THEN		;*changed	
                            CR.CURRENCY = '...'
                        END
                    END
                CASE TRAV.FIELD<1,4> LT 0 AND TRAV.FIELD<1,6> LT 0		;*changed	
                    DB.NB.OF.REC += TRAV.FIELD<1,2>
                    DB.NOSTRO.AMT.FCY += TRAV.FIELD<1,4>
                    DB.NOSTRO.AMT.LCY += TRAV.FIELD<1,6>
                    IF DB.CURRENCY EQ '' THEN
                        DB.CURRENCY = TRAV.FIELD<1,5>
                    END ELSE
                        IF DB.CURRENCY NE TRAV.FIELD<1,5> THEN   ;*changed	
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

    IF RECORD.LIST EQ '' THEN	;*changed		
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END

    RETURN

***********************************************************************
PROCESS.ONE.REMIT:
***********************************************************************

    DEB.SUIT = YR.CEC.INWARD.FILES.ID:'['
	
	Y.REM.HEADER = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER>,@VM)
	FOR IJL = 1 TO Y.REM.HEADER
 *   FOR IJL = 1 TO DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER>,VM)
 
        NOSTRO.ACCT.NO = '' ; NOSTRO.VALUE.DATE = '' ; NOSTRO.BOOKING.DATE = ''
        NOSTRO.CURRENCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
        NOSTRO.TRANS.REF = ''; NOSTRO.OUR.REF = ''
        REMIT.CODE = R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,IJL,1>[1,3]
        NB.OF.REC = R.CEC.INWARD.FILES<CEC.ICF.TRANS.NUMBER,IJL>
        NOSTRO.AMT.FCY = R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,IJL,1>
        NOSTRO.AMT.LCY = R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,IJL,2>
        IF NOSTRO.AMT.LCY EQ '' THEN NOSTRO.AMT.LCY = R.CEC.INWARD.FILES<CEC.ICF.TOT.AMOUNT,IJL,1>
        IF N.DETAIL THEN
            IF NOSTRO.AMT.FCY OR NOSTRO.AMT.LCY THEN
                IF R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,IJL> THEN
                    N.ENTRY.ROOT = R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,IJL,1>
                    N.ENTRY.BEG = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,IJL,2>,"-",1)
                    N.ENTRY.END = FIELD(R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,IJL,2>,"-",2)
                    IF N.ENTRY.END EQ '' THEN N.ENTRY.END = N.ENTRY.BEG
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
                                EXIT
                            END
                        END
                    NEXT CUR
                    IF NOSTRO.ACCT.NO EQ '' THEN   ;*changed
                        NOSTRO.TRANS.REF = R.CEC.INWARD.FILES<CEC.ICF.STMT.NOS,IJL,1>
		Y.TRANS.LAST = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,IJL>,@SM)
		FOR IJP = 1 TO Y.TRANS.LAST					
 *                       FOR IJP = 1 TO DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,IJL>,SM)
 
                            REM.CODE.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,IJL,IJP>[1,3]
                            REM.FIRST.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,IJL,IJP>
                            REM.LAST.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,IJL,IJP>
                            FOR IJZ = REM.FIRST.ID TO REM.LAST.ID
                                YR.CEC.INWARD.ID = YR.CEC.INWARD.CONCAT.ID:'.':REM.CODE.ID:'.':FMT(IJZ,SEQ.FORMAT)
                                GOSUB READ.CEC.INWARD.FILE
                                IF NOT(ER) THEN
                                    BEGIN CASE
                                    CASE NOSTRO.AMT.FCY GT 0 OR NOSTRO.AMT.LCY GT 0     ;*changed
                                        NOSTRO.ACCT.NO = R.CEC.INWARD<CEC.IC.CREDIT.ACCT.NO>
                                        NOSTRO.CURRENCY = R.CEC.INWARD<CEC.IC.CREDIT.CURRENCY>
                                        NOSTRO.VALUE.DATE = R.CEC.INWARD<CEC.IC.CREDIT.VALUE.DATE>
                                    CASE NOSTRO.AMT.FCY LT 0 OR NOSTRO.AMT.LCY LT 0
                                        NOSTRO.ACCT.NO = R.CEC.INWARD<CEC.IC.DEBIT.ACCT.NO>
                                        NOSTRO.CURRENCY = R.CEC.INWARD<CEC.IC.DEBIT.CURRENCY>
                                        NOSTRO.VALUE.DATE = R.CEC.INWARD<CEC.IC.DEBIT.VALUE.DATE>
                                    END CASE
                                END
                                IF NOSTRO.ACCT.NO THEN EXIT
                            NEXT IJZ
                        NEXT IJP
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
    TOT.NOSTRO.AMT.LCY = 0 

    RETURN

***********************************************************************
WRITE.THE.TOTAL:
***********************************************************************

    IF TOT.NB.OF.REC THEN
        RECORD.LIST<-1> = OLD.RECORD.BEG:'[[[[[[[[[['
        IF CR.NB.OF.REC THEN
            IF CR.CURRENCY EQ '...' THEN			;*changed
                IF CR.NOSTRO.AMT.LCY EQ 0 THEN CR.NOSTRO.AMT.LCY = ''
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TCR[[':CR.NB.OF.REC:'[[':CR.NOSTRO.AMT.LCY:'[':LCCY:'[[[[['
            END ELSE
                IF CR.NOSTRO.AMT.FCY EQ 0 THEN CR.NOSTRO.AMT.FCY = ''		;*changed
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TCR[[':CR.NB.OF.REC:'[[':CR.NOSTRO.AMT.FCY:'[':CR.CURRENCY:'[[[[['
            END
        END
        IF DB.NB.OF.REC THEN
            IF DB.CURRENCY EQ '...' THEN
                IF DB.NOSTRO.AMT.LCY EQ 0 THEN DB.NOSTRO.AMT.LCY = ''
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TDB[[':DB.NB.OF.REC:'[[':DB.NOSTRO.AMT.LCY:'[':LCCY:'[[[[['
            END ELSE
                IF DB.NOSTRO.AMT.FCY EQ 0 THEN DB.NOSTRO.AMT.FCY = ''
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TDB[[':DB.NB.OF.REC:'[[':DB.NOSTRO.AMT.FCY:'[':DB.CURRENCY:'[[[[['
            END
        END
        IF TOT.NB.OF.REC NE DB.NB.OF.REC + CR.NB.OF.REC OR (DB.NB.OF.REC AND CR.NB.OF.REC) THEN
            IF TOT.CURRENCY EQ '...' THEN
                IF TOT.NOSTRO.AMT.LCY NE 0 THEN DISP.CCY = LCCY ELSE TOT.NOSTRO.AMT.LCY = '' ; DISP.CCY = ''
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TOT[[':TOT.NB.OF.REC:'[[':TOT.NOSTRO.AMT.LCY:'[':DISP.CCY:'[[[[['
            END ELSE
                IF TOT.NOSTRO.AMT.FCY NE 0 THEN DISP.CCY = TOT.CURRENCY ELSE TOT.NOSTRO.AMT.FCY = '' ; DISP.CCY = ''
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
        IF NOSTRO.AMT.FCY OR NOSTRO.AMT.LCY THEN DISP.CURRENCY = NOSTRO.CURRENCY ELSE DISP.CURRENCY = ''
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

    CALL Y.LOAD.CECPAR(TXT.ER)
    IF TXT.ER THEN RETURN

    LOCATE 'INWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING POS THEN
        SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,POS>:'"0"':"R"
    END

    FN.STMT.ENTRY = 'F.STMT.ENTRY'
    F.STMT.ENTRY = ''
    CALL OPF(FN.STMT.ENTRY, F.STMT.ENTRY)
    YR.STMT.ENTRY.ID = ''
    R.STMT.ENTRY = ''

    CEC.INWARD.CONCAT.FILE = 'F.CEC.INWARD.CONCAT'
    F.CEC.INWARD.CONCAT = ''
    CALL OPF(CEC.INWARD.CONCAT.FILE, F.CEC.INWARD.CONCAT)
    YR.CEC.INWARD.CONCAT.ID = ''
    R.CEC.INWARD.CONCAT = ''

    CEC.INWARD.FILE = 'F.CEC.INWARD'
    F.CEC.INWARD = ''
    CALL OPF(CEC.INWARD.FILE, F.CEC.INWARD)
    YR.CEC.INWARD.ID = ''
    R.CEC.INWARD = ''

    CEC.INWARD.FILES.FILE = 'F.CEC.INWARD.FILES'
    F.CEC.INWARD.FILES = ''
    CALL OPF(CEC.INWARD.FILES.FILE, F.CEC.INWARD.FILES)
    YR.CEC.INWARD.FILES.ID = ''
    R.CEC.INWARD.FILES = ''

    RETURN

READ.CEC.INWARD.FILE:

    ER = ''
    CALL F.READ(CEC.INWARD.FILE,YR.CEC.INWARD.ID,R.CEC.INWARD,F.CEC.INWARD,ER)

    RETURN

READ.CEC.INWARD.CONCAT.FILE:

    ER = ''
    CALL F.READ(CEC.INWARD.CONCAT.FILE,YR.CEC.INWARD.CONCAT.ID,R.CEC.INWARD.CONCAT,F.CEC.INWARD.CONCAT,ER)

    RETURN

READ.CEC.INWARD.FILES.FILE:

    ER = ''
    CALL F.READ(CEC.INWARD.FILES.FILE,YR.CEC.INWARD.FILES.ID,R.CEC.INWARD.FILES,F.CEC.INWARD.FILES,ER)

    RETURN
*-----------------------------------------------------------------------
END
