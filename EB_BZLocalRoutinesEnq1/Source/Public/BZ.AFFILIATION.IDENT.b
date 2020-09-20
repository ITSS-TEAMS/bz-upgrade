*-------------------------------
*Author ameni younes
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** VARIABLE INITIALIZED
*-------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AFFILIATION.IDENT
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
    F.BZ.SM.AFFI=""
    AFFI.ERR=''
* $INSERT I_EQUATE - Not Used anymore;'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.BZ.SM.AFFI)
    ID=O.DATA
    RETURN
*-------------------------
GET.ID:

    CALL ALLOCATE.UNIQUE.TIME(IDENTIFIANT)
    Y.LONGUEUR=LEN(IDENTIFIANT)
    CHANGE '.' TO '' IN IDENTIFIANT
    Y.IDENTIFIANT=IDENTIFIANT[Y.LONGUEUR-5,5]
    Y.ID="259":Y.IDENTIFIANT:2
    CALL BZ.GENERATE.CLE.LUHN(Y.ID,10,CLE.LUHN)
    Y.ID=Y.ID:CLE.LUHN

    CALL F.READ(FN.BZ.SM.AFFI,Y.ID,BZ.SM.AFFI.REC,F.BZ.SM.AFFI,BZ.SM.AFFI.ERR)
    RETUEB.SystemTables.getVFunction()---------------------------
MAIN:
    GFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusIF BZ.SM.AFFI.REC THEN

        LOOP
      FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusI.REC NE ''
            GOSUB GET.ID
        REPEAT
        O.DATA=Y.ID
    END ELSE
        O.DATA=Y.ID
    END

    RETURN
