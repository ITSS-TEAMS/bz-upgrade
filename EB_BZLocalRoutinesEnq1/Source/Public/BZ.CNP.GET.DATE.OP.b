*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"                                                     
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP                   
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.CNP.GET.DATE.OP
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.FUNDS.TRANSFER
    
$INSERT I_COMMON          
$INSERT I_EQUATE          
$INSERT I_ENQUIRY.COMMON  
$INSERT I_F.FUNDS.TRANSFER


*ZIT-UPG-R09-R13/E

* $INSERT I_EQUATE - Not Used anymore;RANSFER"
    F.FT=""
    REC.FT=''
    ERR.FT=''

    FN.FT.HIST="F.FUNDS.TRANSFER$HIS"
    F.F.HIST=""
    REC.FT.HIST=''
    ERR.FT.HIST=''

    CALL OPF(FN.FT,F.FT)
    CALL OPF(FN.FT.HIST,F.FT.HIST)

    REF.FT=O.DATA
    CALL F.READ(FN.FT,REF.FT,REC.FT,F.FT,ERR.FT)

    IF REB.SystemTables.getVFunction()" THEN
        V.DATE.OP=REC.FT<FT.PROCEFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    O.DATA=V.DATE.OP
    END ELSE
        REFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus:";1"
        CALL F.READ(FN.FT.HIST,REF.FT.HIST,REC.FT.HIST,F.FT.HIST,ERR.FT.HIST)
        V.DATE.OP=REC.FT.HIST<FT.PROCESSING.DATE>
        O.DATA=V.DATE.OP
    END

    RETURN
END
