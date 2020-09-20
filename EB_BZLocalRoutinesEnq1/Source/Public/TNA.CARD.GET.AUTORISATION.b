*-----------------------------------------------------------------------------
* <Rating>-30</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE TNA.CARD.GET.AUTORISATION
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :INITIALISATION F.READ VARIABLES;ADD MISSING END 
*-------------------------------------------------------
	$INSERT I_COMMON
	$INSERT I_EQUATE
	$INSERT I_ENQUIRY.COMMON
	$INSERT I_F.FUNDS.TRANSFER
	
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
INIT:
    FN.FT='F.FUNDS.TRANSFER'
    F.FT=''
	R.FT=''
	ERR1=''
	
    LISTEID=''
    RETURN

OPENFILES:
    CALL OPF(FN.FT,F.FT)
    RETURN
PROCESS:
    ID.FT=O.DATA
    CALL F.READ(FN.FT,ID.FT,R.FT,F.FT,ERR1)
    IF R.FT THEN
        AUTORISATION=R.FT<FT.CARD.TXN.DETAIL,3>
    END
    O.DATA=AUTORISATION
    RETURN
END
