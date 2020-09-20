*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT; RENAMED THE ACTIVITY VARIABLE TO Y.ACTIVITY
*-----------------------------------------------------------------------------    
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PROCESS.ACTIVITE2
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
    *INCLUDE GLOBUS.BP I_F.PW.PROCESS
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PW.PROCESS


*ZIT-UPG-R09-R13/E
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;<7>

    ACT = Y.ACTIVITY<1,2>

    O.DATA = ACT

RETURN
END
