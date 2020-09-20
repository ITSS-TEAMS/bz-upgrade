*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-21</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.INT
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

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13 / S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*$INSERT BP I_F.BZ.CNP.INC.PAI

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.CNP.INC.PAI
* $INSERT I_COMMON - Not Used anymore;

    GOSUB INITIALISE
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''

    CALL OPF(FN.BZ.CNP.INC.PAI, F.BZ.CNP.INC.PAI)
    DATE.TODAY=TODAY

    DATEEB.SystemTables.getVFunction()ODAY
    CALL CDT ("",DATE.2.DELAI , "-1FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusON = EB.SystemTables.getVFunction()
    CALL CDT ("",DATE.2.DELAI tmp.V$FUNCTION
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    CALL CDT ("",FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus5W")

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
	CNP.REC=''
	F.ERROR=''
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DEB.DataAccess.Opf.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        MEB.DataAccess.OpfANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        DATE.CNP = CNP.REC<BZ.CNP.DATE.CNP>
        NB.JOURS =EB.SystemTables.getRNew()
FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefD("",DATE.CNP,DATE.TODAY,NB.JOURS)
*********EB.DataAccess.FRead      BEGIN CASE
        CASE ((DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)) OR ((DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7))
            MONTANT.INT=(MONTANT.OP*10*NB.JOURS)/36000
            CALL EB.ROUND.AMEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.INT,'','')
            O.DATA=MONTANT.INT

        CAEB.SystemTables.setE()*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-21</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.INT
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

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13 / S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*$INSERT BP I_F.BZ.CNP.INC.PAI

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.CNP.INC.PAI
*ZIT-UPG-R09-R13/ E

    GOSUB INITIALISE
    GOSUB DO.PROCESS          ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''

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
	CNP.REC=''
	F.ERROR=''
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        DATE.CNP = CNP.REC<BZ.CNP.DATE.CNP>
        NB.JOURS = 'C'
        CALL CDD("",DATE.CNP,DATE.TODAY,NB.JOURS)
***********
        BEGIN CASE
        CASE ((DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)) OR ((DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7))
            MONTANT.INT=(MONTANT.OP*10*NB.JOURS)/36000
            CALL EB.ROUND.AMOUNT("TND",MONTANT.INT,'','')
            O.DATA=MONTANT.INT

        CASE 1
            O.DATA=0EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer

***********
  EB.DataAccess.FWriteLSE
        O.DATA=-1
    ENDEB.SystemTables.setAf()*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-21</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.INT
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

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13 / S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*$INSERT BP I_F.BZ.CNP.INC.PAI

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.CNP.INC.PAI
*ZIT-UPG-R09-R13/ E

    GOSUB INITIALISE
    GOSUB DO.PROCESS          ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''

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
	CNP.REC=''
	F.ERROR=''
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        DATE.CNP = CNP.REC<BZ.CNP.DATE.CNP>
        NB.JOURS = 'C'
        CALL CDD("",DATE.CNP,DATE.TODAY,NB.JOURS)
***********
        BEGIN CASE
        CASE ((DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)) OR ((DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7))
            MONTANT.INT=(MONTANT.OP*10*NB.JOURS)/36000
            CALL EB.ROUND.AMOUNT("TND",MONTANT.INT,'','')
            O.DATA=MONTANT.INT

        CASE 1
            O.DATA=0
        END CASE

***********
    END ELSE
        O.DATA=-1
    END

FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefTables.setE()*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-21</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.INT
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

*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13 / S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*$INSERT BP I_F.BZ.CNP.INC.PAI

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.CNP.INC.PAI
*ZIT-UPG-R09-R13/ E

    GOSUB INITIALISE
    GOSUB DO.PROCESS          ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''

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
	CNP.REC=''
	F.ERROR=''
    CALL F.READ(FN.BZ.CNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAI,F.ERROR)

    IF CNP.REC THEN
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        DATE.ANR=CNP.REC<BZ.CNP.DATE.ANR>
        DATE.SIGNIF=CNP.REC<BZ.CNP.DATE.SIGNIF>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        STATUT.DOSSIER=CNP.REC<BZ.CNP.STATUT.CNP>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION

        DATE.CNP = CNP.REC<BZ.CNP.DATE.CNP>
        NB.JOURS = 'C'
        CALL CDD("",DATE.CNP,DATE.TODAY,NB.JOURS)
***********
        BEGIN CASE
        CASE ((DATE.SIGNIF GT DATE.2.DELAI) AND (DATE.ANR LE TODAY)) OR ((DATE.SIGNIF LE DATE.2.DELAI) AND (STATUT.DOSSIER EQ 7))
            MONTANT.INT=(MONTANT.OP*10*NB.JOURS)/36000
            CALL EB.ROUND.AMOUNT("TND",MONTANT.INT,'','')
            O.DATA=MONTANT.INT

        CASE 1
            O.DATA=0
        END CASE

***********
    END ELSE
        O.DATA=-1
    END

    RETURN

END
