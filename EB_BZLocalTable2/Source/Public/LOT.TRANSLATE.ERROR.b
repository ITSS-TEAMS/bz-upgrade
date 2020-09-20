* @ValidationCode : MjotMTc1NTc2MDk1OkNwMTI1MjoxNjAwNTYxNDcxMDY3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTpmYWxzZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:24:31
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : false
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>696</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE LOT.TRANSLATE.ERROR(MESG.ERROR,MESG.LEVEL)
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-ARITHEMETIC OPERATIONS TO OPERANDS,FM TO @FM
*-----------------------------------------------------------------------------
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.DataAccess
    $USING EB.Security
    $USING EB.ErrorProcessing
    $USING EB.Display

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_F.EB.ERROR - Not Used anymore;
* $INSERT I_F.USER - Not Used anymore;
*    $INSERT I_LOTERR
* $INSERT I_EB.ERROR.COMMON - Not Used anymore;

    LOT.MESG.ID = MESG.ERROR<1> ;* Initial key of EB.ERROR
    LOT.MESG.ET = MESG.ERROR    ;* First language message
    LOT.MESG.TT = MESG.ERROR    ;* User language message
    ERROR.ID = LOT.MESG.ID

    EB.ErrorProcessing.GetErrorMessage(MESG.ERROR)
    IF ERROR.ID[3,1] EQ '.' THEN ERROR.ID = ERROR.ID[".",1,1]:"-":ERROR.ID[".",3,999]
    LOCATE ERROR.ID IN EB.ErrorProcessing.getCErrErrorIdCache()<1> SETTING ERR.POS THEN
        R.EB.ERROR = EB.ErrorProcessing.getCErrErrorRecs(ERR.POS)
        SAVE.MESG.ERROR = MESG.ERROR<1>
        LOT.MESG.TT<1> =  R.EB.ERROR<EB.ErrorProcessing.Error.ErrErrorMsg,1>
        IF LOT.MESG.TT<1> EQ '' THEN LOT.MESG.TT<1> = SAVE.MESG.ERROR
        MESG.ERROR<1> = R.EB.ERROR<EB.ErrorProcessing.Error.ErrErrorMsg,EB.SystemTables.getLngg()>
        IF MESG.ERROR<1> EQ '' THEN MESG.ERROR<1> = SAVE.MESG.ERROR
        IF R.EB.ERROR<EB.ErrorProcessing.Error.ErrLocalRef,1> NE '' THEN
            MESG.LEVEL = R.EB.ERROR<EB.ErrorProcessing.Error.ErrLocalRef,1>[1,1]
            IF MESG.LEVEL LT '0' OR MESG.LEVEL GT '9' THEN MESG.LEVEL = ''
        END
    END

    LOT.MESG.TT = MESG.ERROR<1>:@FM:MESG.ERROR<2>
    MESG.ERROR = MESG.ERROR<1>:@FM:MESG.ERROR<2>

    IF COUNT(MESG.ERROR<1>,"&") GT 0 THEN
        EB.Display.Txt(MESG.ERROR)
        IF COUNT(MESG.ERROR<1>,"&") GT 0 THEN
            TRANS.MSG = TRIM(MESG.ERROR<1>)
            TRANS.NMG = '' ; IE = 0
            STR.LEN = LEN(TRANS.MSG)
            FOR IJ = 1 TO STR.LEN
                BEGIN CASE
                    CASE TRANS.MSG[IJ,1] EQ '&'
                        IF IE GT 1 AND TRANS.MSG[IJ-1,2] EQ ' &' THEN IE-= 1
                    CASE 1
                        IE+=1 ; TRANS.NMG[IE,1] = TRANS.MSG[IJ,1]
                END CASE
            NEXT IJ
            STR.LEN = LEN(TRANS.NMG)
            IF TRANS.NMG[STR.LEN,1] EQ ' ' THEN TRANS.NMG = TRANS.NMG[1,STR.LEN-1]
            MESG.ERROR<1> = TRANS.NMG
*2009       CHANGE '&' TO '' IN MESG.ERROR<1>
        END
    END

    MESG.ERROR = MESG.ERROR<1>

RETURN

*-----------------------------------------------------------------------
END
