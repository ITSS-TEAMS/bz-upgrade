*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13     : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19       : changed VM to @VM                 
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_F.ACCOUNT
*    INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.ACCT.ACTIVITY
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)
*AC.REC = ''
*ERR.AC =''
*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC)

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:
ACTIVITY.COUNT =''
ACTIVITY.ERROFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.ERR =''
			ERR.ACTIVITY =''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
 *                   COMPTEUR.DB++
 COMPTEUR.DB+=1   ;*changed 
                END ELSE
                    IF NOMBRE.BALANCES EQ 1 THEN
         EB.DataAccess.Opf            NOMBRE.JOURS.DEBIT.COURANT=0
         EB.DataAccess.Opf            CREDIT.TROUVE="OK"
                    END ELSE
                        IF INDEX.BALANCES EQ NOMBRE.BALANCES THEN
                            NOMBRE.JOURS.DEBIT.COURANT=0
                            CREDIT.TROUVE="OK"
                  EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef                       DAY.NO=DAY.NOS<1,INDEX.BALANCES+1>
         EB.DataAccess.FRead             ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                            ANNE=ANNE.MOIS[1,4]
                            MOIS=ANNE.MOIS[5,2]
                            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
                            EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.COURANT=NBR.JOURS-DAY.NO+1
                            CREDIT.TROUVE="OK"
            EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13     : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19       : changed VM to @VM                 
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_F.ACCOUNT
*    INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.ACCT.ACTIVITY
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)
*AC.REC = ''
*ERR.AC =''
*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC)

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:
ACTIVITY.COUNT =''
ACTIVITY.ERROR =''
    CMD= "SSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...'"
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.ERR =''
			ERR.ACTIVITY =''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
 *                   COMPTEUR.DB++
 COMPTEUR.DB+=1   ;*changed 
                END ELSE
                    IF NOMBRE.BALANCES EQ 1 THEN
                        NOMBRE.JOURS.DEBIT.COURANT=0
                        CREDIT.TROUVE="OK"
                    END ELSE
                        IF INDEX.BALANCES EQ NOMBRE.BALANCES THEN
                            NOMBRE.JOURS.DEBIT.COURANT=0
                            CREDIT.TROUVE="OK"
                        END ELSE
                            DAY.NO=DAY.NOS<1,INDEX.BALANCES+1>
                            ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                            ANNE=ANNE.MOIS[1,4]
                            MOIS=ANNE.MOIS[5,2]
                            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
                            NOMBRE.JOURS.DEBIT.COURANT=NBR.JOURS-DAY.NO+1
                            CREDIT.TROUVE="OK"
                        END
                    END
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerBIT.CEB.SystemTables.getIdNew()EQ 0 THEN
                        DERNIER.MVMT.DEBIT=ACTEB.DataAccess.FWriteDS<INDEX.MVMT+1>
						ACTIVITY.DEBIT.REC =''
						 ERR.ACTIVITY =''
                        CALL F.READ(FN.ACTIVITY,DERNIER.MVMT.DEBIT, ACTIVITY.DEBIT.REC, F.ACTIVITY, ERR.ACTIVITY)
                        JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.DAY.NO,1>

      EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13     : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19       : changed VM to @VM                 
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_F.ACCOUNT
*    INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.ACCT.ACTIVITY
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)
*AC.REC = ''
*ERR.AC =''
*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC)

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:
ACTIVITY.COUNT =''
ACTIVITY.ERROR =''
    CMD= "SSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...'"
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.ERR =''
			ERR.ACTIVITY =''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
 *                   COMPTEUR.DB++
 COMPTEUR.DB+=1   ;*changed 
                END ELSE
                    IF NOMBRE.BALANCES EQ 1 THEN
                        NOMBRE.JOURS.DEBIT.COURANT=0
                        CREDIT.TROUVE="OK"
                    END ELSE
                        IF INDEX.BALANCES EQ NOMBRE.BALANCES THEN
                            NOMBRE.JOURS.DEBIT.COURANT=0
                            CREDIT.TROUVE="OK"
                        END ELSE
                            DAY.NO=DAY.NOS<1,INDEX.BALANCES+1>
                            ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                            ANNE=ANNE.MOIS[1,4]
                            MOIS=ANNE.MOIS[5,2]
                            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
                            NOMBRE.JOURS.DEBIT.COURANT=NBR.JOURS-DAY.NO+1
                            CREDIT.TROUVE="OK"
                        END
                    END
                    IF NOMBRE.JOURS.DEBIT.COURANT EQ 0 THEN
                        DERNIER.MVMT.DEBIT=ACTIVITY.IDS<INDEX.MVMT+1>
						ACTIVITY.DEBIT.REC =''
						 ERR.ACTIVITY =''
                        CALL F.READ(FN.ACTIVITY,DERNIER.MVMT.DEBIT, ACTIVITY.DEBIT.REC, F.ACTIVITY, ERR.ACTIVITY)
                        JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.DAY.NO,1>

        EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefsetE()*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13     : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19       : changed VM to @VM                 
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_F.ACCOUNT
*    INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ACCOUNT
$INSERT I_F.ACCT.ACTIVITY
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)
*AC.REC = ''
*ERR.AC =''
*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC)

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:
ACTIVITY.COUNT =''
ACTIVITY.ERROR =''
    CMD= "SSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...'"
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.ERR =''
			ERR.ACTIVITY =''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
 *                   COMPTEUR.DB++
 COMPTEUR.DB+=1   ;*changed 
                END ELSE
                    IF NOMBRE.BALANCES EQ 1 THEN
                        NOMBRE.JOURS.DEBIT.COURANT=0
                        CREDIT.TROUVE="OK"
                    END ELSE
                        IF INDEX.BALANCES EQ NOMBRE.BALANCES THEN
                            NOMBRE.JOURS.DEBIT.COURANT=0
                            CREDIT.TROUVE="OK"
                        END ELSE
                            DAY.NO=DAY.NOS<1,INDEX.BALANCES+1>
                            ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                            ANNE=ANNE.MOIS[1,4]
                            MOIS=ANNE.MOIS[5,2]
                            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
                            NOMBRE.JOURS.DEBIT.COURANT=NBR.JOURS-DAY.NO+1
                            CREDIT.TROUVE="OK"
                        END
                    END
                    IF NOMBRE.JOURS.DEBIT.COURANT EQ 0 THEN
                        DERNIER.MVMT.DEBIT=ACTIVITY.IDS<INDEX.MVMT+1>
						ACTIVITY.DEBIT.REC =''
						 ERR.ACTIVITY =''
                        CALL F.READ(FN.ACTIVITY,DERNIER.MVMT.DEBIT, ACTIVITY.DEBIT.REC, F.ACTIVITY, ERR.ACTIVITY)
                        JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.DAY.NO,1>

                        IF JOURS.DEBIT EQ '' THEN
                            JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.BK.DAY.NO,1>
                        END

                        DATE.PREMIER.DEBIT=FIELD(DERNIER.MVMT.DEBIT,'-',2):JOURS.DEBIT
                    END ELSE
                        JOURS.DEBIT=DAY.NO

                        IF JOURS.DEBIT EQ '' THEN
                            JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.BK.DAY.NO,1>
                        END

                        DATE.PREMIER.DEBIT=FIELD(DERNIER.MVMT,'-',2):JOURS.DEBIT
                    END

                    BREAK
                END
                INDEX.BALANCES-=1
            NEXT COMPTEUR.BAL

            IF CREDIT.TROUVE EQ "OK" THEN  ;*changed
                BREAK
            END

            INDEX.MVMT-=1
        NEXT COMPTEUR.DATE

        IF CREDIT.TROUVE EQ "KO" THEN
            DAY.NO=DAY.NOS<1,1>
            DAY.NO=FMT(DAY.NO,"R%2")
            ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
            ANNE=ANNE.MOIS[1,4]
            MOIS=ANNE.MOIS[5,2]
            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
            NOMBRE.JOURS.DEBIT.COURANT=NBR.JOURS-DAY.NO+1
            DATE.PREMIER.DEBIT=ANNE.MOIS:DAY.NO
        END

        R.RECORD<55>=DATE.PREMIER.DEBIT


        IF DATE.PREMIER.DEBIT NE "" THEN
            O.DATA="C"
****************VERIFCATION DATE EN ENTRE
            LONGUEUR=LEN(DATE.PREMIER.DEBIT)
            IF LONGUEUR EQ 8 THEN
****************
                CALL CDD ('',DATE.PREMIER.DEBIT,TODAY,O.DATA)
            END
        END

    END
    RETURN
END
