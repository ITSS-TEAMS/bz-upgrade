*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Varibales initialized, Converted FM to @FM, Converted Arithmatic operation
*                   Converted OPEN to CALL OPF, WRITE to F.WRITE, DELETE to F.DELETE, READ to F.READ
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.CHANGE.FILE.NAME
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---------------------------------------------------------------------
*
* This load routine program allows to remove unwanted characters from
* an inward file Id.
*
*---- Revision History ------------------------------------------------
*
* 13/10/2008 : First design by Edgard PIGNON
*
*---------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_EQUATE
    $INSERT I_LOTDIR

* $INSERT I_EQUATE - Not Used anymore;

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore; ELSE
    FN.FILE.PATH = "F.FILE.PATH"
    F.FILE.PATH = ""
    CALL OPF(FN.FILE.PATH,F.FILE.PATH)   ;*OPF is added
    FILE.DATA=''
    ERR=''
    CALL OPF(FN.DIR, F.DIR)
         
    MESS.ERR = 'EB-LOT.NO.INWARD.LOADED':@FM:DIR.IDENT
    CALL LOT.TRANSLATE.ERROR(MESS.ERR,"")
ETEXT = MESS.ERR ; RETURN
*END

OLD.KEY.LIST = KEY.LIST
KEY.LISTEB.SystemTables.getVFunction()K = 0

LOOP
REMOVE FILE.NAME FROM OLD.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPOINT1
WHILE FILE.NAME:POINT1
IF COUNT(FILE.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEN
    OLD.FILE.NAME = FILE.NAME
    CHANGE " " TO "_" IN FILE.NAME
*  READ FILE.DATA FROM F.FILE.PATH,OLD.FILE.NAME THEN
    CALL F.READ(FN.FILE.PATH,OLD.FILE.NAME,FILE.DATA,F.FILE.PATH,ERR)
    IF FILE.DATA THEN
            
*  WRITE FILE.DATA TO F.FILE.PATH,FILE.NAME
    CALL F.WRITE(FN.FILE.PATH,FILE.NAME,FILE.DATA)
            
* DELETE F.FILE.PATH,OLD.FILE.NAME
    CALL F.DELETE(FN.FILE.PATH,OLD.FILE.NAME)
            
END ELSE
    MESS.ERR = 'EB-LOT.NO.INWARD.LOADED':@FM:OLD.FILE.NAME
    CALL LOT.TRANSLATE.ERROR(MESS.ERR,"")
    ETEXT = MESS.ERR
END
END
IEK += 1 ; KEY.LIST<IEK> = FILE.NAME
REPEAT


RETURN

*------EB.DataAccess.OpfB.DataAccess.Opf------------------------------------------------------------
END
