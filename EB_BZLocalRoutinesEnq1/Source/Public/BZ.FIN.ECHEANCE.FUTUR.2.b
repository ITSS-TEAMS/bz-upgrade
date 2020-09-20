*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FIN.ECHEANCE.FUTUR.2(TABLEAU)
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
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;FM TO @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.STMT.ENTRY
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.STMT.ENTRY
$INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R09-R13 / E

MAIN:


    GOSUB INIT
    GOSUB PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:
    NBR.JOURS=""
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    FN.STMT="F.STMT.ENTRY"
    F.STMT=""
	STMT.REC=""
	ERR.STMT=""
	
    FN.FWD="F.ACCT.TRANS.FWD"
    F.FWD=""
	FWDFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus=""
    Y.CONDITION=""

    COMPTEUR=0

 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEBUT" IN D.FIELDS<1> SETTING DATE.DEBUT.POS THEN
        DATE.DEBUT = D.RANGE.AND.VALUE<DATE.DEBUT.POS>
    END

    LOCATE "DATE.FIN" IN D.FIELDS<1> SETTING DATE.FIN.POS THEN
        DATE.FIN = D.RANGE.AND.VALUE<DATE.FIN.POS>
    END

    LOCATE "REF.LD" IN D.FIELDS<1> SETTING REF.LD.POS THEN
        REF.LD = D.RANGE.AND.VALUE<REF.LD.POS>
    END

    LOCATE "ID.CLIENT" IN D.FIELDS<1> SETTING ID.CLIENT.POS THEN
        ID.CLIENT = D.RANGE.AND.VALUE<ID.CLIENT.POS>
    END

    LOCATE "LOAN.TYPE" IN D.FIELDS<1> SETTING LOAN.TYPE.POS THEN
        LOAN.TYPE= D.RANGE.AND.VALUE<LOAN.TYPE.POS>
    END

    LOCATEB.DataAccess.OpfAGENCE" IN D.FIELDS<1> SETTING AGENCE.POS THEN
        AEB.DataAccess.OpfCE = D.RANGE.AND.VALUE<AGENCE.POS>
    END

    LOCATE "DEVISE" IN D.FIELDS<1> SETTING DEVISE.POS THEN
        DEVISE = D.RANGE.AND.VALUE<DEVISE.POS>
    END

    EB.DataAcFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.LD)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.FWD,F.FWD)

    RETURN

PROCESS:

EBEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer()*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FIN.ECHEANCE.FUTUR.2(TABLEAU)
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
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;FM TO @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.STMT.ENTRY
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.STMT.ENTRY
$INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R09-R13 / E

MAIN:


    GOSUB INIT
    GOSUB PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:
    NBR.JOURS=""
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    FN.STMT="F.STMT.ENTRY"
    F.STMT=""
	STMT.REC=""
	ERR.STMT=""
	
    FN.FWD="F.ACCT.TRANS.FWD"
    F.FWD=""
	FWD.REC=""
	ERR.FWD=""
    Y.CONDITION=""

    COMPTEUR=0

    LOCATE "DATE.DEBUT" IN D.FIELDS<1> SETTING DATE.DEBUT.POS THEN
        DATE.DEBUT = D.RANGE.AND.VALUE<DATE.DEBUT.POS>
    END

    LOCATE "DATE.FIN" IN D.FIELDS<1> SETTING DATE.FIN.POS THEN
        DATE.FIN = D.RANGE.AND.VALUE<DATE.FIN.POS>
    END

    LOCATE "REF.LD" IN D.FIELDS<1> SETTING REF.LD.POS THEN
        REF.LD = D.RANGE.AND.VALUE<REF.LD.POS>
    END

    LOCATE "ID.CLIENT" IN D.FIELDS<1> SETTING ID.CLIENT.POS THEN
        ID.CLIENT = D.RANGE.AND.VALUE<ID.CLIENT.POS>
    END

    LOCATE "LOAN.TYPE" IN D.FIELDS<1> SETTING LOAN.TYPE.POS THEN
        LOAN.TYPE= D.RANGE.AND.VALUE<LOAN.TYPE.POS>
    END

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AGENCE.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AGENCE.POS>
    END

    LOCATE "DEVISE" IN D.FIELDS<1> SETTING DEVISE.POS THEN
        DEVISE = D.RANGE.AND.VALUE<DEVISE.POS>
    END

    CALL OPF(FN.LD,F.LD)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.FWD,F.FWD)

    RETURN

PROCESS:

    SQL.LD = "SELECTEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerDITION
	LD.IDS=''
	LD.COUNT=EB.DataAccess.FWrite.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)
	SQL.CMD.IDS=''
	EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FIN.ECHEANCE.FUTUR.2(TABLEAU)
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
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19-INITIALISED VARIABLES;FM TO @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.STMT.ENTRY
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.STMT.ENTRY
$INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R09-R13 / E

MAIN:


    GOSUB INIT
    GOSUB PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:
    NBR.JOURS=""
    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    FN.STMT="F.STMT.ENTRY"
    F.STMT=""
	STMT.REC=""
	ERR.STMT=""
	
    FN.FWD="F.ACCT.TRANS.FWD"
    F.FWD=""
	FWD.REC=""
	ERR.FWD=""
    Y.CONDITION=""

    COMPTEUR=0

    LOCATE "DATE.DEBUT" IN D.FIELDS<1> SETTING DATE.DEBUT.POS THEN
        DATE.DEBUT = D.RANGE.AND.VALUE<DATE.DEBUT.POS>
    END

    LOCATE "DATE.FIN" IN D.FIELDS<1> SETTING DATE.FIN.POS THEN
        DATE.FIN = D.RANGE.AND.VALUE<DATE.FIN.POS>
    END

    LOCATE "REF.LD" IN D.FIELDS<1> SETTING REF.LD.POS THEN
        REF.LD = D.RANGE.AND.VALUE<REF.LD.POS>
    END

    LOCATE "ID.CLIENT" IN D.FIELDS<1> SETTING ID.CLIENT.POS THEN
        ID.CLIENT = D.RANGE.AND.VALUE<ID.CLIENT.POS>
    END

    LOCATE "LOAN.TYPE" IN D.FIELDS<1> SETTING LOAN.TYPE.POS THEN
        LOAN.TYPE= D.RANGE.AND.VALUE<LOAN.TYPE.POS>
    END

    LOCATE "AGENCE" IN D.FIELDS<1> SETTING AGENCE.POS THEN
        AGENCE = D.RANGE.AND.VALUE<AGENCE.POS>
    END

    LOCATE "DEVISE" IN D.FIELDS<1> SETTING DEVISE.POS THEN
        DEVISE = D.RANGE.AND.VALUE<DEVISE.POS>
    END

    CALL OPF(FN.LD,F.LD)
    CALL OPF(FN.STMT,F.STMT)
    CALL OPF(FN.FWD,F.FWD)

    RETURN

PROCESS:

    SQL.LD = "SELECT " : FN.LD : Y.CONDITION
	LD.IDS=''
	LD.COUNT=''
	LD.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)
	SQL.CMD.IDS=''
	SQLFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef	EB.SystemTables.setE('')
    IF LD.IDS THEN
        FOR LD.SEQUENCE = 1 TO LD.COUNT
            REMOVE LD.ID FROM LD.IDS SETTING LD.POS

            SQL.CMD = "SELECT ":FN.FWD:" WITH @ID LIKE '...":LD.ID:"...'"

            CALL EB.READLIST(SQL.CMD , SQL.CMD.IDS,'',SQL.CMD.COUNT,SQL.CMD.ERROR)

            IF SQL.CMD.IDS THEN
                FOR SQL.CMD.SEQUENCE = 1 TO SQL.CMD.COUNT
                    REMOVE LMM.ID FROM SQL.CMD.IDS SETTING SQL.CMD.POS
                    MONTANT.COM=0
                    MONTANT.PRINCIPAL=0
                    MONTANT.ECHEANCE=0
                    MONTANT.PROFIT=0
                    CALL F.READ(FN.FWD,LMM.ID,FWD.REC, F.FWD, ERR.FWD)
                    NOMBRE.ECHEANCE=DCOUNT(FWD.REC,@FM)
                    MONTANT=0
                    COMPTEUR=0
                    FOR COMPTEUR.FWD=1 TO NOMBRE.ECHEANCE
                        DATE.TOMBE=FWD.REC<COMPTEUR.FWD>
                        DATE.TOMBE=DATE.TOMBE[2,8]
                        IF (DATE.TOMBE LE DATE.FIN) AND (DATE.TOMBE GE DATE.DEBUT) THEN
                            ECHEANCE.FINAL=DATE.TOMBE
                            COMPTEUR+=1
                            IF COMPTEUR EQ 1 THEN
                                DATE.TOMBE.TMP=DATE.TOMBE
                            END
                            STMT.ID=FWD.REC<COMPTEUR.FWD>
                            CALL F.READ(FN.STMT,STMT.ID,STMT.REC, F.STMT, ERR.STMT)
                            CODE.TRANSACTION = STMT.REC<AC.STE.TRANSACTION.CODE>
                            DEVISE=STMT.REC<AC.STE.CURRENCY>

                            IF DEVISE EQ "TND" THEN
                                MONTANT=STMT.REC<AC.STE.AMOUNT.LCY>
                            END ELSE
                                MONTANT=STMT.REC<AC.STE.AMOUNT.FCY>
                            END

                            IF DATE.TOMBE NE DATE.TOMBE.TMP THEN
                                IF MONTANT.PRINCIPAL GT 0 THEN
                                    MONTANT.ECHEANCE=MONTANT.PRINCIPAL+MONTANT.PROFIT+MONTANT.COM
                                    TABLEAU<-1>=LD.ID:'*':MONTANT.PRINCIPAL:'*':MONTANT.COM:'*':MONTANT.PROFIT:'*':DATE.TOMBE.TMP:'*':MONTANT.ECHEANCE
                                    DATE.TOMBE.TMP=DATE.TOMBE
                                    MONTANT.COM=0
                                END
                            END
                            BEGIN CASE
                            CASE CODE.TRANSACTION EQ '420'
                                MONTANT.PRINCIPAL=ABS(MONTANT)
                            CASE CODE.TRANSACTION EQ '434'
                                MONTANT.PROFIT=ABS(MONTANT)
                            CASE (CODE.TRANSACTION NE '434') AND (CODE.TRANSACTION NE '420')
                                MONTANT.COM=MONTANT.COM+ABS(MONTANT)
                            END CASE

                        END
                    NEXT COMPTEUR.FWD
                    IF MONTANT.PRINCIPAL GT 0 THEN
                        MONTANT.ECHEANCE=MONTANT.PRINCIPAL+MONTANT.PROFIT+MONTANT.COM
                        TABLEAU<-1>=LD.ID:'*':MONTANT.PRINCIPAL:'*':MONTANT.COM:'*':MONTANT.PROFIT:'*':ECHEANCE.FINAL:'*':MONTANT.ECHEANCE
                    END
                NEXT SQL.CMD.SEQUENCE
            END
        NEXT LD.SEQUENCE
    END

    RETURN

PREPARE.CONDITION:

    IF REF.LD NE "" THEN
        Y.CONDITION=" AND @ID EQ ":REF.LD
    END

    IF ID.CLIENT NE "" THEN
        Y.CONDITION:=" AND CUSTOMER.ID EQ ":ID.CLIENT

    END

    IF LOAN.TYPE NE "" THEN
        Y.CONDITION:=" AND LOAN.TYPE EQ ":LOAN.TYPE
    END

    IF AGENCE NE "" THEN
        Y.CONDITION:=" AND MIS.ACCT.OFFICER EQ ":AGENCE
    END

    IF DEVISE NE "" THEN
        Y.CONDITION:=" AND CURRENCY EQ ":DEVISE
    END

    IF Y.CONDITION NE "" THEN
        Y.CONDITION=Y.CONDITION[5,200]
        Y.CONDITION=" WITH ":Y.CONDITION
    END

    RETURN

END
