*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.MODIFICATION.AUT
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
    *$INSERT BP I_F.BZ.COFFRE.EVENEMENT
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
    *$INSERT BP I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.EVENEMENT
$INSERT I_F.BZ.COFFRE.REGISTRE
* $INSERT I_COMMON - Not Used anymore;E.CONTRAT

*ZIT-UPG-R09-R13/E


    IF (V$FUNCTION EQ 'I') OR (V$FUNCTION EQ 'A' AND R.NEW(CF.CT.RECORD.STATUS) EQ 'INAU') OR ( V$FUNCTION EQ 'A' AND R.NEW(CF.CT.RECORD.STATUS) EQ 'INAO') THEN

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;"MTS")
        CHANGE ':' TO '' IN Y.TIME

        DATE.EVENT=TODAY
        DETAILS='Ancien Cpte: ' : R.OLD(CF.CT.COMPTE.FACTURATION) : '/ Nouv Cpte: ' : R.NEW(CF.CT.COMPTE.FACTURATION)
        NUMERO.COFFRE=R.NEW(CF.CT.NUMERO.COFFRE)
        TYPE.EVENT='3'
        ID.CONTRAT=ID.NEW
        REF.OPERATION=ID.NEW
        ID.EVENT =  NUMERO.COFFRE :'.':DATE.EVENT:'.':TYPE.EVENT:'.':Y.TIME

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
        FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRATtmp.V$FUNCTIONTION,Y.TIME)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus END
END
