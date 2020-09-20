*----------------------------------------------------------------------
* <Rating>-21</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.E.REST.CAISSE.EMETR.USER(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-ADDED MISSING END
*-------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*
*-------------------------------------------------------------
    GOSUB OPEN.FILE
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
OPEN.FILE:

    FN.TELLER.USER = "F.TELLER.USER"
    F.TELLER.USER = ""
    CALL OPF(FN.TELLER.USER,F.TELLER.USER)

    RETURN

MAIN:

    R.TELLER.USER = ""
    ERR.TELLER.USER = ""
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.TELLER.USER)
    VALEUR.CAISSE = R.TELLER.USER<1,1>

*TELLER.ID.2 EST LA CAISSEE EMETRICE (VERS CAISSE)
    V.VM = 0
    ENQ.DATA<2,V.VM> = 'TELLER.ID.2'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = VALEUR.CAISSE

    RETURN
END
