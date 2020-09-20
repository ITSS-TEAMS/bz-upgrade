*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE CNP.CONV.CALC.MNT.AMENDE.DELAI.3
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
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.BZ.CNP.INC.PAI
$INSERT I_F.BZ.CNP.INC.PAI 
*ZIT-UPG-R09-R13 / E
*ZIT-UPG-R13-R19/E

* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;  ;* Do Actual Process

    RETURN

INITIALISE:

    FN.BZ.CNP.INC.PAI = 'F.BZ.CNP.INC.PAI'
    F.BZ.CNP.INC.PAI = ''
    R.BZ.CNP.INC.PAI = ''
    ERR = ''
	CNP.REC =''
	F.ERROR = ''

    CALL OPF(FN.BZ.CNP.INC.PAI, F.BZ.CNP.INC.PAI)
    DATE.TODAY=TODAY

    RETURN

DO.PROCESS:

    ID.DOSSIER=O.DATA
    CFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCNP.INC.PAI,ID.DOSSIER,CNP.REC,F.BZ.CNP.INC.PAFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus IF CNP.REC THEN
        MONTANT.CHEQUE = CNP.REC<BZ.CNP.MNT.CHQ>
        MONTANT.PROVISION = CNP.REC<BZ.CNP.MNT.PROVISION>
        MONTANT.OP=MONTANT.CHEQUE-MONTANT.PROVISION
        O.DATA=MONTANT.OP*0.2
        CALL EB.ROUND.AMOUNT("TND",O.DATA,'','')
    END ELSE
        O.DATA=-1
    END

    RETURN

END
