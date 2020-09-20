*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : CONVERTED CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS
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
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULE.DATES
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PERIODIC.INTEREST
    $INSERT I_F.BASIC.RATE.TEXT
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_LD.SCH.LIST
    * $INSERT I_COMMON - Not Used anymore;ENCY
    * $INSERT I_EQUATE - Not Used anymore;OMER

    CALL E.LD.SCHED.LIST

    CHANGE "-" TO "" IN R.RECORD<23>

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;M)
    SOMME.PROFIT = SUM(R.RECORD<16>)

    R.RECORD<23,1> = R.RECORD<23,1> + SOMME.PROFIT

    FOR I = 2 TO NB-1

        R.RECORD<23,I> = R.RECORD<23,I-1> - R.RECORD<17,I> - R.RECORD<16,I>

    NEXT I

    RETURN
END
