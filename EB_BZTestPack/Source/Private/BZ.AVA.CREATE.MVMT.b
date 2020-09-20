* @ValidationCode : Mjo2MTA4MTY0ODU6Q3AxMjUyOjE2MDA2MTI5MTMzOTk6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOmZhbHNlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 15:41:53
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
**ZIT-UPG-R13-R19:Converted VM to @VM
**               :Converted GET.LOC.REF to MULTI.GET.LOC.REF

*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*-----------------------------------------------------------------------------
$PACKAGE EB.BZTestPack

*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
**ZIT-UPG-R13-R19:Converted VM to @VM
**               :Converted GET.LOC.REF to MULTI.GET.LOC.REF

*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*-----------------------------------------------------------------------------

SUBROUTINE BZ.AVA.CREATE.MVMT(REF.AVA,TYPE.AVA,BENEFICIARE,SENS,LIBELLE,REF.MVMT,DATE.MOUVEMENT,MONTANT.TND,ORIGINE.FOND,BASE.CALCUL,DATE.DEPART,DATE.RETOUR,TRANS.CUMULE,DROIT.CUMULE,RESERVE3,REF.MVMT.CR.BBE)
    
*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_F.USER
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*INCLUDE GLOBUS.BP I_F.CUSTOMER
*INCLUDE GLOBUS.BP I_F.TELLER
*INCLUDE BP I_F.BZ.AVA.MVMT
*INCLUDE BP I_F.BZ.AVA.BENEF
*INCLUDE BP I_F.BZ.AVA.TYPE
*INCLUDE BP I_F.BZ.AVA.DOSSIER


    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Security
    $USING ST.Customer
    $USING TT.ModelBank
    $USING EB.OverrideProcessing
    $USING EB.ErrorProcessing
    
* $INSERT I_F.USER - Not Used anymore;
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.CUSTOMER - Not Used anymore;
* $INSERT I_F.TELLER - Not Used anymore;
    $INSERT I_F.BZ.AVA.MVMT
    $INSERT I_F.BZ.AVA.BENEF
    $INSERT I_F.BZ.AVA.TYPE
    $INSERT I_F.BZ.AVA.DOSSIER

*ZIT-UPG-R09-R13/E
    FN.MVMT="F.BZ.AVA.MVMT"
    F.MVMT=""

    FN.BEN="F.BZ.AVA.BENEF"
    F.BEN=""

    FN.CUS="F.CUSTOMER"
    F.CUS=""

    FN.TYPE.AVA="F.BZ.AVA.TYPE"
    F.TYPE.AVA=""

    FN.DOSSIER="F.BZ.AVA.DOSSIER"
    F.DOSSIER=""

    CALL OPF(FN.MVMT,F.MVMT)
    CALL OPF(FN.BEN,F.BEN)
    CALL OPF(FN.CUS,F.CUS)
    CALL OPF(FN.TYPE.AVA,F.TYPE.AVA)
    CALL OPF(FN.DOSSIER,F.DOSSIER)


    TOTAL.ALIMENTATION=EB.SystemTables.getRNew(AVA.DOS.TOTAL.UTILISE)

    CALL F.READ(FN.TYPE.AVA,TYPE.AVA,TYPE.AVA.REC,F.TYPE.AVA,TYPE.AVA.ERR)
    IF TYPE.AVA.REC THEN
        CODE.OPERATION=TYPE.AVA.REC<AVA.TYP.CODE.NAT.OP>
    END ELSE
        EB.SystemTables.setE("Type AVA errone")
        EB.ErrorProcessing.Err()
        
    END

* CALL F.READ(FN.CUS,BENEFICIARE,CUS.REC,F.CUS,CUS.ERR)
* IF CUS.REC THEN
*     CODE.AGENCE=CUS.REC<EB.CUS.ACCOUNT.OFFICER>
* END ELSE
*     CALL F.READ(FN.BEN,BENEFICIARE,BEN.REC,F.BEN,BEN.ERR)
*     IF BEN.REC THEN
*         IF BEN.REC<AVA.BEN.ID.CLIENT> THEN
*             CODE.AGENCE=BEN.REC<AVA.BEN.AGENCE>
*         END ELSE
*             CALL F.READ(FN.DOSSIER,REF.AVA,DOSS.REC,F.DOSSIER,DOSS.ERR)
*             CODE.AGENCE = DOSS.REC<AVA.DOS.CODE.AGENCE>
*         END

*     END
* END

    DONNE.REC<AVA.MVT.CODE.AGENCE>=EB.SystemTables.getRUser()<EB.Security.User.UseDepartmentCode>
    DONNE.REC<AVA.MVT.ID.BENEF>=BENEFICIARE
    DONNE.REC<AVA.MVT.SENS>=SENS
    DONNE.REC<AVA.MVT.LIBELLE>=LIBELLE
    DONNE.REC<AVA.MVT.REF.MVMT>=REF.MVMT
    DONNE.REC<AVA.MVT.DATE.MVMT>=DATE.MOUVEMENT
    DONNE.REC<AVA.MVT.MONTANT.TND>=MONTANT.TND
    DONNE.REC<AVA.MVT.ORIGINE.FOND>=ORIGINE.FOND
    DONNE.REC<AVA.MVT.BASE.CALCUL>=BASE.CALCUL
    DONNE.REC<AVA.MVT.DROIT.CUMULE>=DROIT.CUMULE
    DONNE.REC<AVA.MVT.TRANS.CUMULE>=TRANS.CUMULE
    DONNE.REC<AVA.MVT.STATUT>=1
    DONNE.REC<AVA.MVT.DATE.CREATION>=EB.SystemTables.getToday()
    DONNE.REC<AVA.MVT.REF.DOSSIER>=REF.AVA
    DONNE.REC<AVA.MVT.DATE.DEPART>=DATE.DEPART
    DONNE.REC<AVA.MVT.DATE.RETOUR>=DATE.RETOUR
    DONNE.REC<AVA.MVT.NATURE.OP>=CODE.OPERATION
    DONNE.REC<AVA.MVT.COMMENTAIRE>=RESERVE3
    DONNE.REC<AVA.MVT.REF.MVMT.CR.BBE>=REF.MVMT.CR.BBE
*****************

    Y.APPLICATION.NAME = "TELLER"
    Y.FIELD.NAME = "PAY.DEST.DEV" : @VM : "REF.AUT.SORTIE"
    Y.POS = ''
    CALL MULTI.LOC.GET.REF(Y.APPLICATION.NAME,Y.FIELD.NAME,Y.POS)
    POS.DES = Y.POS<1,1>
    POS.REF.VENTE = Y.POS<1,2>
    
    IF LIBELLE EQ 'BBA' THEN
**      CALL GET.LOC.REF("TELLER","PAY.DEST.DEV",POS.DES)
        PAYS.DESTINATION=EB.SystemTables.getRNew(TT.TE.LOCAL.REF)<1,POS.DES>
        DONNE.REC<AVA.MVT.PAYS.DESTINATION>=PAYS.DESTINATION
    END
*****************

*CALL ALLOCATE.UNIQUE.TIME(IDENTIF.UNIQUE)
*ID.MVMT=REF.AVA:TODAY:IDENTIF.UNIQUE

    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    ID.MVMT=REF.AVA:EB.SystemTables.getToday():Y.TIME

    Y.TIME.STAMP = EB.SystemTables.getTimeStamp()
    Y.TIME.STAMP1 = FIELD(Y.TIME.STAMP,':',1)
    Y.TIME.STAMP2 =  FIELD( Y.TIME.STAMP,':',2)
   

    DONNE.REC<AVA.MVT.CURR.NO>       += 1
    DONNE.REC<AVA.MVT.INPUTTER>      = EB.SystemTables.getOperator()
    DONNE.REC<AVA.MVT.DATE.TIME>     = EB.SystemTables.getToday():Y.TIME.STAMP1:Y.TIME.STAMP2
    DONNE.REC<AVA.MVT.AUTHORISER>    = EB.SystemTables.getOperator()
    DONNE.REC<AVA.MVT.CO.CODE>       = "TN0010001"
    Y.DEPT.CODE=EB.SystemTables.getRUser()<EB.Security.User.UseDepartmentCode>
    DONNE.REC<AVA.MVT.DEPT.CODE> = Y.DEPT.CODE

    CALL F.WRITE(FN.MVMT,ID.MVMT,DONNE.REC)
    IF LIBELLE MATCHES "RAV":@VM:"RRV" THEN

**      CALL GET.LOC.REF("TELLER","REF.AUT.SORTIE",POS.REF.VENTE)

        REF.VENTE=EB.SystemTables.getRNew(TT.TE.LOCAL.REF)<1,POS.REF.VENTE>

        CALL F.READ(FN.MVMT,REF.VENTE,MVMT.REC,F.MVMT,MVMT.ERR)
        CALL F.READ(FN.MVMT,ID.MVMT,N.MVT.REC,F.MVMT,MVMT.ERR)

        IF MVMT.REC THEN
            MVMT.REC<AVA.MVT.REF.MVMT.CR.BBE>=ID.MVMT
            N.MVT.REC<AVA.MVT.DATE.DEPART>=MVMT.REC<AVA.MVT.DATE.DEPART>
            N.MVT.REC<AVA.MVT.DATE.RETOUR>=MVMT.REC<AVA.MVT.DATE.RETOUR>
            N.MVT.REC<AVA.MVT.PAYS.DESTINATION>=MVMT.REC<AVA.MVT.PAYS.DESTINATION>
            CALL F.WRITE(FN.MVMT,REF.VENTE,MVMT.REC)
            CALL F.WRITE(FN.MVMT,ID.MVMT,N.MVT.REC)
        END ELSE
            EB.SystemTables.setE("ERREUR MOUVEMENT")
            EB.ErrorProcessing.Err()
            
            GOSUB END.PROGRAM
        END

    END
RETURN
END.PROGRAM:
END
