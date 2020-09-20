*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History :  
*ZIT-UPG-R13-R19     :  No Changes.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENG.COM.MODIF
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


    BZ.OVERRIDE = 'BZ.ENG.REMB.ANTI.COM'
    OVER = O.DATA
    O.DATA = 'NO'
    NBR.OVER=DCOUNT(OVER,@VM)
    SEP = '}'
    FOR COUNTER=1 TO NBR.OVER

        OV=OVER<1,COUNTER>
        OV.1 = FIELD(OV,SEP,1)
        IF OV.1 EQ BZ.OVERRIDE THEN

* $INSERT I_COMMON - Not Used anymore; 'YES'
            BREAK

        END

    NEXT COUNTER

    RETURN
END
