*-----------------------------------------------------------------------------
* <Rating>208</Rating>
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LMM.SCHEDULES(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.LMM.SCHEDULES
    *INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB PROCESS
RETURN

INIT:
    FN.LMM="F.LMM.SCHEDULES"
    F.LMM=""
    LMM.REC=''
    ERR.LD=''
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""

    COMPTEUR=0

    LOCATE "FIN.MAT.DATE" IN D.FIELDS<1> SETTING ECH.POS THEN
        EB.SystemTables.getVFunction()NCE = D.RANGEEB.SystemTables.getVFunction()<ECH.POS>
    ENDFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusFN.LMM,F.LMM)
    CALL OPF(FN.LD,F.LD)

RETFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    SQL.LD = "SELECT ":FN.LD
    LD.IDS=''
    LD.COUNT=''
    LD.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)

    IF LD.IDS THEN
        FOR LD.SEQUENCE = 1 TO LD.COUNT
            REMOVE LD.ID FROM LD.IDS SETTING LD.POS
            MONTANT=0
            MONTANTS=0
            NBR.MONTANTS=0
            SQL.CMD = "SELECT ":FN.LMM:" WITH @ID LIKE '":LD.ID:"...'"
            SQL.CMD.IDS=''
            SQL.CMD.COUNT=''
            SQL.CMD.ERROR=''
            CALL EB.READLIST(SQL.CMD , SQL.CMD.IDS,'',SQL.CMD.COUNT,SQL.CMD.ERROR)

            IF SQL.CMD.IDS THEN
         EB.DataAccess.Opf    FOR SQL.CMD.SEQUENCE = 1 TO SQL.CMD.COUNT
         EB.DataAccess.Opf        REMOVE LMM.ID FROM SQL.CMD.IDS SETTING SQL.CMD.POS
                    DATE.TOMBE.JULIAN=''
                    DATE.TOMBE=''
                    CALL F.READ(FN.LMM, LMM.ID, LMM.REC, F.LMM, ERR.LD)
                    DATE.TOMBE.JULIAN = LMM.ID[13,7]
                  EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefOMBE,DATE.TOMBE.JULIAN)

         EB.DataAccess.FRead     IF DATE.TOMBE LE DATE.ECHEANCE THEN
                        MONTANTS=LMM.REC<LD9.SCHED.AMT>
                        NBR.MONTANTS=DCOUNT(MONTANTS,@VM)
                        FEES=LMM.REC<LD9.FEE.AMOUNT.DUE>
                        NBR.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerVM)
                        FOR COUNTER=1 TO NBR.MONTANTS
            EB.SystemTables.setE(MONTANT+LMM.REC<LD9.SCHED.AMT><1,COUNTER>)
                        NEXT COUNTER
                    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTO NBEB.SystemTables.getIdNew()
                            MONTANT=MONTANT+LMM.REC<LD9.FEE.AMOUNT.DUE><1,COUNTER>
                 EB.DataAccess.FWriteNEXT COUNTER
                        IF MONTANT GT 0 THEN
                            COMPTEUR=COMPTEUR+1
                        END
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>208</Rating>
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LMM.SCHEDULES(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.LMM.SCHEDULES
    *INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB PROCESS
RETURN

INIT:
    FN.LMM="F.LMM.SCHEDULES"
    F.LMM=""
    LMM.REC=''
    ERR.LD=''
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""

    COMPTEUR=0

    LOCATE "FIN.MAT.DATE" IN D.FIELDS<1> SETTING ECH.POS THEN
        DATE.ECHEANCE = D.RANGE.AND.VALUE<ECH.POS>
    END

    CALL OPF(FN.LMM,F.LMM)
    CALL OPF(FN.LD,F.LD)

RETURN

PROCESS:

    SQL.LD = "SELECT ":FN.LD
    LD.IDS=''
    LD.COUNT=''
    LD.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)

    IF LD.IDS THEN
        FOR LD.SEQUENCE = 1 TO LD.COUNT
            REMOVE LD.ID FROM LD.IDS SETTING LD.POS
            MONTANT=0
            MONTANTS=0
            NBR.MONTANTS=0
            SQL.CMD = "SELECT ":FN.LMM:" WITH @ID LIKE '":LD.ID:"...'"
            SQL.CMD.IDS=''
            SQL.CMD.COUNT=''
            SQL.CMD.ERROR=''
            CALL EB.READLIST(SQL.CMD , SQL.CMD.IDS,'',SQL.CMD.COUNT,SQL.CMD.ERROR)

            IF SQL.CMD.IDS THEN
                FOR SQL.CMD.SEQUENCE = 1 TO SQL.CMD.COUNT
                    REMOVE LMM.ID FROM SQL.CMD.IDS SETTING SQL.CMD.POS
                    DATE.TOMBE.JULIAN=''
                    DATE.TOMBE=''
                    CALL F.READ(FN.LMM, LMM.ID, LMM.REC, F.LMM, ERR.LD)
                    DATE.TOMBE.JULIAN = LMM.ID[13,7]
                    CALL JULDATE(DATE.TOMBE,DATE.TOMBE.JULIAN)

                    IF DATE.TOMBE LE DATE.ECHEANCE THEN
                        MONTANTS=LMM.REC<LD9.SCHED.AMT>
                        NBR.MONTANTS=DCOUNT(MONTANTS,@VM)
                        FEES=LMM.REC<LD9.FEE.AMOUNT.DUE>
                        NBR.FEES=DCOUNT(FEES,@VM)
                        FOR COUNTER=1 TO NBR.MONTANTS
                            MONTANT=MONTANT+LMM.REC<LD9.SCHED.AMT><1,COUNTER>
                        NEXT COUNTER
                        FOR COUNTER=1 TO NBR.FEES
                            MONTANT=MONTANT+LMM.REC<LD9.FEE.AMOUNT.DUE><1,COUNTER>
                        NEXT COUNTER
                        IF MONTANT GT 0 THEN
                            COMPTEUR=COMPTEUR+1
                        END
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef       EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>208</Rating>
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LMM.SCHEDULES(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.LMM.SCHEDULES
    *INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

*ZIT-UPG-R09-R13/E

MAIN:

    GOSUB INIT
    GOSUB PROCESS
RETURN

INIT:
    FN.LMM="F.LMM.SCHEDULES"
    F.LMM=""
    LMM.REC=''
    ERR.LD=''
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""

    COMPTEUR=0

    LOCATE "FIN.MAT.DATE" IN D.FIELDS<1> SETTING ECH.POS THEN
        DATE.ECHEANCE = D.RANGE.AND.VALUE<ECH.POS>
    END

    CALL OPF(FN.LMM,F.LMM)
    CALL OPF(FN.LD,F.LD)

RETURN

PROCESS:

    SQL.LD = "SELECT ":FN.LD
    LD.IDS=''
    LD.COUNT=''
    LD.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)

    IF LD.IDS THEN
        FOR LD.SEQUENCE = 1 TO LD.COUNT
            REMOVE LD.ID FROM LD.IDS SETTING LD.POS
            MONTANT=0
            MONTANTS=0
            NBR.MONTANTS=0
            SQL.CMD = "SELECT ":FN.LMM:" WITH @ID LIKE '":LD.ID:"...'"
            SQL.CMD.IDS=''
            SQL.CMD.COUNT=''
            SQL.CMD.ERROR=''
            CALL EB.READLIST(SQL.CMD , SQL.CMD.IDS,'',SQL.CMD.COUNT,SQL.CMD.ERROR)

            IF SQL.CMD.IDS THEN
                FOR SQL.CMD.SEQUENCE = 1 TO SQL.CMD.COUNT
                    REMOVE LMM.ID FROM SQL.CMD.IDS SETTING SQL.CMD.POS
                    DATE.TOMBE.JULIAN=''
                    DATE.TOMBE=''
                    CALL F.READ(FN.LMM, LMM.ID, LMM.REC, F.LMM, ERR.LD)
                    DATE.TOMBE.JULIAN = LMM.ID[13,7]
                    CALL JULDATE(DATE.TOMBE,DATE.TOMBE.JULIAN)

                    IF DATE.TOMBE LE DATE.ECHEANCE THEN
                        MONTANTS=LMM.REC<LD9.SCHED.AMT>
                        NBR.MONTANTS=DCOUNT(MONTANTS,@VM)
                        FEES=LMM.REC<LD9.FEE.AMOUNT.DUE>
                        NBR.FEES=DCOUNT(FEES,@VM)
                        FOR COUNTER=1 TO NBR.MONTANTS
                            MONTANT=MONTANT+LMM.REC<LD9.SCHED.AMT><1,COUNTER>
                        NEXT COUNTER
                        FOR COUNTER=1 TO NBR.FEES
                            MONTANT=MONTANT+LMM.REC<LD9.FEE.AMOUNT.DUE><1,COUNTER>
                        NEXT COUNTER
                        IF MONTANT GT 0 THEN
                            COMPTEUR=COMPTEUR+1
                        END
                    END
                NEXT SQL.CMD.SEQUENCE
            END
            IF MONTANT GT 0 THEN
                TABLEAU<-1>=LD.ID:'*':MONTANT
            END
        NEXT LD.SEQUENCE
    END

RETURN
END
