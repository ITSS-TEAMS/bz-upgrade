*-----------------------------------------------------------------------------
* <Rating>-31</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19    : NO CHANGES 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE FT.BZ.COF.RESIL.AUT
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
*    $INSERT I_F.BZ.COFFRE.CONTRAT
    $INSERT I_F.BZ.COFFRE.CONTRAT
*ZIT-UPG-R09-R13/E
$INSERT I_F.FUNDS.TRANSFER




* $INSERT I_COMMON - Not Used anymore;TION
* $INSERT I_EQUATE - Not Used anymore;



    IF (V$FUNCTION EQ "I") OR (V$FUNCTION EQ "A" AND R.NEW(FT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(FT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.CEB.SystemTables.getVFunction()COFFRE.CONTRAEB.SystemTables.getVFunction()CT = ''




FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusENFILES:
    CALL OPF(FN.CT,F.CT)

    RETUFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    V.REF.CONTRAT = R.NEW(FT.CREDIT.THEIR.REF)
R.CT =''
ERR.CT =''
    CALL F.READ(FN.CT,V.REF.CONTRAT,R.CT,F.CT,ERR.CT)

    IF R.CT NE "" THEN

        IF R.CT<CF.CT.REF.RESTIT.GAR> NE '' THEN
            AF=FT.DEBIT.THEIR.REF
            E="Garantie deja restitue"

        END ELSE

         EB.DataAccess.OpfR.CT<CF.CT.REF.RESTIT.GAR> = ID.NEW   ;* REFERENCE FT
         EB.DataAccess.OpfCALL F.WRITE(FN.CT,V.REF.CONTRAT,R.CT)

        END
    END ELSE
        AF=FT.PAYMENT.DETAILS
        E="ContratEB.SystemTables.getRNew()rFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
    END
EB.DataAccess.FReadRETURN
END
