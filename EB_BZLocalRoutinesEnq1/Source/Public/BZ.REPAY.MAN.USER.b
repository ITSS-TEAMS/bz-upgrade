*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.REPAY.MAN.USER(ENQ.DATA)
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
*-----------------------

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E

    FN.USER='F.USER'
    F.USER=''
    R.USER=''
    ERR1=''
    CALL OPF (FN.USER,F.USER)
* $INSERT I_COMMON - Not Used anymore;USER,OPERATOR,R.USER,F.USER,ERR1)

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;USE.DEPARTMENT.CODE>

    SEL=ENQ.DATA<4>

    IF SEL EQ '' THEN
        ARGUM =1
    END ELSE

        NOMBRE=COUNT(SEL,@VM)
        ARGUM=NOMBRE+2
    END

    ENQ.DATA<2,ARGUM> = 'ACCOUNT.OFFICER'
    ENQ.DATA<3,ARGUM> = 'EQ'
    ENQ.DATA<4,ARGUM> =  DEPART.CODE

    RETURN

END
