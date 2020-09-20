*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*---------------------------------------------------------
**ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.IS.CONVERT.PW
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
$INSERT I_F.ENQUIRY
$INSERT I_ENQUIRY.COMMON


    IF FIELD(O.DATA, ' ' , 3) NE 'F3' THEN

        O.DATA = FIELD(O.DATA, ' ' , 1) : ' S ' : FIELD(O.DATA, ' ' , 3)

    END ELSE
        O.DATA = ''
    END

    RETURN
