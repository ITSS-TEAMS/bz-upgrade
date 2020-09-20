*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT GLOBUS.BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19  : CONVERT TO CHANGE
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PWC.SET.ADDRESS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*ZIT-UPG-R09-R13 / S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON  
    $INSERT I_COMMON         
    $INSERT I_EQUATE         
    $INSERT I_ENQUIRY.COMMON 
    
*ZIT-UPG-R09-R13 / E

    ADDRESS=O.DATA

*    CONVERT "," TO " " IN ADDRESS
	CHANGE "," TO " " IN ADDRESS

* $INSERT I_EQUATE - Not Used anymore;
    RETURN
END
