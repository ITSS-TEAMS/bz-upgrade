*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.REGISTRE.CHQ.RESTRICT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author BounouaraFehmi
*-------------------------------------------------------------
    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_F.USER
    $INSERT  I_F.ACCOUNT
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : INCLUDE GLOBUS.BP to $INCLUDE ../T24_BP
*                 : Issue due to wrong formation of SELECT, Fixed it
*ZIT-UPG-R13-R19  : Converted VM to @VM.
*-----------------------------------------------------------------------------

    FN.USER='F.USER'
    F.USER=''
    CALL OPF (FN.USER,F.USER)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
* $INSERT I_COMMON - Not Used anymore;*    SEL=ENQ.DATA<4>
* $INSERT I_EQUATE - Not Used anymore;L,@VM)
*    ARGUM=NOMBRE+2
    SEL=ENQ.DATA<2>
    NOMBRE=0
    NOMBRE=DCOUNT(ENQ.DATA<2>,@VM)
    ARGUM=NOMBRE+1
*ZIT-UPG-R09-R13/E

    ENQ.DATA<2,ARGUM> = 'UNITE.GESTION'
    ENQ.DATA<3,ARGUM> = 'EQ'
    ENQ.DATA<4,ARGUM> = DEPART.CODE
    RETURN
END
