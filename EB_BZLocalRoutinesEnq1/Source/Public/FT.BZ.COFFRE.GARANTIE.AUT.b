*-----------------------------------------------------------------------------
* <Rating>-33</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE FT.BZ.COFFRE.GARANTIE.AUT
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
    $INSERT I_F.FUNDS.TRANSFER
*ZIT-UPG-R09-R13/S
*    $INSERT BP I_F.BZ.COFFRE.CONTRAT
    $INSERT I_F.BZ.COFFRE.CONTRAT

*ZIT-UPG-R09-R13/E

    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF (V* $INSERT I_EQUATE - Not Used anymore;Q "I") OR (V$FUNCTION EQ "A" AND R.NEW(FT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(FT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END

    RETURN

INITIALISATION:
    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ''
    R.CT= ''
    ERR.CT = ''

    RETURN

OPENFILEEB.SystemTables.getVFunction()LL OPF(FN.CT,F.CT)

    RETURN

PROCEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusur REFERENCE GARANTIE AU NIVEAU CONTRAT COFFREFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTRAT = R.NEW(FT.PAYMENT.DETAILS)

    CALL F.READ(FN.CT,V.REF.CONTRAT,R.CT,F.CT,ERR.CT)

    IF R.CT NE "" THEN

        IF R.CT<CF.CT.REFERENCE.GARANTIE>[1,2] EQ "FT" THEN
            AF=FT.PAYMENT.DETAILS
            E="Garantie deja prelevee"
			
        END ELSE

            R.CT<CF.CT.REFERENCE.GARANTIE> = ID.NEW         ;* REFERENCE FT
            CALL F.WRITE(FN.CT,V.REF.CONTRAT,R.CT)

        END
    END ELSE
        AF=FT.PAYMENT.DETAILS
        E="Contrat Coffre inexistant"
		
    END

* FIN MEB.DataAccess.OpfB.DataAccess.Opfa jour REFERENCE GARANTIE AU NIVEAU CONTRAT COFFRE

    RETURN
