*-----------------------------------------------------------------------------
* <Rating>-34</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.VISITE.AUT
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
    $INSERT I_F.USER
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.COFFRE.EVENEMENT
*$INSERT BP I_F.BZ.COFFRE.REGISTRE
*$INSERT BP I_F.BZ.COFFRE.CONTRAT
*$INSERT BP I_F.BZ.COFFRE.VISITE

$INSERT I_F.BZ.COFFRE.EVENEMENT
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.CONTRAT
* $INSERT I_COMMON - Not Used anymore;E.VISITE

*ZIT-UPG-R09-R13/E
    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF (V$FUNCTION EQ 'I') OR (V$FUNCTION EQ 'A' AND R.NEW(CF.VST.RECORD.STATUS) EQ 'INAU') OR ( V$FUNCTION EQ 'A' AND R.NEW(CF.VST.RECORD.STATUS) EQ 'INAO') THEN
        GOSUB PROCESS

    END

    RETURN

INITIALISATION:

    FN.CT = "F.BZ.COFFRE.CONTRAT"
    F.CT = ''

    RETURN
OPENFILES:

    CALL OPF(FN.CT,F.CT)

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus

*Enregistrement evenement visite coffre
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DATE.EVENT=TODAY
    DETAILS='Mandat: ' : R.NEW(CF.VST.ID.MANDAT) : " / Observations: " : R.NEW(CF.VST.OBSERVATIONS)

* Récupérer Num coffre du contrat
    ID.CONTRAT=R.NEW(CF.VST.ID.CONTRAT)
    CALL F.READ(FN.CT,ID.CONTRAT,R.CT,F.CT,ERR.CT)
    NUMERO.COFFRE=R.CT<CF.CT.NUMERO.COFFRE>
*Fin Récupérer Num coffre du contrat
    TYPE.EVENT='5'
    REF.OPERATION=ID.NEW
    ID.EVENT =  NUMERO.COFFRE :'.':DATE.EVENT:'.':TYPE.EVENT:'.':Y.TIME

    CALL BZ.COFFRE.EVENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME)

*FIN Enregistrement evenement visite coffre  
    RETURN

END
