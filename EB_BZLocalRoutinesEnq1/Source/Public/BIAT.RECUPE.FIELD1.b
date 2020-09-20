* @ValidationCode : MjoxMjQzNjI1OTg5OkNwMTI1MjoxNjAwNjE0MTI3MjM0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MDpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 16:02:07
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : N/A
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted VM to @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
SUBROUTINE BIAT.RECUPE.FIELD1
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;

    tmp.O.DATA = EB.Reports.getOData()
    EB.Reports.setOData(FIELD(tmp.O.DATA,@VM,1))
    EB.Reports.setOData(tmp.O.DATA)

RETURN

*-----------------------------------------------------------------------
END
