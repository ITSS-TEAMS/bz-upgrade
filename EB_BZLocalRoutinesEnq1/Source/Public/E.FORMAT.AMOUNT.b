*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19    : DBR CHANGED TO F.READ
*------------------------------------------------------------------------
* <Rating>0</Rating>
*------------------------------------------------------------------------
*------------------------------------------------------------
* reconstitution des crit�res dynamiques
*-------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE E.FORMAT.AMOUNT
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
$INSERT I_F.CURRENCY.PARAM
*--------------------------------------------------------------------

      V.CURR = R.RECORD<12>
*ZIT-UPG-R13-R19/S	
FN.CUR.PARAM ='F.CURRENCY.PARAM'
F.CUR.PARAM =''
CALL OPF(FN.CUR.PARAM,F.CUR.PARAM)

* $INSERT I_COMMON - Not Used anymore;PARAM, V.CURR, CUR.REC, F.CUR.PARAM, CUR.ERR)
* $INSERT I_EQUATE - Not Used anymore;CUP.NO.OF.DECIMALS>
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;RAM':FM:EB.CUP.NO.OF.DECIMALS,V.CURR,V.NBRE)
*ZIT-UPG-R13-R19/E

      V.FORMAT = "R" : V.NBRE

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;RMAT)

      RETURN

   END
