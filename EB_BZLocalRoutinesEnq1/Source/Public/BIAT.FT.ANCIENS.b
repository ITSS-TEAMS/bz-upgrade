* @ValidationCode : MjotMjYxNTcxMzI1OkNwMTI1MjoxNjAwNjEzODgzODkxOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 15:58:03
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
* <Rating>-20</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted VM to @VM
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE BIAT.FT.ANCIENS(ENQ.DATA)
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
    $USING EB.DataAccess
    $USING EB.ErrorProcessing
    $USING EB.BZLocalTable1
    $USING EB.BZLocalTable2
    $USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*
*------------------------------------------------------------------------
* 24 / 04 / 2010
*-------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;
*-------------------------------------------------------------
    GOSUB MAIN
RETURN
*-------------------------------------------------------------
MAIN:

OPEN.FILE:
    DATE.LIMITE = EB.SystemTables.getToday()
    EB.API.Cdt('',DATE.LIMITE,'-2W')

    V.VM = DCOUNT(ENQ.DATA<2>,@VM) + 1

    ENQ.DATA<2,V.VM> = 'PROCESSING.DATE'
    ENQ.DATA<3,V.VM> = 'LE'
    ENQ.DATA<4,V.VM> = DATE.LIMITE
RETURN
END
