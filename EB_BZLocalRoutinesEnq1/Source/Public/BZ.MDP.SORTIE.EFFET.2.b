*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, E to ETEXT and CALL ERR to CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2(TABLEAU)
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
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
*$INSERT BP I_F.BZ.CPS.PARAMETER

    $INSERT I_F.BZ.MDP.REGISTRE.EFF
    $INSERT I_F.BZ.CPS.PARAMETER

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:
    RUNNING.UNDER.BATCH=1

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''
    REG.REC=''
    ERR=''
    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''

    Y.REEB.SystemTables.getVFunction()MS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.PLACE>
    Y.DEALI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    Y.DEALI.40.HPLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.REG.EFF,F.REG.EFF)
    RETURN
***************************************
PROCESS:

    DATE.ECHEANCE.40.PLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.PLACE,Y.DEALI.40.PLACE)

    DATE.ECHEANCE.40.HPLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.HPLACE, Y.DEALI.40.HPLACE)

    DATE.ECHEANCE.41=TODAY
    CALL CDT('',DATE.ECHEANCE.41,Y.DEALI.41)

    CODE.EB.DataAccess.Opf40
    CODE.EB.DataAccess.Opf41

    SEL.COMMAND="SELECT ":FN.REG.EFF:" WITH (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.PLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'HORS.PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.HPLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND CODE.VALEUR EQ ":CODE.41:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.41:")"



    CALEB.DataAcceFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        ETEXT="Aucun Effet"EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
        CALLEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, E to ETEXT and CALL ERR to CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2(TABLEAU)
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
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
*$INSERT BP I_F.BZ.CPS.PARAMETER

    $INSERT I_F.BZ.MDP.REGISTRE.EFF
    $INSERT I_F.BZ.CPS.PARAMETER

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:
    RUNNING.UNDER.BATCH=1

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''
    REG.REC=''
    ERR=''
    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''

    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.41>
    Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.PLACE>
    Y.DEALI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    Y.DEALI.40.HPLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.REG.EFF,F.REG.EFF)
    RETURN
***************************************
PROCESS:

    DATE.ECHEANCE.40.PLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.PLACE,Y.DEALI.40.PLACE)

    DATE.ECHEANCE.40.HPLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.HPLACE, Y.DEALI.40.HPLACE)

    DATE.ECHEANCE.41=TODAY
    CALL CDT('',DATE.ECHEANCE.41,Y.DEALI.41)

    CODE.40=40
    CODE.41=41

    SEL.COMMAND="SELECT ":FN.REG.EFF:" WITH (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.PLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'HORS.PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.HPLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND CODE.VALEUR EQ ":CODE.41:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.41:")"



    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        ETEXT="Aucun Effet"
    *    CALL ERR
        CALL STORE.END.ERROR
    END ELSE
        LOOP
      EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer FROM SEL.LIST SETTING POS
        WHILE EFFEB.DataAccess.FWrite
            CALL F.READ(FN.REG.EFF,EFFET,REG.REC,F.REG.EFF,ERR)

            TABLEAU<-1>=EFFET
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, E to ETEXT and CALL ERR to CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2(TABLEAU)
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
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
*$INSERT BP I_F.BZ.CPS.PARAMETER

    $INSERT I_F.BZ.MDP.REGISTRE.EFF
    $INSERT I_F.BZ.CPS.PARAMETER

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:
    RUNNING.UNDER.BATCH=1

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''
    REG.REC=''
    ERR=''
    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''

    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.41>
    Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.PLACE>
    Y.DEALI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    Y.DEALI.40.HPLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.REG.EFF,F.REG.EFF)
    RETURN
***************************************
PROCESS:

    DATE.ECHEANCE.40.PLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.PLACE,Y.DEALI.40.PLACE)

    DATE.ECHEANCE.40.HPLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.HPLACE, Y.DEALI.40.HPLACE)

    DATE.ECHEANCE.41=TODAY
    CALL CDT('',DATE.ECHEANCE.41,Y.DEALI.41)

    CODE.40=40
    CODE.41=41

    SEL.COMMAND="SELECT ":FN.REG.EFF:" WITH (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.PLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'HORS.PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.HPLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND CODE.VALEUR EQ ":CODE.41:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.41:")"



    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        ETEXT="Aucun Effet"
    *    CALL ERR
        CALL STORE.END.ERROR
    END ELSE
        LOOP
            REMOVE EFFET FROM SEL.LIST SETTING POS
        WHILE EFFET :POS
            CALL F.READ(FN.REG.EFF,EFFET,REG.REC,F.REG.EFF,ERR)

            TABLEAU<-1>=EFFET
        REPFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, E to ETEXT and CALL ERR to CALL STORE.END.ERROR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2(TABLEAU)
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
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
*$INSERT BP I_F.BZ.CPS.PARAMETER

    $INSERT I_F.BZ.MDP.REGISTRE.EFF
    $INSERT I_F.BZ.CPS.PARAMETER

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:
    RUNNING.UNDER.BATCH=1

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''
    REG.REC=''
    ERR=''
    SEL.LIST=''
    NO.OF.REC=''
    ERR1=''

    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.41>
    Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.PLACE>
    Y.DEALI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    Y.DEALI.40.HPLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'

    RETURN
***************************************
OPENFILES:
    CALL OPF(FN.REG.EFF,F.REG.EFF)
    RETURN
***************************************
PROCESS:

    DATE.ECHEANCE.40.PLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.PLACE,Y.DEALI.40.PLACE)

    DATE.ECHEANCE.40.HPLACE=TODAY
    CALL CDT('',DATE.ECHEANCE.40.HPLACE, Y.DEALI.40.HPLACE)

    DATE.ECHEANCE.41=TODAY
    CALL CDT('',DATE.ECHEANCE.41,Y.DEALI.41)

    CODE.40=40
    CODE.41=41

    SEL.COMMAND="SELECT ":FN.REG.EFF:" WITH (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.PLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'HORS.PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.HPLACE:")"
    SEL.COMMAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND CODE.VALEUR EQ ":CODE.41:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.41:")"



    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        ETEXT="Aucun Effet"
    *    CALL ERR
        CALL STORE.END.ERROR
    END ELSE
        LOOP
            REMOVE EFFET FROM SEL.LIST SETTING POS
        WHILE EFFET :POS
            CALL F.READ(FN.REG.EFF,EFFET,REG.REC,F.REG.EFF,ERR)

            TABLEAU<-1>=EFFET
        REPEAT
    END
    RETURN
END
