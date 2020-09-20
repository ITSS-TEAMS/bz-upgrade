$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BLD.DEPT.FILTER(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*--------------------------------------------------------------------------------------------------------------------------------
* Company Name        : ITSS
*--------------------------------------------------------------------------------------------------------------------------------
*
* Development by      : Imthathullah A
* Development date    : 29 Jan 2018
* Subroutine type     : ENQUIRY
* Attached to         : BZ.IJ.READY.TERM.ASSIGN, BZ.IJ.AUT.DEL.TERM.ASSIGN, BZ.IJ.TERM.ASSIGNED & BZ.IJ.TERM.FAILURE
* Attached as         : Build routine
* Description         : Filter the records to be displayed for corresponding users based on the Agence
*
*--------------------------------------------------------------------------------------------------------------------------------
*MODIFICATION HISTORY:
*---------------------------------------------------------
*ZIT-UPG-R13-R19:COMMENTED OPF FOR USER APPLICATION AS IT CONTAINS CURRENT USER
*--------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER

* $INSERT I_EQUATE - Not Used anymore;'
*    F.USER=''
*	R.USER = ''
*	ERR1 = ''

*    CALL OPF (FN.USER,F.USER)

*    CALL F.READ (FN.USER,OPERATOR,R.USER,F.USER,ERR1)
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    ENQ.DATA<2,-1> = 'AGENCY'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> =  DEPART.CODE

    RETURN
END
