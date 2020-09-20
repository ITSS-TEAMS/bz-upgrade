*****************************
*AUTHOR AMENI YOUNES
*****************************

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.ISRAC
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*********************************
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED;
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
**************************
    GOSUB INIT
    GOSUB MAIN
    RETURN
**************************
INIT:

    FN.AC="F.ACCOUNT"
    F.AC=""
	AC.REC = ''
	AC.ERR = ''

    COMPTE=O.DATA
    CALL OPF(FN.AC,F.AC)
    RETURN
**************************
MAIN:
    CALL F.READ(FN.AC,COMPTE,AC.REC,F.AC,AC.ERR)
    Y.CATEGORY=AC.REC<AC.CATEGORY>
    IF (Y.CATEGORY EQ '1001') OR (Y.CATEGORY EQ '1010') THEN
        O.DATA=1
    END ELSE
        O.DATA=0
    END
    RETURN
