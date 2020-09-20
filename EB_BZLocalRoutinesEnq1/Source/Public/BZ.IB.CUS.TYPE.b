*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IB.CUS.TYPE
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
*ZIT-UPG-R13-R19:  VM converted @VM.
*------------------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S  
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.CUSTOMER 
    $INSERT I_COMMON        
    $INSERT I_EQUATE        
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER    
*ZIT-UPG-R09-R13/E
    VALEUR=O.DATA
    
    BEGIN CASE
    CASE VALEUR MATCHES '8000':@VM:'8100':@VM:'8300':@VM:'8400':@VM:'8101'
* $INSERT I_COMMON - Not Used anymore;    CASE VALEUR MATCHES '8200'
* $INSERT I_EQUATE - Not Used anymore;
    CASE 1
        O.DATA='E'

 END CASE
    RETURN 
END
