$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.COMM.ATT.RESTRICT(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com
*-------------------------------------------------------------
*Modification history :
*ZIT-UPG-R13-R19: Converted VM TO @VM.
*---------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.ENQUIRY

*-------------------------------------------------------------
    FN.USER='F.USER'
    F.USER=''
    CALL OPF (FN.USER,F.USER)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    NOMBRE=0
    NOMBRE=DCOUNT(ENQ.DATA<2>,@VM)
* $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;PT.CODE'
    ENQ.DATA<3,NOMBRE> = 'EQ'
    ENQ.DATA<4,NOMBRE> = DEPART.CODE

    RETURN
END
