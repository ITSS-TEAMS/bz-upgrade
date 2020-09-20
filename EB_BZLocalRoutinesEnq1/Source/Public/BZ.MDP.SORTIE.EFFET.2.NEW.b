*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                   CRT commented as per browser compatibility        
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2.NEW
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
* $INSERT I_EQUATE - Not Used anymore;TCH=1  
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''

    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.41>
    Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    YFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus= Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'
    NBRE=0
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
    SEL.CEB.DataAccess.OpfAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND LOCALITE EQ 'HORS.PLACE' AND CODE.VALEUR EQ ":CODE.40:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.40.HPLACE:")"
    SEL.CEB.DataAccess.OpfAND:=" OR (CODE.DEST NE 25 AND STATUT EQ EFF.OUT.3 AND CODE.VALEUR EQ ":CODE.41:" AND DATE.ECHEANCE.CPS LE ":DATE.ECHEANCE.41:")"
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)

    IF SEL.LIST EQ '' THEN
        E="Aucun Effet"
        CALL ERR
    ENFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef LEB.DataAccess.FRead           REMOVE EFFET FROM SEL.LIST SETTING POS
        WHILE EFFET :POS
            NBRE += 1          
         *   CRT "Nbre traitEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer   *   CRT "Traitement effet Num : ":EFFET
            EB.SystemTables.setE(''); ERR = ''      
            CALL F.READ(FN.REG.EFF,EFFET,REG.REC,F.REG.EFF,ERR)

            REG.REEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer= "EFF.OUT.4"
            REG.REB.DataAccess.FWriteEFF.DATE.SORTIE.PFC> = TODAY  

            CALL F.WRITE(FN.REG.EFF,EFFET,REG.REC)    

        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-101</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT 
*                   CRT commented as per browser compatibility        
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.SORTIE.EFFET.2.NEW
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
    RUNNING.UNDER.BATCH=1  
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN
***************************************
INIT:

    FN.REG.EFF='F.BZ.MDP.REGISTRE.EFF'
    F.REG.EFF=''

    Y.REC.CPS.PARAMS = ''
    CALL BZ.MDP.GETCPS.PARAMS.RTN (Y.REC.CPS.PARAMS)

    Y.DEALI.41 = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.41>
    Y.DEALI.41 = '+':Y.DEALI.41:'W'

    Y.DEALI.40.PLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.PLACE>
    Y.DEALI.40.PLACE ='+':Y.DEALI.40.PLACE:'W'

    Y.DEALI.40.HPLACE = Y.REC.CPS.PARAMS<CPS.PAR.DELAI.40.HPLACE>
    Y.DEALI.40.HPLACE ='+':Y.DEALI.40.HPLACE:'W'
    NBRE=0
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
        E="Aucun Effet"
        CALL ERR
    END ELSE
        LOOP
            REMOVE EFFET FROM SEL.LIST SETTING POS
        WHILE EFFET :POS
            NBRE += 1          
         *   CRT "Nbre traite ":NBRE  
         *   CRT "Traitement effet Num : ":EFFET
             REG.REC = '' ; ERR = ''      
            CALL F.READ(FN.REG.EFF,EFFET,REG.REC,F.REG.EFF,ERR)

            REG.REC<REG.EFF.STATUT> = "EFF.OUT.4"
            REG.REC<REG.EFF.DATE.SORTIE.PFC> = TODAY  

            CALL F.WRITE(FN.REG.EFF,EFFET,REG.REC)    

           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef
      EB.SystemTables.setE(REG.REC<REG.EFF.MNT.LCN>+REG.REC<REG.EFF.MNT.INTERETS>+REG.REC<REG.EFF.MNT.FRAIS.PROT>)
            REF.DEBIT=REG.REC<REG.EFF.NUM.LCN>
            REF.CREDIT=REG.REC<REG.EFF.NUM.LCN>
            UNITE.GESTION=REG.REC<REG.EFF.AGENCE.TIRE>
            ID.COMPTA=EVT:EFFET

            CALL BZ.MDP.SET.MSG.OFS.GEN(EVT,DB.DEVISE,DB.COMPTE,CR.DEVISE,CR.COMPTE,DB.MONTANT,CR.MONTANT,REF.DEBIT,REF.CREDIT,UNITE.GESTION,STATUT,ID.COMPTA)
        REPEAT
    END
    RETURN
END
