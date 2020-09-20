*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*Modification History:
*ZIT-UPG-R13-R19     :  No Changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE E.OFS.REPLACE.VIRG
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

*----------------------------------- 

V.FIELD = O.DATA
O.DATA = TRIM(V.FIELD, ",", "A")

END
