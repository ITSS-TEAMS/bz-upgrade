*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT.PERMANENT(ACCOUNT.ID,DATE.PREMIER.DEBIT,NOMBRE.JOURS.DEBIT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
* @author Marwen Abid Marwen.Abid@banquezitouna.com
* @create 24/10/2017
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP

*ZIT-UPG-R13-R19:VM conevrted to @VM
*               :Arithmetic operator converted to T24 Operand
*               :++,-- converted to += 1,-= 1
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_F.ACCOUNT
*    INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON

    $INSERT I_COMMON
    * $INSERT I_COMMON - Not Used anymore;
    * $INSERT I_EQUATE - Not Used anymore;UNT
    * $INSERT I_ENQUIRY.COMMON - Not Used anymore;Y
    $INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    COMPTE=ACCOUNT.ID

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)

*    CALEB.SystemTables.getVFunction()N.AC,COMPTE, EB.SystemTables.getVFunction()AC, ERR.AC) EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  GOSUB PROCESS

    RETURN

PROCESS:

 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...'"
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.REC=''
			ERR.ACTIVITY=''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
                    COMPTEUR.DB += 1
         EB.DataAccess.Opf    END ELSE
         EB.DataAccess.Opf        IF NOMBRE.BALANCES EQ 1 THEN
                        NOMBRE.JOURS.DEBIT.COURANT=0
                        CREDIT.TROUVE="OK"
                    END ELSE
                        IF INDEX.BALANCES EQ NOMBRE.BALANCES THEN
                  EB.SystemTables.getRNew()FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefS.DEBIT.COURANT=0
                            CREDIT.TROUVE="OK"
         EB.DataAccess.FRead         END ELSE
                            DAY.NO=DAY.NOS<1,INDEX.BALANCES+1>
                            ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                            ANNE=ANNE.MOIS[1,4]
                            EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer]
                            CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
            EB.SystemTables.setE(NBR.JOURS-DAY.NO+1)
                            CREDIT.TROUVE="OK"
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer           END
                 EB.DataAccess.FWriteOMBRE.JOURS.DEBIT.COURANT EQ 0 THEN
                        DERNIER.MVMT.DEBIT=ACTIVITY.IDS<INDEX.MVMT+1>
						ACTIVITY.DEBIT.REC=''
						ERR.ACTIVITY=''
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>835</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT.PERMANENT(ACCOUNT.ID,DATE.PREMIER.DEBIT,NOMBRE.JOURS.DEBIT)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
* @author Marwen Abid Marwen.Abid@banquezitouna.com
* @create 24/10/2017
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP

*ZIT-UPG-R13-R19:VM conevrted to @VM
*               :Arithmetic operator converted to T24 Operand
*               :++,-- converted to += 1,-= 1
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

    COMPTE=ACCOUNT.ID

    FN.AC="F.ACCOUNT"
    F.AC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)

*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC) ;*NOT USED

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:

    CMD= "SSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...'"
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN
        INDEX.MVMT=ACTIVITY.COUNT
        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"
            DERNIER.MVMT=ACTIVITY.IDS<INDEX.MVMT>
			ACTIVITY.REC=''
			ERR.ACTIVITY=''
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                IF BALANCE LE 0 THEN
                    COMPTEUR.DB += 1
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
						ACTIVITY.DEBIT.REC=''
						ERR.ACTIVITY=''
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefLL F.READ(FN.ACTIVITY,DERNIER.MVMT.DEBIT, ACTIVITY.DEBIT.REC, F.ACTIVITY, ERR.ACTIVITY)
        EB.SystemTables.setE(ACTIVITY.DEBIT.REC<IC.ACT.DAY.NO,1>)

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
                INDEX.BALANCES -= 1
            NEXT COMPTEUR.BAL

            IF CREDIT.TROUVE EQ "OK" THEN
                BREAK
            END

            INDEX.MVMT -= 1
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
                CALL CDD ('',DATE.PREMIER.DEBIT,TODAY,NOMBRE.JOURS.DEBIT)
            END
        END

    END
    CRT " LE NOMBRE.JOURS.DEBIT EST: ":NOMBRE.JOURS.DEBIT
    CRT "DATE.PREMIER.DEBIT": DATE.PREMIER.DEBIT
    CRT "NOMBRE.JOURS.DEBIT.COURANT": NOMBRE.JOURS.DEBIT.COURANT

    RETURN
END
