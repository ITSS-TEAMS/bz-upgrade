*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SET.STATUT.CHQ.FIN
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
*ZIT-UPG-R13-R19-NO CHANGES
*------------------------------------------------------------------------
* @author BOUNOUARA FEHMI

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON

    STATUT.INS.CHEQUE=O.DATA

    BEGIN CASE

    CASE (STATUT.INS.CHEQUE EQ 1)
        O.DATA="Cheque emis"

    CASE STATUT.INS.CHEQUE EQ 2
        O.DATA="Cheque presente avec motif de rejet"

* $INSERT I_EQUATE - Not Used anymore;CHEQUE EQ 3
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;paye"

    CASE (STATUT.INS.CHEQUE EQ 4)
        O.DATA="Cheque emis annule"

    CASE 1
        O.DATA="Cheque emis STATUT ":STATUT.INS.CHEQUE

    END CASE


    RETURN


END
