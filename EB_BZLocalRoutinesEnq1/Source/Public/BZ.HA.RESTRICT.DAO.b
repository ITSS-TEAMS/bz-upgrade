*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.HA.RESTRICT.DAO(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author Fahmi.abdeltif@banquezitouna.com
*-------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-VM TO @VM;INITIALISED VARIABLES
********************************************************
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.ENQUIRY

*-------------------------------------------------------------
*
*    FN.USER='F.USER'
*    F.USER=''
*    CALL OPF (FN.USER,F.USER)   ;*R.USER DOES NOT REQUIRE OPF FOR CURRENT USER
    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>

    F.DEPT = ""
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;FICER"
    CALL OPF(FN.DEPT, F.DEPT)
	
	DEPTS=''
	NB.REC=''
	ERR.SEL=''
    SEL = "SELECT F.DEPT.ACCT.OFFICER WITH DEPT.PARENT EQ " :DEPART.CODE
    CALL EB.READLIST(SEL,DEPTS,"",NB.REC,ERR.SEL)
    CHANGE @FM TO ' ' IN DEPTS

    NOMBRE=0
    NOMBRE=DCOUNT(ENQ.DATA<2>,@VM)
    NOMBRE=NOMBRE+1

    ENQ.DATA<2,NOMBRE> = 'DEPT.CODE'
    ENQ.EB.SystemTables.getVFunction()BRE> = 'EQ'
    ENQ.DATA<4,NOMBRE> = DEPFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
END
