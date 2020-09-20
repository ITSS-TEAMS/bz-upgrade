*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN.CP
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History : $INCLUDE TO $INSERT, CONVERT to CHANGE, VM TO @VM, COMMENTED DEBUG
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULE.DATES
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PERIODIC.INTEREST
    $INSERT I_F.BASIC.RATE.TEXT
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.PD.PAYMENT.DUE
    * $INSERT I_COMMON - Not Used anymore;.LIST
    * $INSERT I_EQUATE - Not Used anymore;ENCY
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''

    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)
*    DEBEB.SystemTables.getVFunction()COM.ETUDE = ""
    CALL E.LD.SCHED.LISTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    REF.LD = R.RECORD<35,2>
    REF.LD = FIELFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

    CHANGE "-" TO "" IN R.RECORD<23>

    NB = DCOUNT(R.RECORD<23>,@VM)
    SOMME.PROFIT = SUM(R.RECORD<16>)

    R.RECORD<23,1> = R.RECORD<23,1> + SOMME.PROFIT

    FOR I = 2 TO NB-1

        R.RECORD<23,I> = R.RECORD<23,I-1> - R.RECORD<17,I> - R.RECORD<16,I>

    NEXT I

********************


    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    IF EB.DataAccess.OpfB.DataAccess.OpfLOANS.AND.DEPOSITS EQ '' THEN

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS.NAU,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS.NAU,E.LD.LOANS.AND.DEPOSITS)

    END

    Y.DEVISE.CONTRAT =FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.DEPOSITS<LD.CURRENCY>
    Y.COMEB.DataAccess.FRead.LD.LOANS.AND.DEPOSITS<LD.PRIN.LIQ.ACCT>

    CALL F.READ(FN.ACCOUNT,Y.COMPTE,R.ACCOUNT,F.ACCOUNT,ERR)

    IF R.ACCOUNT NE '' THENEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerY.COMPTE = R.ACCOUNT<AC.CURRENCY>
    END

EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN.CP
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History : $INCLUDE TO $INSERT, CONVERT to CHANGE, VM TO @VM, COMMENTED DEBUG
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULE.DATES
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PERIODIC.INTEREST
    $INSERT I_F.BASIC.RATE.TEXT
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_LD.SCH.LIST
    $INSERT I_F.CURRENCY
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''

    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)
*    DEBUG
    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

    CHANGE "-" TO "" IN R.RECORD<23>

    NB = DCOUNT(R.RECORD<23>,@VM)
    SOMME.PROFIT = SUM(R.RECORD<16>)

    R.RECORD<23,1> = R.RECORD<23,1> + SOMME.PROFIT

    FOR I = 2 TO NB-1

        R.RECORD<23,I> = R.RECORD<23,I-1> - R.RECORD<17,I> - R.RECORD<16,I>

    NEXT I

********************


    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS.NAU,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS.NAU,E.LD.LOANS.AND.DEPOSITS)

    END

    Y.DEVISE.CONTRAT = R.LD.LOANS.AND.DEPOSITS<LD.CURRENCY>
    Y.COMPTE= R.LD.LOANS.AND.DEPOSITS<LD.PRIN.LIQ.ACCT>

    CALL F.READ(FN.ACCOUNT,Y.COMPTE,R.ACCOUNT,F.ACCOUNT,ERR)

    IF R.ACCOUNT NE '' THEN
        Y.ACCT.CCY.COMPTE = R.ACCOUNT<AC.CURRENCY>
    END


    IF Y.DEVISE.COEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerY.COMPTE THEN

***chag

    EB.DataAccess.FWriteMISSION.CONV = R.RECORD<28>
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN.CP
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History : $INCLUDE TO $INSERT, CONVERT to CHANGE, VM TO @VM, COMMENTED DEBUG
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.ENQUIRY
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LMM.SCHEDULE.DATES
    $INSERT I_F.DATES
    $INSERT I_F.COMPANY
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.LMM.SCHEDULES
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.PERIODIC.INTEREST
    $INSERT I_F.BASIC.RATE.TEXT
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_LD.ENQ.COMMON
    $INSERT I_F.PD.PAYMENT.DUE
    $INSERT I_LD.SCH.LIST
    $INSERT I_F.CURRENCY
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''

    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)
*    DEBUG
    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

    CHANGE "-" TO "" IN R.RECORD<23>

    NB = DCOUNT(R.RECORD<23>,@VM)
    SOMME.PROFIT = SUM(R.RECORD<16>)

    R.RECORD<23,1> = R.RECORD<23,1> + SOMME.PROFIT

    FOR I = 2 TO NB-1

        R.RECORD<23,I> = R.RECORD<23,I-1> - R.RECORD<17,I> - R.RECORD<16,I>

    NEXT I

********************


    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS.NAU,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS.NAU,E.LD.LOANS.AND.DEPOSITS)

    END

    Y.DEVISE.CONTRAT = R.LD.LOANS.AND.DEPOSITS<LD.CURRENCY>
    Y.COMPTE= R.LD.LOANS.AND.DEPOSITS<LD.PRIN.LIQ.ACCT>

    CALL F.READ(FN.ACCOUNT,Y.COMPTE,R.ACCOUNT,F.ACCOUNT,ERR)

    IF R.ACCOUNT NE '' THEN
        Y.ACCT.CCY.COMPTE = R.ACCOUNT<AC.CURRENCY>
    END


    IF Y.DEVISE.CONTRAT NE Y.ACCT.CCY.COMPTE THEN

***chag

        COMMISSION.CONV = R.RECORD<28>
        NBRFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefDCOUNT(COMMISSION.CONV,@VM)

      EB.SystemTables.setE(R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT>)
        MONTANT.COMM = 0
        FOR COMPT =1 TO NBRE.COMMISSION

            IF Y.COM.ETUDE NE "" THEN

                IF COMPT EQ 1 THEN
*    R.RECORD<28,COMPT> = Y.COM.ETUDE
                END

            END

***debut
            R.RECORD<18,COMPT> =  R.RECORD<16,COMPT> + R.RECORD<17,COMPT> + R.RECORD<28,COMPT>

        NEXT COMPT

    END

    RETURN
END
