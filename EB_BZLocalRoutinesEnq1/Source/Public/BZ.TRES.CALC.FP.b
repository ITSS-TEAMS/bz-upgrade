*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted GET.LOC.REF to MULTI.GET.LOC.REF, F.READ to CACHE.READ
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TRES.CALC.FP
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
    $INSERT I_F.FX.PARAMETERS

    POSITION.FINAL.LCY = ABS(O.DATA)

    FN.FX.PARAM = "F.FX.PARAMETERS"
    F.FX.PARAM = ""
    R.FX.PARAM=''
    E.FX.PARAM=''

    CALL OPF(FN.FX.PARAM,F.FX.PARAM)

    K.FX.PARAM = "FX.PARAMETERS"

* $INSERT I_COMMON - Not Used anymore;F("FX.PARAMETERS","MNT.FOND",POS.MNT)

* ZIT-UPG-R13-R19/S
    Y.APP = "FX.PARAMETERS"
    Y.FIELD = "MNT.FOND"
    Y.POS = ''
    CALL MULTI.GET.LOC.REF(Y.APP, Y.FIELD, Y.POS)
    POS.MNT = Y.POS<1,1>
* ZIT-UPG-R13-R19/E
    
   * CALL F.READ(FN.FX.PARAM,K.FX.PARAM,R.FX.PARAM,F.FX.PARAM,E.FX.PARAM)
	CALL CACHE.READ(FN.FX.PARAM,K.FX.PARAM,R.FX.PARAM,E.FX.PARAM)

    IF K.FX.PARAM THEN
        Y.MNT.FOND.PROPORE = R.FX.PARAM<FX.P.LOCAL.REF,POS.MNT>
    END

    Y.FPEB.SystemTables.getVFunction()ION.FINAL.LCYEB.SystemTables.getVFunction()OND.PROPORE)EB.SystemTables.getRNew()0FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT(Y.FP,"R4")

*   CONVERT '.' TO ',' IN Y.FPFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusY.FP

RETURN


END
