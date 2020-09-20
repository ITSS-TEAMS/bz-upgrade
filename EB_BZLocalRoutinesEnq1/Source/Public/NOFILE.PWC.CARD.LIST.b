*-----------------------------------------------------------------------------
* <Rating>-31</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.PWC.CARD.LIST(TABLEAU)
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
    $INSERT I_F.USER
    $INSERT I_EB.LOG.MSG

    GOSUB INITIALISATION
    GOSUB PROCESS

RETURN

INITIALISATION:

    THIS.PACKAGE.CLASS = "com.bz.PwcUtilities"
    THIS.METHOD = "getClientCards"

* $INSERT I_COMMON - Not Used anymore;ENT" IN D.FIELDS<1> SETTING POSCLIENT THEN
* $INSERT I_EQUATE - Not Used anymore;T = D.RANGE.AND.VALUE<POSCLIENT>
    END

    CALLJ.ARGUMENTS =  Y.CODE.CLIENT

RETURN

PROCESS:

    CALLJ THIS.PACKAGE.CLASS, THIS.METHOD , CALLJ.ARGUMENTS SETTING CALLJ.RESPONSE ON ERROR

    END

    Y.NBRE.CARTE = COUNT(CALLJ.RESPONSE,"{")

    FOR Y.COMPTEUR = 1 TO Y.NBRE.CARTE
        EB.SystemTables.getVFunction()COMPTEUR + 1
        Y.CARD.TMP = FIELD(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus",Y.POS)
*  CONVERT " " TO "" IN Y.CARD.TMP
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusumber = FIELD(FIELD(Y.CARD.TMP,",",1),"=",2)
        Y.wording = FIELD(FIELD(Y.CARD.TMP,",",2),"=",2)
        Y.embossedName = FIELD(FIELD(Y.CARD.TMP,",",4),"=",2)
        Y.branchName = FIELD(FIELD(Y.CARD.TMP,",",5),"=",2)
        Y.deliveryCardDate = FIELD(FIELD(Y.CARD.TMP,",",6),"=",2)
        Y.activationDate = FIELD(FIELD(Y.CARD.TMP,",",8),"=",2)
        Y.account = FIELD(FIELD(Y.CARD.TMP,",",11),"=",2)
        Y.currency = FIELD(FIELD(Y.CARD.TMP,",",12),"=",2)
        Y.expiryDate = FIELD(FIELD(Y.CARD.TMP,",",13),"=",2)
        Y.nPerOnusAmntLmt1 = FIELD(FIELD(Y.CARD.TMP,",",15),"=",2)
        Y.onPerOnusAmntLmt2 = FIELD(FIELD(Y.CARD.TMP,",",21),"=",2)
        Y.plafondRetrait = FIELD(FIELD(Y.CARD.TMP,",",28),"=",2)
        Y.plafondAchat = FIELD(FIELD(Y.CARD.TMP,",",29),"=",2)
        Y.STATUS =  FIELD(FIELD(Y.CARD.TMP,",",10),"=",2)

        IF Y.STATUS EQ "N" THEN
            TABLEAU<-1>=Y.cardNumber:"*":Y.wording:"*":Y.embossedName:"*":Y.branchName:"*":Y.deliveryCardDate:"*":Y.activationDate:"*":Y.account:"*":Y.currency:"*":Y.expiryDate:"*":Y.nPerOnusAmntLmt1:"*":Y.onPerOnusAmntLmt2:"*":Y.plafondRetrait:"*":Y.plafondAchat:"*":Y.STATUS
        END

    NEXT Y.COMPTEUR

RETURN

END
