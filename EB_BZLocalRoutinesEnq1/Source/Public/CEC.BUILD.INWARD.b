*-----------------------------------------------------------------------------
* <Rating>-14</Rating>
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: NO CHNAGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.BUILD.INWARD
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
* an Inward Local clearing file has been received from the provider.
*
* This program may also runs during the start of day to process the
* pending file prior to any new file processing.
*
* It builds up a list of the files present on a given directory and
* passed their treatment to the SIT.EXEC.INWARD.CLEARING routine.
*
*---- Revision History ------------------------------------------------
*
* 17/08/2006 : First design by Edgard PIGNON
*
* $INSERT I_EQUATE - Not Used anymore;--------------------------------------------------


$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_EQUATE
$INSERT I_F.SPF
$INSERT I_F.DATES
$INSERT I_F.COMPANY
$INSERT I_F.USER
$INSERT I_F.CEC.PARAMETER
$INSERT I_F.CEC.INWARD.LOG

* Contains the fields used for the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECDIR
$INSERT EB.SystemTables.getVFunction()
*    Makes here any specific selection FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'INWARD'
*    SV libraries. If set to '', allFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusber represents a sub-value.
*    For more then one, the separator should be VM (e.g. 1:VM:3) 

     DIR.SUB.VALUE = ''

     GOSUB BUILD.INWARD

     RETURN

BUILD.INWARD:

$INSERT I_CEC.BUILD.INWARD

*-----------------------------------------------------------------------
   END
