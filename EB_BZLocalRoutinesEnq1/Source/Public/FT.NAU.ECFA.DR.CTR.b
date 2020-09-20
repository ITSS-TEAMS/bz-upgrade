*-----------------------------------------------------------------------------
* Version 1.0 15/06/17  GLOBUS Release No. R13
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE FT.NAU.ECFA.DR.CTR(ENQUIRY.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* @author Jmal Firas
*-----------------------
* Modification History :
*ZIT-UPG-R13-R19 :  No Changes.
* ------------------------------------------------------------------------
* <region name= Inserts>
    $INSERT  I_COMMON
    $INSERT  I_EQUATE
    $INSERT  I_ENQUIRY.COMMON
    $INSERT  I_F.USER
    $INSERT  I_F.DEPT.ACCT.OFFICER
    $INSERT  I_F.ENQUIRY
* </region>

*************OPEN.FILE

    F.DEPT = ""
* $INSERT I_COMMON - Not Used anymore;.ACCT.OFFICER"
* $INSERT I_EQUATE - Not Used anymore;, F.DEPT)

*************GET.DEPTLIST

    UDEPT = R.USER<EB.USE.DEPARTMENT.CODE>
    *CALL F.READ(FN.DEPT,UDEPT,R.DEPT,F.DEPT,ERR.PARAM)
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;PARENT>
    MY.QUERY = "SELECT F.DEPT.ACCT.OFFICER WITH DEPT.PARENT EQ " : UDEPT
    CALL EB.READLIST(MY.QUERY,DEPTS,"",NB.REC,ERR.SEL)
    CHANGE @FM TO ' ' IN DEPTS

*************PROCESS

    ENQFILE = "" : R.ENQ<ENQ.FILE.NAME> : ""

    IF ENQFILE EQ "FUNDS.TRANSFER$NAU" THEN
        EB.SystemTables.getVFunction()EPT.CODE"
    END ELSE
        DEPTF = FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    END

    LOCATE DEPTF IN ENQUIRY.DATA<2FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEPT THEN

        ENQUIRY.DATA<4,POS.DEPT> = DEPTS
        ENQUIRY.DATA<3,POS.DEPT> = "EQ"

    END ELSE

        NBC = DCOUNT(ENQUIRY.DATA<2.1>,@SM)
        NBC += 1
        ENQUIRY.DATA<4,NBC> = DEPTS
        ENQUIRY.DATA<3,NBC> = "EQ"
        ENQUIRY.DATA<2,NBC> = DEPTF

    END

    RETURN
