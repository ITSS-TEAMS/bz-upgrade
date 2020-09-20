*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP    
*ZIT-UPG-R09-R13  : $INSERT to $INCLUDE
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT       
*                     FM converted to @FM      
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.POS.CHANGE.ACHAT(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT

*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.SECTOR
* $INSERT I_COMMON - Not Used anymore;_F.STMT.ENTRY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR  
    $INSERT I_F.STMT.ENTRY
*ZIT-UPG-R09-R13/E



    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCOUNT"
    F.AC=""

    LOCATE "BOOKING.DATFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus SETTING DATE.POS THEN
        FROM.DATE = D.RANGE.AND.VALUE<DATE.POS>
        TO.DATE=D.RANGE.AND.VALUE<DATE.POS>
    END

    LOCATE "CURRENCY" IN D.FIELDS<1> SETTING CURR.POS THEN
        Y.CURRENCY = D.RANGE.AND.VALUE<CURR.POS>
    END

    CATEGORY.POS='...TND1401600...'

    IF Y.CURRENCY EQ '' THEN
        CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END ELSE
        CATEGORY.POS=Y.CURRENCY:'TND1401600...'
        CONDITION.SEL =" WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END

    RETURN


OPENFILES:

    EB.EB.DataAccess.OpfaAccess.Opf(FN.STMT.ENTRY,F.STMT.ENTRY)
    CALL OPF(FN.AC,F.AC)


    RETURN


PROCESS:EB.DataAcceFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefCOUNT= "SELECT ":FN.AC:CONDITION.SEL
	SEL.ACCOUNT.IDS = '' ; SEL.ACCOUNT.COUNT = '' ; SEL.ACCOUNT.ERROR = ''  
    CALL EB.READLIST(SEL.ACCEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerIDS, '', SEL.ACCOUNT.COUNT, SEL.ACCOUNT.ERROR)

    FOR COMPEB.SystemTables.setE(1 TO SEL.ACCOUNT.COUNT)
        ID.LIST=""
        OPENING.BAL=EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer
        ACCT.ID=SEB.DataAccess.FWriteUNT.IDS<COMPTEUR.AC>

        MONTANT.TOTAL.DVS=0
        MONTANT.TOTAL.LCY=0
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP    
*ZIT-UPG-R09-R13  : $INSERT to $INCLUDE
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT       
*                     FM converted to @FM      
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.POS.CHANGE.ACHAT(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT

*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.SECTOR
*INCLUDE GLOBUS.BP I_F.STMT.ENTRY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR  
    $INSERT I_F.STMT.ENTRY
*ZIT-UPG-R09-R13/E



    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    LOCATE "BOOKING.DATE" IN D.FIELDS<1> SETTING DATE.POS THEN
        FROM.DATE = D.RANGE.AND.VALUE<DATE.POS>
        TO.DATE=D.RANGE.AND.VALUE<DATE.POS>
    END

    LOCATE "CURRENCY" IN D.FIELDS<1> SETTING CURR.POS THEN
        Y.CURRENCY = D.RANGE.AND.VALUE<CURR.POS>
    END

    CATEGORY.POS='...TND1401600...'

    IF Y.CURRENCY EQ '' THEN
        CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END ELSE
        CATEGORY.POS=Y.CURRENCY:'TND1401600...'
        CONDITION.SEL =" WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END

    RETURN


OPENFILES:

    CALL OPF(FN.STMT.ENTRY,F.STMT.ENTRY)
    CALL OPF(FN.AC,F.AC)


    RETURN


PROCESS:

    SEL.ACCOUNT= "SELECT ":FN.AC:CONDITION.SEL
	SEL.ACCOUNT.IDS = '' ; SEL.ACCOUNT.COUNT = '' ; SEL.ACCOUNT.ERROR = ''  
    CALL EB.READLIST(SEL.ACCOUNT, SEL.ACCOUNT.IDS, '', SEL.ACCOUNT.COUNT, SEL.ACCOUNT.ERROR)

    FOR COMPTEUR.AC=1 TO SEL.ACCOUNT.COUNT
        ID.LIST=""
        OPENING.BAL=""
        ER=""
        ACCT.ID=SEL.ACCOUNT.IDS<COMPTEUR.AC>

        MONTANT.TOTAL.DVS=0
        MONTANT.TOTAL.LCY=0
        SOLFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef0

      EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>-40</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP    
*ZIT-UPG-R09-R13  : $INSERT to $INCLUDE
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT       
*                     FM converted to @FM      
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.POS.CHANGE.ACHAT(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

**AUTHOR :BOUNOUARA FEHMI
**DATE 10/02/2014
**DESCRIPTION: POSITION DE CHANGE ACHAT

*ZIT-UPG-R09-R13/S
*INCLUDE GLOBUS.BP I_COMMON
*INCLUDE GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*INCLUDE GLOBUS.BP I_F.ACCOUNT
*INCLUDE GLOBUS.BP I_F.SECTOR
*INCLUDE GLOBUS.BP I_F.STMT.ENTRY

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_F.SECTOR  
    $INSERT I_F.STMT.ENTRY
*ZIT-UPG-R09-R13/E



    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS

INIT:

    FN.STMT.ENTRY = "F.STMT.ENTRY"
    F.STMT.ENTRY=""

    FN.AC="F.ACCOUNT"
    F.AC=""

    LOCATE "BOOKING.DATE" IN D.FIELDS<1> SETTING DATE.POS THEN
        FROM.DATE = D.RANGE.AND.VALUE<DATE.POS>
        TO.DATE=D.RANGE.AND.VALUE<DATE.POS>
    END

    LOCATE "CURRENCY" IN D.FIELDS<1> SETTING CURR.POS THEN
        Y.CURRENCY = D.RANGE.AND.VALUE<CURR.POS>
    END

    CATEGORY.POS='...TND1401600...'

    IF Y.CURRENCY EQ '' THEN
        CONDITION.SEL = " WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END ELSE
        CATEGORY.POS=Y.CURRENCY:'TND1401600...'
        CONDITION.SEL =" WITH @ID LIKE '":CATEGORY.POS:"' AND CUSTOMER EQ '' AND CURRENCY NE TNC"
    END

    RETURN


OPENFILES:

    CALL OPF(FN.STMT.ENTRY,F.STMT.ENTRY)
    CALL OPF(FN.AC,F.AC)


    RETURN


PROCESS:

    SEL.ACCOUNT= "SELECT ":FN.AC:CONDITION.SEL
	SEL.ACCOUNT.IDS = '' ; SEL.ACCOUNT.COUNT = '' ; SEL.ACCOUNT.ERROR = ''  
    CALL EB.READLIST(SEL.ACCOUNT, SEL.ACCOUNT.IDS, '', SEL.ACCOUNT.COUNT, SEL.ACCOUNT.ERROR)

    FOR COMPTEUR.AC=1 TO SEL.ACCOUNT.COUNT
        ID.LIST=""
        OPENING.BAL=""
        ER=""
        ACCT.ID=SEL.ACCOUNT.IDS<COMPTEUR.AC>

        MONTANT.TOTAL.DVS=0
        MONTANT.TOTAL.LCY=0
        SOLDE.FIN.PERIODE=0

        CALL EB.ACCT.ENTRY.LIST(ACCT.ID,FROM.DATE,TO.DATE,ID.LIST,OPENING.BAL,ER)
*******
        ACCT.ID=ACCT.ID<1>
*******
        IF ID.LIST THEN
            NBRE.TXN.AC=DCOUNT(ID.LIST,@FM)
            GOSUB TRAIT.STMT

            IF MONTANT.TOTAL.DVS NE 0 THEN
                SOLDE.FIN.PERIODE=OPENING.BAL+MONTANT.TOTAL.DVS  
            END

        END
    NEXT COMPTEUR.AC

    RETURN


TRAIT.STMT:

    FOR COMPTEUR.TXN=1 TO NBRE.TXN.AC
        ID.TRANSA=ID.LIST<COMPTEUR.TXN>
		STMT.REC = '' ; STMT.ER = ''  
        CALL F.READ(FN.STMT.ENTRY,ID.TRANSA,STMT.REC,F.STMT.ENTRY,STMT.ER)

        RECORD.STATUS=STMT.REC<AC.STE.RECORD.STATUS>
        IF RECORD.STATUS EQ 'REVE' THEN
            CONTINUE
        END

        AMOUNT.LCY=STMT.REC<AC.STE.AMOUNT.LCY>

        IF AMOUNT.LCY LT 0 THEN
            OPENNING.BALANCE=OPENING.BAL
            TRANSACTION.CODE=STMT.REC<AC.STE.TRANSACTION.CODE>
            THEIR.REFERENCE=STMT.REC<AC.STE.THEIR.REFERENCE>
            ACCOUNT.OFFICER=STMT.REC<AC.STE.ACCOUNT.OFFICER>
            BOOKING.DATE=STMT.REC<AC.STE.BOOKING.DATE>
            CURRENCY=STMT.REC<AC.STE.CURRENCY>
            AMOUNT.FCY=STMT.REC<AC.STE.AMOUNT.FCY>
            EXCHANGE.RATE=STMT.REC<AC.STE.EXCHANGE.RATE>

            DEPARTMENT.CODE=STMT.REC<AC.STE.DEPARTMENT.CODE>

            TRANSACTION.REF=STMT.REC<AC.STE.TRANS.REFERENCE>
            TRANSACTION.TIME=STMT.REC<AC.STE.DATE.TIME>

            TRANSACTION.TIME=TRANSACTION.TIME[7,8]

            IF DEPARTMENT.CODE EQ "6029" THEN
                CONTINUE
            END ELSE
                TABLEAU<-1>=ACCT.ID:'*':AMOUNT.LCY:'*':TRANSACTION.CODE:'*':THEIR.REFERENCE:'*':ACCOUNT.OFFICER:'*':BOOKING.DATE:'*':CURRENCY:'*':AMOUNT.FCY:'*':EXCHANGE.RATE:'*':DEPARTMENT.CODE:'*':OPENNING.BALANCE:'*':TRANSACTION.REF:'*':TRANSACTION.TIME
**
                MONTANT.TOTAL.DVS=MONTANT.TOTAL.DVS+AMOUNT.FCY
                MONTANT.TOTAL.LCY=MONTANT.TOTAL.LCY+AMOUNT.LCY
**
            END
        END ELSE
            CONTINUE    
        END

    NEXT COMPTEUR.TXN     

    RETURN

END
