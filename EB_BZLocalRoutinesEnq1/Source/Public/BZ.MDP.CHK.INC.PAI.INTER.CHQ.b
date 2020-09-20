

* Modification Histroy:
*ZIT-UPG-R13-R19 : Converted FM,VM,SM TO @FM,@VM,@SM.
*                : GET.LOC.REF converted to MULTI.GET.LOC.REF.
*------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
$INSERT I_F.BZ.CNP.INC.PAI
    $INSERT I_F.EB.SIGNATORY.GROUP

    GOSUB INIT
    GOSUB PROCESS.TITULAIRE
    GOSUB PROCESS.INC.PAI
    GOSUB PROCESS.INC.PAI.BCT.OL
    GOSUB SET.ELIGIB
    GOSUB SET.NEXT.STEP
* $INSERT I_COMMON - Not Used anymore;IRY

    GOSUB END.PROGRAM

    RETURN

**************************
SET.NEXT.STEP:
**************************
    IF (Y.STATUT EQ "OK") THEN

        IF (Y.INTERDIT.BCT.TITU EQ "NO") OR (Y.INTERDIT.INTER.TITU EQ "Oui") THEN

            Y.STEP = LEVE.PM

        END ELSE

        EB.SystemTables.getVFunction().CLIENT MATCHEB.SystemTables.getVFunction()M:'PF' THEN

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.SIGNATAIRE.LEVE THEN
                    IF FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus 1 THEN
                        Y.STEP = LEVE.PM
                    END ELSE
                        Y.STEP = LEVE.PP
                    END
                END ELSE
                    Y.STEP = ISSUE
                END

            END ELSE

                IF Y.SIGNATAIRE.LEVE THEN
                    Y.STEP = LEVE.PM
                END ELSE
                    Y.STEP = ISSUE
                END

            END
        END
    END ELSE
        Y.STEP = "ERROR"
    END

    RETURN


*********EB.DataAccess.Opf**************
INIT:
**EB.DataAccess.Opf*********************


***************
    LEVE.PP = "CUSEB.SystemTables.getRNew(),FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefQUIER.NEW I "
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN.DDE"
    ISSUEEB.DataAccess.FReadEQUE.ISSUE,BZ.MDP.CHQ.DEMANDE I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
	
 *ZIT-UPG-R13-R19 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer    ;*GET.LOC.REF converted to MULTI.GET.LOC.REF.
    *CALL GEEB.SystemTables.setE()

* Modification Histroy:
*ZIT-UPG-R13-R19 : Converted FM,VM,SM TO @FM,@VM,@SM.
*                : GET.LOC.REF converted to MULTI.GET.LOC.REF.
*------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
$INSERT I_F.BZ.CNP.INC.PAI
    $INSERT I_F.EB.SIGNATORY.GROUP

    GOSUB INIT
    GOSUB PROCESS.TITULAIRE
    GOSUB PROCESS.INC.PAI
    GOSUB PROCESS.INC.PAI.BCT.OL
    GOSUB SET.ELIGIB
    GOSUB SET.NEXT.STEP
    GOSUB BUILD.ENQUIRY

    GOSUB END.PROGRAM

    RETURN

**************************
SET.NEXT.STEP:
**************************
    IF (Y.STATUT EQ "OK") THEN

        IF (Y.INTERDIT.BCT.TITU EQ "NO") OR (Y.INTERDIT.INTER.TITU EQ "Oui") THEN

            Y.STEP = LEVE.PM

        END ELSE

            IF NAT.CLIENT MATCHES 'PP':@VM:'PF' THEN

                IF Y.SIGNATAIRE.LEVE THEN
                    IF Y.COMPTEUR.SIG GT 1 THEN
                        Y.STEP = LEVE.PM
                    END ELSE
                        Y.STEP = LEVE.PP
                    END
                END ELSE
                    Y.STEP = ISSUE
                END

            END ELSE

                IF Y.SIGNATAIRE.LEVE THEN
                    Y.STEP = LEVE.PM
                END ELSE
                    Y.STEP = ISSUE
                END

            END
        END
    END ELSE
        Y.STEP = "ERROR"
    END

    RETURN


**************************
INIT:
**************************


***************
    LEVE.PP = "CUSTOMER,BZ.INTERDIT.CHEQUIER.NEW I "
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN.DDE"
    ISSUE = "CHEQUE.ISSUE,BZ.MDP.CHQ.DEMANDE I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
	
 *ZIT-UPG-R13-R19 S                     ;*GET.LOC.REF converted to MULTI.GET.LOC.REF.
    *CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",POS.NAT.CLT)
    *CALL GET.LOC.REF("CUSTOMER","INTERDIT.CHQ",POS.INTERD)
	
	Y.LRF.APPEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerSTOMER"
	Y.LRF.FIEEB.DataAccess.FWrite.NAT.CLT":@FM:"INTERDIT.CHQ"
	Y.MPOS = ''
	CALL MULTI.GET.LOC.REF(Y.LRF.APP,Y.LRF.FIE,Y.MPOS)
	POS.NAT.CLT= Y.MPOS<1,1>
	EB.SystemTables.setAf()

* Modification Histroy:
*ZIT-UPG-R13-R19 : Converted FM,VM,SM TO @FM,@VM,@SM.
*                : GET.LOC.REF converted to MULTI.GET.LOC.REF.
*------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
$INSERT I_F.BZ.CNP.INC.PAI
    $INSERT I_F.EB.SIGNATORY.GROUP

    GOSUB INIT
    GOSUB PROCESS.TITULAIRE
    GOSUB PROCESS.INC.PAI
    GOSUB PROCESS.INC.PAI.BCT.OL
    GOSUB SET.ELIGIB
    GOSUB SET.NEXT.STEP
    GOSUB BUILD.ENQUIRY

    GOSUB END.PROGRAM

    RETURN

**************************
SET.NEXT.STEP:
**************************
    IF (Y.STATUT EQ "OK") THEN

        IF (Y.INTERDIT.BCT.TITU EQ "NO") OR (Y.INTERDIT.INTER.TITU EQ "Oui") THEN

            Y.STEP = LEVE.PM

        END ELSE

            IF NAT.CLIENT MATCHES 'PP':@VM:'PF' THEN

                IF Y.SIGNATAIRE.LEVE THEN
                    IF Y.COMPTEUR.SIG GT 1 THEN
                        Y.STEP = LEVE.PM
                    END ELSE
                        Y.STEP = LEVE.PP
                    END
                END ELSE
                    Y.STEP = ISSUE
                END

            END ELSE

                IF Y.SIGNATAIRE.LEVE THEN
                    Y.STEP = LEVE.PM
                END ELSE
                    Y.STEP = ISSUE
                END

            END
        END
    END ELSE
        Y.STEP = "ERROR"
    END

    RETURN


**************************
INIT:
**************************


***************
    LEVE.PP = "CUSTOMER,BZ.INTERDIT.CHEQUIER.NEW I "
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN.DDE"
    ISSUE = "CHEQUE.ISSUE,BZ.MDP.CHQ.DEMANDE I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
	
 *ZIT-UPG-R13-R19 S                     ;*GET.LOC.REF converted to MULTI.GET.LOC.REF.
    *CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",POS.NAT.CLT)
    *CALL GET.LOC.REF("CUSTOMER","INTERDIT.CHQ",POS.INTERD)
	
	Y.LRF.APP ="SECTOR":@FM:"CUSTOMER"
	Y.LRF.FIE = "LIB.NAT.CLT":@FM:"INTERDIT.CHQ"
	Y.MPOS = ''
	CALL MULTI.GET.LOC.REF(Y.LRF.APP,Y.LRF.FIE,Y.MPOS)
	POS.NAT.CLT= Y.MPOS<1,1>
	POSFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefS<2,1>
 *ZIT-UPEB.SystemTables.setE()

* Modification Histroy:
*ZIT-UPG-R13-R19 : Converted FM,VM,SM TO @FM,@VM,@SM.
*                : GET.LOC.REF converted to MULTI.GET.LOC.REF.
*------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ
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
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
$INSERT I_F.BZ.CNP.INC.PAI
    $INSERT I_F.EB.SIGNATORY.GROUP

    GOSUB INIT
    GOSUB PROCESS.TITULAIRE
    GOSUB PROCESS.INC.PAI
    GOSUB PROCESS.INC.PAI.BCT.OL
    GOSUB SET.ELIGIB
    GOSUB SET.NEXT.STEP
    GOSUB BUILD.ENQUIRY

    GOSUB END.PROGRAM

    RETURN

**************************
SET.NEXT.STEP:
**************************
    IF (Y.STATUT EQ "OK") THEN

        IF (Y.INTERDIT.BCT.TITU EQ "NO") OR (Y.INTERDIT.INTER.TITU EQ "Oui") THEN

            Y.STEP = LEVE.PM

        END ELSE

            IF NAT.CLIENT MATCHES 'PP':@VM:'PF' THEN

                IF Y.SIGNATAIRE.LEVE THEN
                    IF Y.COMPTEUR.SIG GT 1 THEN
                        Y.STEP = LEVE.PM
                    END ELSE
                        Y.STEP = LEVE.PP
                    END
                END ELSE
                    Y.STEP = ISSUE
                END

            END ELSE

                IF Y.SIGNATAIRE.LEVE THEN
                    Y.STEP = LEVE.PM
                END ELSE
                    Y.STEP = ISSUE
                END

            END
        END
    END ELSE
        Y.STEP = "ERROR"
    END

    RETURN


**************************
INIT:
**************************


***************
    LEVE.PP = "CUSTOMER,BZ.INTERDIT.CHEQUIER.NEW I "
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN.DDE"
    ISSUE = "CHEQUE.ISSUE,BZ.MDP.CHQ.DEMANDE I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
	
 *ZIT-UPG-R13-R19 S                     ;*GET.LOC.REF converted to MULTI.GET.LOC.REF.
    *CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",POS.NAT.CLT)
    *CALL GET.LOC.REF("CUSTOMER","INTERDIT.CHQ",POS.INTERD)
	
	Y.LRF.APP ="SECTOR":@FM:"CUSTOMER"
	Y.LRF.FIE = "LIB.NAT.CLT":@FM:"INTERDIT.CHQ"
	Y.MPOS = ''
	CALL MULTI.GET.LOC.REF(Y.LRF.APP,Y.LRF.FIE,Y.MPOS)
	POS.NAT.CLT= Y.MPOS<1,1>
	POS.INTERD = Y.MPOS<2,1>
 *ZIT-UPG-R13-R19 E

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''

    FN.AC = "F.ACCOUNT"
    F.AC = ""

    FN.CUST= 'F.CUSTOMER'
    F.CUST=''

    FN.SIG = 'F.EB.SIGNATORY.GROUP'
    F.SIG = ""

    FN.SECT= 'F.SECTOR'
    F.SECT=''

    CALL OPF(FN.BZ.CNP.INC.PAI,F.BZ.CNP.INC.PAI)
    CALL OPF(FN.SIG,F.SIG)
    CALL OPF(FN.AC,F.AC)
    CALL OPF(FN.SECT,F.SECT)
    CALL OPF(FN.CUST,F.CUST)

    CALL F.READ(FN.AC,Y.COMPTE,AC.REC,F.AC,AC.ERR)

    IF AC.REC THEN
        TITULAIRE.ID = AC.REC<AC.CUSTOMER>
    END ELSE
        GOSUB END.PROGRAM
    END


    RETURN

**************************
PROCESS.TITULAIRE:
**************************
    CALL F.READ(FN.CUST,TITULAIRE.ID,R.CUST,F.CUST,ERR.CUST)
    V.SECTOR = R.CUST<EB.CUS.SECTOR>

    Y.INTERDIT.BCT.TITU = R.CUST<EB.CUS.ISSUE.CHEQUES>
    Y.INTERDIT.INTER.TITU = R.CUST<EB.CUS.LOCAL.REF,POS.INTERD>
    Y.LEGAL.ID.TITU = R.CUST<EB.CUS.LEGAL.ID,1>
    Y.BIRTH.DATE.TITU = R.CUST<EB.CUS.DATE.OF.BIRTH>

    CALL F.READ(FN.SECT,V.SECTOR,R.SECT,F.SECT,ERR.SECT)
    NAT.CLIENT =  R.SECT<EB.SEC.LOCAL.REF,POS.NAT.CLT>

    IF NAT.CLIENT EQ 'PM' THEN
        GOSUB PROCESS.SIGNATORY
        Y.SIGNATAIRES.AFF = Y.SIGNATAIRES
        CHANGE @FM TO " " IN Y.SIGNATAIRES.AFF
    END ELSE
        Y.SIGNATAIRES = TITULAIRE.ID
        Y.INTERDITS.BCT = Y.INTERDIT.BCT.TITU
        Y.INTERDITS.INTER = Y.INTERDIT.INTER.TITU
        Y.LEGAL.IDS = Y.LEGAL.ID.TITU
        Y.BIRTH.DATES = Y.BIRTH.DATE.TITU
        Y.COMPTEUR.SIG = 1
        GOSUB PROCESS.SIGNATORY

        Y.SIGNATAIRES.AFF = Y.SIGNATAIRES
        CHANGE @FM TO " " IN Y.SIGNATAIRES.AFF
    END


    RETURN


**************************
PROCESS.SIGNATORY:
**************************
    SEL.COMMAND.CUS="SELECT ":FN.SIG:" WITH @ID LIKE '":TITULAIRE.ID:"....'"
    CALL EB.READLIST(SEL.COMMAND.CUS,SEL.LIST.CUS,'',NO.OF.SIG,ERR1)

    IF SEL.LIST.CUS THEN
        FOR COUNTER.TYPE = 1 TO NO.OF.SIG


            CALL F.READ(FN.SIG,SEL.LIST.CUS<COUNTER.TYPE>,R.GROUP,F.SIG,ERR.GROUP)

            SIGNATAIRES = R.GROUP<EB.SIG.GRP.SIGNATORY.CUSTOMER>
            DATES.DEBUT = R.GROUP<EB.SIG.GRP.START.DATE>
            DATES.FIN = R.GROUP<EB.SIG.GRP.END.DATE>

            NBR.SIGNATAIRE = DCOUNT(SIGNATAIRES,@VM)
            CHANGE @VM TO @FM IN SIGNATAIRES
            CHANGE @VM TO @FM IN DATES.DEBUT
            CHANGE @VM TO @FM IN DATES.FIN
					
            FOR K = 1 TO NBR.SIGNATAIRE
                DATE.DEBUT = DATES.DEBUT<K>
                DATE.FIN = DATES.FIN<K>
                SIGNATAIRE = SIGNATAIRES<K>
*IF (DATE.DEBUT LE TODAY) AND (DATE.FIN GE TODAY) THEN

                CALL F.READ(FN.CUST,SIGNATAIRE,R.SIGNATAIRE,F.CUST,ERR.CUST)

                Y.LEGAL.IDS.TMP = R.SIGNATAIRE<EB.CUS.LEGAL.ID>
                Y.LEGAL.DOC.NAMES.TMP = R.SIGNATAIRE<EB.CUS.LEGAL.DOC.NAME>
                GOSUB GET.CIN

                Y.INTERDIT.BCT = R.SIGNATAIRE<EB.CUS.ISSUE.CHEQUES>
                Y.INTERDIT.INTER = R.SIGNATAIRE<EB.CUS.LOCAL.REF,POS.INTERD>
                IF Y.INTERDIT.INTER EQ "" THEN
                    Y.INTERDIT.INTER = "Non"
                END

                Y.SIGNATAIRES<-1> = SIGNATAIRE
                Y.INTERDITS.BCT<-1> = Y.INTERDIT.BCT

                Y.INTERDITS.INTER<-1> = Y.INTERDIT.INTER
                Y.LEGAL.IDS<-1> = Y.CIN.SIG
                Y.BIRTH.DATES<-1> = R.SIGNATAIRE<EB.CUS.DATE.OF.BIRTH>

                Y.COMPTEUR.SIG+=1
            NEXT K

        NEXT COUNTER.TYPE

    END

    RETURN

**************************
GET.CIN:
**************************
    CHANGE @VM TO @FM IN Y.LEGAL.IDS.TMP
    CHANGE @VM TO @FM IN Y.LEGAL.DOC.NAMES.TMP

    LOCATE 'CIN' IN Y.LEGAL.DOC.NAMES.TMP SETTING POS.CIN ELSE POS.CIN=0

    Y.CIN.SIG = Y.LEGAL.IDS.TMP<POS.CIN>

    RETURN

**************************
PROCESS.INC.PAI.BCT.OL:
**************************
    NBRE.INCIDENT.OL = 0

    FOR COMPTEUR=1 TO Y.COMPTEUR.SIG

        Y.NUM.CIN = Y.LEGAL.IDS<COMPTEUR>
        Y.DATE.OF.BIRTH = Y.BIRTH.DATES<COMPTEUR>

        CALL BZ.INT.CHEQUIER(Y.DATE.OF.BIRTH,Y.NUM.CIN,Y.RETOUR.OL)
*CODE.ERREUR|DATE.INTERDICT|DATE.NAISS|MESSAGE.ERREUR|NBR.AMNESTIE|NBR.CHQ.REGUL|NBR.INCIDENT|NOM|PRENOM|NUM.CIN

        Y.CODE.ERREUR = FIELD(Y.RETOUR.OL,'|',1)
        Y.MSG.ERREUR = FIELD(Y.RETOUR.OL,'|',4)
        IF Y.MSG.ERREUR EQ "null" THEN
            Y.MSG.ERREUR = ""
        END

        IF Y.CODE.ERREUR MATCHES "103":@VM:"198":@VM:"199" THEN
            NBRE.INCIDENT.OL = 1
            BREAK
        END ELSE

            Y.NBR.INCIDENT.TOT = FIELD(Y.RETOUR.OL,'|',7)
            Y.NBR.INCIDENT.REGUL = FIELD(Y.RETOUR.OL,'|',6)

            IF Y.NBR.INCIDENT.TOT EQ "null" THEN
                Y.NBR.INCIDENT.TOT = 0
            END

            IF Y.NBR.INCIDENT.REGUL EQ "null" THEN
                Y.NBR.INCIDENT.REGUL = 0
            END

            Y.NBR.INCIDENT = Y.NBR.INCIDENT.TOT - Y.NBR.INCIDENT.REGUL

            IF Y.NBR.INCIDENT GT 0 THEN
                NBRE.INCIDENT.OL = Y.NBR.INCIDENT
                BREAK
            END
        END
    NEXT COMPTEUR

    RETURN

**************************
PROCESS.INC.PAI:
**************************
    INC.COUNT = 0
    CMD = "SELECT ":FN.BZ.CNP.INC.PAI:" WITH STATUT.CNP NE 5 AND SIGNATAIRE EQ ":Y.SIGNATAIRES.AFF

    CALL EB.READLIST(CMD,INC.IDS,'', INC.COUNT.TMP, INC.ERROR)

    FOR COMPTEIR= 1 TO INC.COUNT.TMP
        Y.IDENTIF.INC = INC.IDS<COMPTEIR>

        CALL F.READ(FN.BZ.CNP.INC.PAI,Y.IDENTIF.INC,UINC.REC,F.BZ.CNP.INC.PAI,IND.ERR)
        IF UINC.REC THEN
            Y.MOTIF.INC = UINC.REC<BZ.CNP.MOTIF.CNP>

            IF NOT(Y.MOTIF.INC MATCHES "01":@VM:"02":@VM:"03":@VM:"04") THEN
                INC.COUNT+=1
            END

        END ELSE
            INC.COUNT = 999
        END

    NEXT COMPTEIR

    RETURN

**************************
SET.ELIGIB:
**************************
    Y.NEXT.STEP = ""
    Y.SIGNATAIRE.LEVE = ""
    Y.SIGNATAIRE.SET = ""


    FOR COMPTEUR=1 TO Y.COMPTEUR.SIG
        Y.SIGNATAIRE = Y.SIGNATAIRES<COMPTEUR>
        Y.ISSUE.CHEQUE = Y.INTERDITS.BCT<COMPTEUR>
        Y.INTER.CHQ.INTERNE = Y.INTERDITS.INTER<COMPTEUR>

        IF (NBRE.INCIDENT.OL EQ 0) AND (INC.COUNT EQ 0) THEN

            IF (Y.ISSUE.CHEQUE EQ "NO") OR (Y.INTER.CHQ.INTERNE EQ "Oui") THEN
                Y.NEXT.STEP = "LEVE"
                Y.SIGNATAIRE.LEVE<-1> = Y.SIGNATAIRE
            END

            Y.STATUT = "OK"
        END ELSE

            Y.STATUT = "KO"
            BREAK
        END
    NEXT COMPTEUR
    RETURN
**************************
BUILD.ENQUIRY:
**************************
    Y.SIG.AFF = Y.SIGNATAIRES:@FM:TITULAIRE.ID
    CHANGE @FM TO ' ' IN Y.SIG.AFF

    R.RECORD<AC.INACTIV.MARKER> = INC.COUNT       ;*NOMBRE INCIDENT
    R.RECORD<AC.INTEREST.LIQU.ACCT> = Y.STATUT    ;*ELIGIBILITE
    R.RECORD<AC.CHARGE.ACCOUNT> = Y.COMPTEUR.SIG  ;*NOMBRE Signataire
    R.RECORD<AC.OTHER.OFFICER> = Y.SIG.AFF        ;*SIGNATIRES

    Y.SIGNATAIRE.LEVE.AFF = Y.SIGNATAIRE.LEVE
    CHANGE @FM TO ' ' IN Y.SIGNATAIRE.LEVE.AFF

    R.RECORD<AC.AUTO.PAY.ACCT> = Y.NEXT.STEP      ;*NEXT STEP
    R.RECORD<AC.REFERAL.CODE> = Y.SIGNATAIRE.LEVE.AFF       ;*SIGNATIRES A INTERDIRE
    R.RECORD<AC.JOINT.HOLDER> = Y.STEP  ;*SIGNATIRES A LEVE INTERDICTION
    R.RECORD<AC.POSITION.TYPE> = NBRE.INCIDENT.OL
    R.RECORD<AC.OUR.EXT.ACCT.NO> = Y.MSG.ERREUR
*****

    RETURN

**************************
END.PROGRAM:

END
