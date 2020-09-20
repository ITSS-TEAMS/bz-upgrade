*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                   CONVERT CHANGED TO CHANGE
*                   GET.LOC.REF CHANGED TO MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
	SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ.IB
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
    $INSERT I_F.CHEQUE.ISSUE

    GOSUB INIT
    GOSUB PROCESS.TITULAIRE
    GOSUB PROCESS.INC.PAI
    GOSUB PROCESS.INC.PAI.BCT.OL
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;TEP
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

            IF NAT.CLIENT MATCHES 'PPFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
                IF Y.SIGNATAIRE.LEVE THEN
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus  IF Y.COMPTEUR.SIG GT 1 THEN
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

    RETUREB.DataAccess.Opf

*****EB.DataAccess.Opf******************
INIT:
**************************


*********EB.DataAcceFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEVE.PP = "CUSTOMER,BZ.INTERDIT.CHEQUIER.NEW I "
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN"
    ISSUE = "CHEQUE.ISSUE,BZ.CHQ.DEMANDE.IB.ACCEPTER I @ID"
***************
    Y.COMPTEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerCOMPTEEB.SystemTables.setE(0)
*ZIT-UPG-R13-R19/S
YAPPLICATION.NAME ="EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerMER"
YFIELD.NAME ="LIB.NAT.CLT":@FM:"INTERDIT.CHQ"
LREF.POS = ''
CAEB.DataAccess.FWriteI.GET.LOC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
POS.NAT.CLT =LREF.POS<1,1>
POS.INTERD =LREF.POS<2,1>
*ZIT-UPGEB.SystemTables.setAf()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                   CONVERT CHANGED TO CHANGE
*                   GET.LOC.REF CHANGED TO MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
	SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ.IB
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
    $INSERT I_F.CHEQUE.ISSUE

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
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN"
    ISSUE = "CHEQUE.ISSUE,BZ.CHQ.DEMANDE.IB.ACCEPTER I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
*ZIT-UPG-R13-R19/S
YAPPLICATION.NAME ="SECTOR":@FM:"CUSTOMER"
YFIELD.NAME ="LIB.NAT.CLT":@FM:"INTERDIT.CHQ"
LREF.POS = ''
CALL MULTI.GET.LOC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
POS.NAT.CLT =LREF.POS<1,1>
POS.INTERD =LREF.POS<2,1>
*ZIT-UPG-R1FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefALEB.SystemTables.setE()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : FM,VM CHANGED TO @FM,@VM
*                   CONVERT CHANGED TO CHANGE
*                   GET.LOC.REF CHANGED TO MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
	SUBROUTINE BZ.MDP.CHK.INC.PAI.INTER.CHQ.IB
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
    $INSERT I_F.CHEQUE.ISSUE

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
    LEVE.PM = "ENQ BZ.CUSTOMER.DETAILS.SIGN"
    ISSUE = "CHEQUE.ISSUE,BZ.CHQ.DEMANDE.IB.ACCEPTER I @ID"
***************
    Y.COMPTE = O.DATA
    Y.COMPTEUR.SIG = 0
*ZIT-UPG-R13-R19/S
YAPPLICATION.NAME ="SECTOR":@FM:"CUSTOMER"
YFIELD.NAME ="LIB.NAT.CLT":@FM:"INTERDIT.CHQ"
LREF.POS = ''
CALL MULTI.GET.LOC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
POS.NAT.CLT =LREF.POS<1,1>
POS.INTERD =LREF.POS<2,1>
*ZIT-UPG-R13-R19/E
*    CALL GET.LOC.REF("SECTOR","LIB.NAT.CLT",POS.NAT.CLT)   ;*CHANGED TO MULTI.GET.LOC.REF
*    CALL GET.LOC.REF("CUSTOMER","INTERDIT.CHQ",POS.INTERD)  ;*CHANGED TO MULTI.GET.LOC.REF


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
AC.REC =''
AC.ERR =''
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
R.CUST =''
ERR.CUST =''
    CALL F.READ(FN.CUST,TITULAIRE.ID,R.CUST,F.CUST,ERR.CUST)
    V.SECTOR = R.CUST<EB.CUS.SECTOR>

    Y.INTERDIT.BCT.TITU = R.CUST<EB.CUS.ISSUE.CHEQUES>
    Y.INTERDIT.INTER.TITU = R.CUST<EB.CUS.LOCAL.REF,POS.INTERD>
    Y.LEGAL.ID.TITU = R.CUST<EB.CUS.LEGAL.ID><1,1>
    Y.BIRTH.DATE.TITU = R.CUST<EB.CUS.DATE.OF.BIRTH>
R.SECT =''
ERR.SECT =''
    CALL F.READ(FN.SECT,V.SECTOR,R.SECT,F.SECT,ERR.SECT)
    NAT.CLIENT =  R.SECT<EB.SEC.LOCAL.REF,POS.NAT.CLT>

    IF NAT.CLIENT EQ 'PM' THEN
        GOSUB PROCESS.SIGNATORY
        Y.SIGNATAIRES.AFF = Y.SIGNATAIRES
 *       CONVERT @FM TO " " IN Y.SIGNATAIRES.AFF ;*CONVERTED TO CHANGE
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

 *       CONVERT FM TO " " IN Y.SIGNATAIRES.AFF ;*CONVERTED TO CHANGE
        CHANGE @FM TO " " IN Y.SIGNATAIRES.AFF 

    END


    RETURN


**************************
PROCESS.SIGNATORY:
**************************
SEL.LIST.CUS =''
NO.OF.SIG =''
ERR1 =''
    SEL.COMMAND.CUS="SELECT ":FN.SIG:" WITH @ID LIKE '":TITULAIRE.ID:"....'"
    CALL EB.READLIST(SEL.COMMAND.CUS,SEL.LIST.CUS,'',NO.OF.SIG,ERR1)

    IF SEL.LIST.CUS THEN
        FOR COUNTER.TYPE = 1 TO NO.OF.SIG

Y.SIG.ID =SEL.LIST.CUS<COUNTER.TYPE>
R.GROUP =''
ERR.GROUP =''
            CALL F.READ(FN.SIG,Y.SIG.ID,R.GROUP,F.SIG,ERR.GROUP)

            SIGNATAIRES = R.GROUP<EB.SIG.GRP.SIGNATORY.CUSTOMER>
            DATES.DEBUT = R.GROUP<EB.SIG.GRP.START.DATE>
            DATES.FIN = R.GROUP<EB.SIG.GRP.END.DATE>

            NBR.SIGNATAIRE = DCOUNT(SIGNATAIRES,@VM)
*            CONVERT VM TO FM IN SIGNATAIRES
*            CONVERT VM TO FM IN SIGNATAIRES
*            CONVERT VM TO FM IN DATES.DEBUT
            CHANGE @VM TO @FM IN DATES.DEBUT
            CHANGE @VM TO @FM IN DATES.FIN
            CHANGE @VM TO @FM IN DATES.FIN

            FOR K = 1 TO NBR.SIGNATAIRE
                DATE.DEBUT = DATES.DEBUT<K>
                DATE.FIN = DATES.FIN<K>
                SIGNATAIRE = SIGNATAIRES<K>
*IF (DATE.DEBUT LE TODAY) AND (DATE.FIN GE TODAY) THEN
R.SIGNATAIRE =''
ERR.CUST =''
                CALL F.READ(FN.CUST,SIGNATAIRE,R.SIGNATAIRE,F.CUST,ERR.CUST)
                Y.INTERDIT.BCT = R.SIGNATAIRE<EB.CUS.ISSUE.CHEQUES>
                Y.INTERDIT.INTER = R.SIGNATAIRE<EB.CUS.LOCAL.REF,POS.INTERD>
                IF Y.INTERDIT.INTER EQ "" THEN
                    Y.INTERDIT.INTER = "Non"
                END

                Y.SIGNATAIRES<-1> = SIGNATAIRE
                Y.INTERDITS.BCT<-1> = Y.INTERDIT.BCT

                Y.INTERDITS.INTER<-1> = Y.INTERDIT.INTER
                Y.LEGAL.IDS<-1> = R.SIGNATAIRE<EB.CUS.LEGAL.ID>
                Y.BIRTH.DATES<-1> = R.SIGNATAIRE<EB.CUS.DATE.OF.BIRTH>

*                Y.COMPTEUR.SIG ++
                Y.COMPTEUR.SIG +=1
*END
            NEXT K

        NEXT COUNTER.TYPE

    END

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
INC.IDS =''
INC.COUNT.TMP =''
INC.ERROR =''
    CMD = "SELECT ":FN.BZ.CNP.INC.PAI:" WITH STATUT.CNP NE 5 AND SIGNATAIRE EQ ":Y.SIGNATAIRES.AFF

    CALL EB.READLIST(CMD,INC.IDS,'', INC.COUNT.TMP, INC.ERROR)

    FOR COMPTEIR= 1 TO INC.COUNT.TMP
        Y.IDENTIF.INC = INC.IDS<COMPTEIR>
UINC.REC =''
IND.ERR =''
        CALL F.READ(FN.BZ.CNP.INC.PAI,Y.IDENTIF.INC,UINC.REC,F.BZ.CNP.INC.PAI,IND.ERR)
        IF UINC.REC THEN
            Y.MOTIF.INC = UINC.REC<BZ.CNP.MOTIF.CNP>

            IF NOT(Y.MOTIF.INC MATCHES "01":@VM:"02":@VM:"03":@VM:"04") THEN
*                INC.COUNT++
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
    NEXT Y.COMPTEUR.SIG
    RETURN
**************************
BUILD.ENQUIRY:
**************************
    Y.SIG.AFF = Y.SIGNATAIRES:@FM:TITULAIRE.ID
 *   CONVERT FM TO ' ' IN Y.SIG.AFF ;*CONVERTED TO CHANGE
    CHANGE @FM TO ' ' IN Y.SIG.AFF 


    R.RECORD<CHEQUE.IS.CHARGES> = INC.COUNT       ;*NOMBRE INCIDENT

    R.RECORD<CHEQUE.IS.CHG.AMOUNT> = Y.STATUT     ;*ELIGIBILITE
    R.RECORD<CHEQUE.IS.CHG.CODE> = Y.COMPTEUR.SIG ;*NOMBRE Signataire

    R.RECORD<CHEQUE.IS.STOCK.REG> = Y.STEP        ;*SIGNATIRES A LEVE INTERDICTION

    R.RECORD<CHEQUE.IS.CLASS.TYPE> = NBRE.INCIDENT.OL
    R.RECORD<CHEQUE.IS.STMT.NO> = Y.MSG.ERREUR
    R.RECORD<CHEQUE.IS.SERIES.ID> = Y.SIG.AFF

*****

    RETURN

**************************
END.PROGRAM:

END
