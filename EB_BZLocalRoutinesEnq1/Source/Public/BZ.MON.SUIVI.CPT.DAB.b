*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19:CONVERT converted to CHANGE
*               :FM converted to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MON.SUIVI.CPT.DAB(ENQ.DATA)
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
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.TT.DAB
 $INSERT I_F.BZ.TT.DAB

*ZIT-UPG-R09-R13/E
    FN.DAB = 'F.BZ.TT.DAB'
    F.DAB = ''
    K.DAB = ''
    R.DAB = ''
    E.DAB = ''

    CALL OPF(FN.DAB,F.DAB)

    SEL.COMMAND="SELECT ":FN.DAB
    
	SEL.LIST=''
	NO.OF.REC=''
	ERR1=''
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        E="Aucun enregistrement"
        CALL ERR
    END ELSE
        LOOP
        EB.SystemTables.getVFunction() ID FROM SEL.EB.SystemTables.getVFunction()NG POS
        WHFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus         CALL F.READ(FN.DAB,ID,R.DAB,F.DAB,E.DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  COMPTE = R.DAB <DAB.COMPTE.DAB>
            IF COMPTE NE '' THEN

                TABLEAU<-1> = COMPTE
            END

        REPEAT
*ZIT-UPG-R13-R19 S
*       CONVERT FM TO SPACE(1) IN TABLEAU
		CHANGE @FM TO SPACE(1) IN TABLEAU
*ZIT-UPG-R13-R19 E

        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = TABLEAU

        RETURN

    END
