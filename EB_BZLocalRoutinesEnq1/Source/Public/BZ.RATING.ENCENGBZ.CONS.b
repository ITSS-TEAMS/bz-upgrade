* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*                   Converted FM, VM to @FM, @VM Converted GET.LOC.REF to MULTI.GET.LOC.REF

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.ENCENGBZ.CONS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
*---------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS
RETURN
*------------------------------------------------
INIT:

    FN.LMM.CUSTOMER='F.LMM.CUSTOMER'
    F.LMM.CUSTOMER=''
    R.LMM.CUSTOMER=''
    ERR.LMM.CUSTOMER=''
    ID.CUSTOMER=O.DATA

* $INSERT I_COMMON - Not Used anymore;'
* $INSERT I_EQUATE - Not Used anymore;=''
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;R, F.LMM.CUSTOMER)
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ND.DEPOSITS','LOAN.TYPE',Y.ID.POS)
* ZIT-UPG-R13-R19/S
    Y.APP = "LD.LOANS.AND.DEPOSITS"
    Y.FIELD = "LOAN.TYPE"
    Y.POS = ''
    CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
    Y.ID.POS = Y.POS<1,1>
* ZIT-UPG-R13-R19/E
    
    FN.LD.LOANS.AND.DEPOSITS='F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS=''
    R.LD.LOANS.AND.DEPOSITS=''
    ERR.LD.LOANS.AND.DEPOSITS=''
    CALL OPF (FN.LD.LOANS.AND.DEPOSITS, F.LD.LOANS.AND.DEPOSITS)
    Y.PREB.SystemTables.getVFunction()="2":@VM:"5":EB.SystemTables.getVFunction()VM:"80":@VM:EB.SystemTables.getRNew()@FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    Y.CONTRACT.NO=''
    Y.AMOUNT=''
    TOFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusODUIT=''
RETURN
*----------------------------------------------------------
PROCESS:
    CALL F.READ(    FN.LMM.CUSTOMER,    ID.CUSTOMER,    R.LMM.CUSTOMER,    F.LMM.CUSTOMER,    ERR.LMM.CUSTOMER)
    Y.NB.CONTRACT.NO = DCOUNT(R.LMM.CUSTOMER,@FM)
    FOR I=1 TO Y.NB.CONTRACT.NO
        CALL F.READ(    FN.LD.LOANS.AND.DEPOSITS,    R.LMM.CUSTOMER<I>,  R.LD.LOANS.AND.DEPOSITS,  F.LD.LOANS.AND.DEPOSITS,   ERR.LD.LOANS.AND.DEPOSITS)
        Y.AMOUNT=R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT>
*    Y.PRODUIT=R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF><1,Y.ID.POS>
        Y.PRODUIT=R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,Y.ID.POS>
        Y.CATEGORY=R.LD.LOANS.AND.DEPOSITS<LD.CATEGORY>

        IF Y.CATEGORY GE 21050 AND Y.CATEGORY LE 21074 THEN
            IF Y.PRODUIT MATCHES Y.PRODUIT.CONS THEN

                Y.ENG=Y.AMOUNT
            END ELSE
                Y.ENG =0
            END
            TOT.ENG=TOT.ENG+Y.ENG
        END
    NEXT I
    O.DATA=TOT.ENG
RETURN
