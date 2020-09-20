*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PACS.AC.DATA.EXTRACT.RUN
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*-----------------------------------------------------------------------------
* MODIFICATION HISTORY :

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.PACS.AC.DATA.EXTRACT
*ZIT-UPG-R13-R19/E

    IF GTSACTIVE THEN         ;* phantom only for browser
        P.COMMAND = 'PHANTOM UNIQUE PACS.AC.DATA.EXTRACT.EXEC ':ID.NEW:'*':OPERATOR:'*':ID.COMPANY
        EXECUTE P.COMMAND CAPTURING V$SENTENCE
        CRT V$SENTENCE
    END ELSE
* $INSERT I_EQUATE - Not Used anymore;.DATA.EXTRACT.SUB
    END

    RETURN
END
