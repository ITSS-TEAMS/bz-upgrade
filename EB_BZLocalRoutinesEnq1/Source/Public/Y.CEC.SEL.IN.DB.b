*-----------------------------------------------------------------------------
* <Rating>198</Rating>
*-----------------------------------------------------------------------------
      * Version 4 27/05/97  GLOBUS Release No. G8.0.01 30/06/97

$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE Y.CEC.SEL.IN.DB(ARGUE)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
******************************************************************************
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-ARITHEMETIC OPERATIONS TO OPERANDS; EXITED DCOUNT;VM TO @VM
******************************************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON

*************************************************************************

      SEL.OPE.CODE = ''
      CALL Y.CEC.EXTRACT.OPE.CODE('INWARD','DB',SEL.OPE.CODE)

      IF SEL.OPE.CODE NE '' THEN
         REC.OPE.CODE = ''
		 Y.SEL.OPE.CODE.CNT=DCOUNT(SEL.OPE.CODE<1>,@VM)
         FOR IJ = 1 TO Y.SEL.OPE.CODE.CNT
* $INSERT I_COMMON - Not Used anymore; 1 THEN REC.OPE.CODE =REC.OPE.CODE:' '
* $INSERT I_EQUATE - Not Used anymore;CODE =REC.OPE.CODE:SEL.OPE.CODE<1,IJ>
         NEXT IJ

         IF REC.OPE.CODE EQ '' THEN REC.OPE.CODE = 'NO'

         BEGIN CASE
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;[1,14] EQ 'FUNDS.TRANSFER'
               LOCATE 'CEC.APPL.CODE' IN ARGUE<2,1> SETTING HERE THEN
*                 ARGUE<4,HERE> = REC.OPE.CODE
               END ELSE
                  ARGUE<2,-1> = 'CEC.APPL.CODE'
                  ARGUE<3,-1> = 'EQ'
                  ARGUE<4,-1> = REC.OPE.CODE
               END
            CASE 1
               LOCATE 'APPLICATION.CODE' IN ARGUE<2,1> SETTING HERE THEN
*       EB.SystemTables.getVFunction()ARGUE<4,HERE>EB.SystemTables.getVFunction().CODE
           FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus               ARGUE<2,-1> = 'APPLICATION.CODEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    ARGUE<3,-1> = 'EQ'
                  ARGUE<4,-1> = REC.OPE.CODE
               END
         END CASE
      END

      RETURN

*************************************************************************

   END
