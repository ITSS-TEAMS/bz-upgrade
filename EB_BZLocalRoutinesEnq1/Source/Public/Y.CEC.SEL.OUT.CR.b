*-----------------------------------------------------------------------------
* <Rating>198</Rating>
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Arthimetic operators converted to operands.
*                : Converted VM to @VM.
*                : DCOUNT assigned to variable for FOR loop.
*----------------------------------------------------------

      * Version 4 27/05/97  GLOBUS Release No. G8.0.01 30/06/97

$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE Y.CEC.SEL.OUT.CR(ARGUE)
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

*************************************************************************

      SEL.OPE.CODE = ''
      CALL Y.CEC.EXTRACT.OPE.CODE('OUTWARD','CR',SEL.OPE.CODE)

      IF SEL.OPE.CODE NE '' THEN
         REC.OPE.CODE = ''
* $INSERT I_COMMON - Not Used anymore;EL.OPE.CODE<1>,@VM)
* $INSERT I_EQUATE - Not Used anymore;TO Y.DCNT
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;REC.OPE.CODE := ' '
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;PE.CODE<1,IJ>
         NEXT IJ

         IF REC.OPE.CODE EQ '' THEN REC.OPE.CODE = 'NO'

         BEGIN CASE
            CASE DATA.FILE.NAME[1,14] EQ 'FUNDS.TRANSFER'
               LOCATE 'CEC.APPL.CODE' IN ARGUE<2,1> SETTING HERE THEN
*                 ARGUE<4,HERE> = REC.OPE.CODE
               END ELSE
                  ARGUE<2,-1> = 'CEC.APPL.CODE'
                  ARGUE<3,-1> = 'EQ'
                  ARGUE<4,-1> = REC.OPE.CODE
               END
        EB.SystemTables.getVFunction()THERWISE
               LOCATE 'APPLICATFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusE<2,1> SETTING HERE THEN
*                 ARFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.OPE.CODE
               END ELSE
                  ARGUE<2,-1> = 'APPLICATION.CODE'
                  ARGUE<3,-1> = 'EQ'
                  ARGUE<4,-1> = REC.OPE.CODE
               END
         END CASE
      END

      RETURN

*************************************************************************

   END
