*-----------------------------------------------------------------------------*
* <Rating>-31</Rating>
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.LI.TXN(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP

*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.LIMIT
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LIMIT
* $INSERT I_COMMON - Not Used anymore;.AND.DEPOSITS
* $INSERT I_EQUATE - Not Used anymore;

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.LIMIT = 'F.LIMIT'
    F.LIMIT = ''

    FN.LIMIT.TX = 'F.LIMIT.TXNS'
    F.LIEB.SystemTables.getVFunction()

    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    C.Y.APPL = 'LD'

    LOCATE "ID" IN D.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ID.POS THEN
        IDENTIF = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.LIMIT,F.LIMIT)
    CALL OPF(FN.LIMIT.TX,F.LIMIT.TX)
    CALL OPF(FN.LD,F.LD)

    RETURN

*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*

    IF IDENTIF NE '' THEN
	    LIMIT.TX.REC=''
		LIMIT.TX.ERR=''
        EB.DataAccess.Opf F.READ(FN.LIMIT.TX,IDENTIF,LIMIT.TX.REC,F.LIMIT.TX,LIMIT.TX.ERR)

       EB.DataAccess.OpfTAL.COUNT=DCOUNT(LIMIT.TX.REC,@FM)
        FOR COMPTEUR=1 TO TOTAL.COUNT
            TXN.DATA = LIMIT.TX.REC<COMPTEUR>
            CLIENT=FIELD(IDENTIF,'.',1)
            REF.COEB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef'/',1)
            Y.APPL=REF.CONTRAT[1,2]
         EB.DataAccess.FReadY.APPL EQ C.Y.APPL THEN
                TABLEAU<-1>=TXN.DATA:"*":IDENTIF:"*":CLIENT

            END

        NEXT COMPTEUR

 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerTables.setE()*-----------------------------------------------------------------------------*
* <Rating>-31</Rating>
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE NOFILE.LI.TXN(TABLEAU)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP

*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.LIMIT
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LIMIT
$INSERT I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R09-R13 / E

    GOSUB INITIALISATION
    GOSUB OPEN.FILES
    GOSUB PROCESS

    RETURN

*----------------------------------------------------------------------------*
INITIALISATION:
*----------------------------------------------------------------------------*

    FN.LIMIT = 'F.LIMIT'
    F.LIMIT = ''

    FN.LIMIT.TX = 'F.LIMIT.TXNS'
    F.LIMIT.TX= ''

    FN.LD = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD = ''

    C.Y.APPL = 'LD'

    LOCATE "ID" IN D.FIELDS<1> SETTING ID.POS THEN
        IDENTIF = D.RANGE.AND.VALUE<ID.POS>
    END

    RETURN

*----------------------------------------------------------------------------*
OPEN.FILES:
*----------------------------------------------------------------------------*
    CALL OPF(FN.LIMIT,F.LIMIT)
    CALL OPF(FN.LIMIT.TX,F.LIMIT.TX)
    CALL OPF(FN.LD,F.LD)

    RETURN

*----------------------------------------------------------------------------*
PROCESS:
*----------------------------------------------------------------------------*

    IF IDENTIF NE '' THEN
	    LIMIT.TX.REC=''
		LIMIT.TX.ERR=''
        CALL F.READ(FN.LIMIT.TX,IDENTIF,LIMIT.TX.REC,F.LIMIT.TX,LIMIT.TX.ERR)

        TOTAL.COUNT=DCOUNT(LIMIT.TX.REC,@FM)
        FOR COMPTEUR=1 TO TOTAL.COUNT
            TXN.DATA = LIMIT.TX.REC<COMPTEUR>
            CLIENT=FIELD(IDENTIF,'.',1)
            REF.CONTRAT=FIELD(TXN.DATA,'/',1)
            Y.APPL=REF.CONTRAT[1,2]
            IF Y.APPL EQ C.Y.APPL THEN
                TABLEAU<-1>=TXN.DATA:"*":IDENTIF:"*":CLIENT

            END

        NEXT COMPTEUR

    END
    RETURN

END
