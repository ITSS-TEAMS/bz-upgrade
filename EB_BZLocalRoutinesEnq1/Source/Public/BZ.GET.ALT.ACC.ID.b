*-----------------------------------------------------------------------------
* <Rating>100</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.GET.ALT.ACC.ID
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-INITIALISED F.READ VARIABLES.
********************************************************
    
	$INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT


    FN.ACC="F.ACCOUNT"
    F.ACC=""
	AC.REC=""
	ACC.ERR=""
    CALL OPF(FN.ACC,F.ACC)

    NUM.ACC=O.DATA

* $INSERT I_COMMON - Not Used anymore;CC,NUM.ACC,AC.REC,F.ACC,ACC.ERR)

    IF AC.REC THEN

        CATEGORY=AC.REC<AC.CATEGORY>

        IF CATEGORY NE 8108 THEN
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;CCT.ID>
        END ELSE
            RIB='2500000000':NUM.ACC:'00'
        END
        O.DATA=RIB
    END
    RETURN
END
