*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19: VARIABLE INITIALISED
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.EVENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.DATE.TIME)
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
*$INSERT BP I_F.BZ.COFFRE.CONTRAT
*$INSERT BP I_F.BZ.COFFRE.LOYER
*$INSERT BP I_F.BZ.COFFRE.REGISTRE
*$INSERT BP I_F.BZ.COFFRE.EVENEMENT


* $INSERT I_COMMON - Not Used anymore;E.CONTRAT
* $INSERT I_EQUATE - Not Used anymore;E.LOYER
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;RE
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;*ZIT-UPG-R09-R13/E

    FN.EVENT = "F.BZ.COFFRE.EVENEMENT"
    F.EVENT = ''
	ERR.EVENT = ''
	R.EVENT   = ''
    CALL OPF(FN.EVENT,F.EVENT)
    CALL F.READ(FN.EVENT,ID.EVENT,R.EVENT,F.EVENT,ERR.EVENT)


    IF R.EVENT EQ '' THEN

        R.EVENT<CF.EVENT.DATE> = DATE.EVENT
        EB.SystemTables.getVFunction().EVENT.DETAILEB.SystemTables.getVFunction()LS
        R.EVENFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.COFFRE> = NUMERO.COFFRE
        R.EVENT<CF.EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= TYPE.EVENT
        R.EVENT<CF.EVENT.ID.CONTRAT> = ID.CONTRAT
        R.EVENT<CF.EVENT.REF.OPERATION> = REF.OPERATION
        R.EVENT<CF.EVENT.DATE.TIME.EVENT> = Y.DATE.TIME

*Ecrire dans la table

        CALL F.WRITE(FN.EVENT,ID.EVENT,R.EVENT)
    END

    RETURN

END
