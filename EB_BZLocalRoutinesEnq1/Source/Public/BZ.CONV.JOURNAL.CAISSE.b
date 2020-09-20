*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONV.JOURNAL.CAISSE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------- 
* Modification History :                                                             
*ZIT-UPG-R09-R13  :   INCLUDE GLOBUS.BP CHANGED TO ../T24_BP   
*ZIT-UPG-R13-R19     : Arithmatic operators converted to operands.                    
*------------------------------------------------------------------------------------

*ZIT-UPG-R09-R13/S  
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.ACCOUNT
    *INCLUDE GLOBUS.BP I_F.CUSTOMER
    *INCLUDE GLOBUS.BP I_F.TELLER      
    $INSERT I_COMMON        
    $INSERT I_EQUATE        
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT     
    $INSERT I_F.CUSTOMER    
    $INSERT I_F.TELLER      
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
    F.TT=""
    TT.REC=""
    ERR1=""
    CPT.CLIENT=""

    CALL OPF(FN.TT,F.TT)

    IF O.DATA[1,2] NE "TT" THEN RETURN

    REF.TT=O.DATA
    CALL F.READ(FN.TT,REF.TT,TT.REC,F.TT,ERR1)
    COMPTE1=TT.REC<TT.TE.ACCOUNT.1>
    COMPTE2=TT.REC<TT.TE.ACCOUNT.2>
    LONG1=LEN(COMPTE1)
    LONGEB.SystemTables.getVFunction()TE2)
    IF LONG1 EQ 10 THEN
        CPFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    END
    IF LONG2 EQ 10 THEN
        CPTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus    END

    O.DATA=CPT.CLIENT
    RETURN
END
