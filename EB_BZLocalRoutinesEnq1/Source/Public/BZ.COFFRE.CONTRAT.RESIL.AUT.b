*-----------------------------------------------------------------------------
* <Rating>-34</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.CONTRAT.RESIL.AUT
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
*    $INSERT BP I_F.BZ.COFFRE.CONTRAT
*    $INSERT BP I_F.BZ.COFFRE.REGISTRE

$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
*ZIT-UPG-R09-R13/E

    GOSUB INITIALISATION
* $INSERT I_COMMON - Not Used anymore;


    IF (V* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REEB.SystemTables.getVFunction() ERR.REG = ''

    C.STAT.DISPONIBLE="1FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus

OPENFILES:
    CALL OPF(FN.REG,F.REG)

FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCESS:
* Metre a jour statut coffre : 1 Disponible
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

    IF R.REG NE "" THEN
        R.REG<CF.REG.STATUT> =   C.STAT.DISPONIBLE
        CALL F.WRITE(FN.REG,V.NUM.COFFRE,R.REG)
    END ELSE

        ETEXT="NUM coffre inexistant"
        CALL STORE.END.ERROR

    END

* FIN Metre a jour statut coffre : 1 Disponible
*EnregistEB.DataAccess.Opfent evenement resiliation location  coffre
    Y.TIMEB.DataAccess.Opf OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DATE.EVENT=TODAY
    DETAILS='AUTHORISER: ' : R.USER<EB.USE.USER.NAME>
    NUMERO.COFFRE=R.NEW(CF.CT.NUMERO.COFFRE)
    TYPE.EVENT='4'
    FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEW
    REF.OEB.DataAccess.FReadON=ID.NEW
    ID.EVENT =  NUMERO.COFFRE :'.':DATE.EVENT:'.':TYPE.EVENT:'.':Y.TIME

    CALL BZ.COFFRE.EVENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME)

*FIN Enregistrement evenemEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyercation  coffre


    RETUEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-34</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COFFRE.CONTRAT.RESIL.AUT
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
*    $INSERT BP I_F.BZ.COFFRE.CONTRAT
*    $INSERT BP I_F.BZ.COFFRE.REGISTRE

$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
*ZIT-UPG-R09-R13/E

    GOSUB INITIALISATION
    GOSUB OPENFILES


    IF (V$FUNCTION EQ "I") OR (V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAU") OR ( V$FUNCTION EQ "A" AND R.NEW(CF.CT.RECORD.STATUS) EQ "INAO") THEN

        GOSUB PROCESS

    END


    RETURN



INITIALISATION:
    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    C.STAT.DISPONIBLE="1"


    RETURN

OPENFILES:
    CALL OPF(FN.REG,F.REG)

    RETURN

PROCESS:
* Metre a jour statut coffre : 1 Disponible
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

    IF R.REG NE "" THEN
        R.REG<CF.REG.STATUT> =   C.STAT.DISPONIBLE
        CALL F.WRITE(FN.REG,V.NUM.COFFRE,R.REG)
    END ELSE

        ETEXT="NUM coffre inexistant"
        CALL STORE.END.ERROR

    END

* FIN Metre a jour statut coffre : 1 Disponible
*Enregistrement evenement resiliation location  coffre
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    DATE.EVENT=TODAY
    DETAILS='AUTHORISER: ' : R.USER<EB.USE.USER.NAME>
    NUMERO.COFFRE=R.NEW(CF.CT.NUMERO.COFFRE)
    TYPE.EVENT='4'
    ID.CONTRAT=ID.NEW
    REF.OPERATION=ID.NEW
    ID.EVENT =  NUMERO.COFFRE :'.':DATE.EVENT:'.':TYPE.EVENT:'.':Y.TIME

    CALL BZ.COFFRE.EVENT(ID.EVENT,DATE.EVENT,DETAILS,NUMERO.COFFRE,TYPE.EVENT,ID.CONTRAT,REF.OPERATION,Y.TIME)

*FIN Enregistrement evenement resiliation location  coffre


    RETURN
END
