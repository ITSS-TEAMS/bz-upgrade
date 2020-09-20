*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
**ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCOLLOS(ENQ.DATA)
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

* $INSERT I_COMMON - Not Used anymore;.LC.TYPES'
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;C.TYPES)

    FN.LC = 'F.LETTER.OF.CREDIT'
    F.LC = ''
    CALL OPF(FN.LC,F.LC)

    LC.ID = ''
    LC.CURR = ''
    LC.CUST = ''
    EXP.DATE = ''
    RETURN

SEL.RECS:

    ENQ.DATA.FIELDS = ENQ.DATA<2>
    E.DAEB.SystemTables.getVFunction()ATA<4>
    CHANGE @VM TO @FM IN ENQ.DATAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusGE @VM TO @FM IN E.DATA

    LOCATE '@ID' INFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND DOC.COLLECTION EQ 'YES'"
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETEB.DataAccess.OpfB.DataAccess.Opf
GET.LC.REC:

    SEL.LC.CMD = "SELECT ":FN.LC:" WITH LC.TYPE EQ ":TYPE.ID:
    IF LC.ID NE ''EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.CMD = EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.CMD : " AND WITH @ID EQ ":LC.ID
    END
EB.DataAccess.FReadIF LC.CUST NE '' THEN
        SEL.LC.CMD := " AND WITH APPLICANT.CUSTNO EQ ":LC.CUST
    END

    IF LC.CUEB.SyEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
**ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCOLLOS(ENQ.DATA)
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
    EXP.DATE = ''
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

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND DOC.COLLECTION EQ 'YES'"
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

    IF EXEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeress.FWriteEN
        SEL.LC.CMD := " AND WITH EXPIRY.DATE EQ ":EXP.DATE
    END

    CALLEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
**ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.INCOLLOS(ENQ.DATA)
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
    EXP.DATE = ''
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

    LOCATE 'APPLICANT.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CUST = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'I' AND DOC.COLLECTION EQ 'YES'"
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

    IF EXP.DATE NE '' THEN
        SEL.LC.CMD := " AND WITH EXPIRY.DATE EQ ":EXP.DATE
    END

    CALL EBFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefC.CMD,SEL.LC.LIST,'',NO.OF.LC,SEL.LC.ERR)
    LC.IEB.SystemTables.setE(SEL.LC.LIST)
    CHANGE @FM TO ' ' IN LC.IDS
    ENQ.DATA<2,1> = '@ID'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = LC.IDS

    RETURN
