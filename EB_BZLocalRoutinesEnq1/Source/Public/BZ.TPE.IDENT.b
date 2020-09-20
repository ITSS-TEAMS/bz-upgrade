*---------------------------------
*Author ameni younes
*-------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TPE.IDENT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*-------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*------------------------------------------------------------------------

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.SM.TPE
*ZIT-UPG-R13-R19/E
*-----------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN
*----------------------------
INIT:
* $INSERT I_COMMON - Not Used anymore;BZ.SM.TPE"
* $INSERT I_EQUATE - Not Used anymore;	BZ.SM.TPE.REC = ''
	BZ.SM.TPE.ERR = ''
    CALL OPF(FN.BZ.SM.TPE,F.BZ.SM.TPE)
    ID=O.DATA
    RETURN
*-------------------------
GET.ID:
    CALL ALLOCATE.UNIQUE.TIME(IDENTIFIANT)
    Y.LONGUEUR=LEN(IDENTIFIANT)
    CHANGE '.' TO '' IN IDENTIFIANT
    Y.IDENTIFIANT=IDENTIFIANT[Y.LONGUEUR-5,5]
    Y.ID="258":Y.IDENTIFIANT:2
    CALL BZ.GENERATE.CLE.LUHN(Y.ID,10,CLE.LUHN)
    Y.ID=Y.ID:CLE.LUHN
    CALL F.READ(FN.BZ.SM.TPE,Y.ID,BZ.SM.TPE.REC,F.BZ.SM.TPE,BZ.SM.TPE.ERR)
    RETUEB.SystemTables.getVFunction()-------------------------
MAIN:
    GOSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus BZ.SM.TPE.REC THEN
        LOOP
        WHIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusNE ''
            GOSUB GET.ID
        REPEAT
        O.DATA=Y.ID
    END ELSE
        O.DATA=Y.ID
    END
    RETURN
	
	END
