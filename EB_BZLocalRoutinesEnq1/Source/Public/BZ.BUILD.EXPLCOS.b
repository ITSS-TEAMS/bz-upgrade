*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.EXPLCOS(ENQ.DATA)
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
    ISS.BK.NUM = ''
    LC.AMT = ''
    LC.CURR = ''
    LC.BEN = ''
    ADV.EXP.DATE = ''
    EXP.DATE = ''
    RETURN

SEL.RECSEB.SystemTables.getVFunction()NQ.DATA.FIELDS = ENQ.DATA<2>
    E.DATA FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  CHANGE @VM TO @FM IN ENQ.DATA.FIELDS
    CHFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN E.DATA

    LOCATE '@ID' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.ID = E.DATA<POS>
    END

    LOCATE 'ISSUING.BANK.NO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ISS.BK.NUM = E.DATA<POS>
    END

    LOCATE 'LC.AMOUNT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.AMT = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'BENEFICIARY.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.BEN = E.DATA<POS>
    END

    LOCATE 'ADVICE.EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.EXP.DATE = E.DATA<POS>
    END
EB.DataAccess.Opf   LOCEB.DataAccess.Opf 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefead SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'E' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.EXPLCOS(ENQ.DATA)
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
    ISS.BK.NUM = ''
    LC.AMT = ''
    LC.CURR = ''
    LC.BEN = ''
    ADV.EXP.DATE = ''
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

    LOCATE 'ISSUING.BANK.NO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ISS.BK.NUM = E.DATA<POS>
    END

    LOCATE 'LC.AMOUNT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.AMT = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'BENEFICIARY.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.BEN = E.DATA<POS>
    END

    LOCATE 'ADVICE.EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.EXP.DATE = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'E' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerAccess.FWrite.LC.CMD = "SELECT ":FN.LC:" WITH LC.TYPE EQ ":TYPE.ID:
    IF LEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-50</Rating>
*---------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:Converted FM,VM, to @FM,@VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BUILD.EXPLCOS(ENQ.DATA)
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
    ISS.BK.NUM = ''
    LC.AMT = ''
    LC.CURR = ''
    LC.BEN = ''
    ADV.EXP.DATE = ''
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

    LOCATE 'ISSUING.BANK.NO' IN ENQ.DATA.FIELDS SETTING POS THEN
        ISS.BK.NUM = E.DATA<POS>
    END

    LOCATE 'LC.AMOUNT' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.AMT = E.DATA<POS>
    END

    LOCATE 'LC.CURRENCY' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.CURR = E.DATA<POS>
    END

    LOCATE 'BENEFICIARY.CUSTNO' IN ENQ.DATA.FIELDS SETTING POS THEN
        LC.BEN = E.DATA<POS>
    END

    LOCATE 'ADVICE.EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        ADV.EXP.DATE = E.DATA<POS>
    END

    LOCATE 'EXPIRY.DATE' IN ENQ.DATA.FIELDS SETTING POS THEN
        EXP.DATE = E.DATA<POS>
    END

    RETURN

PROCESS:

    SEL.CMD = "SELECT ":FN.LC.TYPES:" WITH IMPORT.EXPORT EQ 'E' "
    SEL.CMD := "AND DOC.COLLECTION NE 'YES' AND CLEAN.CREDIT NE 'YES' AND CLEAN.COLLECTION NE 'YES' "
    CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
    TYPE.ID = SEL.LIST
    CHANGE @FM TO ' ' IN TYPE.ID
    GOSUB GET.LC.REC

    RETURN

GET.LC.REC:

    SEL.LC.CMD = "SELECT ":FN.LC:" WITH LC.TYPE EQ ":TYPE.ID:
    IF LC.IFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef       EB.SystemTables.setE(EB.SystemTables.getE()EL.LC.CMD : " AND WITH @ID EQ ":LC.ID)
    END

    IF ISS.BK.NUM NE '' THEN
        SEL.LC.CMD := " AND WITH ISSUING.BANK.NO EQ ":ISS.BK.NUM
    END

    IF LC.AMT NE '' THEN
        SEL.LC.CMD := " AND WITH LC.AMOUNT EQ ":LC.AMT
    END

    IF LC.CURR NE '' THEN
        SEL.LC.CMD := " AND WITH LC.CURRENCY EQ ":LC.CURR
    END

    IF LC.BEN NE '' THEN
        SEL.LC.CMD := " AND WITH BENEFICIARY.CUSTNO EQ ":LC.BEN
    END

    IF ADV.EXP.DATE NE '' THEN
        SEL.LC.CMD := " AND WITH ADVICE.EXPIRY.DATE EQ ":ADV.EXP.DATE
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
