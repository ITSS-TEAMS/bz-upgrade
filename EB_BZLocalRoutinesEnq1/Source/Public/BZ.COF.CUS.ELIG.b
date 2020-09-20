*-----------------------------------------------------------------------------
* <Rating>200</Rating>
*-----------------------------------------------------------------------------
*---------------------------------------------
* @author Marwen Ben Nasr le 22/09/2014
* @description : Verifier l'egibilite de l'agent economique
*---------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19-REPLACED F.READ WITH CACHE.READ
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.CUS.ELIG
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
    $INSERT I_F.CUSTOMER
    $INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.COFFRE.PARAMETERS
$INSERT I_F.BZ.COFFRE.PARAMETERS
*ZIT-UPG-R09-R13/E
    IF MESSAGE EQ 'VAL' THEN RETURN

    CLIENT=COMI

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;RAMETERS"
    F.CF.PARAM = ""
    R.CF.PARAM= ''
    ERR.CF.PARAM = ''
    ID.PARAM="SYSTEM"

    FN.CUS = "F.CUSTOMER"
    F.CUS = ""
    R.CUS= ''
    ERR.CUS = ''

    CALL OPF(FN.CUS,F.CUS)
*    CALL OPF(FN.CF.PARAM,F.CF.PARAM)   ;*COMMENTING CALL OPF AS F.READ IS REPLACED WITH CACHE READ

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction().CUS,CLIENT,Rtmp.V$FUNCTION,ERR.CUS)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    V.SFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusUS.SECTOR>

******************************
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEAD(FN.CF.PARAM,ID.PARAM,R.CF.PARAM,F.CF.PARAM,ERR.CF.PARAM)
     CALL CACHE.READ(FN.CF.PARAM,ID.PARAM,R.CF.PARAM,ERR.CF.PARAM)   ;*REPLACED FORM F.READ
    V.SECTOR.PARAM = R.CF.PARAM<CF.PARAM.SECTOR>

    CHANGE @VM TO @FM IN V.SECTOR.PARAM


    LOCATE V.SECTOR IN V.SECTOR.PARAM SETTING SECTOR.POS ELSE SECTOR.POS = ''

    IF SECTOR.POS EQ "" THEN
        ETEXT="Client non elligible: agent economique " :  V.SECTOR
        CALL STORE.END.ERROR

    END

*****
    RETURN
END
