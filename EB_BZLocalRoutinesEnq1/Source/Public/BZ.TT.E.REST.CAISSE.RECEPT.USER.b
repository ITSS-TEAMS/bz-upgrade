*----------------------------------------------------------------------
* <Rating>-21</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.E.REST.CAISSE.RECEPT.USER(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*-----------------------------------------------------------------------------
* MODIFICATION HISTORY :

*ZIT-UPG-R13-R19 : NO CHANGE
*-----------------------------------------------------------------------------	

*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E

    GOSUB OPEN.FILE
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
OPEN.FILE:

* $INSERT I_EQUATE - Not Used anymore; "F.TELLER.USER"
    F.TELLER.USER = ""
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;LER.USER)

    RETURN

MAIN:

    R.TELLER.USER = ""
    ERR.TELLER.USER = ""
    CALL F.READ(FN.TELLER.USER,OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.TELLER.USER)
    VALEUR.CAISSE = R.TELLER.USER<1,1>

    *TELLER.ID.1 EST LA CAISSEE RECEPTRICE (VERS CAISSE)
    V.VM = 0
    ENQ.DATA<2,V.VM> = 'TELLER.ID.1'
    ENQ.EB.SystemTables.getVFunction()M> = 'EQ'
    ENQ.DATA<4,V.VM> = VALEUR.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusURN 
END
