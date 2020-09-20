*---------------------------------
*Author ameni younes
*-------------------------------
* Modification History :
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                      CONVERT to CHANGE                   
*-------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TPE.IDENT.KITMARCHANDS  
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
    $INSERT I_F.BZ.SM.TPE
*-----------------------------
    GOSUB INIT  
    GOSUB MAIN
    RETURN
*----------------------------
INIT:
    FN.BZ.SM.TPE="F.BZ.SM.TPE"
    F.BZ.SM.TPE=""
    CALL OPF(FN.BZ.SM.TPE,F.BZ.SM.TPE)
    ID=O.DATA
    RETURN
* $INSERT I_EQUATE - Not Used anymore;------
GET.ID:
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;NTIFIANT)
    Y.LONGUEUR=LEN(IDENTIFIANT)
  *  CONVERT '.' TO '' IN IDENTIFIANT
     CHANGE '.' TO '' IN IDENTIFIANT  
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.LONGUEUR-5,5]
    Y.ID="256":Y.IDENTIFIANT:2
    CALL BZ.GENERATE.CLE.LUHN(Y.ID,10,CLE.LUHN)
    Y.ID=Y.ID:CLE.LUHN
	BZ.SM.TPE.REC = '' ; BZ.SM.TPE.ERR = ''  
    CALL F.READ(FN.BZ.SM.TPE,Y.ID,BZ.SM.TPE.REC,F.BZ.SM.TPE,BZ.SM.TPE.ERR)
    RETURN
*------------------------------
MAIN:
    GOSUB GET.ID
    IF BEB.SystemTables.getVFunction()EC THEN
        LOOP
        WHILE BZ.SFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus            GOSUB GET.ID
        REPEAT    
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusID
    END ELSE
        O.DATA=Y.ID
    END
    RETURN
