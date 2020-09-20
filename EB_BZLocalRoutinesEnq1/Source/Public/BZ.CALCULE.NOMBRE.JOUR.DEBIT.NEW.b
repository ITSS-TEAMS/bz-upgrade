*-----------------------------------------------------------------------------
* <Rating>1131</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** CALL OPF and Variables initialized
*** Converted Arithmatic operation
*** Converted VM, ++ converted to +=
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT.NEW
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
 *-----------------------------------------------------------------------------------
* Modification History :                                                             
*ZIT-UPG-R09-R13  :   INCLUDE GLOBUS.BP CHANGED TO ../T24_BP                         
*------------------------------------------------------------------------------------

*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE    
    $INSERT I_COMMON 
    $INSERT I_EQUATE 
    *INCLUDE GLOBUS.BP I_F.ACCOUNT
    *INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT      
    * $INSERT I_COMMON - Not Used anymore;.ACTIVITY
    * $INSERT I_EQUATE - Not Used anymore;Y.COMMON 
*ZIT-UPG-R09-R13/E 
    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""
    ERR.AC=""
    AC.REC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    DERNIER.MVMT.CREDIT=""

    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)

*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC);*NOTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   GOSUB PROCESS

    RETURN

PROCESS:

FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...' BY-DSND @ID"
    ACTIVITY.ERROR=""
    ACTIVITY.COUNT=""
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN

        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"

            DERNIER.MVMT=ACTIVITY.IDS<COMPTEUR.DATE>
            ERR.ACTIVITY=""
            ACTIVITY.REC=""
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)

**
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
         EB.DataAccess.OpfMOUVEMENTS.CREDITS=ACTIVITY.REC<IC.ACT.TURNOVER.CREDIT>
         EB.DataAccess.OpfDAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
**

            FOR COEB.SystemTables.getRNew()RFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
         EB.DataAccess.FRead MOUVEMENT.CREDIT=MOUVEMENTS.CREDITS<1,INDEX.BALANCES>

                IF BALANCE LT 0 THEN

                    COMPTEUREB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer      EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>1131</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** CALL OPF and Variables initialized
*** Converted Arithmatic operation
*** Converted VM, ++ converted to +=
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALCULE.NOMBRE.JOUR.DEBIT.NEW
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
 *-----------------------------------------------------------------------------------
* Modification History :                                                             
*ZIT-UPG-R09-R13  :   INCLUDE GLOBUS.BP CHANGED TO ../T24_BP                         
*------------------------------------------------------------------------------------

*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE    
    $INSERT I_COMMON 
    $INSERT I_EQUATE 
    *INCLUDE GLOBUS.BP I_F.ACCOUNT
    *INCLUDE GLOBUS.BP I_F.ACCT.ACTIVITY
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT      
    $INSERT I_F.ACCT.ACTIVITY
    $INSERT I_ENQUIRY.COMMON 
*ZIT-UPG-R09-R13/E 
    COMPTE=O.DATA

    FN.AC="F.ACCOUNT"
    F.AC=""
    ERR.AC=""
    AC.REC=""

    FN.ACTIVITY="F.ACCT.ACTIVITY"
    F.ACTIVITY=""
    DIFF.DATE="C"
    DERNIER.MVMT.CREDIT=""

    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.ACTIVITY,F.ACTIVITY)

*    CALL F.READ(FN.AC,COMPTE, AC.REC, F.AC, ERR.AC);*NOT USED

MAIN:
    GOSUB PROCESS

    RETURN

PROCESS:


    CMD= "SSELECT ":FN.ACTIVITY:" WITH @ID LIKE '":COMPTE:"...' BY-DSND @ID"
    ACTIVITY.ERROR=""
    ACTIVITY.COUNT=""
    CALL EB.READLIST(CMD, ACTIVITY.IDS, '', ACTIVITY.COUNT, ACTIVITY.ERROR)
    IF ACTIVITY.IDS THEN

        FOR COMPTEUR.DATE=1 TO ACTIVITY.COUNT
            COMPTEUR.DB=0
            POSITION.CR=0
            CREDIT.TROUVE="KO"

            DERNIER.MVMT=ACTIVITY.IDS<COMPTEUR.DATE>
            ERR.ACTIVITY=""
            ACTIVITY.REC=""
            CALL F.READ(FN.ACTIVITY,DERNIER.MVMT, ACTIVITY.REC, F.ACTIVITY, ERR.ACTIVITY)

**
            BALANCES=ACTIVITY.REC<IC.ACT.BALANCE>
            MOUVEMENTS.CREDITS=ACTIVITY.REC<IC.ACT.TURNOVER.CREDIT>
            DAY.NOS=ACTIVITY.REC<IC.ACT.DAY.NO>
            NOMBRE.BALANCES=DCOUNT(BALANCES,@VM)
            INDEX.BALANCES=NOMBRE.BALANCES
**

            FOR COMPTEUR.BAL=1 TO NOMBRE.BALANCES
                BALANCE=BALANCES<1,INDEX.BALANCES>
                MOUVEMENT.CREDIT=MOUVEMENTS.CREDITS<1,INDEX.BALANCES>

                IF BALANCE LT 0 THEN

                    COMPTEUR.DB += 1

                    IF MOUVEMENT.CREDIT NE "" THEN
                        IF DERNIER.MVMT.CREDIT EQ "" THEN
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerMT.CREB.SystemTables.getIdNew()IELD(DERNIER.MVMT,'-',2):DAY.NOS<1,INDEX.BALANCES>
                        END
                 EB.DataAccess.FWrite

                END ELSE
                    IF NOMBRE.BALANCES EQ 1 THEN
        EB.SystemTables.setAf(0)
        EB.SystemTables.setE("OK")
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
                        DERNIER.MVMT.DEBIT=ACTIVITY.IDS<COMPTEUR.DATE-1>
                        CALL F.READ(FN.ACTIVITY,DERNIER.MVMT.DEBIT, ACTIVITY.DEBIT.REC, F.ACTIVITY, ERR.ACTIVITY)
                        JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.DAY.NO,1>

                        IF JOURS.DEBIT EQ '' THEN
                            JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.BK.DAY.NO,1>
                        END

                        DATE.PREMIER.DEBIT=FIELD(DERNIER.MVMT.DEBIT,'-',2):JOURS.DEBIT

                        IF DERNIER.MVMT.CREDIT NE "" THEN
                            DATE.PREMIER.DEBIT=DERNIER.MVMT.CREDIT
                        END

                    END ELSE

                        JOURS.DEBIT=DAY.NO

                        IF JOURS.DEBIT EQ '' THEN
                            JOURS.DEBIT=ACTIVITY.DEBIT.REC<IC.ACT.BK.DAY.NO,1>
                        END

                        DATE.PREMIER.DEBIT=FIELD(DERNIER.MVMT,'-',2):JOURS.DEBIT

                        IF DERNIER.MVMT.CREDIT NE "" THEN
                            DATE.PREMIER.DEBIT=DERNIER.MVMT.CREDIT
                        END
                    END

                    BREAK
                END
                INDEX.BALANCES -= 1
            NEXT COMPTEUR.BAL

            IF CREDIT.TROUVE EQ"OK" THEN
                BREAK
            END

        NEXT COMPTEUR.DATE

        IF CREDIT.TROUVE EQ "KO" THEN
            IF DERNIER.MVMT.CREDIT EQ "" THEN
                DAY.NO=DAY.NOS<1,1>
                DAY.NO=FMT(DAY.NO,"R%2")
                ANNE.MOIS=FIELD(DERNIER.MVMT,'-',2)
                ANNE=ANNE.MOIS[1,4]
                MOIS=ANNE.MOIS[5,2]
                CALL BZ.NOMBRE.JOURS.MOIS(ANNE,MOIS,NBR.JOURS)
                NOMBRE.JOURS.DEBIT.COURANT=NBR.JOURS-DAY.NO+1
                DATE.PREMIER.DEBIT=ANNE.MOIS:DAY.NO
            END ELSE
                DATE.PREMIER.DEBIT=DERNIER.MVMT.CREDIT
            END
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
