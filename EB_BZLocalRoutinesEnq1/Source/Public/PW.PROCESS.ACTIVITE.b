*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
* ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INSERT
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, RENAMED ACTIVITY VARIABLE TO Y.ACTIVITY
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PW.PROCESS.ACTIVITE
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
    *INCLUDE GLOBUS.BP I_F.PW.ACTIVITY
$INSERT I_COMMON        
$INSERT I_EQUATE        
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.PW.PROCESS  
$INSERT I_F.PW.ACTIVITY 


* $INSERT I_COMMON - Not Used anymore;    REC = R.RECORD

    Y.ACTIVITY= REC<7>

    NB.ACT = DCOUNT(Y.ACTIVITY,@VM)

    IF NB.ACT EQ 0 THEN

        ACT = Y.ACTIVITY<1,1>

    END
    ELSE

        ACT = Y.ACTIVITY<1,NB.ACT>

    END

    O.DATA = ACT

    RETURN

END
