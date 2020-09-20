*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* ZIT-UPG-R13-R19      : ARITHEMATIC OPERATOR CHANGED TO T24 OPERATORS  
* ----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.BUILD.ADDRESS.CONV(ENQ.DATA)
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

    LOCATE 'CUSTOMER' IN ENQ.DATA<2,1> SETTING ENQ.POS THEN
        IF ENQ.DATA<3,ENQ.POS> EQ 'EQ' AND ENQ.DATA<4,ENQ.POS> NE '' THEN
            ENQ.DATA<2,ENQ.POS> = '@ID'
            ENQ.DATA<3,ENQ.POS> = 'LK'
            ENQ.DATA<4,ENQ.POS> = '"...':"'.C-":ENQ.DATA<4,1>:".'":'..."'
        END
    END
    RETURN
END
