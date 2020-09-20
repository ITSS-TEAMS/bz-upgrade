*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATOR REPLACED
*                 FM, VM, SM REPLACED WITH @FM, @VM, @SM
*                 DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.FILES(Y.LIST)
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
* 12/05/2007 - First Release
*              Edgard Pignon
*----------------------------------------------------------------------

*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
* $INSERT I_COMMON - Not Used anymore;
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR
$INSERT I_LOTERR

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
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus1 TO Y.CTR
            Y.LIST<-1> = '[[[[[[0[FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusK>:'[[[[[['
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

    LOCATE 'DATE.TO' IN D.FIELDS<1> SETTING ID.POS THEN
    DATE.TO = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
    DATE.TO = ''
    END

    IF DATE.FROM AND DATE.TO AND DATE.FROM GT DATE.TO THEN
        TXT.ER = 'DATE.TO > DATE.FROM'
    END
EB.DataAccess.Opf   IF EB.DataAccess.OpfE.FROM THEN
        IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
            IF DATEB.SystemTables.getRNew()MFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
                DATE.TO = TODAY
         EB.DataAccess.FRead
        END
    END

    LOCATE 'FILE.ID' IN D.FIEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.POS THEN
    N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
    END ELSEEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATOR REPLACED
*                 FM, VM, SM REPLACED WITH @FM, @VM, @SM
*                 DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.FILES(Y.LIST)
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
* 12/05/2007 - First Release
*              Edgard Pignon
*----------------------------------------------------------------------

*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR
$INSERT I_LOTERR

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
            Y.LIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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

    LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
    N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
    N.FILE.ID = ''
    END

    N.FILEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeress.FWrite'
    LOCATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
    N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
    IF COUNT(N.FILE.NAME,"...") GT 0 THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATOR REPLACED
*                 FM, VM, SM REPLACED WITH @FM, @VM, @SM
*                 DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.FILES(Y.LIST)
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
* 12/05/2007 - First Release
*              Edgard Pignon
*----------------------------------------------------------------------

*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR
$INSERT I_LOTERR

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
            Y.LIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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

    LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
    N.FILE.ID = D.RANGE.AND.VALUE<ID.POS>
    END ELSE
    N.FILE.ID = ''
    END

    N.FILE.NAME.OPER = ''
    LOCATE 'FILE.NAME' IN D.FIELDS<1> SETTING ID.POS THEN
    N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
    IF COUNT(N.FILE.NAME,"...") GT 0 THEN
        N.FFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef 'Y'
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*-----------------------------------------------------------------------------
*Modification History

*ZIT-UPG-R13-R19: OPERATOR REPLACED
*                 FM, VM, SM REPLACED WITH @FM, @VM, @SM
*                 DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CEC.VIEW.INWARD.FILES(Y.LIST)
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
* 12/05/2007 - First Release
*              Edgard Pignon
*----------------------------------------------------------------------

*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.FILES
$INSERT I_F.CEC.INWARD
$INSERT I_CECPAR
$INSERT I_LOTERR

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
            Y.LIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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
        CHANGE '...' TO '' IN N.FILE.NAME
    END
    END ELSE
    N.FILE.NAME = ''
    END

    CALL EB.READLIST('','','','','')   ; * To reset the desktop bug

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
    IF ID.LIST.ALL EQ '' THEN
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END
    RETURN

***********************************************************************
PROCESS:
***********************************************************************
    Y.COUNT = DCOUNT(ID.LIST.ALL,@FM)
    FOR CTR = 1 TO Y.COUNT
        YR.CEC.INWARD.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
        GOSUB READ.CEC.INWARD.CONCAT.FILE
        IF NOT(ER) THEN
            Y.CTR1 = DCOUNT(R.CEC.INWARD.CONCAT<1>,@VM)
            FOR IJK = 1 TO Y.CTR1
                Y.CTR2 = DCOUNT(R.CEC.INWARD.CONCAT<1,IJK>,@SM)
                FOR IJT = 1 TO Y.CTR2
                    YR.CEC.INWARD.FILES.ID = R.CEC.INWARD.CONCAT<1,IJK,IJT>
                    IF N.FILE.ID AND N.FILE.ID NE YR.CEC.INWARD.FILES.ID THEN CONTINUE
                    GOSUB READ.CEC.INWARD.FILES.FILE

                    IF NOT(ER) THEN
                        IF N.FILE.NAME THEN
                            V.FILE.NAME = R.CEC.INWARD.FILES<CEC.ICF.FILE.NAME>
                            IF N.FILE.NAME.OPER EQ 'Y' THEN
                                CHANGE N.FILE.NAME TO '#' IN V.FILE.NAME
                                IF COUNT(V.FILE.NAME,"#") GT 0 ELSE CONTINUE
                            END ELSE
                                IF N.FILE.NAME NE V.FILE.NAME THEN CONTINUE
                            END
                        END

                        DEB.LIST = YR.CEC.INWARD.FILES.ID:'['
                        DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.PROCESS.DATE>:'['
                        DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.PROCESS.TIME>:'['
                        DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.CREATION.DATE>:'['
                        DEB.LIST := R.CEC.INWARD.FILES<CEC.ICF.CREATION.TIME>:'['
                        DEB.SUIT = R.CEC.INWARD.FILES<CEC.ICF.FILE.NAME>:'['
                        IF R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER> NE '' THEN
                            TRAV.RECORD = R.CEC.INWARD.FILES<CEC.ICF.FILE.HEADER>
                            GOSUB SPLIT.THE.RECORD
                            MSG.ERR = 'EB-CEC.FILE.HEADER'
                            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                            RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:MSG.ERR:'[0[':XML.SPLIT
                        END
                        GOSUB PROCESS.ONE.REMIT
                        IF R.CEC.INWARD.FILES<CEC.ICF.FILE.TRAILER> NE '' THEN
                            TRAV.RECORD = R.CEC.INWARD.FILES<CEC.ICF.FILE.TRAILER>
                            GOSUB SPLIT.THE.RECORD
                            MSG.ERR = 'EB-CEC.FILE.TRAILER'
                            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                            RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:MSG.ERR:'[0[':XML.SPLIT
                        END
                    END
                NEXT IJT
            NEXT IJK
        END
    NEXT CTR

    IF RECORD.LIST EQ '' THEN
        TXT.ER = 'EB-CEC.NOTHING.FOUND'
        CALL LOT.TRANSLATE.ERROR(TXT.ER,'')
    END
    RETURN

***********************************************************************
PROCESS.ONE.REMIT:
***********************************************************************
    Y.CTR3 = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER>,@VM)
    FOR IJL = 1 TO Y.CTR3
        TRAV.RECORD = R.CEC.INWARD.FILES<CEC.ICF.REM.HEADER,IJL>
        GOSUB SPLIT.THE.RECORD
        RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'Rem header':'[0[':XML.SPLIT
        Y.CTR4 = DCOUNT(R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,IJL>,@SM)
        FOR IJP = 1 TO Y.CTR4
            REM.CODE.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.CODE,IJL,IJP>
            REM.FIRST.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.FIRST,IJL,IJP>
            REM.LAST.ID = R.CEC.INWARD.FILES<CEC.ICF.TRANS.LAST,IJL,IJP>
            FOR IJZ = REM.FIRST.ID TO REM.LAST.ID
                YR.CEC.INWARD.ID = YR.CEC.INWARD.CONCAT.ID:'.':REM.CODE.ID[1,3]:'.':FMT(IJZ,SEQ.FORMAT)
                GOSUB READ.CEC.INWARD.FILE
                IF NOT(ER) THEN
                    TRAV.RECORD = R.CEC.INWARD<CEC.IC.INWARD.REC,1,1>
                    GOSUB SPLIT.THE.RECORD
                    RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:YR.CEC.INWARD.ID:'[1[':XML.SPLIT
                END ELSE
                    N.ERR = 'EB-CEC.MISSING.DETAIL'
                    CALL LOT.TRANSLATE.ERROR(N.ERR,'')
                    RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:YR.CEC.INWARD.ID:'[1[':N.ERR:'[[[[['
                END
            NEXT IJZ
        NEXT IJP

        TRAV.RECORD = R.CEC.INWARD.FILES<CEC.ICF.REM.TRAILER,IJL>
        GOSUB SPLIT.THE.RECORD
        RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'Rem trail.':'[0[':XML.SPLIT

    NEXT IJL

    RETURN

***********************************************************************
SPLIT.THE.RECORD:
***********************************************************************

    IGA = 0 ; GOT.LINE = 0
    REC.LENGTH = LEN(TRAV.RECORD)
    XML.SPLIT = ''
    LOOP
        IGA += 1 ; LAST.POS = 256*(IGA-1)
        IF 256*IGA LT REC.LENGTH THEN
            IF XML.SPLIT NE '' THEN XML.SPLIT := '['
            XML.SPLIT := TRAV.RECORD[LAST.POS+1,256]
        END ELSE
            IF XML.SPLIT NE '' THEN XML.SPLIT := '['
            XML.SPLIT := TRAV.RECORD[LAST.POS+1,REC.LENGTH-LAST.POS]
            GOT.LINE = 1
        END
    UNTIL GOT.LINE
    REPEAT
    FOR IIT = 6 TO IGA STEP -1
        XML.SPLIT :='['
    NEXT IIT

    RETURN

***********************************************************************
INITIALISE:
***********************************************************************

    REC.DATA = '' ; REC.KEY = ''
    RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = '' ; POS = ''

    CALL Y.LOAD.CECPAR(TXT.ER)
    IF TXT.ER THEN RETURN

    LOCATE 'INWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING POS THEN
    SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,POS>:'"0"':"R"
    COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,POS>
    END

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
