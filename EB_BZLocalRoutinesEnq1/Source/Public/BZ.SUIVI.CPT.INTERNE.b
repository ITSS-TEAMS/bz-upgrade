*-----------------------------------------------------------------------------
* <Rating>99</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SUIVI.CPT.INTERNE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;CONVERT TO CHANGE;COMMENTED F.READ
*-------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ACCOUNT



    FN.ACC= 'F.ACCOUNT'
    F.ACC=''

    CALL OPF(FN.ACC,F.ACC)



* $INSERT I_COMMON - Not Used anymore;ACC,ACC.ID,R.ACC,F.ACC,ERR.ACC) ;*NOT USED IN THE PRGM.


* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;:" WITH @ID LIKE '...10001...'"
	SEL.LIST=''
	NO.SEL=''
	SEL.ERR=''
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;SEL.LIST,'',NO.SEL,SEL.ERR)

    IF SEL.LIST EQ '' THEN
        E="Aucun enregistrement"
        CALL ERR
    END ELSE
        LOOP
            REMOVE ID FROM SEL.LIST SETTING POS
        WHILE ID:POS

        EB.SystemTables.getVFunction()        V.SELECT.FIELD = ENQ.DATA<2>
*  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus TO @FM IN V.SELECT.FIELD
		CHANGE @VM TO @FMFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusD
        LOCATE "ACCOUNT" IN V.SELECT.FIELD  SETTING POS2 ELSE POS2=0

        IF POS2 NE 0 THEN

 *           CONVERT @FM TO SPACE(1) IN SEL.LIST
			CHANGE @FM TO SPACE(1) IN SEL.LIST
            ENQ.DATA<2,POS2> = 'ACCOUNT'
            ENQ.DATA<3,POS2> = 'EQ'
            ENQ.DATA<4,POS2> = SEL.LIST
        END
    END

    RETURN
END
