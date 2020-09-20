*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCLCOLLOS(ENQ.DATA)
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
    LC.APPL = ''
    EXP.DATE = ''
	POS = ''
	SEL.LIST = ''
	NO.OF.RECS = ''
	EB.SystemTables.getVFunction()''
	SEL.LC.LIST = ''
	NO.OF.LC = ''
	SFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
	
    RETURN

SEL.RECS:

    ENQ.DATA.FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'APPLICANT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.APPL = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END
EB.DataAccess.Opf   RETEB.DataAccess.Opf

PROCESS:

    SEL.CMD = "SELEB.SystemTables.getRNew():FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefITH IMPORT.EXPORT EQ 'I' AND CLEAN.COLLECTION EQ 'YES'"
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
    SUBROUTINE BZ.BUILD.INCLCOLLOS(ENQ.DATA)
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
    LC.APPL = ''
    EXP.DATE = ''
	POS = ''
	SEL.LIST = ''
	NO.OF.RECS = ''
	SEL.ERR = ''
	SEL.LC.LIST = ''
	NO.OF.LC = ''
	SEL.LC.ERR = ''
	
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'APPLICANT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.APPL = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND CLEAN.COLLECTION EQ 'YES'"
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

    IF LC.APPL NE '' THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCLCOLLOS(ENQ.DATA)
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
    LC.APPL = ''
    EXP.DATE = ''
	POS = ''
	SEL.LIST = ''
	NO.OF.RECS = ''
	SEL.ERR = ''
	SEL.LC.LIST = ''
	NO.OF.LC = ''
	SEL.LC.ERR = ''
	
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'APPLICANT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.APPL = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND CLEAN.COLLECTION EQ 'YES'"
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

    IF LC.APPL NE '' THEN
        SELFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefD WITH APPLICANT EQ ":LC.APPL
    ENDEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM, VM CHANGED TO @FM, @VM
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCLCOLLOS(ENQ.DATA)
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
    LC.APPL = ''
    EXP.DATE = ''
	POS = ''
	SEL.LIST = ''
	NO.OF.RECS = ''
	SEL.ERR = ''
	SEL.LC.LIST = ''
	NO.OF.LC = ''
	SEL.LC.ERR = ''
	
	
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA = ENQ.DATA<4>
    CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHANGE @VM TO @FM IN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'APPLICANT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.APPL = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND CLEAN.COLLECTION EQ 'YES'"
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

    IF LC.APPL NE '' THEN
        SEL.LC.CMD := " AND WITH APPLICANT EQ ":LC.APPL
    END

    IF LC.CURR NE '' THEN
        SEL.LC.CMD := " AND WITH LC.CURRENCY EQ ":LC.CURR
    END

    IF EXP.DATE NE '' THEN
        SEL.LC.CMD := " AND WITH EXPIRY.DATE EQ ":EXP.DATE
    END

    CALL EB.READLIST(SEL.LC.CMD,SEL.LC.LIST,'',NO.OF.LC,SEL.LC.ERR)
    LC.IDS = SEL.LC.LIST
    CHANGE @FM TO ' ' IN LC.IDS
    ENQ.DATA<2,1> = '@ID'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = LC.IDS

    RETURN
