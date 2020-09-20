*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALC.AMT.IMPAYE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* description du programme
*
* DATE: 2015 11 18
*-----------------------------------------------------------------------------
*Auteur : Zeki.BenOthmen@banquezitouna.com
*-----------------------------------------------------------------------------
* Historique des modifications :
*ZIT-UPG-R13-R19     :  No Changes.
*
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES
*-----------------------------------------------------------------------------
    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

* $INSERT I_EQUATE - Not Used anymore;----------------------------------------------------------
INITIALISE:


*-----------------------------------------------------------------------------
OPEN.FILES:


    RETURN

*-----------------------------------------------------------------------------
PROCESS:

    O.DATA = SUM(R.RECORD<PD.BAL.CURR.OS.AMT>)

    RETURN
*-------EB.SystemTables.getVFunction()-------------EB.SystemTables.getVFunction()------------EB.SystemTables.getRNew()-FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus--


END
