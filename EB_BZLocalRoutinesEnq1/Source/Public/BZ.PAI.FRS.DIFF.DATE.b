*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PAI.FRS.DIFF.DATE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R09-R13 / E

    DATE.EMISSION=O.DATA
    DATE.JOUR=TODAY

* $INSERT I_COMMON - Not Used anymore;SION) EQ 8 THEN
* $INSERT I_EQUATE - Not Used anymore;C'
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;SSION,DATE.JOUR,NB.JOURS)

        O.DATA=NB.JOURS
    END ELSE
        O.DATA=""
    END


    RETURN

END
