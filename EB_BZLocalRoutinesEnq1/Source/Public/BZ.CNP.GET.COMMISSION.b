*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.CNP.GET.COMMISSION
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.FUNDS.TRANSFER


$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER




*ZIT-UPG-R09-R13/E
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;HIS"
    F.FT.HIST=""
    REC.FT.HIST=''
    ERR.FT.HIST=''

    FN.FT="F.FUNDS.TRANSFER"
    F.FT=""
    REC.FT=''
    ERR.FT=''

    CALL OPF(FN.FT,F.FT)
    CALL OPF(FN.FT.HIST,F.FT.HIST)

    REF.FT=O.DATA
tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction().FT,REF.FT,REtmp.V$FUNCTIONERR.FT)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    IF REFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus        V.COMM.AMT=REC.FT<FT.COMMISSION.AMT,1>FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSSION.AMT=V.COMM.AMT[4,8]
        O.DATA=V.COMMISSION.AMT
    END ELSE
        REF.FT.HIST=O.DATA :";1"

        CALL F.READ(FN.FT.HIST,REF.FT.HIST,REC.FT.HIST,F.FT.HIST,ERR.FT.HIST)
        V.COMM.AMT=REC.FT.HIST<FT.COMMISSION.AMT,1>
        V.COMMISSION.AMT=V.COMM.AMT[4,8]
        O.DATA=V.COMMISSION.AMT
    END
    RETURN
END
