* @ValidationCode : MjotOTMxMzg0MDY4OkNwMTI1MjoxNjAwNjE0MTQwMzU0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 16:02:20
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>-10</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM,VM to @FM, @VM, CONVERT to CHANGE
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1

SUBROUTINE BIAT.IS.REST.FICH.REMET(ENQ.DATA)
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*
*------------------------------------------------------------------------
* 25 / 04 / 2010
*-------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
*-------------------------------------------------------------
    GOSUB MAIN
RETURN
*-------------------------------------------------------------
MAIN:
    NBR.LOTS = 0
    V.VM = DCOUNT(ENQ.DATA<2>,@VM)
    FOR I = 1 TO V.VM
        IF ENQ.DATA<2,I> EQ 'LOT.PROCESS.ID' THEN
            LIST.LOTS = ENQ.DATA<4,I>
            NBR.LOTS = DCOUNT(LIST.LOTS,@VM)
            CHANGE @VM TO @FM IN LIST.LOTS
            LOT.PRO = LIST.LOTS<1> : "..."
            FOR J = 2 TO NBR.LOTS
                LOT.PRO := " " : LIST.LOTS<J> : "..."
            NEXT J
            ENQ.DATA<3,I> = "LK"
            ENQ.DATA<4,I> = LOT.PRO
            I = V.VM
        END
    NEXT I
RETURN
END