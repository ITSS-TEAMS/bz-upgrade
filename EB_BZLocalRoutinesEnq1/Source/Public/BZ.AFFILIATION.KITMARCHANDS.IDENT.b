* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGES
*-------------------------------
*Author ameni younes
*-------------------------------
*---- Revision History ------------------------------------------------

*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AFFILIATION.KITMARCHANDS.IDENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.SM.AFFILIATION

*-----------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN
*----------------------------
INIT:
    FN.BZ.SM.AFFI="F.BZ.SM.AFFILIATION"
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;M.AFFI,F.BZ.SM.AFFI)
    ID=O.DATA
    RETURN
*-------------------------
GET.ID:
    CALL ALLOCATE.UNIQUE.TIME(IDENTIFIANT)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    CHANGE '.' TO '' IN IDENTIFIANT
    Y.IDENTIFIANT=IDENTIFIANT[Y.LONGUEUR-5,5]
    Y.ID="257":Y.IDENTIFIANT:2
    CALL BZ.GENERATE.CLE.LUHN(Y.ID,10,CLE.LUHN)
    Y.ID=Y.ID:CLE.LUHN
	BZ.SM.AFFI.REC = ''
	BZ.SM.AFFI.ERR = ''
    CALL F.READ(FN.BZ.SM.AFFI,Y.ID,BZ.SM.AFFI.REC,F.BZ.SM.AFFI,BZ.SM.AFFI.ERR)
    RETURN
*-------EB.SystemTables.getVFunction()-------------
MAIN:
    GOSUB GET.ID
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusREC THEN
        LOOP
        WHILE BZ.SM.AFFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus         GOSUB GET.ID
        REPEAT
        O.DATA=Y.ID
    END ELSE
        O.DATA=Y.ID
    END
    RETURN
