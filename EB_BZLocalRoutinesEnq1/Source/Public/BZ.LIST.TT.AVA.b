*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LIST.TT.AVA(ENQ.DATA)
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
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP,$INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_F.TELLER
*    INCLUDE BP I_F.BZ.AVA.MVMT
$INSERT I_F.TELLER
$INSERT I_F.BZ.AVA.MVMT
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;*-------------------------------------------------------------
   
   REF.MVMT=R.NEW(AVA.MVT.REF.MVMT)

    FN.TT="F.TELLER"
    F.TT=""
	REC.TT = ''
	TT.ERR = ''
	
    FN.TT.HIS="F.TELLER$HIS"
    F.TT.HIS=""



    CALL OPF(FN.TT,F.TT)
tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction().TT,REF.MVMT,tmp.V$FUNCTIONT,TT.ERR)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    IFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus      ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    ENQ.DATA<4,1> = REF.MVMT
    END ELSE
        ENQ.DATA<2,1> = '@ID'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = REF.MVMT:";1"
    END
    RETURN
END
