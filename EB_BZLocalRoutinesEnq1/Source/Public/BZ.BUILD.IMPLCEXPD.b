*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.IMPLCEXPD(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LC.TYPES
    $INSERT I_F.LETTER.OF.CREDIT
	

    GOSUB INIT
    GOSUB SEL.RECS
    GOSUB PROCESS

    RETURN

INIT:

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;S'
    F.LC.TYPES = ''
    CALL OPF(FN.LC.TYPES,F.LC.TYPES)

    FN.LC = 'F.LETTER.OF.CREDIT'
    F.LC = ''
    CALL OPF(FN.LC,F.LC)

    LC.ID = ''
    LC.CURR = ''
    LC.CUST = ''
    ADV.BK.CUSTNO = ''
	POS =''
	SEL.ERR = ''
    NO.OF.RECS = ''
    SEL.EB.SystemTables.getVFunction()
    SEL.LC.LIST = ''
	NO.OF.LC =''
	SEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    RETURN

SEL.RECS:

    ENQ.DATA.FIELDSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'ADVISING.BK.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.BK.CUSTNO = E.DATA<POS>
    END

    RETEB.DataAccess.OpfB.DataAccess.Opf
PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' "
    SEL.CMD := "ANEB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefYES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.EB.DataAccess.FReadEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.LC.REC:EBEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.IMPLCEXPD(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LC.TYPES
    $INSERT I_F.LETTER.OF.CREDIT
	

    GOSUB INIT
    GOSUB SEL.RECS
    GOSUB PROCESS

    RETURN

INIT:

    FN.LC.TYPES = 'F.LC.TYPES'
    F.LC.TYPES = ''
    CALL OPF(FN.LC.TYPES,F.LC.TYPES)

    FN.LC = 'F.LETTER.OF.CREDIT'
    F.LC = ''
    CALL OPF(FN.LC,F.LC)

    LC.ID = ''
    LC.CURR = ''
    LC.CUST = ''
    ADV.BK.CUSTNO = ''
	POS =''
	SEL.ERR = ''
    NO.OF.RECS = ''
    SEL.LIST = ''
    SEL.LC.LIST = ''
	NO.OF.LC =''
	SEL.LC.ERR =''
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'ADVISING.BK.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.BK.CUSTNO = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.LC.REC:

    SEL.LC.CMD = "SEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerH LC.EB.SystemTables.getIdNew()Q ":TYPE.ID:
    IF LC.ID NE '' THEN
        SEL.LC.CMEB.DataAccess.FWriteAND WITH @ID EQ ":LC.ID
    END

    IF LC.CUST NE '' THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.IMPLCEXPD(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LC.TYPES
    $INSERT I_F.LETTER.OF.CREDIT
	

    GOSUB INIT
    GOSUB SEL.RECS
    GOSUB PROCESS

    RETURN

INIT:

    FN.LC.TYPES = 'F.LC.TYPES'
    F.LC.TYPES = ''
    CALL OPF(FN.LC.TYPES,F.LC.TYPES)

    FN.LC = 'F.LETTER.OF.CREDIT'
    F.LC = ''
    CALL OPF(FN.LC,F.LC)

    LC.ID = ''
    LC.CURR = ''
    LC.CUST = ''
    ADV.BK.CUSTNO = ''
	POS =''
	SEL.ERR = ''
    NO.OF.RECS = ''
    SEL.LIST = ''
    SEL.LC.LIST = ''
	NO.OF.LC =''
	SEL.LC.ERR =''
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'ADVISING.BK.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.BK.CUSTNO = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.LC.REC:

    SEL.LC.CMD = "SELECT ":FN.LC:" WITH LC.TYPE EQ ":TYPE.ID:
    IF LC.ID NE '' THEN
        SEL.LC.CMD := " AND WITH @ID EQ ":LC.ID
    END

    IF LC.CUST NE '' THEN
        SELFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefD WITH APPLICANT.CUSTNO EQ ":LC.CUST
    ENDEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.IMPLCEXPD(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LC.TYPES
    $INSERT I_F.LETTER.OF.CREDIT
	

    GOSUB INIT
    GOSUB SEL.RECS
    GOSUB PROCESS

    RETURN

INIT:

    FN.LC.TYPES = 'F.LC.TYPES'
    F.LC.TYPES = ''
    CALL OPF(FN.LC.TYPES,F.LC.TYPES)

    FN.LC = 'F.LETTER.OF.CREDIT'
    F.LC = ''
    CALL OPF(FN.LC,F.LC)

    LC.ID = ''
    LC.CURR = ''
    LC.CUST = ''
    ADV.BK.CUSTNO = ''
	POS =''
	SEL.ERR = ''
    NO.OF.RECS = ''
    SEL.LIST = ''
    SEL.LC.LIST = ''
	NO.OF.LC =''
	SEL.LC.ERR =''
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'ADVISING.BK.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.BK.CUSTNO = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.LC.REC:

    SEL.LC.CMD = "SELECT ":FN.LC:" WITH LC.TYPE EQ ":TYPE.ID:
    IF LC.ID NE '' THEN
        SEL.LC.CMD := " AND WITH @ID EQ ":LC.ID
    END

    IF LC.CUST NE '' THEN
        SEL.LC.CMD := " AND WITH APPLICANT.CUSTNO EQ ":LC.CUST
    END

    IF LC.CURR NE '' THEN
        SEL.LC.CMD := " AND WITH LC.CURRENCY EQ ":LC.CURR
    END

    IF ADV.BK.CUSTNO '' THEN
        SEL.LC.CMD := " AND WITH ADVISING.BK.CUSTNO EQ ":ADV.BK.CUSTNO
    END

    CALL EB.READLIST(SEL.LC.CMD,SEL.LC.LIST,'',NO.OF.LC,SEL.LC.ERR)
    LC.IDS = SEL.LC.LIST
    CHANGE @FM TO ' ' IN LC.IDS
    ENQ.DATA<2,1> = '@ID'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = LC.IDS

    RETURN
