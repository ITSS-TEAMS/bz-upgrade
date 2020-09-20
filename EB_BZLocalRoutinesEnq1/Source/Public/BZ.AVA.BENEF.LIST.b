*-----------------------------------------------------------------------------
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVA.BENEF.LIST(ENQ.DATA)
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
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP
*ZIT-UPG-R13-R19    : NO CHANGES
*-----------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON 
*ZIT-UPG-R09-R13 / S
*$INSERT BP I_F.BZ.AVA.MVMT 
$INSERT I_F.BZ.AVA.MVMT
*ZIT-UPG-R09-R13 / E

        REF.DOSSIER = R.NEW(AVA.MVT.REF.DOSSIER)

    ENQ.DATA<2,1> = 'REF.AVA'
    ENQ.DATA<3,1> = 'EQ'
* $INSERT I_COMMON - Not Used anymore; REF.DOSSIER


    RETURN

END
