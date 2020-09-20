*-----------------------------------------------------------------------------
* <Rating>99</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE E.LOT.EVENT.LOG
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*---- Revision History ------------------------------------------------
**ZIT-UPG-R13-R19   : Arithmetic operators converted to operands.
*                   : Converted SM to @SM.
*---------------------------------------------------------------------

$INSERT  I_COMMON
$INSERT  I_ENQUIRY.COMMON
$INSERT  I_F.LOT.LOG
$INSERT  I_EQUATE

*---- Main processing section ----

      O.DATA = ''
      SM.COUNT = DCOUNT(R.RECORD<LOT.LOG.EVENT.TIME,VC>,@SM) 
      FOR IJK = 1 TO SM.COUNT
         IF R.RECORD<LOT.LOG.EVENT.MESS,VC,IJK> THEN
            FIND.TIME = R.RECORD<LOT.LOG.EVENT.TIME,VC,IJK>
            BEGIN CASE 
* $INSERT I_COMMON - Not Used anymore;R.RECORD<LOT.LOG.EVENT.LEVEL,VC,IJK> EQ '1'
* $INSERT I_EQUATE - Not Used anymore;ND.LEVE = 'OVER : '
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;<LOT.LOG.EVENT.LEVEL,VC,IJK> EQ '2'
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;               CASE 1
                  FIND.LEVE = 'AVIS : '
            END CASE
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;D<LOT.LOG.EVENT.MESS,VC,IJK>
         END
         IF S EQ IJK THEN O.DATA = FIND.TIME:' ':FIND.LEVE:FIND.MESS 
      NEXT IJK

      RETURN

*-----------------------------------------------------------------------
   END
