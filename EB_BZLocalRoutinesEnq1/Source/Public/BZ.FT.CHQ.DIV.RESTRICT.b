*-----------------------------------------------------------------------------

* <Rating>0</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted GET.LOC.REF to MULTI.GET.LOC.REF, Variables initialized
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FT.CHQ.DIV.RESTRICT(ENQ.DATA)
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
*------------------------------------------------------------------------

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.USER
$INSERT I_F.DEPT.ACCT.OFFICER


*    CALL GET.LOC.REF("DEPT.ACCT.OFFICER","CPT.CHQ.BQ.DIV",POS.FRS.DIV)
    * ZIT-UPG-R13-R19/S
       Y.APP = "DEPT.ACCT.OFFICER"
       Y.FIELD = "CPT.CHQ.BQ.DIV"
       Y.POS = ''
* $INSERT I_EQUATE - Not Used anymore;T.LOC.REF(Y.APP, Y.FIELD, Y.POS)
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;,1>
    * ZIT-UPG-R13-R19/E 

    V.DEPARTEMENT=R.USER<EB.USE.DEPARTMENT.CODE>

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;"
    F.DAO=""
    DAO.ERR=""
    DAO.REC=""

    CALL OPF(FN.DAO,F.DAO)

    CALL F.READ(FN.DAO,V.DEPARTEMENT,DAO.REC,F.DAO,DAO.ERR)

    CPT.CHQ.FRS.DIV=DAO.REC<EB.DAO.LOCAL.REF,POS.FRS.DIV>

* NBRE.MULTI=DCOUNT(ENQ.DATA<2>,@VM)

* NBRE.MULTI++
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus2> THEN
        ENQ.DATA<2,-1> = 'CREDIT.ACCTFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.DATA<3,-1> = 'EQ'
        ENQ.DATA<4,-1> = CPT.CHQ.FRS.DIV
    END ELSE
        ENQ.DATA<2,1> = 'CREDIT.ACCT.NO'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = CPT.CHQ.FRS.DIV
    END

    RETURN
END
