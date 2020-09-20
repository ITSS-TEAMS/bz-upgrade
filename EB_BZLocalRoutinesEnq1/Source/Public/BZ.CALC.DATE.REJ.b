*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CALC.DATE.REJ
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP     
*ZIT-UPG-R13-R19     :  No Changes.                      
*-----------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/S
*$INSERT BP I_F.BZ.MDP.REGISTRE.EFF
$INSERT I_F.BZ.MDP.REGISTRE.EFF
*ZIT-UPG-R09-R13/E
           DATE.COMP = O.DATA
    IF DATE.COMP NE '' THEN

        CALL CDT('',DATE.COMP,'+1W')

        O.DATA = DATE.COMP
    END ELSE
O.DATA =''

END

    RETURN

END
