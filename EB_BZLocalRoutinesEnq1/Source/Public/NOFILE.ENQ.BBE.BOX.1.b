*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19   : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>2144</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.ENQ.BBE.BOX.1 (TABLEAU)
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
    $INSERT I_F.CURRENCY
    $INSERT I_F.TELLER

    $INSERT I_F.TELLER.ID
MAIN:

    GOSUB INIT
    GOSUB PROCESS
    RETURN

INIT:

* $INSERT I_COMMON - Not Used anymore;CY"
    F.CUR=""

    FN.TELLER="F.TELLER$HIS"
    F.TELLER=""

    FN.TELLER.ID="F.TELLER.ID"
    F.TELLER.ID=""

    LOCATE "DATE.DEBUT" IN D.FIELDS<1> SETTING POSDEBUT THEN
        DATE.DEBUT = D.RANGE.AND.VALUE<POSDEBUT>
    END

    LOCATE "DATE.FIN" IN D.FIELDS<1> SETTING POSFIN THEN
        DATE.FIN = D.RANGE.AND.VALUE<POSFIN>
    END

*  LOCATEB.SystemTables.getVFunction()ID" IN D.FIELEB.SystemTables.getVFunction()ING POSTELLEEB.SystemTables.getRNew()NFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus = D.RANGE.AND.VALUE<POSTELLER>





* EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusF(FN.CUR,F.CUR)
    CALL OPF(FN.TELLER,F.TELLER)
    CALL OPF(FN.TELLER.ID,F.TELLER.ID)



    RETURN

PROCESS:
TEL.IDS =''
TEL.ID.COUNT =''
TELLER.ID.ERROR =''
    SQL.TELLER.ID = "SELECT ":FN.TELLER.ID:" WITH @ID GE 9000"
    CALL EB.READLIST(SQL.TELLER.ID , TEL.IDS,'',TEL.ID.COUNT,TELLER.ID.ERROR)

    IF TEL.IDS THEN
        LOOP
            REMOVE TEL.ID FROM TEL.IDS SETTING POS

        WHILE TEL.ID:POS

       EB.DataAccess.OpfB.DataAccess.OpfGOSUB ECRITURE

        REPEAT

        RETURN
* FIN PROCESS


ECRITFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.FRead      V.NBR.ACHAT.EUR = 0
        V.MNT.ACHAT.EUR = 0
        V.MNT.LOC.ACHAT.EUR EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerBEB.SystemTables.setE(0)
        V.MNT.VENTE.EUR = 0
        V.MNT.LOC.VEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer     V.NBR.ACHEB.DataAccess.FWrite= 0
        V.MNT.ACHAT.USD = 0
        V.MNT.LOC.ACHAT.USD = 0

        EB.SystemTables.setAf()*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19   : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>2144</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.ENQ.BBE.BOX.1 (TABLEAU)
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
    $INSERT I_F.CURRENCY
    $INSERT I_F.TELLER

    $INSERT I_F.TELLER.ID
MAIN:

    GOSUB INIT
    GOSUB PROCESS
    RETURN

INIT:

    FN.CUR="F.CURRENCY"
    F.CUR=""

    FN.TELLER="F.TELLER$HIS"
    F.TELLER=""

    FN.TELLER.ID="F.TELLER.ID"
    F.TELLER.ID=""

    LOCATE "DATE.DEBUT" IN D.FIELDS<1> SETTING POSDEBUT THEN
        DATE.DEBUT = D.RANGE.AND.VALUE<POSDEBUT>
    END

    LOCATE "DATE.FIN" IN D.FIELDS<1> SETTING POSFIN THEN
        DATE.FIN = D.RANGE.AND.VALUE<POSFIN>
    END

*  LOCATE "TELLER.ID" IN D.FIELDS<1> SETTING POSTELLER THEN
*     TELLERIDS = D.RANGE.AND.VALUE<POSTELLER>





* END

    CALL OPF(FN.CUR,F.CUR)
    CALL OPF(FN.TELLER,F.TELLER)
    CALL OPF(FN.TELLER.ID,F.TELLER.ID)



    RETURN

PROCESS:
TEL.IDS =''
TEL.ID.COUNT =''
TELLER.ID.ERROR =''
    SQL.TELLER.ID = "SELECT ":FN.TELLER.ID:" WITH @ID GE 9000"
    CALL EB.READLIST(SQL.TELLER.ID , TEL.IDS,'',TEL.ID.COUNT,TELLER.ID.ERROR)

    IF TEL.IDS THEN
        LOOP
            REMOVE TEL.ID FROM TEL.IDS SETTING POS

        WHILE TEL.ID:POS

            GOSUB ECRITURE

        REPEAT

        RETURN
* FIN PROCESS


ECRITURE:
        V.NBR.ACHAT.EUR = 0
        V.MNT.ACHAT.EUR = 0
        V.MNT.LOC.ACHAT.EUR = 0

        V.NBR.VENTE.EUR = 0
        V.MNT.VENTE.EUR = 0
        V.MNT.LOC.VENTE.EUR = 0

        V.NBR.ACHAT.USD = 0
        V.MNT.ACHAT.USD = 0
        V.MNT.LOC.ACHAT.USD = 0

        V.NFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef0
        EB.SystemTables.setE(0)
        V.MNT.LOC.VENTE.USD = 0


        V.NBR.ACHAT.TND = 0
        V.MNT.ACHAT.TND = 0
        V.MNT.LOC.ACHAT.TND = 0

        V.NBR.VENTE.TND = 0
        V.MNT.VENTE.TND = 0
        V.MNT.LOC.VENTE.TND = 0

        V.NBR.ACHAT.TNC = 0
        V.MNT.ACHAT.TNC  = 0
        V.MNT.LOC.ACHAT.TNC = 0


        V.NBR.VENTE.TNC = 0
        V.MNT.VENTE.TNC = 0
        V.MNT.LOC.VENTE.TNC = 0

        V.NBR.ACHAT.SEK = 0
        V.MNT.ACHAT.SEK = 0
        V.MNT.LOC.ACHAT.SEK = 0

        V.NBR.VENTE.SEK = 0
        V.MNT.VENTE.SEK = 0
        V.MNT.LOC.VENTE.SEK = 0

        V.NBR.ACHAT.SAR = 0
        V.MNT.ACHAT.SAR = 0
        V.MNT.LOC.ACHAT.SAR = 0

        V.NBR.VENTE.SAR = 0
        V.MNT.VENTE.SAR = 0
        V.MNT.LOC.VENTE.SAR = 0

        V.NBR.ACHAT.QAR = 0
        V.MNT.ACHAT.QAR = 0
        V.MNT.LOC.ACHAT.QAR = 0

        V.NBR.VENTE.QAR = 0
        V.MNT.VENTE.QAR = 0
        V.MNT.LOC.VENTE.QAR = 0

        V.NBR.ACHAT.NOK = 0
        V.MNT.ACHAT.NOK = 0
        V.MNT.LOC.ACHAT.NOK = 0

        V.NBR.VENTE.NOK = 0
        V.MNT.VENTE.NOK = 0
        V.MNT.LOC.VENTE.NOK = 0

        V.NBR.ACHAT.MRO = 0
        V.MNT.ACHAT.MRO = 0
        V.MNT.LOC.ACHAT.MRO = 0

        V.NBR.VENTE.MRO = 0
        V.MNT.VENTE.MRO = 0
        V.MNT.LOC.VENTE.MRO = 0

        V.NBR.ACHAT.MAD = 0
        V.MNT.ACHAT.MAD = 0
        V.MNT.LOC.ACHAT.MAD = 0

        V.NBR.VENTE.MAD = 0
        V.MNT.VENTE.MAD = 0
        V.MNT.LOC.VENTE.MAD = 0

        V.NBR.ACHAT.LYD = 0
        V.MNT.ACHAT.LYD = 0
        V.MNT.LOC.ACHAT.LYD = 0

        V.NBR.VENTE.LYD = 0
        V.MNT.VENTE.LYD = 0
        V.MNT.LOC.VENTE.LYD = 0

        V.NBR.ACHAT.KWD = 0
        V.MNT.ACHAT.KWD = 0
        V.MNT.LOC.ACHAT.KWD = 0

        V.NBR.VENTE.KWD = 0
        V.MNT.VENTE.KWD = 0
        V.MNT.LOC.VENTE.KWD = 0

        V.NBR.ACHAT.JPY = 0
        V.MNT.ACHAT.JPY = 0
        V.MNT.LOC.ACHAT.JPY = 0

        V.NBR.VENTE.JPY = 0
        V.MNT.VENTE.JPY= 0
        V.MNT.LOC.VENTE.JPY = 0

        V.NBR.ACHAT.GBP = 0
        V.MNT.ACHAT.GBP = 0
        V.MNT.LOC.ACHAT.GBP = 0

        V.NBR.VENTE.GBP = 0
        V.MNT.VENTE.GBP = 0
        V.MNT.LOC.VENTE.GBP = 0

        V.NBR.ACHAT.DZD = 0
        V.MNT.ACHAT.DZD = 0
        V.MNT.LOC.ACHAT.DZD = 0

        V.NBR.VENTE.DZD = 0
        V.MNT.VENTE.DZD = 0
        V.MNT.LOC.VENTE.DZD = 0

        V.NBR.ACHAT.DKK= 0
        V.MNT.ACHAT.DKK = 0
        V.MNT.LOC.ACHAT.DKK = 0

        V.NBR.VENTE.DKK = 0
        V.MNT.VENTE.DKK = 0
        V.MNT.LOC.VENTE.DKK = 0


        V.NBR.ACHAT.CHF= 0
        V.MNT.ACHAT.CHF = 0
        V.MNT.LOC.ACHAT.CHF = 0

        V.NBR.VENTE.CHF = 0
        V.MNT.VENTE.CHF= 0
        V.MNT.LOC.VENTE.CHF = 0

        V.NBR.ACHAT.CAD= 0
        V.MNT.ACHAT.CAD = 0
        V.MNT.LOC.ACHAT.CAD = 0

        V.NBR.VENTE.CAD = 0
        V.MNT.VENTE.CAD= 0
        V.MNT.LOC.VENTE.CAD = 0

        V.NBR.ACHAT.BHD= 0
        V.MNT.ACHAT.BHD = 0
        V.MNT.LOC.ACHAT.BHD = 0

        V.NBR.VENTE.BHD = 0
        V.MNT.VENTE.BHD = 0
        V.MNT.LOC.VENTE.BHD = 0

        V.NBR.ACHAT.AED = 0
        V.MNT.ACHAT.AED = 0
        V.MNT.LOC.ACHAT.AED = 0

        V.NBR.VENTE.AED = 0
        V.MNT.VENTE.AED = 0
        V.MNT.LOC.VENTE.AED = 0

        SQL.TELLER = "SELECT ":FN.TELLER:" WITH TELLER.ID.1 EQ " : TEL.ID : " AND TRANSACTION.CODE EQ 250 260 AND AUTH.DATE LE " :DATE.FIN: " AND AUTH.DATE GE " :DATE.DEBUT: " AND RECORD.STATUS NE REVE "
TELLER.IDS =''
TELLER.COUNT =''
TELLER.ERROR =''

        CALL EB.READLIST(SQL.TELLER , TELLER.IDS,'',TELLER.COUNT,TELLER.ERROR)

        IF TELLER.IDS THEN

            FOR TELLER.SEQUENCE = 1 TO TELLER.COUNT
                REMOVE TELLER.ID FROM TELLER.IDS SETTING TELLER.POS
R.TELLER =''
E.TELLER =''
                CALL F.READ( FN.TELLER , TELLER.ID, R.TELLER , F.TELLER , E.TELLER )

                V.RECORD.STATUS = R.TELLER<TT.TE.RECORD.STATUS>
                V.AUTH.DATE = R.TELLER<TT.TE.AUTH.DATE>

                TYPE = R.TELLER<TT.TE.TRANSACTION.CODE>

*IF (TYPE EQ "250" OR TYPE EQ "260" ) AND V.RECORD.STATUS NE "REVE" AND V.AUTH.DATE GE DATE.DEBUT AND V.AUTH.DATE LE DATE.FIN THEN

                DEVISE = R.TELLER<TT.TE.CURRENCY.1>
                MONTANT =  R.TELLER<TT.TE.AMOUNT.FCY.1>
                MONTANT.LOC = R.TELLER<TT.TE.AMOUNT.LOCAL.1>
                CAISSE = R.TELLER<TT.TE.TELLER.ID.1>

                BEGIN CASE
                CASE DEVISE EQ "EUR"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.EUR =  V.NBR.ACHAT.EUR + 1
                        V.MNT.ACHAT.EUR =  V.MNT.ACHAT.EUR + MONTANT
                        V.MNT.LOC.ACHAT.EUR = V.MNT.LOC.ACHAT.EUR + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.EUR =  V.NBR.VENTE.EUR + 1
                        V.MNT.VENTE.EUR =  V.MNT.VENTE.EUR + MONTANT
                        V.MNT.LOC.VENTE.EUR = V.MNT.LOC.VENTE.EUR + MONTANT.LOC

                    END

                CASE DEVISE EQ "USD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.USD =  V.NBR.ACHAT.USD + 1
                        V.MNT.ACHAT.USD =  V.MNT.ACHAT.USD + MONTANT
                        V.MNT.LOC.ACHAT.USD = V.MNT.LOC.ACHAT.USD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.USD =  V.NBR.VENTE.USD + 1
                        V.MNT.VENTE.USD =  V.MNT.VENTE.USD + MONTANT
                        V.MNT.LOC.VENTE.USD = V.MNT.LOC.VENTE.USD + MONTANT.LOC
                    END

                CASE DEVISE EQ "TND"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.TND =  V.NBR.ACHAT.TND + 1
                        V.MNT.ACHAT.TND =  V.MNT.ACHAT.TND + MONTANT
                        V.MNT.LOC.ACHAT.TND = V.MNT.LOC.ACHAT.TND + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.TND =  V.NBR.VENTE.TND + 1
                        V.MNT.VENTE.TND =  V.MNT.VENTE.TND + MONTANT
                        V.MNT.LOC.VENTE.TND = V.MNT.LOC.VENTE.TND + MONTANT.LOC
                    END

                CASE DEVISE EQ "TNC"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.TNC =  V.NBR.ACHAT.TNC + 1
                        V.MNT.ACHAT.TNC =  V.MNT.ACHAT.TNC + MONTANT
                        V.MNT.LOC.ACHAT.TNC = V.MNT.LOC.ACHAT.TNC + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.TNC =  V.NBR.VENTE.TNC + 1
                        V.MNT.VENTE.TNC =  V.MNT.VENTE.TNC + MONTANT
                        V.MNT.LOC.VENTE.TNC = V.MNT.LOC.VENTE.TNC + MONTANT.LOC
                    END

                CASE DEVISE EQ "SEK"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.SEK =  V.NBR.ACHAT.SEK + 1
                        V.MNT.ACHAT.SEK =  V.MNT.ACHAT.SEK + MONTANT
                        V.MNT.LOC.ACHAT.SEK = V.MNT.LOC.ACHAT.SEK + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.SEK =  V.NBR.VENTE.SEK + 1
                        V.MNT.VENTE.SEK =  V.MNT.VENTE.SEK + MONTANT
                        V.MNT.LOC.VENTE.SEK = V.MNT.LOC.VENTE.SEK + MONTANT.LOC
                    END

                CASE DEVISE EQ "SAR"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.SAR =  V.NBR.ACHAT.SAR + 1
                        V.MNT.ACHAT.SAR =  V.MNT.ACHAT.SAR + MONTANT
                        V.MNT.LOC.ACHAT.SAR = V.MNT.LOC.ACHAT.SAR + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.SAR =  V.NBR.VENTE.SAR + 1
                        V.MNT.VENTE.SAR =  V.MNT.VENTE.SAR + MONTANT
                        V.MNT.LOC.VENTE.SAR = V.MNT.LOC.VENTE.SAR + MONTANT.LOC
                    END


                CASE DEVISE EQ "QAR"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.QAR =  V.NBR.ACHAT.QAR + 1
                        V.MNT.ACHAT.QAR =  V.MNT.ACHAT.QAR + MONTANT
                        V.MNT.LOC.ACHAT.QAR = V.MNT.LOC.ACHAT.QAR + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.QAR =  V.NBR.VENTE.QAR + 1
                        V.MNT.VENTE.QAR =  V.MNT.VENTE.QAR + MONTANT
                        V.MNT.LOC.VENTE.QAR = V.MNT.LOC.VENTE.QAR + MONTANT.LOC
                    END

                CASE DEVISE EQ "NOK"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.NOK =  V.NBR.ACHAT.NOK + 1
                        V.MNT.ACHAT.NOK =  V.MNT.ACHAT.NOK + MONTANT
                        V.MNT.LOC.ACHAT.NOK = V.MNT.LOC.ACHAT.NOK + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.NOK =  V.NBR.VENTE.NOK + 1
                        V.MNT.VENTE.NOK =  V.MNT.VENTE.NOK + MONTANT
                        V.MNT.LOC.VENTE.NOK = V.MNT.LOC.VENTE.NOK + MONTANT.LOC
                    END

                CASE DEVISE EQ "MRO"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.MRO =  V.NBR.ACHAT.MRO + 1
                        V.MNT.ACHAT.MRO =  V.MNT.ACHAT.MRO + MONTANT
                        V.MNT.LOC.ACHAT.MRO = V.MNT.LOC.ACHAT.MRO + MONTANT.LOC


                    END ELSE

                        V.NBR.VENTE.MRO =  V.NBR.VENTE.MRO + 1
                        V.MNT.VENTE.MRO =  V.MNT.VENTE.MRO + MONTANT
                        V.MNT.LOC.VENTE.MRO = V.MNT.LOC.VENTE.MRO + MONTANT.LOC
                    END


                CASE DEVISE EQ "MAD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.MAD =  V.NBR.ACHAT.MAD + 1
                        V.MNT.ACHAT.MAD =  V.MNT.ACHAT.MAD + MONTANT
                        V.MNT.LOC.ACHAT.MAD = V.MNT.LOC.ACHAT.MAD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.MAD =  V.NBR.VENTE.MAD + 1
                        V.MNT.VENTE.MAD =  V.MNT.VENTE.MAD + MONTANT
                        V.MNT.LOC.VENTE.MAD = V.MNT.LOC.VENTE.MAD + MONTANT.LOC
                    END

                CASE DEVISE EQ "LYD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.LYD =  V.NBR.ACHAT.LYD + 1
                        V.MNT.ACHAT.LYD =  V.MNT.ACHAT.LYD + MONTANT
                        V.MNT.LOC.ACHAT.LYD = V.MNT.LOC.ACHAT.LYD + MONTANT.LOC
                    END ELSE

                        V.NBR.VENTE.LYD =  V.NBR.VENTE.LYD + 1
                        V.MNT.VENTE.LYD =  V.MNT.VENTE.LYD + MONTANT
                        V.MNT.LOC.VENTE.LYD = V.MNT.LOC.VENTE.LYD + MONTANT.LOC
                    END

                CASE DEVISE EQ "KWD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.KWD =  V.NBR.ACHAT.KWD + 1
                        V.MNT.ACHAT.KWD =  V.MNT.ACHAT.KWD + MONTANT
                        V.MNT.LOC.ACHAT.KWD = V.MNT.LOC.ACHAT.KWD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.KWD =  V.NBR.VENTE.KWD + 1
                        V.MNT.VENTE.KWD =  V.MNT.VENTE.KWD + MONTANT
                        V.MNT.LOC.VENTE.KWD = V.MNT.LOC.VENTE.KWD + MONTANT.LOC
                    END

                CASE DEVISE EQ "JPY"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.JPY =  V.NBR.ACHAT.JPY + 1
                        V.MNT.ACHAT.JPY =  V.MNT.ACHAT.JPY + MONTANT
                        V.MNT.LOC.ACHAT.JPY = V.MNT.LOC.ACHAT.JPY + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.JPY =  V.NBR.VENTE.JPY + 1
                        V.MNT.VENTE.JPY =  V.MNT.VENTE.JPY + MONTANT
                        V.MNT.LOC.VENTE.JPY = V.MNT.LOC.VENTE.JPY + MONTANT.LOC
                    END

                CASE DEVISE EQ "GBP"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.GBP =  V.NBR.ACHAT.GBP + 1
                        V.MNT.ACHAT.GBP =  V.MNT.ACHAT.GBP + MONTANT
                        V.MNT.LOC.ACHAT.GBP = V.MNT.LOC.ACHAT.GBP + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.GBP =  V.NBR.VENTE.GBP + 1
                        V.MNT.VENTE.GBP =  V.MNT.VENTE.GBP + MONTANT
                        V.MNT.LOC.VENTE.GBP = V.MNT.LOC.VENTE.GBP + MONTANT.LOC
                    END

                CASE DEVISE EQ "DZD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.DZD =  V.NBR.ACHAT.DZD + 1
                        V.MNT.ACHAT.DZD =  V.MNT.ACHAT.DZD + MONTANT
                        V.MNT.LOC.ACHAT.DZD = V.MNT.LOC.ACHAT.DZD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.DZD =  V.NBR.VENTE.DZD + 1
                        V.MNT.VENTE.DZD =  V.MNT.VENTE.DZD + MONTANT
                        V.MNT.LOC.VENTE.DZD = V.MNT.LOC.VENTE.DZD + MONTANT.LOC

                    END

                CASE DEVISE EQ "DKK"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.DKK =  V.NBR.ACHAT.DKK + 1
                        V.MNT.ACHAT.DKK =  V.MNT.ACHAT.DKK + MONTANT
                        V.MNT.LOC.ACHAT.DKK = V.MNT.LOC.ACHAT.DKK + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.DKK =  V.NBR.VENTE.DKK + 1
                        V.MNT.VENTE.DKK =  V.MNT.VENTE.DKK + MONTANT
                        V.MNT.LOC.VENTE.DKK = V.MNT.LOC.VENTE.DKK + MONTANT.LOC

                    END

                CASE DEVISE EQ "CHF"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.CHF =  V.NBR.ACHAT.CHF + 1
                        V.MNT.ACHAT.CHF =  V.MNT.ACHAT.CHF + MONTANT
                        V.MNT.LOC.ACHAT.CHF = V.MNT.LOC.ACHAT.CHF + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.CHF =  V.NBR.VENTE.CHF + 1
                        V.MNT.VENTE.CHF =  V.MNT.VENTE.CHF + MONTANT
                        V.MNT.LOC.VENTE.CHF = V.MNT.LOC.VENTE.CHF + MONTANT.LOC
                    END


                CASE DEVISE EQ "CAD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.CAD =  V.NBR.ACHAT.CAD + 1
                        V.MNT.ACHAT.CAD =  V.MNT.ACHAT.CAD + MONTANT
                        V.MNT.LOC.ACHAT.CAD = V.MNT.LOC.ACHAT.CAD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.CAD =  V.NBR.VENTE.CAD + 1
                        V.MNT.VENTE.CAD =  V.MNT.VENTE.CAD + MONTANT
                        V.MNT.LOC.VENTE.CAD = V.MNT.LOC.VENTE.CAD + MONTANT.LOC

                    END


                CASE DEVISE EQ "BHD"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.BHD =  V.NBR.ACHAT.BHD + 1
                        V.MNT.ACHAT.BHD =  V.MNT.ACHAT.BHD + MONTANT
                        V.MNT.LOC.ACHAT.BHD = V.MNT.LOC.ACHAT.CAD + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.BHD =  V.NBR.VENTE.BHD + 1
                        V.MNT.VENTE.BHD =  V.MNT.VENTE.BHD + MONTANT
                        V.MNT.LOC.VENTE.BHD = V.MNT.LOC.VENTE.BHD + MONTANT.LOC

                    END


                CASE DEVISE EQ "AED"

                    IF TYPE EQ '250' THEN

                        V.NBR.ACHAT.AED =  V.NBR.ACHAT.AED + 1
                        V.MNT.ACHAT.AED =  V.MNT.ACHAT.AED + MONTANT
                        V.MNT.LOC.ACHAT.AED = V.MNT.LOC.ACHAT.AED + MONTANT.LOC

                    END ELSE

                        V.NBR.VENTE.AED =  V.NBR.VENTE.AED + 1
                        V.MNT.VENTE.AED =  V.MNT.VENTE.AED + MONTANT
                        V.MNT.LOC.VENTE.AED = V.MNT.LOC.VENTE.AED + MONTANT.LOC
                    END


                END CASE

*END

            NEXT TELLER.SEQUENCE

        END
CUR.IDS =''
CUR.COUNT =''
CUR.ERROR =''
        SQL.CUR = "SELECT ":FN.CUR

        CALL EB.READLIST(SQL.CUR , CUR.IDS,'',CUR.COUNT,CUR.ERROR)

        IF CUR.IDS THEN
            FOR COUNTER=1 TO CUR.COUNT
                REMOVE CUR.ID FROM CUR.IDS SETTING CUR.POS

                BEGIN CASE

                CASE CUR.ID EQ "EUR"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.EUR:'*':V.MNT.ACHAT.EUR:'*':V.NBR.VENTE.EUR:'*':V.MNT.VENTE.EUR:'*':V.MNT.LOC.ACHAT.EUR:'*':V.MNT.LOC.VENTE.EUR:'*':TEL.ID

                CASE CUR.ID EQ "USD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.USD:'*':V.MNT.ACHAT.USD:'*':V.NBR.VENTE.USD:'*':V.MNT.VENTE.USD:'*':V.MNT.LOC.ACHAT.USD:'*':V.MNT.LOC.VENTE.USD:'*':TEL.ID

                CASE CUR.ID EQ "TND"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.TND:'*':V.MNT.ACHAT.TND:'*':V.NBR.VENTE.TND:'*':V.MNT.VENTE.TND:'*':V.MNT.LOC.ACHAT.TND:'*':V.MNT.LOC.VENTE.TND:'*':TEL.ID

                CASE CUR.ID EQ "TNC"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.TNC:'*':V.MNT.ACHAT.TNC:'*':V.NBR.VENTE.TNC:'*':V.MNT.VENTE.TNC:'*':V.MNT.LOC.ACHAT.TNC:'*':V.MNT.LOC.VENTE.TNC:'*':TEL.ID

                CASE CUR.ID EQ "SEK"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.SEK:'*':V.MNT.ACHAT.SEK:'*':V.NBR.VENTE.SEK:'*':V.MNT.VENTE.SEK:'*':V.MNT.LOC.ACHAT.SEK:'*':V.MNT.LOC.VENTE.SEK:'*':TEL.ID

                CASE CUR.ID EQ "SAR"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.SAR:'*':V.MNT.ACHAT.SAR:'*':V.NBR.VENTE.SAR:'*':V.MNT.VENTE.SAR:'*':V.MNT.LOC.ACHAT.SAR:'*':V.MNT.LOC.VENTE.SAR:'*':TEL.ID

                CASE CUR.ID EQ "QAR"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.QAR:'*':V.MNT.ACHAT.QAR:'*':V.NBR.VENTE.QAR:'*':V.MNT.VENTE.QAR:'*':V.MNT.LOC.ACHAT.QAR:'*':V.MNT.LOC.VENTE.QAR:'*':TEL.ID

                CASE CUR.ID EQ "NOK"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.NOK:'*':V.MNT.ACHAT.NOK:'*':V.NBR.VENTE.NOK:'*':V.MNT.VENTE.NOK:'*':V.MNT.LOC.ACHAT.NOK:'*':V.MNT.LOC.VENTE.NOK:'*':TEL.ID

                CASE CUR.ID EQ "MRO"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.MRO:'*':V.MNT.ACHAT.MRO:'*':V.NBR.VENTE.MRO:'*':V.MNT.VENTE.MRO:'*':V.MNT.LOC.ACHAT.MRO:'*':V.MNT.LOC.VENTE.MRO:'*':TEL.ID

                CASE CUR.ID EQ "MAD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.MAD:'*':V.MNT.ACHAT.MAD:'*':V.NBR.VENTE.MAD:'*':V.MNT.VENTE.MAD:'*':V.MNT.LOC.ACHAT.MAD:'*':V.MNT.LOC.VENTE.MAD:'*':TEL.ID

                CASE CUR.ID EQ "LYD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.LYD:'*':V.MNT.ACHAT.LYD:'*':V.NBR.VENTE.LYD:'*':V.MNT.VENTE.LYD:'*':V.MNT.LOC.ACHAT.LYD:'*':V.MNT.LOC.VENTE.LYD:'*':TEL.ID

                CASE CUR.ID EQ "KWD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.KWD:'*':V.MNT.ACHAT.KWD:'*':V.NBR.VENTE.KWD:'*':V.MNT.VENTE.KWD:'*':V.MNT.LOC.ACHAT.KWD:'*':V.MNT.LOC.VENTE.KWD:'*':TEL.ID

                CASE CUR.ID EQ "JPY"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.JPY:'*':V.MNT.ACHAT.JPY:'*':V.NBR.VENTE.JPY:'*':V.MNT.VENTE.JPY:'*':V.MNT.LOC.ACHAT.JPY:'*':V.MNT.LOC.VENTE.JPY:'*':TEL.ID

                CASE CUR.ID EQ "GBP"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.GBP:'*':V.MNT.ACHAT.GBP:'*':V.NBR.VENTE.GBP:'*':V.MNT.VENTE.GBP:'*':V.MNT.LOC.ACHAT.GBP:'*':V.MNT.LOC.VENTE.GBP:'*':TEL.ID

                CASE CUR.ID EQ "DZD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.DZD:'*':V.MNT.ACHAT.DZD:'*':V.NBR.VENTE.DZD:'*':V.MNT.VENTE.DZD:'*':V.MNT.LOC.ACHAT.DZD:'*':V.MNT.LOC.VENTE.DZD:'*':TEL.ID

                CASE CUR.ID EQ "DKK"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.DKK:'*':V.MNT.ACHAT.DKK:'*':V.NBR.VENTE.DKK:'*':V.MNT.VENTE.DKK:'*':V.MNT.LOC.ACHAT.DKK:'*':V.MNT.LOC.VENTE.DKK:'*':TEL.ID

                CASE CUR.ID EQ "CHF"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.CHF:'*':V.MNT.ACHAT.CHF:'*':V.NBR.VENTE.CHF:'*':V.MNT.VENTE.CHF:'*':V.MNT.LOC.ACHAT.CHF:'*':V.MNT.LOC.VENTE.CHF:'*':TEL.ID

                CASE CUR.ID EQ "CAD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.CAD:'*':V.MNT.ACHAT.CAD:'*':V.NBR.VENTE.CAD:'*':V.MNT.VENTE.CAD:'*':V.MNT.LOC.ACHAT.CAD:'*':V.MNT.LOC.VENTE.CAD:'*':TEL.ID

                CASE CUR.ID EQ "BHD"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.BHD:'*':V.MNT.ACHAT.BHD:'*':V.NBR.VENTE.BHD:'*':V.MNT.VENTE.BHD:'*':V.MNT.LOC.ACHAT.BHD:'*':V.MNT.LOC.VENTE.BHD:'*':TEL.ID

                CASE CUR.ID EQ "AED"
                    TABLEAU<-1> = CUR.ID:'*':V.NBR.ACHAT.AED:'*':V.MNT.ACHAT.AED:'*':V.NBR.VENTE.AED:'*':V.MNT.VENTE.AED:'*':V.MNT.LOC.ACHAT.AED:'*':V.MNT.LOC.VENTE.AED:'*':TEL.ID

                END CASE


            NEXT COUNTER



        END




        RETURN
    END
