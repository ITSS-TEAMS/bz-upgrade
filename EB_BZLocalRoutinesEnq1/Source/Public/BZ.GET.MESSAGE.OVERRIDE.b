*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.MESSAGE.OVERRIDE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-CONVERT TO CHANGE;FM,VM TO @FM,@VM
********************************************************
   
   $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.DEMANDE.ISB


    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS
    RETURN

INITIALISATION:
*file opening, variable set up

    FN.BZ.DEMANDE.ISB = 'F.BZ.DEMANDE.ISB'
    F.BZ.DEMANDE.ISB = ''
    R.BZ.DEMANDE.ISB = ''
* $INSERT I_COMMON - Not Used anymore;.ISB = ''
    OVR='OVR00'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;SB,F.BZ.DEMANDE.ISB)
    V.OVERRIDE=""
    RETURN
MAIN.PROCESS:
*main subroutine processing


    ID.DF = O.DATA
    CALL F.READ(FN.BZ.DEMANDE.ISB,ID.DF,R.BZ.DEMANDE.ISB,F.BZ.DEMANDE.ISB,ERR.F.BZ.DEMANDE.ISB)
    V.MSG.OVERRIDE=R.BZ.DEMANDE.ISB<BZ.DEMANDE.ISB.OVERRIDE>
*    CONVERT VM TO FM IN V.MSG.OVERRIDE
	CHANGE @VM TO @FM IN V.MSG.OVERRIDE
    NB.MSG=DCOUNT(V.MSG.OVERRIDE,@FM)
    FOR I=1 TO NB.MSG
        V.MSG=V.MSG.OVERRIDE<I>
        EB.SystemTables.getVFunction()ELDS(V.MSG,'.EB.SystemTables.getVFunction()    IF (V.FIELD EQFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusFIELD EQ 'OVR002') THEN
            O.DATA= VFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ELSE
            O.DATA=''
        END
    NEXT I
    RETURN
END
