*---------------------------------------------
*@author Abdelmonaam Mastouri
*<abdelmonaam.mastouri@banquezitouna.com>
*---------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FILTRE.DIR.REG(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
	
    FN.USER='F.USER'
    F.USER=''
    R.USER=''
    ERR1=''

    CALL OPF (FN.USER,F.USER)
    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)

* $INSERT I_EQUATE - Not Used anymore;USER<EB.USE.DEPARTMENT.CODE>


    ENQ.DATA<2,-1> = 'DIR.REG'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> = DEPART.CODE
    RETURN
END
