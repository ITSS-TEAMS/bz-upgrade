*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.QUOTE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
	
*------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : NO CHANGES
*------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
*ZIT-UPG-R13-R19/E

    Y.QUOTE.IN=O.DATA
    BEGIN CASE
    CASE Y.QUOTE.IN EQ "0"
        Y.QUOTE.IN ="1"
    CASE Y.QUOTE.IN EQ "1"
        Y.QUOTE.IN = 1:"0"
    CASE Y.QUOTE.IN EQ "2"
* $INSERT I_COMMON - Not Used anymore; 1:"00"
* $INSERT I_EQUATE - Not Used anymore;EQ "3"
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    CASE Y.QUOTE.IN EQ "4"
        Y.QUOTE.IN = 1:"0000"
    CASE Y.QUOTE.IN EQ "5"
        Y.QUOTE.IN = 1:"00000"
    END CASE
    O.DATA=Y.QUOTE.IN
    RETURN
END
