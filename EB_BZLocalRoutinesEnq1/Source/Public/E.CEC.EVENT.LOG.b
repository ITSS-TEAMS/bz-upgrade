*-----------------------------------------------------------------------------
* <Rating>99</Rating>
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:Arithmetic Operations Changed to T24 Operands 
**               :SM Converted to @SM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE E.CEC.EVENT.LOG
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
*
*
*---------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.CEC.INWARD.LOG
$INSERT I_EQUATE


*---- Main processing section ----

      O.DATA = ''
* $INSERT I_COMMON - Not Used anymore;UNT(R.RECORD<CEC.ICL.EVENT.TIME,VC>,@SM) 
* $INSERT I_EQUATE - Not Used anymore; SM.COUNT
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;.EVENT.MESS,VC,IJK> THEN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;CEC.ICL.EVENT.TIME,VC,IJK>
            BEGIN CASE 
               CASE R.RECORD<CEC.ICL.EVENT.LEVEL,VC,IJK> EQ '1'
                  FIND.LEVE = 'OVER : '
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;C.ICL.EVENT.LEVEL,VC,IJK> EQ '2'
                  c = 'BLOC : '
               CASE 1
                  FIND.LEVE = 'AVIS : '
            END CASE
            FIND.MESS = R.RECORD<CEC.ICL.EVENT.MESS,VC,IJK>
         END
         IF S EQ IJK THEN O.DATA = FIND.TIME:' ':FIND.LEVE:FIND.MESS 
      NEXT IJK

      REEB.SystemTables.getVFunction()-----------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus------------
   END
