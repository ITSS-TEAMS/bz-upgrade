*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE PACS.LENDING.EXTRACT.RUN
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
    $INSERT I_S.COMMON
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_GTS.COMMON
    $INSERT I_F.PACS.LENDING.EXTRACT


    IF GTSACTIVE THEN         ;* phantom only for browser
        P.COMMAND = 'PHANTOM UNIQUE PACS.LENDING.EXTRACT.EXEC ':ID.NEW:'*':OPERATOR:'*':ID.COMPANY
        EXECUTE P.COMMAND CAPTURING V$SENTENCE
        CRT V$SENTENCE
    END ELSE
        CALL PACS.LENDING.EXTRACT.SUB
    END

    RETURN
END
