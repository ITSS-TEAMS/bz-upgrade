*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.OUTWARD.STAT(Y.LIST)
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
*  
*----------------------------------------------------------------------
* Modification History :     
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT  
*                      Arithmatic operations converted to operands 
*                      removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM   
*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
* $INSERT I_COMMON - Not Used anymore;RY    
* $INSERT I_EQUATE - Not Used anymore;METER  
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;S
$INSERT I_F.CEC.OUTWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
        EB.SystemTables.getVFunction()T = DCOUNT(TXEB.SystemTables.getVFunction()
        FOR IJK =FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    
            Y.LIST<-1> = '[[[[[ERR[[[[[[FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'['
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

    IF EB.DataAccess.OpfB.DataAccess.OpfFROM THEN
        IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATE.FROM EQ TODAY THEN DATE.TO = TODAY
        END
    END

FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefccess.FReadETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    EEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.OUTWARD.STAT(Y.LIST)
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
*  
*----------------------------------------------------------------------
* Modification History :     
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT  
*                      Arithmatic operations converted to operands 
*                      removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM   
*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY    
$INSERT I_F.CEC.PARAMETER  
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
        TXT.ER.DCNT = DCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO TXT.ER.DCNT    
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

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerARD.CONCAT.FILE
    IF DATE.FROM EB.DataAccess.FWrite       SELECT.CMD := ' WITH @ID GE "':DATE.FROM:'"'
        IF DATE.TO THEN
            SELECT.CMD := ' AND @ID LE "':DATE.TO:'"'
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.OUTWARD.STAT(Y.LIST)
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
*  
*----------------------------------------------------------------------
* Modification History :     
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT  
*                      Arithmatic operations converted to operands 
*                      removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM   
*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY    
$INSERT I_F.CEC.PARAMETER  
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
        TXT.ER.DCNT = DCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO TXT.ER.DCNT    
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

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'SSELECT ':CEC.OUTWARD.CONCAT.FILE
    IF DATE.FROM THEN
        SELECT.CMD := ' WITH @ID GE "':DATE.FROM:'"'
        IF DATE.TO THEN
            SELECT.CMD := ' AND @ID LE "':DATE.TO:'"'
        ENDFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefstemTables.setE()*-----------------------------------------------------------------------------
* <Rating>5262</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.OUTWARD.STAT(Y.LIST)
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
*  
*----------------------------------------------------------------------
* Modification History :     
* ZIT-UPG-R13-R19 :    removed BP's and changed INCLUDE to INSERT  
*                      Arithmatic operations converted to operands 
*                      removed DCOUNT in FOR LOOP , FM,VM,SM converted to @FM,@VM,@SM   
*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.STMT.ENTRY    
$INSERT I_F.CEC.PARAMETER  
$INSERT I_F.CEC.OUTWARD.FILES
$INSERT I_F.CEC.OUTWARD
$INSERT I_CECPAR

*---- Main processing section ----

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN
            GOSUB PROCESS
        END
    END

    IF TXT.ER THEN
        TXT.ER.DCNT = DCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO TXT.ER.DCNT    
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

    LOCATE 'DETAIL' IN D.FIELDS<1> SETTING ID.POS THEN
        N.DETAIL = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
        N.DETAIL = ''
    END

    CALL EB.READLIST('','','','','')    ;* To reset the desktop bug

    SELECT.CMD = 'SSELECT ':CEC.OUTWARD.CONCAT.FILE
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
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END

    RETURN

***********************************************************************
PROCESS:
***********************************************************************
    ID.LIST.ALL.DCNT = DCOUNT(ID.LIST.ALL,@FM)
    FOR CTR = 1 TO ID.LIST.ALL.DCNT        
        YR.CEC.OUTWARD.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
        GOSUB READ.CEC.OUTWARD.CONCAT.FILE
        IF NOT(ER) THEN
           OUTWARD.CONCAT.DCNT = DCOUNT(R.CEC.OUTWARD.CONCAT<1>,@VM)
           FOR IJK = 1 TO OUTWARD.CONCAT.DCNT
              OUTWARD.CONCAT.DCNT.1 = DCOUNT(R.CEC.OUTWARD.CONCAT<1,IJK>,@SM)  
              FOR IJT = 1 TO OUTWARD.CONCAT.DCNT.1      
                 YR.CEC.OUTWARD.FILES.ID = R.CEC.OUTWARD.CONCAT<1,IJK,IJT>       
                 GOSUB READ.CEC.OUTWARD.FILES.FILE
                 IF NOT(ER) THEN
                    DEB.LIST = YR.CEC.OUTWARD.FILES.ID:'['
                    DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.DATE>:'['
                    DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.TIME>:'['
                    DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.DATE>:'['
                    DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.TIME>:'['
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
        IF R.SUMMARY.REC<IUR,2> EQ 0 THEN R.SUMMARY.REC<IUR,2> = ''
        IF R.SUMMARY.REC<IUR,3> EQ 0 THEN R.SUMMARY.REC<IUR,3> = ''
        DEBUT.RECORD = OLD.RECORD.BEG:R.SUMMARY.KEY<IUR,1>:'[[':R.SUMMARY.REC<IUR,1>:'[[':R.SUMMARY.REC<IUR,2>:'['
        IF R.SUMMARY.REC<IUR,2> OR R.SUMMARY.REC<IUR,3> THEN DISP.CCY = R.SUMMARY.KEY<IUR,2> ELSE DISP.CCY = ''
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
                IF OLD.RECORD.BEG THEN GOSUB WRITE.THE.TOTAL
                OLD.RECORD.BEG = RECORD.BEG
                GOSUB INITIATE.THE.TOTAL
            END
            NB.REMITS = DCOUNT(R.SECOND.KEY<IUR>,@VM)
            FOR ICU = 1 TO NB.REMITS
                RECORD.LIST<-1> = RECORD.BEG:R.FIRST.KEY<IUR,2>:'[':R.SECOND.KEY<IUR,ICU>
                TRAV.FIELD = R.SECOND.KEY<IUR,ICU>
              *  CONVERT '[' TO VM IN TRAV.FIELD
                 CHANGE '[' TO @VM IN TRAV.FIELD    
                IF TRAV.FIELD<1,5> EQ '' THEN TRAV.FIELD<1,5> = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
                IF TRAV.FIELD<1,4> EQ 0 THEN TRAV.FIELD<1,4> = ''
                IF TRAV.FIELD<1,6> EQ 0 THEN TRAV.FIELD<1,6> = ''
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
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END

    RETURN

***********************************************************************
PROCESS.ONE.REMIT:
***********************************************************************

    DEB.SUIT = YR.CEC.OUTWARD.FILES.ID:'['
    OUTWARD.FILES.DCNT = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER>,@VM)
    FOR IJL = 1 TO OUTWARD.FILES.DCNT  
        NOSTRO.ACCT.NO = '' ; NOSTRO.VALUE.DATE = '' ; NOSTRO.BOOKING.DATE = ''
        NOSTRO.CURRENCY = R.CEC.PARAMETER<CEC.PAR.CLEAR.CURRENCY>
        NOSTRO.TRANS.REF = ''; NOSTRO.OUR.REF = ''
        REMIT.CODE = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,IJL,1>[1,3]
        NB.OF.REC = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.NUMBER,IJL>
        NOSTRO.AMT.FCY = R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,IJL,1>
        NOSTRO.AMT.LCY = R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,IJL,2>
        IF NOSTRO.AMT.LCY EQ '' THEN NOSTRO.AMT.LCY = R.CEC.OUTWARD.FILES<CEC.OCF.TOT.AMOUNT,IJL,1>
        IF N.DETAIL THEN
            IF NOSTRO.AMT.FCY OR NOSTRO.AMT.LCY THEN
                IF R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,IJL> THEN
                    N.ENTRY.ROOT = R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,IJL,1>
                    N.ENTRY.BEG = FIELD(R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,IJL,2>,"-",1)
                    N.ENTRY.END = FIELD(R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,IJL,2>,"-",2)
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
                    IF NOSTRO.ACCT.NO EQ '' THEN
                        NOSTRO.TRANS.REF = R.CEC.OUTWARD.FILES<CEC.OCF.STMT.NOS,IJL,1>
                        OUTWARD.FILES.DCNT.1 = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL>,@SM)
                        FOR IJP = 1 TO OUTWARD.FILES.DCNT.1    
                            REM.CODE.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,IJL,IJP>[1,3]
                            REM.FIRST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,IJL,IJP>
                            REM.LAST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL,IJP>
                            FOR IJZ = REM.FIRST.ID TO REM.LAST.ID  
                                YR.CEC.OUTWARD.ID = YR.CEC.OUTWARD.CONCAT.ID:'.':REM.CODE.ID:'.':FMT(IJZ,SEQ.FORMAT)
                                GOSUB READ.CEC.OUTWARD.FILE  
                                IF NOT(ER) THEN
                                    BEGIN CASE
                                    CASE NOSTRO.AMT.FCY GT 0 OR NOSTRO.AMT.LCY GT 0
                                        NOSTRO.ACCT.NO = R.CEC.OUTWARD<CEC.OC.CREDIT.ACCT.NO>
                                        NOSTRO.CURRENCY = R.CEC.OUTWARD<CEC.OC.CREDIT.CURRENCY>
                                        NOSTRO.VALUE.DATE = R.CEC.OUTWARD<CEC.OC.CREDIT.VALUE.DATE>
                                    CASE NOSTRO.AMT.FCY LT 0 OR NOSTRO.AMT.LCY LT 0
                                        NOSTRO.ACCT.NO = R.CEC.OUTWARD<CEC.OC.DEBIT.ACCT.NO>
                                        NOSTRO.CURRENCY = R.CEC.OUTWARD<CEC.OC.DEBIT.CURRENCY>
                                        NOSTRO.VALUE.DATE = R.CEC.OUTWARD<CEC.OC.DEBIT.VALUE.DATE>
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
    TOT.NOSTRO.AMT.LCY = 0 ; * RDL20080401

    RETURN

***********************************************************************
WRITE.THE.TOTAL:
***********************************************************************

    IF TOT.NB.OF.REC THEN
        RECORD.LIST<-1> = OLD.RECORD.BEG:'[[[[[[[[[['
        IF CR.NB.OF.REC THEN
            IF CR.CURRENCY EQ '...' THEN
                IF CR.NOSTRO.AMT.LCY EQ 0 THEN CR.NOSTRO.AMT.LCY = ''
                RECORD.LIST<-1> = OLD.RECORD.BEG:'TCR[[':CR.NB.OF.REC:'[[':CR.NOSTRO.AMT.LCY:'[':LCCY:'[[[[['
            END ELSE
                IF CR.NOSTRO.AMT.FCY EQ 0 THEN CR.NOSTRO.AMT.FCY = ''
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

    LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING POS THEN
        SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,POS>:'"0"':"R"
    END

    FN.STMT.ENTRY = 'F.STMT.ENTRY'
    F.STMT.ENTRY = ''
    CALL OPF(FN.STMT.ENTRY, F.STMT.ENTRY)
    YR.STMT.ENTRY.ID = ''
    R.STMT.ENTRY = ''

    CEC.OUTWARD.CONCAT.FILE = 'F.CEC.OUTWARD.CONCAT'
    F.CEC.OUTWARD.CONCAT = ''
    CALL OPF(CEC.OUTWARD.CONCAT.FILE, F.CEC.OUTWARD.CONCAT)
    YR.CEC.OUTWARD.CONCAT.ID = ''
    R.CEC.OUTWARD.CONCAT = ''

    CEC.OUTWARD.FILE = 'F.CEC.OUTWARD'
    F.CEC.OUTWARD = ''
    CALL OPF(CEC.OUTWARD.FILE, F.CEC.OUTWARD)
    YR.CEC.OUTWARD.ID = ''
    R.CEC.OUTWARD = ''

    CEC.OUTWARD.FILES.FILE = 'F.CEC.OUTWARD.FILES'
    F.CEC.OUTWARD.FILES = ''
    CALL OPF(CEC.OUTWARD.FILES.FILE, F.CEC.OUTWARD.FILES)
    YR.CEC.OUTWARD.FILES.ID = ''
    R.CEC.OUTWARD.FILES = ''

    RETURN

READ.CEC.OUTWARD.FILE:

    ER = '' ; R.CEC.OUTWARD = ''      
    CALL F.READ(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD,F.CEC.OUTWARD,ER)

    RETURN

READ.CEC.OUTWARD.CONCAT.FILE:

    ER = '' ; R.CEC.OUTWARD.CONCAT = ''  
    CALL F.READ(CEC.OUTWARD.CONCAT.FILE,YR.CEC.OUTWARD.CONCAT.ID,R.CEC.OUTWARD.CONCAT,F.CEC.OUTWARD.CONCAT,ER)

    RETURN  

READ.CEC.OUTWARD.FILES.FILE:

    ER = '' ; R.CEC.OUTWARD.FILES = ''    
    CALL F.READ(CEC.OUTWARD.FILES.FILE,YR.CEC.OUTWARD.FILES.ID,R.CEC.OUTWARD.FILES,F.CEC.OUTWARD.FILES,ER)

    RETURN  
*-----------------------------------------------------------------------
END
