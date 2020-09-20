* @ValidationCode : MjotNTg3MTIzMDg4OkNwMTI1MjoxNjAwNjEyOTYwMDAwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 15:42:40
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0

$PACKAGE EB.BZTestPack
*
* Implementation of EB.BZLocalTable1.testTrim
*
*
SUBROUTINE TEST.TRIM


    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Reports
    
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_COMMON - Not Used anymore;
    
    LINE="TEST,AAA"
    APP = TRIM(LINE[',',1,1]) ;* EN_20080415 <Start>
    REC.ID = TRIM(LINE[',',2,1])
    
    
RETURN
