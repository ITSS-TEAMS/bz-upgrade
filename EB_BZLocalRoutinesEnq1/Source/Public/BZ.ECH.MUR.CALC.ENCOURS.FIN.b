*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM;INITIALISED F.READ VARIABLES.
						
********************************************************

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
    * $INSERT I_COMMON - Not Used anymore;.COMMON
    * $INSERT I_EQUATE - Not Used anymore;AYMENT.DUE
    $INSERT I_LD.SCH.LIST
    $INSERT I_F.CURRENCY
    $INSERT I_F.CUSTOMER
    $INSERT I_F.ACCOUNT

    FN.ACCOUNT = 'F.ACCOUNT'
    F.ACCOUNT = ''
	R.ACCOUNT=''
	ERR=''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
	R.LD.LOANS.AND.DEPOSITS=''
	E.LD.LOANS.AND.DEPOSITS=''
	
    FN.LEB.SystemTables.getVFunction()D.DEPOSITS.NAEB.SystemTables.getVFunction()LOANS.AND.DEEB.SystemTables.getRNew()SFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>   
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

*    CONVERT "-" TO "" IN R.RECORD<23>
	CHANGE "-" TO "" IN R.RECORD<23>
    NB = DCOUNT(R.RECORD<23>,@VM)
    SOMME.PROFIT = SUM(R.RECORD<16>)

    R.RECORD<23,1> = R.RECORD<23,1> + SOMME.PROFIT

    FOR I = 2 TO NB-1

        R.RECORD<23,I> = R.RECORD<23,I-1> - R.RECORD<17,I> - R.RECORD<16,I>
    NEXT I

*******EB.DataAccess.OpfB.DataAccess.Opf********


    CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

    IF R.LD.LOANS.EB.SystemTables.getRNew()EFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEN

        EB.DataAccess.FReadREAD(FN.LD.LOANS.AND.DEPOSITS.NAU,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS.NAU,E.LD.LOANS.AND.DEPOSITS)

    END

    Y.DEVISE.CONTRAT = R.LD.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer<LD.CURRENCY>
    Y.COMPTE= R.LD.LOANS.AND.DEPOSITS<LD.PRIN.LIQ.ACCT>

    CALL FEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM;INITIALISED F.READ VARIABLES.
						
********************************************************

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
	R.ACCOUNT=''
	ERR=''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
	R.LD.LOANS.AND.DEPOSITS=''
	E.LD.LOANS.AND.DEPOSITS=''
	
    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>   
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

*    CONVERT "-" TO "" IN R.RECORD<23>
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

    IF R.ACCOUNT NEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer Y.ACCT.CCEB.DataAccess.FWriteE = R.ACCOUNT<AC.CURRENCY>
    END


    IF YEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM;INITIALISED F.READ VARIABLES.
						
********************************************************

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
	R.ACCOUNT=''
	ERR=''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
	R.LD.LOANS.AND.DEPOSITS=''
	E.LD.LOANS.AND.DEPOSITS=''
	
    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>   
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

*    CONVERT "-" TO "" IN R.RECORD<23>
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


    IF Y.DEFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef Y.ACCT.CCY.COMPTE THEN

***chaEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ECH.MUR.CALC.ENCOURS.FIN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM;INITIALISED F.READ VARIABLES.
						
********************************************************

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
	R.ACCOUNT=''
	ERR=''

    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
	R.LD.LOANS.AND.DEPOSITS=''
	E.LD.LOANS.AND.DEPOSITS=''
	
    FN.LD.LOANS.AND.DEPOSITS.NAU = 'F.LD.LOANS.AND.DEPOSITS$NAU'
    F.LD.LOANS.AND.DEPOSITS.NAU = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)
    CALL OPF(FN.LD.LOANS.AND.DEPOSITS.NAU,F.LD.LOANS.AND.DEPOSITS.NAU)
    CALL OPF(FN.ACCOUNT,F.ACCOUNT)

    Y.COM.ETUDE = ""
    CALL E.LD.SCHED.LIST

**********

    REF.LD = R.RECORD<35,2>   
    REF.LD = FIELD(REF.LD," ",3)

*********
    K.LD.LOANS.AND.DEPOSITS = REF.LD

*    CONVERT "-" TO "" IN R.RECORD<23>
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

        COMMISSION.CONV = R.RECORD<18>   
        NBRE.COMMISSION = DCOUNT(COMMISSION.CONV,@VM)

        Y.COM.ETUDE = R.LD.LOANS.AND.DEPOSITS<LD.CHRG.AMOUNT>
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
