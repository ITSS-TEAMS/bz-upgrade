*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19:GET.LOC.REF converted to MULTI.GET.LOC.REF
*-----------------------------------------------------------------------------
* Version 1.0 16/06/17  GLOBUS Release No. R13
* ---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AFFICHAGE.REF
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------------
*-- @DESC    : Routine permet d'afficher les references des contrats
*-- @Author  : Maroua Chikhaoui
*-----------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.AC.CHARGE.REQUEST

    V.REF = FIELD(O.DATA,"-",2)
    V.CATEG = FIELD(O.DATA,"-",1)
    REFDEM = ""
	R.ACCR=''
	R.FT=''

    F.FUNDS.TRANSFER = ""
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;TRANSFER"
    CALL OPF(FN.FUNDS.TRANSFER, F.FUNDS.TRANSFER)

    F.FUNDS.TRANSFER.HIS = ""
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;FUNDS.TRANSFER$HIS"
    CALL OPF(FN.FUNDS.TRANSFER.HIS, F.FUNDS.TRANSFER.HIS)

    F.AC.CHARGE.REQUEST = ""
    FN.AC.CHARGE.REQUEST = "F.AC.CHARGE.REQUEST"
    CALL OPF(FN.AC.CHARGE.REQUEST, F.AC.CHARGE.REQUEST)

    F.AC.CHARGE.REQUEST.HIS = ""
    FN.AC.CHARGE.REQUEST.HIS = "F.AC.CHARGE.REQUEST$HIS"
    CALL OPF(FN.AC.CHARGE.REQUEST.HIS, F.AC.CHARGE.REQUEST.HIS)
	
*ZIT-UPG-R13-R19 S
	Y.APPLICATION.NAME='FUNDS.TRFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.NAME='REF.DEMANDE'
	Y.POS=''
	CALL MULTI.GEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusCATION.NAME,Y.FIELD.NAME,Y.POS)
	POS.REFDEM=Y.POS<1,1>
*ZIT-UPG-R13-R19 E

    IF V.CATEG EQ 52354 OR V.CATEG EQ 52355 THEN
	    ERR.ACCR=''
        CALL F.READ(FN.AC.CHARGE.REQUEST,V.REF,R.ACCR,F.AC.CHARGE.REQUEST,ERR.ACCR)
        IF NOT(ERR.ACCR)THEN
        REFDEM = R.ACCR<CHG.EXTRA.DETAILS>
    END ELSE
	    ERR.ACCR1=''
        CALL F.READ.HISTORY(FN.AC.CHARGE.REQUEST.HIS,V.REF,R.ACCR,F.AC.CHARGE.REQUEST.HIS,ERR.ACCR1)
        REFDEM = R.ACCR<CHG.EXTRA.DETAILS>
    END
END

IF V.CATEG EQ 52580 OR V.CATEG EQ 52581 THEN
    ERR.FT=''
    CALL F.READ(FN.FUNDS.TRANSFER,V.REF,R.FT,F.FUNDS.TRANSFER,ERR.FT)
    IF NOT(ERR.FT)THEN
*   CALL GET.LOC.REF('FUNDS.TRANSFER','REF.DEMANDE',POS.REFDEM)
    REFDEM = R.FT<FT.LOCAL.REF,POS.REFDEM>
END ELSE
    ERR.FT1=''
    EB.DataAccess.OpfEAD.HISTORY(FN.FUNDS.TRANSFER.HIS,V.REF,R.FT,F.FUNDS.TRANSFER.HIS,ERR.FT1)
*   EB.DataAccess.Opf.LOC.REF('FUNDS.TRANSFER','REF.DEMANDE',POS.REFDEM)
    REFDEM = R.FT<FT.LOCAL.REF,POS.REFDEM>
END
END

O.DATA = REFDEM

RETURN
