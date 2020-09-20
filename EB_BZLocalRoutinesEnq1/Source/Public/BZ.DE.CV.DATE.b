*------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History:
* ZIT-UPG-R13-R19
*------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.DE.CV.DATE(Y.VALEUR.INS,NBRE.STMT.ENTRY,Y.STMT.RACINE,Y.TXN.CODE.TARGET,Y.ROUTINE.PARAM.4,Y.VALEUR.INS.RES)
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

    DATE.IN = Y.VALEUR.INS
    IF DATE.IN NE '' THEN
        SEP ="/"
        CALL BZ.CONV.DATE(DATE.IN,SEP)
    END
    Y.VALEUR.INS.RES= DATE.IN


    RETURN

END
