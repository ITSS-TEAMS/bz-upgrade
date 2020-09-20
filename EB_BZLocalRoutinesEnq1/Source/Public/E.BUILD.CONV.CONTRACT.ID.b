*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
* ZIT-UPG-R13-R19  : Arthimetic operators converted to operands.
*--------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.BUILD.CONV.CONTRACT.ID(ENQ.DATA)
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
    LOCATE 'CONTRACT.ID' IN ENQ.DATA<2,1> SETTING ENQ.POS THEN
        IF ENQ.DATA<3,ENQ.POS> EQ 'EQ' AND ENQ.DATA<4,ENQ.POS> NE '' THEN
            ENQ.DATA<2,ENQ.POS> = '@ID'
            ENQ.DATA<3,ENQ.POS> = 'LK'
            ENQ.DATA<4,ENQ.POS> = ENQ.DATA<4,ENQ.POS>:'...' 
        END
    END
    RETURN
END
