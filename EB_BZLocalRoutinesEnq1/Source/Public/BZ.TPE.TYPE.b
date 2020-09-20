*-------------------------------
*Author ameni younes
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TPE.TYPE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.BZ.SM.AFFILIATION
*-----------------------------
    GOSUB INIT
    GOSUB MAIN
RETURN
*----------------------------
INIT:
    FN.BZ.SM.AFFI="F.BZ.SM.AFFILIATION"
    F.BZ.SM.AFFI=""
    CALL OPF(FN.BZ.SM.AFFI,F.BZ.SM.AFFI)
    Y.ID=O.DATA
RETURN
*-------------------------
MAIN:
* $INSERT I_EQUATE - Not Used anymore;    IF ( Y.ID EQ "256") THEN
        Y.TYPE="KIT"
    END
    IF ( Y.ID EQ "258") THEN
        Y.TYPE="TPE"
    END
    IF (Y.TYPE NE '') THEN
        O.DATA = Y.TYPE
    END ELSE
        O.DATA = ''
    END
RETURN
