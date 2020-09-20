$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.BLD.SIM.DEPT.FILTER(ENQ.DATA)
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
* Development by      : ITSS
* Development date    : 9 Jun 2018
* Subroutine type     : ENQUIRY
* Attached to         : BZ.IJ.SOLD.LDS
* Attached as         : Build routine
* Description         : Filter the records to be displayed for corresponding users based on the Agence
*
*--------------------------------------------------------------------------------------------------------------------------------
*** Modification History:
*** "ZIT-UPG-R13-R19"
*--------------------------------------------------------------------------------------------------------------------------------
*
*--------------------------------------------------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;USE.DEPARTMENT.CODE>

    ENQ.DATA<2,-1> = 'AGENCY'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> =  DEPART.CODE

    RETURN
END
