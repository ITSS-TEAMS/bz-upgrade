*-----------------------------------------------------------------------------
* <Rating>-12</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE ZIT.CEC.BUILD.OUTWARD.080
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
* This program is called manually by the bank's operators whenever
* an Outward CEC file is to be generated to the provider.
*
* It builds up a list of the CEC.OUTWARD.PENDING available
* files and passed it to the CEC.EXEC.OUTWARD routine.
*
*---- Revision History ------------------------------------------------
*
* 22/05/2007 : First design by Edgard PIGNON
*ZIT-UPG-R13-R19-ADDED MISSING RETURN
*----------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
* $INSERT I_EQUATE - Not Used anymore;
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.OUTWARD.LOG
$INSERT I_F.CEC.OUTWARD.PENDING


* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECOUT
$INSERT I_CECPAR

*    Makes here any specific selection on CEC.PARAMETER 'OUTWARD'
*    SV libraries. If set to '', all are taken. A Number represents a sub-value.
*    For more then one, the separator should be VM (e.g. 1:VM:3) 

     DIREB.SystemTables.getVFunction() = 3

     GOSUB BUILD.OUTWARD

*    FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatuseader in case for each missing transaction typFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusd

     CALL CEC.OUTWARD.REF.HIST(Y.PROCESS.DATE)
*    CALL CEC.EMPTY.OUTWARD

     RETURN

BUILD.OUTWARD:
$INSERT I_CEC.BUILD.OUTWARD
RETURN  ;*ADDDED MISSING RETURN

*-----------------------------------------------------------------------
   END
