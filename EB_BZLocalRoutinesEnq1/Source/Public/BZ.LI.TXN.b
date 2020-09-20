*-----------------------------------------------------------------------------*
* <Rating>-31</Rating>
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LI.TXN(RESULTAT)
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

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED; FM TO @FM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.LIMIT
*    INCLUDE GLOBUS.BP I_F.LD.LOANS.AND.DEPOSITS
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;T
    * $INSERT I_EQUATE - Not Used anymore;OANS.AND.DEPOSITS
*ZIT-UPG-R09-R13 / E
*ZIT-UPG-R13-R19/E

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
	LIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus	TX.ERR = ''

    FN.LD = 'F.LD.LOANS.AND.DEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus = ''

    C.Y.APPL = 'LD'
	
	ID.POS = ''
	
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
PROCESS:EB.DataAccess.Opf-------EB.DataAccess.Opf-----------------------------------------------------------------*

    IF IDENTIF NE '' THEN
        CALL F.READ(FN.LIMIT.TX,IDENTIF,LIMIT.TX.REC,F.LIMIT.TX,LIMIT.TX.ERR)


        TOTAL.COUNT=DCFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefEC,@FM)
        FEB.DataAccess.FReadPTEUR=1 TO TOTAL.COUNT
            TXN.DATA = LIMIT.TX.REC<COMPTEUR>
            CLIENT=FIELD(IDENTIF,'.',1)
            REF.CONTRAT=FIELD(TXN.DATA,'/',1)
            Y.APPL=REF.CONTREB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer   IF Y.APPL EQ C.Y.APPL THEN
            EB.SystemTables.setE(TXN.DATA:"*":IDENTIF:"*":CLIENT)

            END

 EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.DataAccess.FWrite
    END
    RETURN


END
