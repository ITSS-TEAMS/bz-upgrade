 *-----------------------------------------------------------------------------
* <Rating>-1</Rating>
**************************************************************************
* Modification History:
* "ZIT-UPG-R13-R19"
* Converted CALL GET.LOC.REF to CALL MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.IS.ECH.IJARA
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
    * $INSERT I_COMMON - Not Used anymore;AYMENT.DUE
    * $INSERT I_EQUATE - Not Used anymore;.LIST
    $INSERT I_F.CURRENCY
    $INSERT I_F.CUSTOMER


***************
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;TAX.TAUX,Y.TAX.CATEGORY)
    Y.TAX.TAUX = Y.TAX.TAUX/100
    CALL BZ.GET.AMOUNT.COM.ECHEANCE(FE.COM,FE.TVA)
***************

    MONTANT.TIMBRE = '0.4'

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
    K.LD.LOANS.AND.DEPOSITS = O.DATA
    R.LDEB.SystemTables.getVFunction().DEPOSITS = 'EB.SystemTables.getVFunction()D.LOANS.AND.DEPOSIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ''
    R.CUSTOMER = ''
    E.CUSTOMER = ''

    CALL OPF(FN.CUSTOMER,F.CUSTOMER)

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)
    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS$NAU'
        F.LD.LOANS.AND.DEPOSITS = ''
        K.LD.LOANS.AND.DEPOSITS = O.DATA
        R.LD.LOANS.AND.DEPOSITS = ''
        E.LD.LOANS.AND.DEPOSITS = ''

        CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    END

    COMM.ETUDE = R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT,1>
    CLIENEB.DataAccess.Opf R.LD.LOANS.AND.DEPOSITS<LD.CUSTOMER.ID>
    EB.DataAccess.OpfEAD(FN.CUSTOMER,CLIENT,R.CUSTOMER,F.CUSTOMER,E.CUSTOMER)
    NOM.CLIENT = R.CUSTOMER<EB.CUS.SHORT.NAME>
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","SEC.DEP.AMT",N.LD.ACOMPTE)
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","TIEG",N.TIEG)
* ZIT-UPG-R13-R19/S
YPOS = ''
YAPPLICATION FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef.DEPOSITS'
YFIELDNAMEB.DataAccess.FReadEC.DEP.AMT':@VM:'TIEG'
CALL MULTI.GET.LOC.REF (YAPPLICATION, YFIELDNAME, YPOS)
N.LD.ACOMPTE = YPOS<1,1>
N.TIEG = YPOS<1,2>
* ZIT-UPG-R13-R19/E
    ACOEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerAND.DEPOSITS<LD.LOCAL.REF,N.LD.ACOMPTE>
    MONATNT.EB.SystemTables.setE(R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT> + ACOMPTE)
    TIEG =R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,N.TIEG>


    SUP.TVA = ''EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyeriteLL BZ.CHECK.SUSP.TVA(CLIENT,SUP.TVA)
    IF SUP.TVA EQ 'NON' THEN
        TVA.ACOMPTE = ACOMPTE * Y.TAX.TAUX
    ENDEB.SystemTables.setAf() *-----------------------------------------------------------------------------
* <Rating>-1</Rating>
**************************************************************************
* Modification History:
* "ZIT-UPG-R13-R19"
* Converted CALL GET.LOC.REF to CALL MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.IS.ECH.IJARA
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


***************
    CALL BZ.GET.TVA.COLLECTE(Y.TAX.TAUX,Y.TAX.CATEGORY)
    Y.TAX.TAUX = Y.TAX.TAUX/100
    CALL BZ.GET.AMOUNT.COM.ECHEANCE(FE.COM,FE.TVA)
***************

    MONTANT.TIMBRE = '0.4'

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
    K.LD.LOANS.AND.DEPOSITS = O.DATA
    R.LD.LOANS.AND.DEPOSITS = ''
    E.LD.LOANS.AND.DEPOSITS = ''

    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    K.CUSTOMER = ''
    R.CUSTOMER = ''
    E.CUSTOMER = ''

    CALL OPF(FN.CUSTOMER,F.CUSTOMER)

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)
    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS$NAU'
        F.LD.LOANS.AND.DEPOSITS = ''
        K.LD.LOANS.AND.DEPOSITS = O.DATA
        R.LD.LOANS.AND.DEPOSITS = ''
        E.LD.LOANS.AND.DEPOSITS = ''

        CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    END

    COMM.ETUDE = R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT,1>
    CLIENT = R.LD.LOANS.AND.DEPOSITS<LD.CUSTOMER.ID>
    CALL F.READ(FN.CUSTOMER,CLIENT,R.CUSTOMER,F.CUSTOMER,E.CUSTOMER)
    NOM.CLIENT = R.CUSTOMER<EB.CUS.SHORT.NAME>
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","SEC.DEP.AMT",N.LD.ACOMPTE)
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","TIEG",N.TIEG)
* ZIT-UPG-R13-R19/S
YPOS = ''
YAPPLICATION = 'LD.LOANS.AND.DEPOSITS'
YFIELDNAME = 'SEC.DEP.AMT':@VM:'TIEG'
CALL MULTI.GET.LOC.REF (YAPPLICATION, YFIELDNAME, YPOS)
N.LD.ACOMPTE = YPOS<1,1>
N.TIEG = YPOS<1,2>
* ZIT-UPG-R13-R19/E
    ACOMPTE = R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,N.LD.ACOMPTE>
    MONATNT.FIN = R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT> + ACOMPTE
    TIEG =R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,N.TIEG>


    SUP.TVA = ''
    CALL BZ.CHECK.SUSP.TVA(CLIENT,SUP.TVA)
    IF SUP.TVA EQ 'NON' THEN
        TVA.ACOMPTE = ACOMPTE * Y.TAX.TAUX
    END

FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTables.setE() *-----------------------------------------------------------------------------
* <Rating>-1</Rating>
**************************************************************************
* Modification History:
* "ZIT-UPG-R13-R19"
* Converted CALL GET.LOC.REF to CALL MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.IS.ECH.IJARA
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


***************
    CALL BZ.GET.TVA.COLLECTE(Y.TAX.TAUX,Y.TAX.CATEGORY)
    Y.TAX.TAUX = Y.TAX.TAUX/100
    CALL BZ.GET.AMOUNT.COM.ECHEANCE(FE.COM,FE.TVA)
***************

    MONTANT.TIMBRE = '0.4'

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
    K.LD.LOANS.AND.DEPOSITS = O.DATA
    R.LD.LOANS.AND.DEPOSITS = ''
    E.LD.LOANS.AND.DEPOSITS = ''

    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    K.CUSTOMER = ''
    R.CUSTOMER = ''
    E.CUSTOMER = ''

    CALL OPF(FN.CUSTOMER,F.CUSTOMER)

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)
    IF R.LD.LOANS.AND.DEPOSITS EQ '' THEN

        FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS$NAU'
        F.LD.LOANS.AND.DEPOSITS = ''
        K.LD.LOANS.AND.DEPOSITS = O.DATA
        R.LD.LOANS.AND.DEPOSITS = ''
        E.LD.LOANS.AND.DEPOSITS = ''

        CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    END

    COMM.ETUDE = R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT,1>
    CLIENT = R.LD.LOANS.AND.DEPOSITS<LD.CUSTOMER.ID>
    CALL F.READ(FN.CUSTOMER,CLIENT,R.CUSTOMER,F.CUSTOMER,E.CUSTOMER)
    NOM.CLIENT = R.CUSTOMER<EB.CUS.SHORT.NAME>
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","SEC.DEP.AMT",N.LD.ACOMPTE)
*    CALL GET.LOC.REF("LD.LOANS.AND.DEPOSITS","TIEG",N.TIEG)
* ZIT-UPG-R13-R19/S
YPOS = ''
YAPPLICATION = 'LD.LOANS.AND.DEPOSITS'
YFIELDNAME = 'SEC.DEP.AMT':@VM:'TIEG'
CALL MULTI.GET.LOC.REF (YAPPLICATION, YFIELDNAME, YPOS)
N.LD.ACOMPTE = YPOS<1,1>
N.TIEG = YPOS<1,2>
* ZIT-UPG-R13-R19/E
    ACOMPTE = R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,N.LD.ACOMPTE>
    MONATNT.FIN = R.LD.LOANS.AND.DEPOSITS<LD.AMOUNT> + ACOMPTE
    TIEG =R.LD.LOANS.AND.DEPOSITS<LD.LOCAL.REF,N.TIEG>


    SUP.TVA = ''
    CALL BZ.CHECK.SUSP.TVA(CLIENT,SUP.TVA)
    IF SUP.TVA EQ 'NON' THEN
        TVA.ACOMPTE = ACOMPTE * Y.TAX.TAUX
    END

    CALL E.LD.SCHED.LIST





    NB3 = DCOUNT(R.RECORD,@FM)


    RESULT1 = R.RECORD<18>

    NB = DCOUNT(RESULT1,@VM)

    R.RECORD<17,1> = R.RECORD<16,2> + R.RECORD<17,2> + ACOMPTE
    R.RECORD<28,1> = R.RECORD<28,1> + TVA.ACOMPTE
    R.RECORD<18,1> = R.RECORD<28,1> + R.RECORD<16,2> + R.RECORD<17,2> + ACOMPTE
    R.RECORD<38,1> = FE.COM + COMM.ETUDE


**********************
*MODIF 12/06/2012
**********************
* R.RECORD<39,1> = '0.3'
******************
    R.RECORD<39,1> = MONTANT.TIMBRE
**************************
    R.RECORD<40,1> = R.RECORD<28,1> - R.RECORD<38,1>  -  R.RECORD<39,1>
    R.RECORD<41> =  MONATNT.FIN
    R.RECORD<42> =  TIEG
    R.RECORD<43> = NOM.CLIENT

    FOR I = 2 TO NB

        R.RECORD<38,I> = FE.COM


**********************
*MODIF 12/06/2012
**********************
*R.RECORD<39,I> = '0.3'
*****************************

        R.RECORD<39,I> = MONTANT.TIMBRE

************************************

        R.RECORD<40,I> = R.RECORD<28,I> - R.RECORD<38,I>  -  R.RECORD<39,I>

    NEXT I


    RETURN
