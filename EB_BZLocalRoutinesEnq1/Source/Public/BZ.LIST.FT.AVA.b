*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.FT.AVA(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*------------------------------------------------------------------------
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_F.BZ.AVA.MVMT
    
*ZIT-UPG-R09-R13/E
*-------------------------------------------------------------
    REF.MVMT=R.NEW(AVA.MVT.REF.MVMT)

* $INSERT I_EQUATE - Not Used anymore;RANSFER"
    F.FT=""
    REC.FT=''
    FT.ERR=''

    FN.FT.HIS="F.FUNDS.TRANSFER$HIS"
    F.FT.HIS=""



    CALL OPF(FN.FT,F.FT)
    CALL F.READ(FN.FT,REF.MVMT,REC.FT,F.FT,FT.ERR)

    IF REC.FT THEN
        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
        EB.SystemTables.getVFunction(),1> = REF.MVMEB.SystemTables.getVFunction() ELSE
        ENQFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusMT:";1"
    END
    RETURN
END
 
