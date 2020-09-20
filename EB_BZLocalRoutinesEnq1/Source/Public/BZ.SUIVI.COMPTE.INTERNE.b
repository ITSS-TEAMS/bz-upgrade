*-----------------------------------------------------------------------------
* <Rating>199</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.SUIVI.COMPTE.INTERNE(ENQ.DATA)
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
*    CALL F.READ(FN.ACC,ACC.ID,R.ACC,F.ACC,ERR.ACC)  ;*NOT USED ANYWHERE IN THE PGM

    V.SELECT.FIELD = ENQ.DATA<2>
*    CONVERT @VM TO @FM IN V.SELECT.FIELD
	CHANGE @VM TO @FM IN V.SELECT.FIELD
    LOCATE "ACCOUNT" IN V.SELECT.FIELD  SETTING POS2 ELSE POS2=0

* $INSERT I_COMMON - Not Used anymore;TA<4,POS2>

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;  IN V.BORNE
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;NE
    V.BORNE = TRIM(V.BORNE, SPACE(1), "A")
    V.BORNE.1= FIELD(V.BORNE, "*",1)
    V.BORNE.2= FIELD(V.BORNE, "*",2)

    V.BORNE.1=  V.BORNE.1[6,10]
    V.BORNE.2=  V.BORNE.2[6,10]

    V.CATEG.1= V.BORNE.1
    V.CATEG.2= V.BORNE.2

    SELECTION = "SELECT ":FN.ACC:" WITH @ID LIKE '3A...' AND CATEGORY GE " : V.CATEG.1:"  AND CATEGORY LE  " : V.CATEG.2
	SEL.LIST=''
	NO.SEL=''
	EB.SystemTables.getVFunction()
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR)
    CALL EB.READLIST(SELECTION,SEtmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusR)

    IF SEL.LIST EQ '' THEN
        E="AFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusnt"
        CALL ERR
    END ELSE
        LOOP
            REMOVE ID FROM SEL.LIST SETTING POS
        WHILE ID:POS

        REPEAT

        V.SELECT.FIELD = ENQ.DATA<2>
*        CONVERT @VM TO @FM IN V.SELECT.FIELD
		CHANGE @VM TO @FM IN V.SELECT.FIELD
        LOCATE "ACCOUNT" IN V.SELECT.FIELD  SETTING POS2 ELSE POS2=0

        IF POS2 NE 0 THEN

*            CONVERT @FM TO SPACE(1) IN SEL.LIST
			CHANGE @FM TO SPACE(1) IN SEL.LIST
            ENQ.DATA<2,POS2> = 'ACCOUNT'
            ENQ.DATA<3,POS2> = 'EQ'
            ENQ.DATA<4,POS2> = SEL.LIST
        END
    END
    TEXT = NO.SEL
    CALL REM
	EB.DataAccess.Opf  RETUREB.DataAccess.OpfEND
