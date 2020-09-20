*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>400</Rating>
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:EXECUTE,READLIST converted to EB.READLIST
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
        SUBROUTINE BZ.DC.CONTROL.COMPTE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 23 / 02 / 2010  par azdadou
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DATA.CAPTURE
$INSERT I_F.ACCOUNT
*------------------------------------------------------------------------

    GOSUB OPEN.FILE
    GOSUB MAIN
    GOSUB WARN
    RETURN
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;----------------------------------
OPEN.FILE:

    FN.DC = "F.DATA.CAPTURE"
    F.DC = ""
    CALL OPF(FN.DC,F.DC)

    FN.DC.NAU = "F.DATA.CAPTURE$NAU"
    F.DC.NAU = ""
    CALL OPF(FN.DC.NAU,F.DC.NAU)

    FN.ACC = "F.ACCOUNT"
    F.ACC = ""
    CALL OPF(FN.ACC,F.ACC)
    RETURN
*-------EB.SystemTables.getVFunction()-------------EB.SystemTables.getVFunction()------------EB.SystemTables.getRNew()-FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ID.DC = ID.NEW
      COMPTE = R.NEW(DC.DC.ACFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    DEVISE = R.NEW(DC.DC.CURRENCY)
    *RECHERCHE DES LISTES DE DATA CAPTURE APPARTENANT AU MEME BATCH  (ET AU MEME DEPARTEMENT CODE)
    DC.SIMILAIRE = ID.DC[1,LEN(ID.DC) - 3]

    *DONNEES DU COMPTE
    R.ACC = ""
    ERR.ACC = ""
    CALL F.READ(FN.ACC,COMPTE,R.ACC,F.ACC,ERR.ACC)          ;* Lire les donnees du compte saisi
    DEVISE.COMPTE = R.ACC<AC.CURRENCY>         ;* Reccuperer la devise
    CATEG = R.ACC<AC.CATEGORY>      ;* Reccuperer la categorie
    IF DEVISE EQ "" THEN
       DEVISE = DEVISE.COMPTE
    END
    CATEGORIE = ""
    IF (CATEG GE 21000) AND (CATEG LE 21999) THEN
       CATEGORIE = "BILAN"
    END
    IF ((CATEG GE 20000) AND (CATEG LE 20999)) OR ((CATEG GE 23000) AND (CATEG LE 49999)) THEN
       CATEGORIE = "HORSBILAN"
    END
    IF ((CATEG GE 50000) AND (CATEG LE 59999)) OR ((CATEG GE 60000) AND (CATEG LE 64999)) THEN
       CATEGORIE = "PL"
    END
    * pour generer des commentaires
        *TEXT = "DC.SIMILAIRE " : DC.SIMILAIRE : " COMPTE   " : COMPTE : " ET DEVISE " : DEVISE : " ET CATEG " : CATEG : " ET CATEGORIE " : CATEGORIE
        *EB.DataAccess.OpfL REM
    MSGWAEB.DataAccess.OpfNG = ""
    *TRAITEMENT POUR DATA.CAPTURE
    SEL.LIST = ""
    SEL.NBR =""
    SEL.ERR =""
    SEL.CMD = "SELEB.SystemTables.getRNew():FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefCY ACCOUNT.NUMBER WITH @ID LIKE ":DC.SIMILAIRE:"... TO 1"
    * pour generer des commentaires
        *EB.DataAccess.FRead "SELECT COMMANDE " : SEL.CMD
        *CALL REM
    AUTHORIZED = "TRUE"
*ZIT-UPG-R13-R19 S 
*   EXECUTE SEL.CMD ;* ExecuEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer READLIST SEL.LIST FROM 1 ELSE AUTHORIZED = "FALSE"
	CALLEB.SystemTables.setE()*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>400</Rating>
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:EXECUTE,READLIST converted to EB.READLIST
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
        SUBROUTINE BZ.DC.CONTROL.COMPTE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 23 / 02 / 2010  par azdadou
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DATA.CAPTURE
$INSERT I_F.ACCOUNT
*------------------------------------------------------------------------

    GOSUB OPEN.FILE
    GOSUB MAIN
    GOSUB WARN
    RETURN
*-------------------------------------------------------------
OPEN.FILE:

    FN.DC = "F.DATA.CAPTURE"
    F.DC = ""
    CALL OPF(FN.DC,F.DC)

    FN.DC.NAU = "F.DATA.CAPTURE$NAU"
    F.DC.NAU = ""
    CALL OPF(FN.DC.NAU,F.DC.NAU)

    FN.ACC = "F.ACCOUNT"
    F.ACC = ""
    CALL OPF(FN.ACC,F.ACC)
    RETURN
*-------------------------------------------------------------
MAIN:
      ID.DC = ID.NEW
      COMPTE = R.NEW(DC.DC.ACCOUNT.NUMBER)
      DEVISE = R.NEW(DC.DC.CURRENCY)
    *RECHERCHE DES LISTES DE DATA CAPTURE APPARTENANT AU MEME BATCH  (ET AU MEME DEPARTEMENT CODE)
    DC.SIMILAIRE = ID.DC[1,LEN(ID.DC) - 3]

    *DONNEES DU COMPTE
    R.ACC = ""
    ERR.ACC = ""
    CALL F.READ(FN.ACC,COMPTE,R.ACC,F.ACC,ERR.ACC)          ;* Lire les donnees du compte saisi
    DEVISE.COMPTE = R.ACC<AC.CURRENCY>         ;* Reccuperer la devise
    CATEG = R.ACC<AC.CATEGORY>      ;* Reccuperer la categorie
    IF DEVISE EQ "" THEN
       DEVISE = DEVISE.COMPTE
    END
    CATEGORIE = ""
    IF (CATEG GE 21000) AND (CATEG LE 21999) THEN
       CATEGORIE = "BILAN"
    END
    IF ((CATEG GE 20000) AND (CATEG LE 20999)) OR ((CATEG GE 23000) AND (CATEG LE 49999)) THEN
       CATEGORIE = "HORSBILAN"
    END
    IF ((CATEG GE 50000) AND (CATEG LE 59999)) OR ((CATEG GE 60000) AND (CATEG LE 64999)) THEN
       CATEGORIE = "PL"
    END
    * pour generer des commentaires
        *TEXT = "DC.SIMILAIRE " : DC.SIMILAIRE : " COMPTE   " : COMPTE : " ET DEVISE " : DEVISE : " ET CATEG " : CATEG : " ET CATEGORIE " : CATEGORIE
        *CALL REM
    MSGWARNING = ""
    *TRAITEMENT POUR DATA.CAPTURE
    SEL.LIST = ""
    SEL.NBR =""
    SEL.ERR =""
    SEL.CMD = "SELECT ":FN.DC :" CURRENCY ACCOUNT.NUMBER WITH @ID LIKE ":DC.SIMILAIRE:"... TO 1"
    * pour generer des commentaires
        *TEXT = "SELECT COMMANDE " : SEL.CMD
        *CALL REM
    AUTHORIZED = "TRUE"
*ZIT-UPG-R13-R19 S 
*   EXECUTE SEL.CMD ;* Executer le SELECT
*   READLIST SEL.LIST FROM 1 ELSE AUTHORIZED = "FALSE"
	CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
	IF SEL.ERR THEN
	    AUTHORIZEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerEND
*ZIT-UPG-R13-R19 EB.DataAccess.FWrite IF AUTHORIZED NE "FALSE" THEN
    SEL.NBR = DCOUNT(SEL.LIST,@FM)      ;*
	
    * poEB.SystemTables.setAf()*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>400</Rating>
*-----------------------------------------------------------------------------
**Modification History:
**ZIT-UPG-R13-R19:EXECUTE,READLIST converted to EB.READLIST
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
        SUBROUTINE BZ.DC.CONTROL.COMPTE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 23 / 02 / 2010  par azdadou
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.DATA.CAPTURE
$INSERT I_F.ACCOUNT
*------------------------------------------------------------------------

    GOSUB OPEN.FILE
    GOSUB MAIN
    GOSUB WARN
    RETURN
*-------------------------------------------------------------
OPEN.FILE:

    FN.DC = "F.DATA.CAPTURE"
    F.DC = ""
    CALL OPF(FN.DC,F.DC)

    FN.DC.NAU = "F.DATA.CAPTURE$NAU"
    F.DC.NAU = ""
    CALL OPF(FN.DC.NAU,F.DC.NAU)

    FN.ACC = "F.ACCOUNT"
    F.ACC = ""
    CALL OPF(FN.ACC,F.ACC)
    RETURN
*-------------------------------------------------------------
MAIN:
      ID.DC = ID.NEW
      COMPTE = R.NEW(DC.DC.ACCOUNT.NUMBER)
      DEVISE = R.NEW(DC.DC.CURRENCY)
    *RECHERCHE DES LISTES DE DATA CAPTURE APPARTENANT AU MEME BATCH  (ET AU MEME DEPARTEMENT CODE)
    DC.SIMILAIRE = ID.DC[1,LEN(ID.DC) - 3]

    *DONNEES DU COMPTE
    R.ACC = ""
    ERR.ACC = ""
    CALL F.READ(FN.ACC,COMPTE,R.ACC,F.ACC,ERR.ACC)          ;* Lire les donnees du compte saisi
    DEVISE.COMPTE = R.ACC<AC.CURRENCY>         ;* Reccuperer la devise
    CATEG = R.ACC<AC.CATEGORY>      ;* Reccuperer la categorie
    IF DEVISE EQ "" THEN
       DEVISE = DEVISE.COMPTE
    END
    CATEGORIE = ""
    IF (CATEG GE 21000) AND (CATEG LE 21999) THEN
       CATEGORIE = "BILAN"
    END
    IF ((CATEG GE 20000) AND (CATEG LE 20999)) OR ((CATEG GE 23000) AND (CATEG LE 49999)) THEN
       CATEGORIE = "HORSBILAN"
    END
    IF ((CATEG GE 50000) AND (CATEG LE 59999)) OR ((CATEG GE 60000) AND (CATEG LE 64999)) THEN
       CATEGORIE = "PL"
    END
    * pour generer des commentaires
        *TEXT = "DC.SIMILAIRE " : DC.SIMILAIRE : " COMPTE   " : COMPTE : " ET DEVISE " : DEVISE : " ET CATEG " : CATEG : " ET CATEGORIE " : CATEGORIE
        *CALL REM
    MSGWARNING = ""
    *TRAITEMENT POUR DATA.CAPTURE
    SEL.LIST = ""
    SEL.NBR =""
    SEL.ERR =""
    SEL.CMD = "SELECT ":FN.DC :" CURRENCY ACCOUNT.NUMBER WITH @ID LIKE ":DC.SIMILAIRE:"... TO 1"
    * pour generer des commentaires
        *TEXT = "SELECT COMMANDE " : SEL.CMD
        *CALL REM
    AUTHORIZED = "TRUE"
*ZIT-UPG-R13-R19 S 
*   EXECUTE SEL.CMD ;* Executer le SELECT
*   READLIST SEL.LIST FROM 1 ELSE AUTHORIZED = "FALSE"
	CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
	IF SEL.ERR THEN
	    AUTHORIZED = "FALSE"
    END
*ZIT-UPG-R13-R19 E	
    IF AUTHORIZED NE "FALSE" THEN
    SEL.NBR = DCOUNT(SEL.LIST,@FM)      ;*
	
    * pour FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefmentaires
        EB.SystemTables.setE("Nombre d'entrees   " : SEL.NBR / 2)
        *CALL REM
    *CONTROL SUR LES DEVISES. PAS DE DEVISE DIFFERENTE DES AUTRES
    *CONTROL SUR LES CATEGORIES DE COMPTE:
    *   Bloquer les Ecritures comptables DC faisant intervenir un compte hors bilan contre un compte bilan
    *Les comptes bilans : marche monetaire(MM) : 21000-21999
    *                     prts et depots(LD) : 21000-21999
    *                     et credits a la clientele(MG-LD))
    *Les comptes hors bilan : (echanges de devises(FX) : 20000-20999
    *                         engagements par signature(MD)
    *                         lettre de credits) (LC) : : plage 23000-49999
    *   Bloquer les ecritures comptables DC faisant intervenir un compte hors bilan contre une PLCategory
    *PL cest la plage de categorie de compte 50000-59999 et 60000-64999
	
    FOR I = 1 TO SEL.NBR
        DEVISE.ACOMPARER =   SEL.LIST<I>

        COMPTE.ACOMPARER = SEL.LIST<I + 1>
        * pour generer des commentaires
        *TEXT = "COMPTE   " : COMPTE : " ET NOUVEAU COMPTE " : COMPTE.ACOMPARER
        *CALL REM

        R.ACC = ""
        ERR.ACC = ""
        CALL F.READ(FN.ACC,COMPTE.ACOMPARER,R.ACC,F.ACC,ERR.ACC)          ;* Lire les donnees du compte saisi
        DEVISE.COMPTE.ACOMPARER = R.ACC<AC.CURRENCY>         ;* Reccuperer la devise
        CATEG.ACOMPARER = R.ACC<AC.CATEGORY>      ;* Reccuperer la categorie
        IF DEVISE.ACOMPARER EQ "" THEN
           DEVISE.ACOMPARER = DEVISE.COMPTE.ACOMPARER
        END

        * pour generer des commentaires
        *TEXT = "DEVISE   " : DEVISE : " ET NOUVELLE DEVISE " : DEVISE.ACOMPARER
        *CALL REM
        IF DEVISE NE DEVISE.ACOMPARER THEN
           MSGWARNING = "DEVISE DIFFERENTE DES AUTRES ECRITURES"
        END

        CATEGORIE.ACOMPARER = ""
        IF (CATEG.ACOMPARER GE 21000) AND (CATEG.ACOMPARER LE 21999) THEN
           CATEGORIE.ACOMPARER = "BILAN"
        END
        IF ((CATEG.ACOMPARER GE 20000) AND (CATEG.ACOMPARER LE 20999)) OR ((CATEG.ACOMPARER GE 23000) AND (CATEG.ACOMPARER LE 49999)) THEN
           CATEGORIE.ACOMPARER = "HORSBILAN"
        END
        IF ((CATEG.ACOMPARER GE 50000) AND (CATEG.ACOMPARER LE 59999)) OR ((CATEG.ACOMPARER GE 60000) AND (CATEG.ACOMPARER LE 64999)) THEN
           CATEGORIE.ACOMPARER = "PL"
        END

        IF CATEGORIE EQ "HORSBILAN" THEN
           IF CATEGORIE.ACOMPARER NE CATEGORIE THEN
              AF = DC.DC.ACCOUNT.NUMBER
              ETEXT = "CATEGORIE DE COMPTE NON PERMISE"
              CALL STORE.END.ERROR
              *RETURN
           END
        END ELSE
            IF CATEGORIE.ACOMPARER EQ "HORSBILAN" THEN
              AF = DC.DC.ACCOUNT.NUMBER
              ETEXT = "CATEGORIE DE COMPTE NON PERMISE"
              CALL STORE.END.ERROR
              *RETURN
            END
        END
        I += 1
    NEXT I
   END

*TRAITEMENT POUR DATA.CAPTURE$NAU
    SEL.LIST = ""
    SEL.NBR =""
    SEL.ERR =""

    SEL.CMD = "SELECT ":FN.DC.NAU :" CURRENCY ACCOUNT.NUMBER WITH @ID LIKE ":DC.SIMILAIRE:"... TO 1"
*ZIT-UPG-R13-R19 S 
*   EXECUTE SEL.CMD ;* Executer le SELECT
    * pour generer des commentaires
        *TEXT = "SELECT COMMANDE " : SEL.CMD
        *CALL REM
*   READLIST SEL.LIST FROM 1 ELSE RETURN
	CALL EB.READLIST(SEL.CMD,SEL.LIST,'',NO.OF.RECS,SEL.ERR)
	IF SEL.ERR THEN RETURN
*ZIT-UPG-R13-R19 S 
    SEL.NBR = DCOUNT(SEL.LIST,@FM)      ;*
    * pour generer des commentaires
        *TEXT = "Nombre d'entrees   " : SEL.NBR / 2
        *CALL REM
    *CONTROL SUR LES DEVISES. PAS DE DEVISE DIFFERENTE DES AUTRES
    *CONTROL SUR LES CATEGORIES DE COMPTE:
    *   Bloquer les Ecritures comptables DC faisant intervenir un compte hors bilan contre un compte bilan
    *Les comptes bilans : marche monetaire(MM) : 21000-21999
    *                     prts et depots(LD) : 21000-21999
    *                     et credits a la clientele(MG-LD))
    *Les comptes hors bilan : (echanges de devises(FX) : 20000-20999
    *                         engagements par signature(MD)
    *                         lettre de credits) (LC) : : plage 23000-49999
    *   Bloquer les ecritures comptables DC faisant intervenir un compte hors bilan contre une PLCategory
    *PL cest la plage de categorie de compte 50000-59999 et 60000-64999

    FOR I = 1 TO SEL.NBR
        DEVISE.ACOMPARER =   SEL.LIST<I>

        COMPTE.ACOMPARER = SEL.LIST<I + 1>
        * pour generer des commentaires
        *TEXT = "COMPTE   " : COMPTE : " ET NOUVEAU COMPTE " : COMPTE.ACOMPARER
        *CALL REM

        R.ACC = ""
        ERR.ACC = ""
        CALL F.READ(FN.ACC,COMPTE.ACOMPARER,R.ACC,F.ACC,ERR.ACC)          ;* Lire les donnees du compte saisi
        DEVISE.COMPTE.ACOMPARER = R.ACC<AC.CURRENCY>         ;* Reccuperer la devise
        CATEG.ACOMPARER = R.ACC<AC.CATEGORY>      ;* Reccuperer la categorie
        IF DEVISE.ACOMPARER EQ "" THEN
           DEVISE.ACOMPARER = DEVISE.COMPTE.ACOMPARER
        END

        * pour generer des commentaires
        *TEXT = "DEVISE   " : DEVISE : " ET NOUVELLE DEVISE " : DEVISE.ACOMPARER
        *CALL REM
        IF DEVISE NE DEVISE.ACOMPARER THEN
           MSGWARNING = "DEVISE DIFFERENTE DES AUTRES ECRITURES"
        END

        CATEGORIE.ACOMPARER = ""
        IF (CATEG.ACOMPARER GE 21000) AND (CATEG.ACOMPARER LE 21999) THEN
           CATEGORIE.ACOMPARER = "BILAN"
        END
        IF ((CATEG.ACOMPARER GE 20000) AND (CATEG.ACOMPARER LE 20999)) OR ((CATEG.ACOMPARER GE 23000) AND (CATEG.ACOMPARER LE 49999)) THEN
           CATEGORIE.ACOMPARER = "HORSBILAN"
        END
        IF ((CATEG.ACOMPARER GE 50000) AND (CATEG.ACOMPARER LE 59999)) OR ((CATEG.ACOMPARER GE 60000) AND (CATEG.ACOMPARER LE 64999)) THEN
           CATEGORIE.ACOMPARER = "PL"
        END

        IF CATEGORIE EQ "HORSBILAN" THEN
           IF CATEGORIE.ACOMPARER NE CATEGORIE THEN
              AF = DC.DC.ACCOUNT.NUMBER
              ETEXT = "CATEGORIE DE COMPTE NON PERMISE"
              CALL STORE.END.ERROR
              *RETURN
           END
        END ELSE
            IF CATEGORIE.ACOMPARER EQ "HORSBILAN" THEN
              AF = DC.DC.ACCOUNT.NUMBER
              ETEXT = "CATEGORIE DE COMPTE NON PERMISE"
              CALL STORE.END.ERROR
              *RETURN
            END
        END
        I += 1
    NEXT I

    RETURN

*-------------------------------------------------------------
WARN:
    IF  MSGWARNING NE "" THEN
        AF = DC.DC.CURRENCY
        TEXT = MSGWARNING
        CALL STORE.OVERRIDE(CURR.NO)
    END
    RETURN
*----------------------------------------------------
