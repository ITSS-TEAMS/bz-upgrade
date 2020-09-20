*-----------------------------------------------------------------------------
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; VM TO @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.LIMIT.DF(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LIMIT
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
    $INSERT I_F.LIMIT.REFERENCE
*ZIT-UPG-R13-R19/E

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.DF="F.BZ.LI.DECISION.FINANCEMENT"
    F.DF=""
	R.DF = ''
	YERR = ''
    CALL OPF(FN.DF,F.DF)

    FN.LI="F.LIMIT"
    F.LI=""
	R.LI=""
	LI.YERR = ''
    CALL OPF(FN.LI,F.LI)


    FN.LI.REF="F.LIMIT.REFERENCE"
    F.LI.REF=""
	R.LIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusYERR = ''
    CALL OPF(FN.LI.REF,F.LI.REF)
 FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusF.ID.POS = ''
	DF.IDS    = ''
	DF.COUNT  = ''
	DF.ERROR  = ''
	POS       = ''
	REF.ID    = ''
	

    RETURN

PREPARE.CONDITION:

    LOCATE "@ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        @ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    CONDITION=""

    IF @ID THEN
        CONDITION:=" @ID EQ ":@ID
    END

    RETEB.DataAccess.OpfB.DataAccess.Opf

PROCESS:
    IF CONDITION THEN
        SQL.DF = "EB.SystemTables.getRNew()TFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefITH ":CONDITION

    END
EB.DataAccess.FReadLL EB.READLIST(SQL.DF , DF.IDS,'',DF.COUNT,DF.ERROR)

    IF DF.IDS EQ '' THEN
        RETURN
    END ELSEEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerystemTables.setE()*-----------------------------------------------------------------------------
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; VM TO @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.LIMIT.DF(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LIMIT
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
    $INSERT I_F.LIMIT.REFERENCE
*ZIT-UPG-R13-R19/E

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.DF="F.BZ.LI.DECISION.FINANCEMENT"
    F.DF=""
	R.DF = ''
	YERR = ''
    CALL OPF(FN.DF,F.DF)

    FN.LI="F.LIMIT"
    F.LI=""
	R.LI=""
	LI.YERR = ''
    CALL OPF(FN.LI,F.LI)


    FN.LI.REF="F.LIMIT.REFERENCE"
    F.LI.REF=""
	R.LI.REF=""
	REF.LI.YERR = ''
    CALL OPF(FN.LI.REF,F.LI.REF)
    @ID=""
	
	REF.ID.POS = ''
	DF.IDS    = ''
	DF.COUNT  = ''
	DF.ERROR  = ''
	POS       = ''
	REF.ID    = ''
	

    RETURN

PREPARE.CONDITION:

    LOCATE "@ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        @ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    CONDITION=""

    IF @ID THEN
        CONDITION:=" @ID EQ ":@ID
    END

    RETURN


PROCESS:
    IF CONDITION THEN
        SQL.DF = "SELECT " : FN.DF :" WITH ":CONDITION

    END
    CALL EB.READLIST(SQL.DF , DF.IDS,'',DF.COUNT,DF.ERROR)

    IF DF.IDS EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE REF.ID FROM DF.IDS SETTING POS
        WHILE REF.IDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer CALL F.READ(FN.DF,REF.ID,R.DF,F.DF,YERR)
            GOSUBEB.DataAccess.FWrite.IDS
        REPEAT
    END

    RETUEB.SystemTables.setAf()*-----------------------------------------------------------------------------
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; VM TO @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.LIMIT.DF(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LIMIT
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
    $INSERT I_F.LIMIT.REFERENCE
*ZIT-UPG-R13-R19/E

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.DF="F.BZ.LI.DECISION.FINANCEMENT"
    F.DF=""
	R.DF = ''
	YERR = ''
    CALL OPF(FN.DF,F.DF)

    FN.LI="F.LIMIT"
    F.LI=""
	R.LI=""
	LI.YERR = ''
    CALL OPF(FN.LI,F.LI)


    FN.LI.REF="F.LIMIT.REFERENCE"
    F.LI.REF=""
	R.LI.REF=""
	REF.LI.YERR = ''
    CALL OPF(FN.LI.REF,F.LI.REF)
    @ID=""
	
	REF.ID.POS = ''
	DF.IDS    = ''
	DF.COUNT  = ''
	DF.ERROR  = ''
	POS       = ''
	REF.ID    = ''
	

    RETURN

PREPARE.CONDITION:

    LOCATE "@ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        @ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    CONDITION=""

    IF @ID THEN
        CONDITION:=" @ID EQ ":@ID
    END

    RETURN


PROCESS:
    IF CONDITION THEN
        SQL.DF = "SELECT " : FN.DF :" WITH ":CONDITION

    END
    CALL EB.READLIST(SQL.DF , DF.IDS,'',DF.COUNT,DF.ERROR)

    IF DF.IDS EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE REF.ID FROM DF.IDS SETTING POS
        WHILE REF.ID :POS
            CALL F.READ(FN.DF,REF.ID,R.DF,F.DF,YERR)
            GOSUB GET.DF.IDS
        REPEAT
    END

    RETURNFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedReftemTables.setE()*-----------------------------------------------------------------------------
*cree par Fahmi Abdeltif (fahmi.abdeltif@banquezitouna.com)
*-------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; VM TO @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.LIMIT.DF(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LIMIT
    $INSERT I_F.BZ.LI.DECISION.FINANCEMENT
    $INSERT I_F.LIMIT.REFERENCE
*ZIT-UPG-R13-R19/E

MAIN:

    GOSUB INIT
    GOSUB  PREPARE.CONDITION
    GOSUB PROCESS
    RETURN

INIT:

    FN.DF="F.BZ.LI.DECISION.FINANCEMENT"
    F.DF=""
	R.DF = ''
	YERR = ''
    CALL OPF(FN.DF,F.DF)

    FN.LI="F.LIMIT"
    F.LI=""
	R.LI=""
	LI.YERR = ''
    CALL OPF(FN.LI,F.LI)


    FN.LI.REF="F.LIMIT.REFERENCE"
    F.LI.REF=""
	R.LI.REF=""
	REF.LI.YERR = ''
    CALL OPF(FN.LI.REF,F.LI.REF)
    @ID=""
	
	REF.ID.POS = ''
	DF.IDS    = ''
	DF.COUNT  = ''
	DF.ERROR  = ''
	POS       = ''
	REF.ID    = ''
	

    RETURN

PREPARE.CONDITION:

    LOCATE "@ID" IN D.FIELDS<1> SETTING REF.ID.POS THEN
        @ID = D.RANGE.AND.VALUE<REF.ID.POS>
    END

    CONDITION=""

    IF @ID THEN
        CONDITION:=" @ID EQ ":@ID
    END

    RETURN


PROCESS:
    IF CONDITION THEN
        SQL.DF = "SELECT " : FN.DF :" WITH ":CONDITION

    END
    CALL EB.READLIST(SQL.DF , DF.IDS,'',DF.COUNT,DF.ERROR)

    IF DF.IDS EQ '' THEN
        RETURN
    END ELSE
        LOOP
            REMOVE REF.ID FROM DF.IDS SETTING POS
        WHILE REF.ID :POS
            CALL F.READ(FN.DF,REF.ID,R.DF,F.DF,YERR)
            GOSUB GET.DF.IDS
        REPEAT
    END

    RETURN

GET.DF.IDS:
    IF R.DF THEN
        REF.LI = R.DF<DEC.FIN.REFERENCE.LIMIT>
        Y.NBR.LI = DCOUNT(REF.LI,@VM)
        FOR COMPTEUR =1 TO Y.NBR.LI
            ID.LIMIT=R.DF<DEC.FIN.REFERENCE.LIMIT><1,COMPTEUR>
            CALL F.READ(FN.LI,ID.LIMIT,R.LI,F.LI,LI.YERR)

            DEVISE=R.LI<LI.LIMIT.CURRENCY>
            Y.APPROVAL.DATE=R.LI<LI.APPROVAL.DATE>
            Y.OFFERED.UNTIL=R.LI<LI.OFFERED.UNTIL>
            Y.REVIEW.FREQUENCY=R.LI<LI.REVIEW.FREQUENCY>
            Y.EXPIRY.DATE=R.LI<LI.EXPIRY.DATE>
            Y.PROPOSAL.DATE=R.LI<LI.PROPOSAL.DATE>
            Y.LIMIT.GRADE=R.LI<LI.LIMIT.GRADE>
            Y.NOTES=R.LI<LI.NOTES>
            Y.INTERNAL.AMOUNT=R.LI<LI.INTERNAL.AMOUNT>
            Y.CREDIT.LINE=R.LI<LI.CREDIT.LINE>
            Y.LIMIT.PRODUCT=R.LI<LI.LIMIT.PRODUCT>
            CALL F.READ(FN.LI.REF,Y.LIMIT.PRODUCT,R.LI.REF,F.LI.REF,REF.LI.YERR)

            Y.LI.DESC=R.LI.REF<LI.REF.DESCRIPTION>
            Y.MARKER=R.LI<LI.AVAILABLE.MARKER>
            Y.NETTING=R.LI<LI.ALLOW.NETTING>
            TABLEAU<-1>=ID.LIMIT:'*':Y.LI.DESC:'*':DEVISE:'*':Y.APPROVAL.DATE:'*':Y.OFFERED.UNTIL:'*':Y.REVIEW.FREQUENCY:'*':Y.EXPIRY.DATE:'*':Y.PROPOSAL.DATE:'*':Y.LIMIT.GRADE:'*':Y.NOTES:'*':Y.INTERNAL.AMOUNT:'*':Y.CREDIT.LINE:'*':Y.LIMIT.PRODUCT:'*':Y.MARKER:'*':Y.NETTING
        NEXT COMPTEUR
    END ELSE

        CRT YERR
    END


    RETURN


    RETURN

END
