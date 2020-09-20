*-----------------------------------------------------------------------------
* <Rating>-30</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE OPERATOR.DEPT.CODE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
**-----------------------------------------------------------------------------
  

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON    
$INSERT I_F.USER
$INSERT I_F.CEC.INWARD



    GOSUB INITIALISE
    GOSUB OPEN.FILES
    GOSUB PROCESS.DATA

    RETURN

*-------------------------------------------
INITIALISE:
    DEPT.CODE=''
* $INSERT I_EQUATE - Not Used anymore;
    FN.USER = 'F.USER'
    F.USER = ''   
    RETURN
*-----------------------------------------------
PROCESS.DATA:
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;USER,F.USER,USER.ERR)
    DEPT.CODE = R.USER <EB.USE.DEPARTMENT.CODE>
    DEPT.CODE=FMT(DEPT.CODE , "R%3")
    ENQ.DATA<2,1> = "INITIAL.BRANCH"
    ENQ.DATA<3,1> = "EQ"
    ENQ.DATA<4,1> = DEPT.CODE

  
    RETURN

*-------EB.SystemTables.getVFunction()-------------EB.SystemTables.getVFunction()------
OPEN.FILESFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.USER, F.USER)

    RETURN

*------------FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus------------------------------------------
END
