*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
*
* @description :
*---------------------------------------------

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COF.MODIF.FACT.INPUT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3


    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13/s
*   $INSERT BP I_F.BZ.COFFRE.CONTRAT
$INSERT I_F.BZ.COFFRE.CONTRAT
*ZIT-UPG-R09-R13/e

PROCESS:
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;ACTURATION) NE R.OLD(CF.CT.COMPTE.FACTURATION) THEN
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;LD)=R.OLD(CF.CT.COMPTE.FACTURATION)
    END
    RETURN
END
