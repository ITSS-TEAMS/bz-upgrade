*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
*------------------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : Build routine added to BZ.MDP.CHEQUES.STOPPED (JIRA REF: ZTZ-27)

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE SOF.BLD.RTN.1(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R13-R19/E
	
	POS.FM = ''
	POS.VM = ''
    FIND '@ID' IN ENQ.DATA SETTING POS.FM,POS.VM ELSE POS.VM = '' POS.FM= ''
    ENQ.DATA<3,POS.VM> = 'LK'
    ENQ.DATA<4,POS.VM> = 'CURR.' : ENQ.DATA<4,POS.VM> : '....'
END
