*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CARD.MAJ.PLAFOND.RETRAIT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------
* Modification History :                                                     
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP             
*                   $INCLUDE GLOBUS.BP to $INCLUDE ../T24.BP    

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED           
*----------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
	
*ZIT-UPG-R13-R19/S	
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON
*$INSERT BP I_F.TNA.CARD.LIMITS
$INSERT I_F.TNA.CARD.LIMITS 
*ZIT-UPG-R09-R13/E
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;TS='F.TNA.CARD.LIMITS'
    F.TNA.CARD.LIMITS=''
	R.CARD.LIMITS = ''
	ERR = ''
    CODE.PRODUIT = O.DATA
    CALL OPF(FN.TNA.CARD.LIMITS,F.TNA.CARD.LIMITS)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ITS,CODE.PRODUIT,R.CARD.LIMITS,F.TNA.CARD.LIMITS,ERR)

    Y.RES = R.CARD.LIMITS<LIMITS.PRROCESSING.CODE>
    CHANGE @VM TO @FM IN Y.RES
    NBR.LI = DCOUNT(Y.RES,@FM)
    Y.LIMS = R.CARD.LIMITS<LIMITS.PER.NAT.AMT>
    CHANGE @VM TO @FM IN Y.LIMS        ;*

    FOR K = 1 TO NBR.LI
*RETRAIT
        IF Y.RES<K> EQ '2' THEN
            Y.LIFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus            Y.LIMSS = Y.LIMSS[1,LEN(Y.LIMSS)-4FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus   NEXT K
    O.DATA = Y.LIMSS
    RETURN
