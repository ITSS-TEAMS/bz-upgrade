*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted FM, VM, SM
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.VIEW.OUTWARD.FILES(Y.LIST)
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
    * $INSERT I_COMMON - Not Used anymore;
    * $INSERT I_EQUATE - Not Used anymore;PARAMETER
    * $INSERT I_ENQUIRY.COMMON - Not Used anymore;FILES
    $INSERT I_F.CEC.OUTWARD
    $INSERT I_CECPAR
    $INSERT I_LOTERR

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;---

    GOSUB INITIALISE
    IF TXT.ER EQ '' THEN
        GOSUB SELECT.LIST
        IF TXT.ER EQ '' THEN
            GOSUB PROCESS
        END
    END

    IF TEB.SystemTables.getVFunction()
*    FOR IJK = 1 TO DCOUNT(TXT.ER,@FM)FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO CNT3FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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
        TEB.DataAccess.OpfER = 'DATE.TO > DATE.FROM'
    END
EB.DataAccess.Opf   IF DATE.FROM THEN
        IF DATE.FROM GT TODAY THEN
            TXT.ER = 'DATE.FROM > TODAY'
        END ELSE
      FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefROM EQ TODAY THEN DATE.TO = TODAY
        EEB.DataAccess.FRead  END

    LOCATE 'FILE.ID' IN D.FIELDS<1> SETTING ID.POS THEN
        N.FILE.ID = D.RANGE.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
    END ELSE
        N.FIEB.SystemTables.setE('')
    END

    N.FILE.NAME.OPEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerE 'FILE.EB.DataAccess.FWriteN D.FIELDS<1> SETTING ID.POS THEN
        N.FILE.NAME = D.RANGE.AND.VALUE<ID.POS>
        IF COUNT(N.FILE.NAME,"...") GT 0 THEN
            N.FILE.NAME.OPER = 'Y'
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted FM, VM, SM
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.VIEW.OUTWARD.FILES(Y.LIST)
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
    $INSERT I_F.CEC.OUTWARD.FILES
    $INSERT I_F.CEC.OUTWARD
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
*    FOR IJK = 1 TO DCOUNT(TXT.ER,@FM)
        CNT3 = DCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO CNT3
            Y.LIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefO '' IN N.FILE.NAME
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1435</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*** Converted FM, VM, SM
*** Converted DCOUNT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.VIEW.OUTWARD.FILES(Y.LIST)
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
    $INSERT I_F.CEC.OUTWARD.FILES
    $INSERT I_F.CEC.OUTWARD
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
*    FOR IJK = 1 TO DCOUNT(TXT.ER,@FM)
        CNT3 = DCOUNT(TXT.ER,@FM)
        FOR IJK = 1 TO CNT3
            Y.LIST<-1> = '[[[[[[0[ERROR[':TXT.ER<IJK>:'[[[[[['
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
            CHANGE '...' TO '' IN N.FILE.NAME
        END
    END ELSE
        N.FILE.NAME = ''
    END

    CALL EB.READLIST('','','','','')   ; * To reset the desktop bug

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

*  FOR CTR = 1 TO DCOUNT(ID.LIST.ALL,@FM)
    CNT4 = DCOUNT(ID.LIST.ALL,@FM)
    FOR CTR = 1 TO CNT4
        YR.CEC.OUTWARD.CONCAT.ID = TRIM(ID.LIST.ALL<CTR>)
        GOSUB READ.CEC.OUTWARD.CONCAT.FILE
        IF NOT(ER) THEN
*   FOR IJK = 1 TO DCOUNT(R.CEC.OUTWARD.CONCAT<1>,@VM)
            CNT5 = DCOUNT(R.CEC.OUTWARD.CONCAT<1>,@VM)
            FOR IJK = 1 TO CNT5
*      FOR IJT = 1 TO DCOUNT(R.CEC.OUTWARD.CONCAT<1,IJK>,@SM)
                CNT6 = DCOUNT(R.CEC.OUTWARD.CONCAT<1,IJK>,@SM)
                FOR IJT = 1 TO CNT6
                    YR.CEC.OUTWARD.FILES.ID = R.CEC.OUTWARD.CONCAT<1,IJK,IJT>
                    IF N.FILE.ID AND N.FILE.ID NE YR.CEC.OUTWARD.FILES.ID THEN CONTINUE
                    GOSUB READ.CEC.OUTWARD.FILES.FILE

                    IF NOT(ER) THEN
                        IF N.FILE.NAME THEN
                            V.FILE.NAME = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME>
                            IF N.FILE.NAME.OPER EQ 'Y' THEN
                                CHANGE N.FILE.NAME TO '#' IN V.FILE.NAME
                                IF COUNT(V.FILE.NAME,"#") GT 0 ELSE CONTINUE
                            END ELSE
                                IF N.FILE.NAME NE V.FILE.NAME THEN CONTINUE
                            END
                        END

                        DEB.LIST = YR.CEC.OUTWARD.FILES.ID:'['
                        DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.DATE>:'['
                        DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.PROCESS.TIME>:'['
                        DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.DATE>:'['
                        DEB.LIST := R.CEC.OUTWARD.FILES<CEC.OCF.CREATION.TIME>:'['
                        DEB.SUIT = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.NAME>:'['
                        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER> NE '' THEN
                            TRAV.RECORD = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.HEADER>
                            GOSUB SPLIT.THE.RECORD
                            MSG.ERR = 'EB-CEC.FILE.HEADER'
                            CALL LOT.TRANSLATE.ERROR(MSG.ERR,'')
                            RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:MSG.ERR:'[0[':XML.SPLIT
                        END
                        GOSUB PROCESS.ONE.REMIT
                        IF R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER> NE '' THEN
                            TRAV.RECORD = R.CEC.OUTWARD.FILES<CEC.OCF.FILE.TRAILER>
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

***   FOR IJL = 1 TO DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER>,VM)
    CNT1 = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER>,@VM)
    FOR IJL = 1 TO CNT1
        TRAV.RECORD = R.CEC.OUTWARD.FILES<CEC.OCF.REM.HEADER,IJL>
        GOSUB SPLIT.THE.RECORD
        RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:'Rem header':'[0[':XML.SPLIT
         
***      FOR IJP = 1 TO DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL>,SM)
        CNT2 = DCOUNT(R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL>,@SM)
        FOR IJP = 1 TO CNT2
            REM.CODE.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.CODE,IJL,IJP>[1,3]
            REM.FIRST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.FIRST,IJL,IJP>
            REM.LAST.ID = R.CEC.OUTWARD.FILES<CEC.OCF.TRANS.LAST,IJL,IJP>
            FOR IJZ = REM.FIRST.ID TO REM.LAST.ID
                YR.CEC.OUTWARD.ID = YR.CEC.OUTWARD.CONCAT.ID:'.':REM.CODE.ID:'.':FMT(IJZ,SEQ.FORMAT)
                GOSUB READ.CEC.OUTWARD.FILE
                IF NOT(ER) THEN
                    TRAV.RECORD = R.CEC.OUTWARD<CEC.OC.OUTWARD.REC,1,1>
                    GOSUB SPLIT.THE.RECORD
                    RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:YR.CEC.OUTWARD.ID:'[1[':XML.SPLIT
                END ELSE
                    N.ERR = 'EB-CEC.MISSING.DETAIL'
                    CALL LOT.TRANSLATE.ERROR(N.ERR,'')
                    RECORD.LIST<-1> = DEB.LIST:DEB.SUIT:YR.CEC.OUTWARD.ID:'[1[':N.ERR:'[[[[['
                END
            NEXT IJZ
        NEXT IJP

        TRAV.RECORD = R.CEC.OUTWARD.FILES<CEC.OCF.REM.TRAILER,IJL>
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
    RECORD.LIST = '' ; Y.LIST = '' ; TXT.ER = ''

    CALL Y.LOAD.CECPAR(TXT.ER)
    IF TXT.ER THEN RETURN

    LOCATE 'OUTWARD' IN R.CEC.PARAMETER<CEC.PAR.FILE.DIRECTION,1> SETTING POS THEN
        SEQ.FORMAT = R.CEC.PARAMETER<CEC.PAR.SEQUENCE.DIGITS,POS>:'"0"':"R"
        COMMIT.NUMBER = R.CEC.PARAMETER<CEC.PAR.COMMIT.NUMBER,POS>
    END

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

    ER = ''
    CALL F.READ(CEC.OUTWARD.FILE,YR.CEC.OUTWARD.ID,R.CEC.OUTWARD,F.CEC.OUTWARD,ER)

RETURN

READ.CEC.OUTWARD.CONCAT.FILE:

    ER = ''
    CALL F.READ(CEC.OUTWARD.CONCAT.FILE,YR.CEC.OUTWARD.CONCAT.ID,R.CEC.OUTWARD.CONCAT,F.CEC.OUTWARD.CONCAT,ER)

RETURN

READ.CEC.OUTWARD.FILES.FILE:

    ER = ''
    CALL F.READ(CEC.OUTWARD.FILES.FILE,YR.CEC.OUTWARD.FILES.ID,R.CEC.OUTWARD.FILES,F.CEC.OUTWARD.FILES,ER)

RETURN
*-----------------------------------------------------------------------
END
