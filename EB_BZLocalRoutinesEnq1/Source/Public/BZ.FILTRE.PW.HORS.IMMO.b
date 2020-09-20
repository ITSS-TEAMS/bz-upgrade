*---------------------------------------------
*@author Abdelmonaam Mastouri le 18/04/2016
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FILTRE.PW.HORS.IMMO (ENQ.DATA)
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

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON

    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

    ENQ.DATA<2,NB.SEL + 1> = 'PROCESS.DEFINITION'
    ENQ.DATA<3,NB.SEL + 1> = 'EQ'
    ENQ.DATA<4,NB.SEL + 1> = 'MURABAHA.NEW.BZ MURABAHA.BZ'

    RETURN
END
