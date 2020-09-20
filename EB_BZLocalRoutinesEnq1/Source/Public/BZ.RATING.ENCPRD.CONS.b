*Modification History:
*-------------------------------------------------------------
*ZIT-UPG-R13-R19  : GET.LOC.REF CHANGED TO MULTI.GET.LOC.REF
*                   FM CHANGED TO @FM   
*-------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.ENCPRD.CONS
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
    Y.VAL=O.DATA
    ID.CUSTOMER =FIELD(Y.VAL,'-',1)
    Y.PROD=FIELD(Y.VAL,'-',2)
    R.LMM.CUSTOMER=''
* $INSERT I_COMMON - Not Used anymore;=''
* $INSERT I_EQUATE - Not Used anymore;.CUSTOMER, F.LMM.CUSTOMER)
*ZIT-UPG-R13-R19/S	
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;.DEPOSITS'
YFIELD.NAME ='LOAN.TYPE'
LREF.POS = ''
CALL MULTI.GET.LOC.REF(YAPPLICATION.NAME, YFIELD.NAME, LREF.POS)
Y.ID.POS = LREF.POS<1,1>	
*    CALL GET.LOC.REF('LD.LOANS.AND.DEPOSITS','LOAN.TYPE',Y.ID.POS)
*ZIT-UPG-R13-R19/E

    FN.LD.LOANS.AND.DEPOSITS='F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS=''
    R.LD.LOANS.AND.DEPOSITS=''
    ERR.LD.LOANS.AND.DEPOSITS=''
    CALL OPF (FN.LD.LOANS.AND.DEPOSITS, F.LD.LOANS.AND.DEPOSITS)
    Y.CONTRACT.NO=''
    Y.AMEB.SystemTables.getVFunction()   TOT.ENG=0
    Y.PRODUIT=''
    RETURFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus---------------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusLL F.READ(FN.LMM.CUSTOMER,ID.CUSTOMER,R.LMM.CUSTOMER,F.LMM.CUSTOMER,ERR.LMM.CUSTOMER)
    Y.NB.CONTRACT.NO = DCOUNT(R.LMM.CUSTOMER,@FM)
    FOR I=1 TO Y.NB.CONTRACT.NO
        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,R.LMM.CUSTOMER<I>,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,ERR.LD.LOANS.AND.DEPOSITS)
        Y.AMOUNT=R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT>
        Y.PRODUIT=R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,Y.ID.POS>
            IF Y.PRODUIT EQ Y.PROD THEN
                Y.ENG=Y.AMOUNT
            END ELSE
                Y.ENG =0
            END
            TOT.ENG=TOT.ENG+Y.ENG
    NEXT I
    O.DATA=TOT.ENG
    RETURN
