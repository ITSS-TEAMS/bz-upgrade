$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.AGE.DIMP.6M
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*                  HARDCODE PD.BALANCE 47TH FIELD IS SOFTCODED 
*-----------------------------------------------------------------------------	
*ZIT-UPG-R13-R19/S 
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES
*ZIT-UPG-R13-R19/E
*-------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS.BALANCES
    GOSUB END.PROGRAM

    RETURN
*-------------------------------------------------
INIT:

* $INSERT I_COMMON - Not Used anymore;

    Y.TODAY = TODAY

    FN.PD.BALANCES = "F.PD.BALANCES"
    F.PD.BALANCES = ""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    FN.PD.BALANCES.HIST = "F.PD.BALANCES.HIST"
    F.PD.BALANCES.HIST = ""
    R.PD.BALANCES.HIST=""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    CALL OPF(FN.PD.BALANCES,F.PD.BALANCES)
    CALL OPF(FN.PD.BALANCES.HIST,F.PD.BALANCES.HIST)

    Y.DATA.FORM=TODAY

    CALL CDT('',Y.DATA.FORM,'-18FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN


*-------------------------------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus:

	SQL.BALANCES.IDS = ''
	SQL.BALANCES.COUNT = ''
	SQL.BALANCES.ERROR = ''
    SQL.BALANCES = "SELECT ":FN.PD.BALANCES:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"

    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN
        Y.DIFF.MOIS=0
    END ELSE
        SQL.BALANCES = "SSELECT ":FN.PD.BALANCES.HIST:" WITH @ID LIKE 'PD":Y.LD.ID:"...' BY-DSND @ID"
        CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)
        IF SQL.BALANCES.IDS THEN
            Y.DER.REC=SQL.BALANCES.IDS<1>

            Y.DATE.PD = FIELD(Y.DER.REC,'-',2)

            IF Y.DATE.PD GE Y.DATA.FORM THEN
         EB.DataAccess.Opf    CALL F.READ(FN.PD.BALANCES.HIST,Y.DER.REC,PD.BALANCES.REC,F.PD.BALANCES.HIST,PD.BALANCES.ERR)
         EB.DataAccess.Opf    IF PD.BALANCES.REC THEN
                    Y.DATE.PAIEEMNT = PD.BALANCES.REC<PD.BAL.REPAY.DATE,1,1>;* HARDCODED TO SOFTCODE 

                    CALL CDD ('',Y.TODAY,Y.DATE.PAIEEMNT,Y.DIFF)
                    Y.DIFF = ABS(Y.DIFF)
                  EB.SystemTables.getRNew()IFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef             CASE (Y.DIFF GE 1) AND (Y.DIFF LE 30)

       EB.DataAccess.FRead           Y.DIFF.MOIS = 1

                    CASE 1

                        Y.EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer/30
            EB.SystemTables.setE(FIELD(Y.DIFF.MOIS,'.',1))
                    END CASE
                END EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer        Y.DIFF.MOIS="ERROR"
                EEB.DataAccess.FWrite           END ELSE
                Y.DIFF.MOIS=6
        EB.SystemTables.setAf()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.AGE.DIMP.6M
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*                  HARDCODE PD.BALANCE 47TH FIELD IS SOFTCODED 
*-----------------------------------------------------------------------------	
*ZIT-UPG-R13-R19/S 
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES
*ZIT-UPG-R13-R19/E
*-------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS.BALANCES
    GOSUB END.PROGRAM

    RETURN
*-------------------------------------------------
INIT:

    Y.LD.ID = O.DATA

    Y.TODAY = TODAY

    FN.PD.BALANCES = "F.PD.BALANCES"
    F.PD.BALANCES = ""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    FN.PD.BALANCES.HIST = "F.PD.BALANCES.HIST"
    F.PD.BALANCES.HIST = ""
    R.PD.BALANCES.HIST=""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    CALL OPF(FN.PD.BALANCES,F.PD.BALANCES)
    CALL OPF(FN.PD.BALANCES.HIST,F.PD.BALANCES.HIST)

    Y.DATA.FORM=TODAY

    CALL CDT('',Y.DATA.FORM,'-180C')

    RETURN


*-------------------------------------
PROCESS.BALANCES:

	SQL.BALANCES.IDS = ''
	SQL.BALANCES.COUNT = ''
	SQL.BALANCES.ERROR = ''
    SQL.BALANCES = "SELECT ":FN.PD.BALANCES:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"

    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN
        Y.DIFF.MOIS=0
    END ELSE
        SQL.BALANCES = "SSELECT ":FN.PD.BALANCES.HIST:" WITH @ID LIKE 'PD":Y.LD.ID:"...' BY-DSND @ID"
        CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)
        IF SQL.BALANCES.IDS THEN
            Y.DER.REC=SQL.BALANCES.IDS<1>

            Y.DATE.PD = FIELD(Y.DER.REC,'-',2)

            IF Y.DATE.PD GE Y.DATA.FORM THEN
                CALL F.READ(FN.PD.BALANCES.HIST,Y.DER.REC,PD.BALANCES.REC,F.PD.BALANCES.HIST,PD.BALANCES.ERR)
                IF PD.BALANCES.REC THEN
                    Y.DATE.PAIEEMNT = PD.BALANCES.REC<PD.BAL.REPAY.DATE,1,1>;* HARDCODED TO SOFTCODE 

                    CALL CDD ('',Y.TODAY,Y.DATE.PAIEEMNT,Y.DIFF)
                    Y.DIFF = ABS(Y.DIFF)
                    BEGIN CASE
                    CASE (Y.DIFF GE 1) AND (Y.DIFF LE 30)

                        Y.DIFF.MOIS = 1

                    CASE 1

                        Y.DIFF.MOIS = Y.DIFF/30
                        Y.DIFF.MOIS = FIELD(Y.DIFF.MOIS,'.',1)
                    END CASE
                END ELSE
                    Y.DIFF.MOIS="ERROR"
                END

            END ELSE
                Y.DIFF.MOIS=6
           FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefB.SystemTables.setE()$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.AGE.DIMP.6M
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*                  HARDCODE PD.BALANCE 47TH FIELD IS SOFTCODED 
*-----------------------------------------------------------------------------	
*ZIT-UPG-R13-R19/S 
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.BALANCES
*ZIT-UPG-R13-R19/E
*-------------------------------------------------
    GOSUB INIT
    GOSUB PROCESS.BALANCES
    GOSUB END.PROGRAM

    RETURN
*-------------------------------------------------
INIT:

    Y.LD.ID = O.DATA

    Y.TODAY = TODAY

    FN.PD.BALANCES = "F.PD.BALANCES"
    F.PD.BALANCES = ""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    FN.PD.BALANCES.HIST = "F.PD.BALANCES.HIST"
    F.PD.BALANCES.HIST = ""
    R.PD.BALANCES.HIST=""
	PD.BALANCES.REC = ''
	PD.BALANCES.ERR = ''

    CALL OPF(FN.PD.BALANCES,F.PD.BALANCES)
    CALL OPF(FN.PD.BALANCES.HIST,F.PD.BALANCES.HIST)

    Y.DATA.FORM=TODAY

    CALL CDT('',Y.DATA.FORM,'-180C')

    RETURN


*-------------------------------------
PROCESS.BALANCES:

	SQL.BALANCES.IDS = ''
	SQL.BALANCES.COUNT = ''
	SQL.BALANCES.ERROR = ''
    SQL.BALANCES = "SELECT ":FN.PD.BALANCES:" WITH @ID LIKE 'PD":Y.LD.ID:"...'"

    CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)

    IF SQL.BALANCES.IDS THEN
        Y.DIFF.MOIS=0
    END ELSE
        SQL.BALANCES = "SSELECT ":FN.PD.BALANCES.HIST:" WITH @ID LIKE 'PD":Y.LD.ID:"...' BY-DSND @ID"
        CALL EB.READLIST(SQL.BALANCES, SQL.BALANCES.IDS, '',SQL.BALANCES.COUNT,SQL.BALANCES.ERROR)
        IF SQL.BALANCES.IDS THEN
            Y.DER.REC=SQL.BALANCES.IDS<1>

            Y.DATE.PD = FIELD(Y.DER.REC,'-',2)

            IF Y.DATE.PD GE Y.DATA.FORM THEN
                CALL F.READ(FN.PD.BALANCES.HIST,Y.DER.REC,PD.BALANCES.REC,F.PD.BALANCES.HIST,PD.BALANCES.ERR)
                IF PD.BALANCES.REC THEN
                    Y.DATE.PAIEEMNT = PD.BALANCES.REC<PD.BAL.REPAY.DATE,1,1>;* HARDCODED TO SOFTCODE 

                    CALL CDD ('',Y.TODAY,Y.DATE.PAIEEMNT,Y.DIFF)
                    Y.DIFF = ABS(Y.DIFF)
                    BEGIN CASE
                    CASE (Y.DIFF GE 1) AND (Y.DIFF LE 30)

                        Y.DIFF.MOIS = 1

                    CASE 1

                        Y.DIFF.MOIS = Y.DIFF/30
                        Y.DIFF.MOIS = FIELD(Y.DIFF.MOIS,'.',1)
                    END CASE
                END ELSE
                    Y.DIFF.MOIS="ERROR"
                END

            END ELSE
                Y.DIFF.MOIS=6
            END
        END ELSE

            Y.DIFF.MOIS=6
        END

    END

    O.DATA = Y.DIFF.MOIS

    RETURN
*---------------------------------------------------------------------
END.PROGRAM:
END
