*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP

*ZIT-UPG-R13-R19:FM,VM converted to @FM,@VM
*               :CONVERT changed to CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.AC.CUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13/S
*  INCLUDE GLOBUS.BP I_COMMON
*  INCLUDE GLOBUS.BP I_EQUATE
*  INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*  INCLUDE GLOBUS.BP I_F.CUSTOMER
*  INCLUDE GLOBUS.BP I_F.ACCOUNT

*ZIT-UPG-R13-R19 S 

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;OMER
    * $INSERT I_EQUATE - Not Used anymore;UNT
	
*ZIT-UPG-R13-R19 E 

*ZIT-UPG-R09-R13/E

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;NT"
    F.CUS.AC=""
    CUS.AC.REC=''
	CUS.ERR=''
    CALL OPF(FN.CUS.AC,F.CUS.AC)

    Y.CUSTOMER=O.DATA

    CALL F.READ(FN.CUS.AC,Y.CUSTOMER,CUS.AC.REC,F.CUS.AC,CUS.ERR)

    IF CEB.SystemTables.getVFunction()THEN
*ZIT-UPG-R13-R19 S
*       CONVERTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusS.AC.REC
		CHANGE @FM TO @VM IN CUS.AC.REC
*FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus 
        R.RECORD<33>=CUS.AC.REC
    END

    RETURN
END
