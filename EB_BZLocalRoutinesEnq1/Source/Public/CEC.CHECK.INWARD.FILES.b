*-----------------------------------------------------------------------------
* <Rating>198</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE CEC.CHECK.INWARD.FILES
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation to T24 standards, READ to F.READ, WRITE to F.WRITE, DELETE to F.DELETE, OPEN to CALL OPF
*---------------------------------------------------------------------
*
* This load routine program allows to remove unwanted characters from
* an inward file Id.
*
*---- Revision History ------------------------------------------------
*
* 04/01/2010 : First design by Edgard PIGNON
*
*---------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_CECDIR

* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.PATH ELSE
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;
    F.FILE.PATH = ''
    CALL OPF(FN.FILE.PATH, F.FILE.PATH)
    MESS.ERR = 'EB-CEC.NO.INWARD.LOADED':@FM:DIR.IDENT
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;SS.ERR,"")
ETEXT = MESS.ERR ; RETURN
* END;*COMMENTED END

OLD.KEY.LIST = KEY.LIST
KEY.LIST = '' ; IEK = 0

LOOP
REMOVE FILE.NAME FROM OLD.KEY.LIST SETTING POINT1
WHILE FILE.NAME:POINT1
IF COUNTEB.SystemTables.getVFunction()," ") GT 0 THEB.SystemTables.getVFunction()D.FILE.NAME = FILEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus " " TO "_" IN FILE.NAME
*   READ FILE.DATA FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLD.FILE.NAME THEN    
    CALL F.READ(FN.FILE.PATH, OLD.FILE.NAME, FILE.DATA, F.FILE.PATH, ERR)
*    IF R.FILE THEN   ;*COMMENTED NOW
      IF FILE.DATA THEN
	ERR = ''
    FILE.DATA = ''
    END
*    WRITE FILE.DATA TO F.FILE.PATH,FILE.NAME
    CALL F.WRITE(FN.FILE.PATH, FILE.NAME, FILE.DATA)
        
*    DELETE F.FILE.PATH,OLD.FILE.NAME
    CALL F.DELETE(FN.FILE.PATH, OLD.FILE.NAME)
        
END ELSE
    MESS.ERR = 'EB-CEC.NO.INWARD.LOADED':@FM:OLD.FILE.NAME
    CALL LOT.TRANSLATE.ERROR(MESS.ERR,"")
    ETEXT = MESS.ERR
END
*END  ;*COMMENTED END
IEK = IEK + 1 ; KEY.LIST<IEK> = FILE.NAME
REPEAT

IF KEY.LIST EQ '' THEN

*       Check if previous execution has crashed then reexecute it first

UNFORM.FIEB.DataAccess.OpfID = "CECTEST" ; KEY.ADD = ''
RSTATEMENEB.DataAccess.Opf "SELECT FT.IN.TAPE WITH @ID EQ ":UNFORM.FILE.ID
CALL EB.READLIST(RSTATEMENT,KEY.ADD,'','','')
IF KEY.ADD NE '' THEN CALL CEC.TEST.INWARD
END ELSE CALL CEC.TEST.INWARD

RETURN

*--------EB.DaFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef--------------------------------------------------------
END
