*-------------------------------------
*Author ameni younes
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:NO CHANGES
*-------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.SAL.NET.TND
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.CUSTOMER
*------------------------------------------------------------
    GOSUB INIT
    GOSUB MAIN
    RETURN
*------------------------------------------------------------
INIT:
    CURRENCY.MARKET = 1
    CHG.AMT = 0
    BASE.CCY = ""
    EXCH.RATE = ""
    LCL.AMT = 0
    Y.SAL=O.DATA
* $INSERT I_EQUATE - Not Used anymore;.SAL,':',1)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
    RETURN
*------------------------------------------------------------
MAIN:
    CALL EXCHRATE(CURRENCY.MARKET, Y.DEV, Y.SALARY, "TND", CHG.AMT, BASE.CCY, EXCH.RATE, "", LCL.AMT, "")
    O.DATA = LCL.AMT

    RETURN

   RETURN
