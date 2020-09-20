*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CONV.CATEG
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :                                                      
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP                  
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13/S
    *INCLUDE GLOBUS.BP I_COMMON
    *INCLUDE GLOBUS.BP I_EQUATE
    *INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
    *INCLUDE GLOBUS.BP I_F.ACCOUNT
$INSERT I_COMMON         
$INSERT I_EQUATE         
$INSERT I_ENQUIRY.COMMON 
$INSERT I_F.ACCOUNT      
*ZIT-UPG-R09-R13/E
    VALEUR=O.DATA
    IF VALEUR EQ '0' THEN
        O.DATA='P'
    END
* $INSERT I_COMMON - Not Used anymore; THEN    
* $INSERT I_EQUATE - Not Used anymore;    END

    RETURN
END
