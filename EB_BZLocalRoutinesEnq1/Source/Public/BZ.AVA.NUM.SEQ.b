*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.AVA.NUM.SEQ
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
    $INSERT I_ENQUIRY.COMMON


    Y.NUM.SEQ = O.DATA

* CALL ALLOCATE.UNIQUE.TIME(IDENTIF.UNIQUE)

    *ID.MVMT=Y.NUM.SEQ:TODAY:IDENTIF.UNIQUE
    Y.TIME = OCONV(TIME(), "MTS")
    CHANGE ':' TO '' IN Y.TIME
    ID.MVMT=Y.NUM.SEQ:TODAY:Y.TIME

* $INSERT I_COMMON - Not Used anymore;

    RETURN

END
