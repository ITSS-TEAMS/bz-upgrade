*---------------------------------------------
*@author Abdelmonaam Mastouri
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:NO CHANGES
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FILTRE.PW.IMMO (ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19  S

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
	
*ZIT-UPG-R13-R19  E

    SELECT.ENQ  = ENQ.DATA<2>

    NB.SEL = DCOUNT(SELECT.ENQ,@VM)

    ENQ.DATA<2,NB.SEL + 1> = 'PROCESS.DEFINITION'
    ENQ.DATA<3,NB.SEL + 1> = 'EQ'
* $INSERT I_COMMON - Not Used anymore;L + 1> = 'MURABAHA.IMMO MURABAHA.IMMO.NEW'

    RETURN
END
