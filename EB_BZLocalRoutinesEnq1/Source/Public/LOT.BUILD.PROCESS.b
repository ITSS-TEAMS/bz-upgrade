*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE LOT.BUILD.PROCESS
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
* This program is called to process the treatment of files remitted by
* customers to the bank in order to make or require payments on his
* behalf.
*
* It builds up a list of the files present on a given directory and
* passed their treatment to the LOT.EXEC.PROCESS routine.
*
*---- Revision History -----------------------------------------------
*
* 10/08/2006 : First design by Edgard PIGNON
*ZIT-UPG-R13-R19 :  No Changes.
*---------------------------------------------------------------------

$INSERT  I_COMMON
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_EQUATE
$INSERT  I_F.SPF
* $INSERT I_EQUATE - Not Used anymore;$INSERT  I_F.COMPANY
$INSERT  I_F.USER
$INSERT  I_F.LOT.PARAMETER
$INSERT  I_F.LOT.LOG

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;with files information to be passed to
* LOT.EXEC.PROCESS.

$INSERT  I_LOTDIR
$INSERT  I_LOTPAR
$INSERT  I_LOTERR

*    Makes here any specific selection on LOT.PARAMETER MV libraries.
*    If set to '', all are taken. A Number represents a multi-value.
*    For more then one, the separator should be MV (e.g. 1:MV:3) 

     DIR.MULTI.VALUE = ''

$INSERT  I_LOT.BUILD.PROCESSFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus----------------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus END
