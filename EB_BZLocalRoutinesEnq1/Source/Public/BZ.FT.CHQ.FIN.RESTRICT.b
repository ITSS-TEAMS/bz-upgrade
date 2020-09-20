*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FT.CHQ.FIN.RESTRICT(ENQ.DATA)
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
*Modification history :
*ZIT-UPG-R13-R19   :  remover BP and changed INCLUDE to INSERT    
*                     GET.LOC.REF converted to MULTI.GET.LOC.REF         
*------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.USER
$INSERT I_F.DEPT.ACCT.OFFICER        

  *  CALL GET.LOC.REF("DEPT.ACCT.OFFICER","CPT.CHQ.FRS.FIN",POS.FRS.FIN)
     YAPPLICATION.NAME = "DEPT.ACCT.OFFICER"
	 YFIELD.NAME = "CPT.CHQ.FRS.FIN"
	 LREF.POS = ""
	 CALL MULTI.GET.LOC.REF(YAPPLICATION.NAME,YFIELD.NAME,LREF.POS)  
* $INSERT I_COMMON - Not Used anymore;LREF.POS<1,1>     

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;B.USE.DEPARTMENT.CODE>

    FN.DAO="F.DEPT.ACCT.OFFICER"
    F.DAO=""
    CALL OPF(FN.DAO,F.DAO)
	
     DAO.REC = '' ; DAO.ERR = ''
    CALL F.READ(FN.DAO,V.DEPARTEMENT,DAO.REC,F.DAO,DAO.ERR)

    CPT.CHQ.FRS.FIN=DAO.REC<EB.DAO.LOCAL.REF,POS.FRS.FIN>

    IF ENQ.DATA<2> THEN
        ENQ.DATA<2,-1> = 'CREDIT.ACCT.NO'
        ENQ.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = CPT.CHQ.FRS.FIN
    END EB.SystemTables.getVFunction()    ENQ.DATA<2,1> = 'CREDIT.ACCT.NO'
   FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus> = 'EQ'
        ENQ.DATA<4,1> = CPT.CHQ.FRS.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
    RETURN
END
