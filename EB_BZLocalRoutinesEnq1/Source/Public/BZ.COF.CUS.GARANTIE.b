*-----------------------------------------------------------------------------
* <Rating>239</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description : Verifier l'egibilite du compte GARANTIE
*---------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZITOUNA-UPG-R13-R19 : 
*FM converted to @FM  
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CUS.GARANTIE
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
* $INSERT BP I_F.BZ.COFFRE.CONTRAT
* * $INSERT I_COMMON - Not Used anymore;COFFRE.REGISTRE
* * $INSERT I_EQUATE - Not Used anymore;COFFRE.TYPE
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;T
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.TYPE

*ZIT-UPG-R09-R13/E
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;TURN

    V.FLAG.GARANTIE = COMI

    IF V.FLAG.GARANTIE NE 'YES' THEN
        R.NEW(CF.CT.AMOUNT.GARANTIE)= ""
        R.NEW(CF.CT.COMPTE.GARANTIE)=""


        RETURN

    END


    V.CUSTOMER = R.NEW(CF.CT.ID.CLIENT)
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCUSTOMER.ACCOUNT"
    F.CUS.ACC = ''
    R.CFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusRR.CUS.ACC = ''

    FN.ACC = "F.ACCOUNT"
    F.ACC = ''
    R.ACC= ''
    ERR.ACC = ''

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    FN.TYP = "F.BZ.COFFRE.TYPE"  
    F.TYP = ''
    R.TYP= ''
    ERR.TYP = ''



    CALL OPF(FN.CUS.ACC,F.CUS.ACC)
    CALL OPF(FN.ACC,F.ACC)
    EB.DataAccess.Opf(FN.REG,F.REG)
    EB.DataAccess.Opf(FN.TYP,F.TYP)



******************************
    Y.FACT.DEV=R.NEB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefRATION)
    CALL F.READ(FN.ACC,Y.FACT.DEV,R.ACC.FACT,F.ACC,ERR.ACC.FACT)
    V.CUREB.DataAccess.FRead.DEV=R.ACC.FACT<AC.CURRENCY>
    CALL F.READ(FN.CUS.ACC,V.CUSTOMER,R.CUS.ACC,F.CUS.ACC,ERR.CUS.ACC)
    IF R.CUS.ACC THEN
        V.ACC.NUMBER = R.CUS.ACC


        S.ACEB.SystemTabEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerACC.NUMBER,@FM))
        V.ACC.GAR = ""
        FOR K = 1 TOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer       R.ACCOUNT = ''
            K.ACCEB.DataAccess.FWriteR.CUS.ACC<K>
            CALL F.READ(FN.ACC,K.ACCOUNT,R.ACCOUNT,F.ACC,ERR.ACC)
            IF R.ACCOUNT NE '' THEN
                Y.ACCT.CATEG = R.ACCOUNT<AC.CATEGORY>
        EB.SystemTables.setAf(R.ACCOUNT<AC.CURRENCY>)
        EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>239</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description : Verifier l'egibilite du compte GARANTIE
*---------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZITOUNA-UPG-R13-R19 : 
*FM converted to @FM  
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CUS.GARANTIE
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
    $INSERT I_F.CUSTOMER.ACCOUNT
    $INSERT I_F.ACCOUNT
*ZIT-UPG-R09-R13/S
* $INSERT BP I_F.BZ.COFFRE.CONTRAT
* $INSERT BP I_F.BZ.COFFRE.REGISTRE
* $INSERT BP I_F.BZ.COFFRE.TYPE
$INSERT I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.REGISTRE
$INSERT I_F.BZ.COFFRE.TYPE

*ZIT-UPG-R09-R13/E
    IF MESSAGE EQ 'VAL' THEN RETURN

    V.FLAG.GARANTIE = COMI

    IF V.FLAG.GARANTIE NE 'YES' THEN
        R.NEW(CF.CT.AMOUNT.GARANTIE)= ""
        R.NEW(CF.CT.COMPTE.GARANTIE)=""


        RETURN

    END


    V.CUSTOMER = R.NEW(CF.CT.ID.CLIENT)
    FN.CUS.ACC = "F.CUSTOMER.ACCOUNT"
    F.CUS.ACC = ''
    R.CUS.ACC= ''
    ERR.CUS.ACC = ''

    FN.ACC = "F.ACCOUNT"
    F.ACC = ''
    R.ACC= ''
    ERR.ACC = ''

    FN.REG = "F.BZ.COFFRE.REGISTRE"
    F.REG = ''
    R.REG= ''
    ERR.REG = ''

    FN.TYP = "F.BZ.COFFRE.TYPE"  
    F.TYP = ''
    R.TYP= ''
    ERR.TYP = ''



    CALL OPF(FN.CUS.ACC,F.CUS.ACC)
    CALL OPF(FN.ACC,F.ACC)
    CALL OPF(FN.REG,F.REG)
    CALL OPF(FN.TYP,F.TYP)



******************************
    Y.FACT.DEV=R.NEW(CF.CT.COMPTE.FACTURATION)
    CALL F.READ(FN.ACC,Y.FACT.DEV,R.ACC.FACT,F.ACC,ERR.ACC.FACT)
    V.CURR.FACT.DEV=R.ACC.FACT<AC.CURRENCY>
    CALL F.READ(FN.CUS.ACC,V.CUSTOMER,R.CUS.ACC,F.CUS.ACC,ERR.CUS.ACC)
    IF R.CUS.ACC THEN
        V.ACC.NUMBER = R.CUS.ACC


        S.ACCT.CNT = DCOUNT(V.ACC.NUMBER,@FM)
        V.ACC.GAR = ""
        FOR K = 1 TO S.ACCT.CNT
            R.ACCOUNT = ''
            K.ACCOUNT = R.CUS.ACC<K>
            CALL F.READ(FN.ACC,K.ACCOUNT,R.ACCOUNT,F.ACC,ERR.ACC)
            IF R.ACCOUNT NE '' THEN
                Y.ACCT.CATEG = R.ACCOUNT<AC.CATEGORY>
                V.CURR.GAR.DEV = R.ACCOUNT<AC.CURRENCY>
                IF (Y.ACCT.CATEG EQ '4300') AND (V.CURR.FACT.DEV EQ V.CURR.GAR.DEV) THEN
                    V.ACC.GAR =  K.ACCOUNT

                    R.NEW(CF.CT.COMPTE.GARANTIE)= K.ACCOUNT
                    BREAK

                END
            END
        NEXT K

        IF  V.ACC.GAR EQ "" THEN
            ETEXT="Compte garantie avec devise " : V.CURR.GAR.DEV : " non ouvert"
            CALL STORE.END.ERROR

        END ELSE

* Récupérer montant garantie

            V.NUM.COFFRE = R.NEW(CF.CT.NUMERO.COFFRE)
            CALL F.READ(FN.REG,V.NUM.COFFRE,R.REG,F.REG,ERR.REG)

            IF R.REG NE "" THEN
                V.TYPE.COFFRE =R.REG<CF.REG.TYPE>

                CALL F.READ(FN.TYP,V.TYPE.COFFRE,R.TYP,F.TYP,ERR.TYP)
                IF R.TYP NE "" THEN
                    V.RET.GARANTIE=R.TYP<CF.TYPE.RET.GARANTIE>
                    R.NEW(CF.CT.AMOUNT.GARANTIE)=V.RET.GARANTIE
                END ELSE
                    ETEXT="Type coffre inexistant"
                    CALL STORE.END.ERROR

                END

            END ELSE

                ETEXT="NUM coffre inexistant"
                CALL STORE.END.ERROR


            END
        END

    END ELSE

        ETEXT="Client inexistant"
        CALL STORE.END.ERROR
    END

    RETURN
END
