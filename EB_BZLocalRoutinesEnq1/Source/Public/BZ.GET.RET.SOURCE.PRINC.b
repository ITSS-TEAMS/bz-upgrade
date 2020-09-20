*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.RET.SOURCE.PRINC
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------
* Modification History :  
*ZIT-UPG-R13-R19     : Converted GET.LOC.REF to MULTI.GET.LOC.REF.
*-----------------------------------------------------------------------------


    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_F.FUNDS.TRANSFER
    $INSERT I_ENQUIRY.COMMON


    GOSUB INIT
    GOSUB MAIN.PROCESS
    RETURN
*---------------------------------------------------------------------------
*
INIT:
*file opening, variable set up
    FN.FT="F.FUNDS.TRANSFER"
    F.FT=""
* $INSERT I_COMMON - Not Used anymore;.FT)

    RETURN

MAIN.PROCESS:
*main subroutine processing
    ID.FT= O.DATA
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;T,F.FT,E.FT)
*ZIT-UPG-R13-R19/S                         ;*Converted GET.LOC.REF to MULTI.GET.LOC.REF.
   * CALL GET.LOC.REF("FUNDS.TRANSFER","RET.SOURCE",POS.RS)
	Y.LOC.APP = "FUNDS.TRANSFER"
	Y.LOC.FIE =  "RET.SOURCE":@VM:"RET.GAR"
	Y.MPOS = ''
	CALL MULTI.GET.LOC.REF(Y.LOC.APP,Y.LOC.FIE,Y.MPOS)   
   POS.RS = Y.MPOS<1,1>
   POS.RET.GAR = Y.MPOS<1,2>
*ZIT-UPG-R13-R19/E
    V.RSEB.SystemTables.getVFunction()OCAL.REF,POS.EB.SystemTables.getVFunction()  CALL GET.LOC.REFFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus,"RET.GAR",POS.RET.GAR)
    V.RET.GAR=R.FT<FTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusT.GAR>

    IF V.RS NE "" THEN
        IF V.RET.GAR THEN
            RET.SOURCE.PRINC = R.FT<FT.COMMISSION.AMT><1,2>
            O.DATA = RET.SOURCE.PRINC
        END ELSE
            RET.SOURCE.PRINC = R.FT<FT.COMMISSION.AMT><1,1>
            O.DATA=RET.SOURCE.PRINC
        END

        RETURN
    END
