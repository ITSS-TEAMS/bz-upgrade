*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TR.CLEAR.CONCAT.POS(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* @desc Cette routine s'execute avant le lancement de la requete ZIT.TR.POS.MVMT.TODAY
* @desc Cette routine permet de vider la table ZIT.POS.MVMT.DETAILS
*
* @author OBenhalima
* @create 16 / 07 / 2010
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INTIALISED VARIABLES;ADDED MISSING END
*-------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON


    FN.DETS = "F.ZIT.POS.MVMT.DETAILS"
    F.DETS = ""
    K.DETS = ""
	R.CMD=""
	N.CMD=""
	E.CMD=""
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;MT.DETAILS"
    CALL EB.READLIST(CMD, R.CMD, '', N.CMD, E.CMD)
    IF N.CMD THEN
        FOR I = 1 TO N.CMD
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;            CALL F.DELETE(FN.DETS, K.DETS)
        NEXT I
    END
	CALL JOURNAL.UPDATE('') ;*EXITED FROM LOOP

    RETURN
END
