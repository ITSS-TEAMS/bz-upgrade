*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.AMENDE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------------------
* @author BOUNOUARA FEHMI
*Modification History:
*----------------------------------------------------------------------------- 
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.CNP.INC.PAI

*ZIT-UPG-R13-R19/S
     $INSERT I_COMMON
     * $INSERT I_COMMON - Not Used anymore;E
     * $INSERT I_EQUATE - Not Used anymore;RY.COMMON
     * $INSERT I_ENQUIRY.COMMON - Not Used anymore;PAI
*ZIT-UPG-R09-R13 / E  
*ZIT-UPG-R13-R19/E
    
    GOSUB INITIALISE
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''
	EB.SystemTables.getVFunction()''
	CNP.REC = ''

tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI)
    CALL OPF(Ftmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI)
    DATE.TODAY=TODAY

    DATEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   CALL CDT ("",DATE.2.DELAI , "-1W")
    CALL CDT ("",DATE.2.DELAI , "-89C")
    CALL CDT ("",DATE.2.DELAI , "-5W")

****
    LOOP
        DATE.TODAY.TMP=DATE.2.DELAI
        CALL CDT('',DATE.TODAY.TMP, '+1C')
        CALL AWD('',DATE.TODAY.TMP,Y.VAL)
    WHILE Y.VAL EQ 'H'

        DATE.2.DELAI = DATE.TODAY.TMP

    REPEAT
****

    RETURN

DO.PROCESS:

    ID.DOSSIER=O.DATA
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF EB.DataAccess.OpfB.DataAccess.OpfEC THEN
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        MONTANT.PREB.SystemTables.getRNew()OFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefCNP.MNT.PROVISION>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

       EB.DataAccess.FRead CASE
        CASE (DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)
            O.DATA=MONTANT.OP*0.1

        CASE (DATE.SIGNIF EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerND (STATUT.DOSSIER EQ 7)
            EB.SystemTables.setE(MONTANT.OP*0.2)

        CASE 1
    EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer        END CASEEB.DataAccess.FWrite  CALL EB.ROUND.AMOUNT("TND",O.DATA,'','')
    END ELSE
        O.DATA=-1
    ENDEB.SystemTables.setAf()*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.AMENDE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------------------
* @author BOUNOUARA FEHMI
*Modification History:
*----------------------------------------------------------------------------- 
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.CNP.INC.PAI

*ZIT-UPG-R13-R19/S
     $INSERT I_COMMON
     $INSERT I_EQUATE
     $INSERT I_ENQUIRY.COMMON
     $INSERT I_F.BZ.CNP.INC.PAI
*ZIT-UPG-R09-R13 / E  
*ZIT-UPG-R13-R19/E
    
    GOSUB INITIALISE
    GOSUB DO.PROCESS          ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''
	F.ERROR = ''
	CNP.REC = ''

    CALL OPF(FN.BZ.CNP.INC.PAI, F.BZ.CNP.INC.PAI)
    DATE.TODAY=TODAY

    DATE.2.DELAI=TODAY
    CALL CDT ("",DATE.2.DELAI , "-1W")
    CALL CDT ("",DATE.2.DELAI , "-89C")
    CALL CDT ("",DATE.2.DELAI , "-5W")

****
    LOOP
        DATE.TODAY.TMP=DATE.2.DELAI
        CALL CDT('',DATE.TODAY.TMP, '+1C')
        CALL AWD('',DATE.TODAY.TMP,Y.VAL)
    WHILE Y.VAL EQ 'H'

        DATE.2.DELAI = DATE.TODAY.TMP

    REPEAT
****

    RETURN

DO.PROCESS:

    ID.DOSSIER=O.DATA
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        BEGIN CASE
        CASE (DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)
            O.DATA=MONTANT.OP*0.1

        CASE (DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7)
            O.DATA=MONTANT.OP*0.2

        CASE 1
            O.DATA=0
        END CASE
        CALL EB.ROUND.AMOUNT("TND",O.DATA,'','')
    END ELSE
        O.DATA=-1
    END

FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTables.setE()*-----------------------------------------------------------------------------
* <Rating>-22</Rating>
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.AMENDE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------------------
* @author BOUNOUARA FEHMI
*Modification History:
*----------------------------------------------------------------------------- 
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
    *$INSERT GLOBUS.BP I_COMMON
    *$INSERT GLOBUS.BP I_EQUATE
    *$INSERT GLOBUS.BP I_ENQUIRY.COMMON
    *$INSERT BP I_F.BZ.CNP.INC.PAI

*ZIT-UPG-R13-R19/S
     $INSERT I_COMMON
     $INSERT I_EQUATE
     $INSERT I_ENQUIRY.COMMON
     $INSERT I_F.BZ.CNP.INC.PAI
*ZIT-UPG-R09-R13 / E  
*ZIT-UPG-R13-R19/E
    
    GOSUB INITIALISE
    GOSUB DO.PROCESS          ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''
	F.ERROR = ''
	CNP.REC = ''

    CALL OPF(FN.BZ.CNP.INC.PAI, F.BZ.CNP.INC.PAI)
    DATE.TODAY=TODAY

    DATE.2.DELAI=TODAY
    CALL CDT ("",DATE.2.DELAI , "-1W")
    CALL CDT ("",DATE.2.DELAI , "-89C")
    CALL CDT ("",DATE.2.DELAI , "-5W")

****
    LOOP
        DATE.TODAY.TMP=DATE.2.DELAI
        CALL CDT('',DATE.TODAY.TMP, '+1C')
        CALL AWD('',DATE.TODAY.TMP,Y.VAL)
    WHILE Y.VAL EQ 'H'

        DATE.2.DELAI = DATE.TODAY.TMP

    REPEAT
****

    RETURN

DO.PROCESS:

    ID.DOSSIER=O.DATA
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        BEGIN CASE
        CASE (DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)
            O.DATA=MONTANT.OP*0.1

        CASE (DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7)
            O.DATA=MONTANT.OP*0.2

        CASE 1
            O.DATA=0
        END CASE
        CALL EB.ROUND.AMOUNT("TND",O.DATA,'','')
    END ELSE
        O.DATA=-1
    END

    RETURN

END
