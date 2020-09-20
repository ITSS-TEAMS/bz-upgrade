*-----------------------------------------------------------------------------
* <Rating>-15</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE CEC.BUILD.OUTWARD
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
*ZIT-UPG-R13-R19    : NO CHANGES
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

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;the accounting, delivery, dates check, fees calculation, ...

$INSERT I_CECOUT
$INSERT I_CECPAR

*    Makes here any specific selection on CEC.PARAMETER 'OUTWARD'
*    SV libraries. If set to '', all are taken. A Number represents a sub-value.
*    For more then one, the separator should be VM (e.g. 1:VM:3) 

     DIR.SUB.VALUE = ''

     GOSUB BUILD.OUTWARD

*    To issue a null header iFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusissing transaction type in daily outward

  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRD.REF.HIST(Y.PROCESS.DATE)
     CALL CEC.EMPTY.OUTWARD

     RETURN

BUILD.OUTWARD:

$INSERT I_CEC.BUILD.OUTWARD

*-----------------------------------------------------------------------
   END
