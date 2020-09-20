*-----------------------------------------------------------------------------
* <Rating>198</Rating>
*-----------------------------------------------------------------------------
*Modification history

*ZIT-UPG-R13-R19: OPERATORS CHANGED TO OPERANDS
*				  VM CHANGED TO @VM
*				  DCOUNT
*                 VARIABLE INITIALISED
*-----------------------------------------------------------------------------
      * Version 4 27/05/97  GLOBUS Release No. G8.0.01 30/06/97

$PACKAGE EB.BZLocalRoutinesEnq1
      SUBROUTINE Y.CEC.SEL.OUT.DB(ARGUE)
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
      CALL Y.CEC.EXTRACT.OPE.CODE('OUTWARD','DB',SEL.OPE.CODE)

* $INSERT I_EQUATE - Not Used anymore;E NE '' THEN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;SEL.OPE.CODE<1>,VM)
		 Y.CTR = DCOUNT(SEL.OPE.CODE<1>,@VM)
		 FOR IJ = 1 TO Y.CTR
            IF IJ GT 1 THEN REC.OPE.CODE := ' '
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.OPE.CODE<1,IJ>
         NEXT IJ

         IF REC.OPE.CODE EQ '' THEN REC.OPE.CODE = 'NO'
			HERE = 0
         BEGIN CASE
            CASE DATA.FILE.NAME[1,14] EQ 'FUNDS.TRANSFER'
               LOCATE 'CEC.APPL.CODE' IN ARGUE<2,1> SETTING HERE THEN
*                 ARGUE<4,HERE> = REC.OPE.CODE
               END ELSE
        EB.SystemTables.getVFunction()ARGUE<2,-1> =EB.SystemTables.getVFunction().CODE'
          FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus1> = 'EQ'
                  ARGUE<4,-1> = RECFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus         END
            CASE 1
               LOCATE 'APPLICATION.CODE' IN ARGUE<2,1> SETTING HERE THEN
*                 ARGUE<4,HERE> = REC.OPE.CODE
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
