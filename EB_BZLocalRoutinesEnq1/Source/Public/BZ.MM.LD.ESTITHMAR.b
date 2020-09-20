*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Commented CRT as it is not browser compatible
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MM.LD.ESTITHMAR(TABLEAU)
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
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.CATEGORY
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    CALL OPF(FN.LD,F.LD)

    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    CALL OPF(FN.MM,F.MM)


    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    CALL OPF(FN.CUSTOMER,F.CUSTOMER)
	EB.SystemTables.getVFunction()=''

    FN.CATEG = 'F.CATEGORY'
    FFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusV$FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FN.CATEG,tmp.V$FUNCTIONEB.SystemTables.setVFunction(tmp.V$FUNCTION)
	R.CATEG=''

   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusECTOR'
    F.SECTOR = ''
    CALL OPF(FN.SECTOR,F.SECTOR)
	R.SECTOR=''

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
    CALL OPF (FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)

    CUSTOMER.ID=""
    REF.ID=""
    MIS.ACCT.OFFICER=""
	
	YERR=''

    RETURN

PREPARE.CONDITION:


    LOCATE "CUSTOMER.ID" IN D.FIELDS<1> SETTING CUSTOMER.ID.POS THEN
        CUSTOMER.ID = D.RANGE.AND.VALUE<CUSTOMER.ID.POS>
    END
EB.DataAccess.Opf   LOCEB.DataAccess.Opf "REF.ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        REF.ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    LOCATE "MIS.ACEB.SystemTables.getRNew()FFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefDS<1> SETTING MIS.ACCT.OFFICER.POS THEN
        MIS.ACCT.OFFICER = D.RANGE.AND.VALUE<MIS.ACCT.OFFICER.POS>
    END
EB.DataAccess.FReadCONDITION=""

    IF CUSTOMER.ID THEN
   EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerCUSTOMER.ID EQ ":CUSTOMER.ID
    END

EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Commented CRT as it is not browser compatible
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MM.LD.ESTITHMAR(TABLEAU)
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
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.CATEGORY
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    CALL OPF(FN.LD,F.LD)

    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    CALL OPF(FN.MM,F.MM)


    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    CALL OPF(FN.CUSTOMER,F.CUSTOMER)
	R.CUSTOMER=''

    FN.CATEG = 'F.CATEGORY'
    F.CATEG = ''
    CALL OPF(FN.CATEG,F.CATEG)
	R.CATEG=''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''
    CALL OPF(FN.SECTOR,F.SECTOR)
	R.SECTOR=''

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
    CALL OPF (FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)

    CUSTOMER.ID=""
    REF.ID=""
    MIS.ACCT.OFFICER=""
	
	YERR=''

    RETURN

PREPARE.CONDITION:


    LOCATE "CUSTOMER.ID" IN D.FIELDS<1> SETTING CUSTOMER.ID.POS THEN
        CUSTOMER.ID = D.RANGE.AND.VALUE<CUSTOMER.ID.POS>
    END

    LOCATE "REF.ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        REF.ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    LOCATE "MIS.ACCT.OFFICER" IN D.FIELDS<1> SETTING MIS.ACCT.OFFICER.POS THEN
        MIS.ACCT.OFFICER = D.RANGE.AND.VALUE<MIS.ACCT.OFFICER.POS>
    END

    CONDITION=""

    IF CUSTOMER.ID THEN
        CONDITION:=" CUSTOMER.ID EQ ":CUSTOMER.ID
    END


    IF REF.ID THENEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerNEB.DataAccess.FWrite.ID EQ ":REF.ID
    END

    IF MIS.ACCT.OFFICER THEN
        EB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Commented CRT as it is not browser compatible
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MM.LD.ESTITHMAR(TABLEAU)
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
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.CATEGORY
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    CALL OPF(FN.LD,F.LD)

    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    CALL OPF(FN.MM,F.MM)


    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    CALL OPF(FN.CUSTOMER,F.CUSTOMER)
	R.CUSTOMER=''

    FN.CATEG = 'F.CATEGORY'
    F.CATEG = ''
    CALL OPF(FN.CATEG,F.CATEG)
	R.CATEG=''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''
    CALL OPF(FN.SECTOR,F.SECTOR)
	R.SECTOR=''

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
    CALL OPF (FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)

    CUSTOMER.ID=""
    REF.ID=""
    MIS.ACCT.OFFICER=""
	
	YERR=''

    RETURN

PREPARE.CONDITION:


    LOCATE "CUSTOMER.ID" IN D.FIELDS<1> SETTING CUSTOMER.ID.POS THEN
        CUSTOMER.ID = D.RANGE.AND.VALUE<CUSTOMER.ID.POS>
    END

    LOCATE "REF.ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        REF.ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    LOCATE "MIS.ACCT.OFFICER" IN D.FIELDS<1> SETTING MIS.ACCT.OFFICER.POS THEN
        MIS.ACCT.OFFICER = D.RANGE.AND.VALUE<MIS.ACCT.OFFICER.POS>
    END

    CONDITION=""

    IF CUSTOMER.ID THEN
        CONDITION:=" CUSTOMER.ID EQ ":CUSTOMER.ID
    END


    IF REF.ID THEN
        CONDITION:=" REF.ID EQ ":REF.ID
    END

    IF MIS.ACCT.OFFICER THEN
        CONFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefCCT.OFFICER EQ ":MIS.ACCT.OFFICER
    ENDEB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Commented CRT as it is not browser compatible
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MM.LD.ESTITHMAR(TABLEAU)
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
    $INSERT I_F.CUSTOMER
    $INSERT I_F.SECTOR
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.MM.MONEY.MARKET
    $INSERT I_F.CATEGORY
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.LD="F.LD.LOANS.AND.DEPOSITS"
    F.LD=""
    CALL OPF(FN.LD,F.LD)

    FN.MM="F.MM.MONEY.MARKET"
    F.MM=""
    CALL OPF(FN.MM,F.MM)


    FN.CUSTOMER = 'F.CUSTOMER'
    F.CUSTOMER = ''
    CALL OPF(FN.CUSTOMER,F.CUSTOMER)
	R.CUSTOMER=''

    FN.CATEG = 'F.CATEGORY'
    F.CATEG = ''
    CALL OPF(FN.CATEG,F.CATEG)
	R.CATEG=''

    FN.SECTOR = 'F.SECTOR'
    F.SECTOR = ''
    CALL OPF(FN.SECTOR,F.SECTOR)
	R.SECTOR=''

    FN.DEPT.ACCT.OFFICER = 'F.DEPT.ACCT.OFFICER'
    F.DEPT.ACCT.OFFICER = ''
    CALL OPF (FN.DEPT.ACCT.OFFICER,F.DEPT.ACCT.OFFICER)

    CUSTOMER.ID=""
    REF.ID=""
    MIS.ACCT.OFFICER=""
	
	YERR=''

    RETURN

PREPARE.CONDITION:


    LOCATE "CUSTOMER.ID" IN D.FIELDS<1> SETTING CUSTOMER.ID.POS THEN
        CUSTOMER.ID = D.RANGE.AND.VALUE<CUSTOMER.ID.POS>
    END

    LOCATE "REF.ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        REF.ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    LOCATE "MIS.ACCT.OFFICER" IN D.FIELDS<1> SETTING MIS.ACCT.OFFICER.POS THEN
        MIS.ACCT.OFFICER = D.RANGE.AND.VALUE<MIS.ACCT.OFFICER.POS>
    END

    CONDITION=""

    IF CUSTOMER.ID THEN
        CONDITION:=" CUSTOMER.ID EQ ":CUSTOMER.ID
    END


    IF REF.ID THEN
        CONDITION:=" REF.ID EQ ":REF.ID
    END

    IF MIS.ACCT.OFFICER THEN
        CONDITION:=" MIS.ACCT.OFFICER EQ ":MIS.ACCT.OFFICER
    END

    RETURN


PROCESS:

    IF CONDITION THEN
        SQL.MM = "SELECT " : FN.MM :" WITH CATEGORY GE 21000  AND CATEGORY LE 21029 AND ":CONDITION
    END ELSE
        SQL.MM = "SELECT " : FN.MM :" WITH CATEGORY GE 21000  AND CATEGORY LE 21029 "
    END
	
    MM.IDS=''
	MM.COUNT=''
	MM.ERROR=''
    CALL EB.READLIST(SQL.MM , MM.IDS,'',MM.COUNT,MM.ERROR)

    IF MM.IDS EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE REF.ID FROM MM.IDS SETTING POS
        WHILE REF.ID :POS
		    R.MM=''
			YERR=''
            CALL F.READ(FN.MM,REF.ID,R.MM,F.MM,YERR)
            GOSUB GET.MM.IDS

        REPEAT
    END

    IF CONDITION THEN
        SQL.LD = "SELECT " : FN.LD : " WITH CATEGORY EQ 21001 21005 AND STATUS EQ CUR FWD AND ":CONDITION
    END ELSE
        SQL.LD = "SELECT " : FN.LD : " WITH CATEGORY EQ 21001 21005 AND STATUS EQ CUR FWD"
    END

    LD.IDS=''
	LD.COUNT=''
	LD.ERROR=''
    CALL EB.READLIST(SQL.LD , LD.IDS,'',LD.COUNT,LD.ERROR)

    IF LD.IDS EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE REF.ID FROM LD.IDS SETTING POS
        WHILE REF.ID :POS
		    R.LD=''
			YERR=''
            CALL F.READ(FN.LD,REF.ID,R.LD,F.LD,YERR)
            GOSUB GET.LD.IDS
        REPEAT
    END
    RETURN

GET.MM.IDS:

    IF R.MM THEN
        Y.AMOUNT= R.MM<MM.PRINCIPAL>
        Y.ACC=R.MM<MM.PRIN.LIQ.ACCT>
        Y.DR.ACC=R.MM<MM.DRAWDOWN.ACCOUNT>
        Y.VALUE.DATE=R.MM<MM.VALUE.DATE>
        Y.MAT.DATE=R.MM<MM.MATURITY.DATE>
        Y.INTEREST.RATE = R.MM<MM.INTEREST.RATE>
        Y.CURRENCY=R.MM<MM.CURRENCY>
        Y.CUSTOMER.ID = R.MM<MM.CUSTOMER.ID>
        CALL F.READ(FN.CUSTOMER,Y.CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,YERR)
        Y.CUS.NAME.1 = R.CUSTOMER<EB.CUS.NAME.1>
        Y.SECTOR.ID=R.CUSTOMER<EB.CUS.SECTOR>
        CALL F.READ(FN.SECTOR,Y.SECTOR.ID,R.SECTOR,F.SECTOR,YERR)
        Y.SECTOR=R.SECTOR<EB.SEC.DESCRIPTION>
        Y.MIS.ACCT.OFFICER = R.MM<MM.MIS.ACCT.OFFICER>
        Y.CATEGORY = R.MM<MM.CATEGORY>
        CALL F.READ(FN.CATEG,Y.CATEGORY,R.CATEG,F.CATEG,YERR)
        DESC.CATEG=R.CATEG<EB.CAT.DESCRIPTION>
        TABLEAU<-1>=REF.ID:'*':Y.CUSTOMER.ID:'*':Y.AMOUNT:'*':Y.CATEGORY:'*':Y.VALUE.DATE:'*':Y.MAT.DATE:'*':Y.DR.ACC:'*':Y.ACC:'*':Y.CUS.NAME.1:'*':DESC.CATEG:'*':Y.MIS.ACCT.OFFICER:'*':Y.INTEREST.RATE:'*':Y.SECTOR:'*':Y.CURRENCY

    END ELSE

  *      CRT YERR ;*Commented CRT as it is not browser compatible
    END

    RETURN

GET.LD.IDS:

    CALL F.READ(FN.LD,REF.ID,R.LD,F.LD,YERR)
    IF R.LD THEN
        Y.AMOUNT= R.LD<LD.AMOUNT>
        Y.ACC=R.LD<LD.PRIN.LIQ.ACCT>
        Y.DR.ACC=R.LD<LD.DRAWDOWN.ACCOUNT>
        Y.VALUE.DATE=R.LD<LD.VALUE.DATE>
        Y.MAT.DATE=R.LD<LD.FIN.MAT.DATE>
        Y.INTEREST.RATE = R.LD<LD.INTEREST.RATE>
        Y.CURRENCY=R.LD<LD.CURRENCY>
        Y.CUSTOMER.ID = R.LD<LD.CUSTOMER.ID>
        CALL F.READ(FN.CUSTOMER,Y.CUSTOMER.ID,R.CUSTOMER,F.CUSTOMER,YERR)
        Y.CUS.NAME.1 = R.CUSTOMER<EB.CUS.NAME.1>
        Y.SECTOR.ID=R.CUSTOMER<EB.CUS.SECTOR>
        CALL F.READ(FN.SECTOR,Y.SECTOR.ID,R.SECTOR,F.SECTOR,YERR)
        Y.SECTOR=R.SECTOR<EB.SEC.DESCRIPTION>
        Y.MIS.ACCT.OFFICER = R.LD<LD.MIS.ACCT.OFFICER>
        Y.CATEGORY = R.LD<LD.CATEGORY>
        CALL F.READ(FN.CATEG,Y.CATEGORY,R.CATEG,F.CATEG,YERR)
        DESC.CATEG=R.CATEG<EB.CAT.DESCRIPTION>
        TABLEAU<-2>=REF.ID:'*':Y.CUSTOMER.ID:'*':Y.AMOUNT:'*':Y.CATEGORY:'*':Y.VALUE.DATE:'*':Y.MAT.DATE:'*':Y.DR.ACC:'*':Y.ACC:'*':Y.CUS.NAME.1:'*':DESC.CATEG:'*':Y.MIS.ACCT.OFFICER:'*':Y.INTEREST.RATE:'*':Y.SECTOR:'*':Y.CURRENCY

    END ELSE

  *     CRT YERR   ;*Commented CRT as it is not browser compatible
    END

    RETURN

END
