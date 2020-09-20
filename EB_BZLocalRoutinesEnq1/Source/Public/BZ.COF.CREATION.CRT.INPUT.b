*-----------------------------------------------------------------------------
* <Rating>57</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.INPUT
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
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.CONTRAT
* $INSERT I_COMMON - Not Used anymore;E.REGISTRE
    
*ZIT-UPG-R09-R13/E

    IF MESSAGE EQ 'HLD' THEN RETURN
    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF V$FUNCTION EQ 'I' THEN

        GOSUB PROCESS

    END

    IF V$FUNCTION EQ 'D' THEN

        GOSUB TRAITEMENT_DELETE


    END



    RETURN



INITIALISATION:

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'

    C.STAT.ATTENTE.AUT="99"

    C.STAT.DISPONIBLE="1"

    RETURN

OPENFILES:

    CALL OPF(FN.REG,F.REG)

    RETURN

PROCESS:EB.DataAccess.Opf* VerifEB.DataAccess.Opftion saisie
    V.FLAG.GARANTIE = R.NEW(CF.CT.GARANTIE)

    IF V.FLAG.GARANTIE EQ 'YES' THEN


        IEB.DataAcceFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.AMOUNT.GARANTIE) EQ "" OR R.NEW(CF.CT.COMPTE.GARANTIE) EQ "" THEN
            ETEXT="Donnees garanties manquantes"
            CALL STORE.END.ERROR

        END

    END ELSEEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerE()*-----------------------------------------------------------------------------
* <Rating>57</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.INPUT
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
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
    
*ZIT-UPG-R09-R13/E

    IF MESSAGE EQ 'HLD' THEN RETURN
    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF V$FUNCTION EQ 'I' THEN

        GOSUB PROCESS

    END

    IF V$FUNCTION EQ 'D' THEN

        GOSUB TRAITEMENT_DELETE


    END



    RETURN



INITIALISATION:

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    C.STAT.ATTENTE.AUT="99"

    C.STAT.DISPONIBLE="1"

    RETURN

OPENFILES:

    CALL OPF(FN.REG,F.REG)

    RETURN

PROCESS:

* Verification saisie
    V.FLAG.GARANTIE = R.NEW(CF.CT.GARANTIE)

    IF V.FLAG.GARANTIE EQ 'YES' THEN


        IF R.NEW(CF.CT.AMOUNT.GARANTIE) EQ "" OR R.NEW(CF.CT.COMPTE.GARANTIE) EQ "" THEN
            ETEXT="Donnees garanties manquantes"
            CALL STORE.END.ERROR

        END

    END ELSE
        R.NEW(CF.CT.AMOUNT.GARANTIE)= ""
        R.NEW(CF.CT.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer"



    END


EB.DataAccess.FWriteB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>57</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.INPUT
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
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
    
*ZIT-UPG-R09-R13/E

    IF MESSAGE EQ 'HLD' THEN RETURN
    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF V$FUNCTION EQ 'I' THEN

        GOSUB PROCESS

    END

    IF V$FUNCTION EQ 'D' THEN

        GOSUB TRAITEMENT_DELETE


    END



    RETURN



INITIALISATION:

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    C.STAT.ATTENTE.AUT="99"

    C.STAT.DISPONIBLE="1"

    RETURN

OPENFILES:

    CALL OPF(FN.REG,F.REG)

    RETURN

PROCESS:

* Verification saisie
    V.FLAG.GARANTIE = R.NEW(CF.CT.GARANTIE)

    IF V.FLAG.GARANTIE EQ 'YES' THEN


        IF R.NEW(CF.CT.AMOUNT.GARANTIE) EQ "" OR R.NEW(CF.CT.COMPTE.GARANTIE) EQ "" THEN
            ETEXT="Donnees garanties manquantes"
            CALL STORE.END.ERROR

        END

    END ELSE
        R.NEW(CF.CT.AMOUNT.GARANTIE)= ""
        R.NEW(CF.CT.COMPTE.GARANTIE)=""



    END




*FinEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>57</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description :
*---------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted Arithmatic operation
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CREATION.CRT.INPUT
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
    *$INSERT BP I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
    
*ZIT-UPG-R09-R13/E

    IF MESSAGE EQ 'HLD' THEN RETURN
    GOSUB INITIALISATION
    GOSUB OPENFILES

    IF V$FUNCTION EQ 'I' THEN

        GOSUB PROCESS

    END

    IF V$FUNCTION EQ 'D' THEN

        GOSUB TRAITEMENT_DELETE


    END



    RETURN



INITIALISATION:

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    C.STAT.ATTENTE.AUT="99"

    C.STAT.DISPONIBLE="1"

    RETURN

OPENFILES:

    CALL OPF(FN.REG,F.REG)

    RETURN

PROCESS:

* Verification saisie
    V.FLAG.GARANTIE = R.NEW(CF.CT.GARANTIE)

    IF V.FLAG.GARANTIE EQ 'YES' THEN


        IF R.NEW(CF.CT.AMOUNT.GARANTIE) EQ "" OR R.NEW(CF.CT.COMPTE.GARANTIE) EQ "" THEN
            ETEXT="Donnees garanties manquantes"
            CALL STORE.END.ERROR

        END

    END ELSE
        R.NEW(CF.CT.AMOUNT.GARANTIE)= ""
        R.NEW(CF.CT.COMPTE.GARANTIE)=""



    END




*Fin Verification saisie


* Metre a jour statut coffre : 99 attente autorisation contrat
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

    IF R.REG NE "" THEN
        R.REG<CF.REG.STATUT> = C.STAT.ATTENTE.AUT
        CALL F.WRITE(FN.REG,V.NUM.COFFRE,R.REG)
    END ELSE

        ETEXT="NUM coffre inexistant"
        CALL STORE.END.ERROR


    END


    RETURN

    TRAITEMENT_DELETE:
    V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
    CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

    IF R.REG NE "" THEN
        R.REG<CF.REG.STATUT> = C.STAT.DISPONIBLE
        CALL F.WRITE(FN.REG,V.NUM.COFFRE,R.REG)
    END ELSE

        ETEXT="NUM coffre inexistant"
        CALL STORE.END.ERROR


    END


    RETURN
