*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------*
* Marwen BEN NASR
*-----------------------------------------------------------------------------*
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TMP.WEEKS(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : GLOBUS.BP TO ../T24_BP

* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Variables initialized, Converted VM to @VM
*-----------------------------------------------------------------------------

*ZIT-UPG-R09-R13 / S
*    INCLUDE GLOBUS.BP I_COMMON
*    INCLUDE GLOBUS.BP I_EQUATE
*    INCLUDE GLOBUS.BP I_ENQUIRY.COMMON
*    INCLUDE GLOBUS.BP I_F.USER
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    * $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;) + 1

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    ENQ.DATA<2,V.VM> = 'ACCOUNT.OFFICER'
    ENQ.DATA<3,V.VM> = 'EQ'
    ENQ.DATA<4,V.VM> = DEPART.CODE



RETURN

END
