*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                      
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR(ACCT.ID,DATE.DB,DATE.FIN,Y.FLUX.CREDIT.PERIOD)
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
    $INSERT I_F.STMT.ENTRY


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
*******************************
INIT:
*******************************

    Y.COMPTE = ACCT.ID
* $INSERT I_COMMON - Not Used anymore;.DB
* $INSERT I_EQUATE - Not Used anymore;IN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    F.STMT = ""
    Y.LIST.OUT = 977:@VM:521:@VM:952:@VM:121:@VM:51:@VM:994:@VM:381:@VM:998
    Y.LIST.SOUSTRAIRE = 968:@VM:967:@VM:232:@VM:233:@VM:234:@VM:600:@VM:967:@VM:933
    Y.TOTAL.FLUX.CREDIT = 0
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    RETURN
*******************************
OPENFILES:
*******************************
    CALL OPF(FN.STMT,F.STMT)

    RETURN


********EB.SystemTables.getVFunction()*************EB.SystemTables.getVFunction()**************
 PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus**********************************************FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusPTE.TMP = Y.COMPTE
    CALL EB.ACCT.ENTRY.LIST(Y.COMPTE.TMP,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
    IF ID.LIST THEN
        NBRE.TXN.AC=DCOUNT(ID.LIST,@FM)
        FOR COMPTEUR.TXN=1 TO NBRE.TXN.AC
            ID.TRANSA=ID.LIST<COMPTEUR.TXN>

            GOSUB TRAIT.TXN.STMT
            IF OUT.IND EQ 1 THEN
                CONTINUE
            END ELSE
                IF IND.REV EQ 1 THEN
                    CONTINUE
                END ELSE

                    IF SOUS.IND EQ 1 THEN
                        IF Y.SENS.OP EQ "D" THEN

                            Y.TOTAL.FLUX.DEBIT.SOUS += Y.MONTANT
                        END
                    END ELSE
                        IF Y.SENS.OP EQ "C" THEN
                            Y.TOTAL.FLUX.CREDIT += Y.MONTANT
                        END
                    END

         EB.DataAccess.Opf    END
         EB.DataAccess.OpfEND

        NEXT COMPTEUR.TXN
        Y.FLUX.CREDIT.PERIOD = Y.TOTAL.FLUX.CREDIT + Y.TOTAL.FLUX.DEBIT.SOUS

    END ELSE
        NBFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef      YEB.DataAccess.FReadCREDIT.PERIOD=0
    END
    RETURN
****************************
TRAIT.TXN.STMT:
***********EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer**
STMT.REC =''EB.SystemTables.setE()*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                      
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR(ACCT.ID,DATE.DB,DATE.FIN,Y.FLUX.CREDIT.PERIOD)
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
    $INSERT I_F.STMT.ENTRY


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
*******************************
INIT:
*******************************

    Y.COMPTE = ACCT.ID
    FROM.DATE = DATE.DB
    TO.DATE = DATE.FIN
    FN.STMT = "F.STMT.ENTRY"
    F.STMT = ""
    Y.LIST.OUT = 977:@VM:521:@VM:952:@VM:121:@VM:51:@VM:994:@VM:381:@VM:998
    Y.LIST.SOUSTRAIRE = 968:@VM:967:@VM:232:@VM:233:@VM:234:@VM:600:@VM:967:@VM:933
    Y.TOTAL.FLUX.CREDIT = 0
    Y.TOTAL.FLUX.DEBIT.SOUS = 0
    RETURN
*******************************
OPENFILES:
*******************************
    CALL OPF(FN.STMT,F.STMT)

    RETURN


*******************************************************
 PROCESS:
************************************************************
    Y.COMPTE.TMP = Y.COMPTE
    CALL EB.ACCT.ENTRY.LIST(Y.COMPTE.TMP,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
    IF ID.LIST THEN
        NBRE.TXN.AC=DCOUNT(ID.LIST,@FM)
        FOR COMPTEUR.TXN=1 TO NBRE.TXN.AC
            ID.TRANSA=ID.LIST<COMPTEUR.TXN>

            GOSUB TRAIT.TXN.STMT
            IF OUT.IND EQ 1 THEN
                CONTINUE
            END ELSE
                IF IND.REV EQ 1 THEN
                    CONTINUE
                END ELSE

                    IF SOUS.IND EQ 1 THEN
                        IF Y.SENS.OP EQ "D" THEN

                            Y.TOTAL.FLUX.DEBIT.SOUS += Y.MONTANT
                        END
                    END ELSE
                        IF Y.SENS.OP EQ "C" THEN
                            Y.TOTAL.FLUX.CREDIT += Y.MONTANT
                        END
                    END

                END
            END

        NEXT COMPTEUR.TXN
        Y.FLUX.CREDIT.PERIOD = Y.TOTAL.FLUX.CREDIT + Y.TOTAL.FLUX.DEBIT.SOUS

    END ELSE
        NBRE.TXN.AC=0
        Y.FLUX.CREDIT.PERIOD=0
    END
    RETURN
****************************
TRAIT.TXN.STMT:
*******************************
STMT.REC =''
STMT.ER =''
tmp.ID.NEW.STMT.ER = EB.SystemTables.getIdNew(STMT.ER)
    CALL F.READ(FN.SEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.REC,tmp.ID.NEW.STMT.ER
EB.SystemTables.setIdNew(STMT.ER, tmp.ID.NEW.STMT.ER)
    MONTANT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>
    MONTANT.FCY=SEB.DataAccess.FWrite<AC.STE.AMOUNT.FCY>
    IDENTIF.TRANS=STMT.REC<AC.STE.TRANSACTION.CODE>
    Y.SYSTEM.ID=STMT.REC<AC.STE.SYSTEM.ID>
    Y.RECORD.STATUS=STMT.REC<AC.STE.RECORD.STATUS>
    IF IEB.SystemTables.setAf()*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                      
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.FLUX.CREDITEUR(ACCT.ID,DATE.DB,DATE.FIN,Y.FLUX.CREDIT.PERIOD)
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
    $INSERT I_F.STMT.ENTRY


    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

    RETURN
*******************************
INIT:
*******************************

    Y.COMPTE = ACCT.ID
    FROM.DATE = DATE.DB
    TO.DATE = DATE.FIN
    FN.STMT = "F.STMT.ENTRY"
    F.STMT = ""
    Y.LIST.OUT = 977:@VM:521:@VM:952:@VM:121:@VM:51:@VM:994:@VM:381:@VM:998
    Y.LIST.SOUSTRAIRE = 968:@VM:967:@VM:232:@VM:233:@VM:234:@VM:600:@VM:967:@VM:933
    Y.TOTAL.FLUX.CREDIT = 0
    Y.TOTAL.FLUX.DEBIT.SOUS = 0
    RETURN
*******************************
OPENFILES:
*******************************
    CALL OPF(FN.STMT,F.STMT)

    RETURN


*******************************************************
 PROCESS:
************************************************************
    Y.COMPTE.TMP = Y.COMPTE
    CALL EB.ACCT.ENTRY.LIST(Y.COMPTE.TMP,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
    IF ID.LIST THEN
        NBRE.TXN.AC=DCOUNT(ID.LIST,@FM)
        FOR COMPTEUR.TXN=1 TO NBRE.TXN.AC
            ID.TRANSA=ID.LIST<COMPTEUR.TXN>

            GOSUB TRAIT.TXN.STMT
            IF OUT.IND EQ 1 THEN
                CONTINUE
            END ELSE
                IF IND.REV EQ 1 THEN
                    CONTINUE
                END ELSE

                    IF SOUS.IND EQ 1 THEN
                        IF Y.SENS.OP EQ "D" THEN

                            Y.TOTAL.FLUX.DEBIT.SOUS += Y.MONTANT
                        END
                    END ELSE
                        IF Y.SENS.OP EQ "C" THEN
                            Y.TOTAL.FLUX.CREDIT += Y.MONTANT
                        END
                    END

                END
            END

        NEXT COMPTEUR.TXN
        Y.FLUX.CREDIT.PERIOD = Y.TOTAL.FLUX.CREDIT + Y.TOTAL.FLUX.DEBIT.SOUS

    END ELSE
        NBRE.TXN.AC=0
        Y.FLUX.CREDIT.PERIOD=0
    END
    RETURN
****************************
TRAIT.TXN.STMT:
*******************************
STMT.REC =''
STMT.ER =''
    CALL F.READ(FN.STMT,ID.TRANSA,STMT.REC,F.STMT,STMT.ER)
    MONTANT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>
    MONTANT.FCY=STMT.REC<AC.STE.AMOUNT.FCY>
    IDENTIF.TRANS=STMT.REC<AC.STE.TRANSACTION.CODE>
    Y.SYSTEM.ID=STMT.REC<AC.STE.SYSTEM.ID>
    Y.RECORD.STATUS=STMT.REC<AC.STE.RECORD.STATUS>
    IF IDENFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefES Y.LIST.OUT THEN
        EB.SystemTables.setE(1)
    END ELSE
        OUT.IND = 0
        IF Y.RECORD.STATUS EQ 'REVE' THEN
            IND.REV=1
        END ELSE
            IND.REV=0
            IF IDENTIF.TRANS MATCHES Y.LIST.SOUSTRAIRE THEN
                SOUS.IND = 1
            END ELSE
                SOUS.IND = 0
            END
            IF MONTANT.FCY THEN
                Y.MONTANT = MONTANT.FCY
                IF MONTANT.FCY GT 0 THEN
                    Y.SENS.OP="C"
                END ELSE
                    Y.SENS.OP="D"
                END
            END ELSE
                Y.MONTANT = MONTANT.LCY
                IF MONTANT.LCY GT 0 THEN
                    Y.SENS.OP="C"
                END ELSE
                    Y.SENS.OP="D"
                END
            END
        END
    END
    RETURN
END
