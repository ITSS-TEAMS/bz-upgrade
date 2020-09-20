*----------------------------------------------------------------------
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TT.COMPTE.BCT.DVS.NEW
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BOUNOUARA FEHMI
* Modification History :    
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT  
*                      GET.LOC.REF converted to MULTI.GET.LOC.REF                             
*------------------------------------------------------

    $INSERT I_COMMON     
    $INSERT I_EQUATE  
    $INSERT I_ENQUIRY.COMMON     
    $INSERT I_F.FUNDS.TRANSFER          
    $INSERT I_F.CURRENCY
*------------------------------------------------------------------------

    GOSUB OPEN.FILE
    GOSUB MAIN
    RETURN
*-------------------------------------------------------------
OPEN.FILE:

* $INSERT I_COMMON - Not Used anymore;ENCY"
    F.CUR = ""
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;

    RETURN
*-------------------------------------------------------------
MAIN:

    DEVISE = O.DATA

    R.CUR = ""  
    ERR.CUR = ""
    CALL F.READ(FN.CUR,DEVISE,R.CUR,F.CUR,ERR.CUR)          ;* Lire les donnees de la devise
  

   * CALL GET.LOC.REF("CURRENCY","COMPTE.BCT.DVS",REF1)
   YAPPLICATION.NAME = "CURRENCY"
   YFIELEB.SystemTables.getVFunction()COMPTE.BCT.DVEB.SystemTables.getVFunction()F.POS = ""  
tmp.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusystemTables.getVFunction()
   CALL MULTI.GET.LOC.REF(YAPPLICATION.tmp.V$FUNCTIOND.NAME,LREF.POS)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusS<1,1>             

    COMPTEBCT.DVS = R.CUR<EB.CUR.LOCAL.REF,REF1>           

    O.DATA = COMPTEBCT.DVS  

    RETURN
