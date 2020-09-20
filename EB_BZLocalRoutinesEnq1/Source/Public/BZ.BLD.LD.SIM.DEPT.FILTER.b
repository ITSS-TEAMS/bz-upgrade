$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BLD.LD.SIM.DEPT.FILTER(ENQ.DATA)
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
* Development date    : 28 May 2018
* Subroutine type     : ENQUIRY
* Attached to         : BZ.IJ.SOLD.LDS
* Attached as         : Build routine
* Description         : Filter the records to be displayed for corresponding users based on the Agence
*
*--------------------------------------------------------------------------------------------------------------------------------
*** Modification History - 
*** "ZIT-UPG-R013-R19"
*--------------------------------------------------------------------------------------------------------------------------------
*
*--------------------------------------------------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;

    FN.USER='F.USER'
    F.USER=''

    CALL OPF (FN.USER,F.USER)

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;.DEPARTMENT.CODE>

    ENQ.DATA<2,-1> = 'MIS.ACCT.OFFICER'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> =  DEPART.CODE

    RETURN
END
