* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TID.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER
$INSERT I_F.TELLER.ID
$INSERT I_F.ACCOUNT
*-------------------------------------------------------------
    FN.TID='F.TELLER.ID'
    F.TID=''
    CALL OPF (FN.TID,F.TID)

    FN.ACC = "F.ACCOUNT" ; F.ACC = ""
    CALL OPF(FN.ACC,F.ACC)

* $INSERT I_EQUATE - Not Used anymore;USER<EB.USE.DEPARTMENT.CODE>
SEL.LIST =''
NO.OF.REC =''
ERR1 =''
    SEL.COMMAND='SELECT ':FN.TID: ' WITH TELLER.OFFICE EQ ':DEPART.CODE
    CALL EB.READLIST(SEL.COMMAND,SEL.LIST,'',NO.OF.REC,ERR1)
    CAISSES = SEL.LIST

    IF SEL.LIST EQ '' THEN
        E="Agence sans aucune caisse"
        CALL ERR
        ENQ.DATA<2,1> = 'TELLER.ID'
        ENQ.DATA<3,1> = 'EQ'
        ENQ.DATA<4,1> = ''
    END ELSE
        SEL.LIST = ''
        EB.SystemTables.getVFunction()"SELECT ":FN.EB.SystemTables.getVFunction() CATEGORY EQEB.SystemTables.getRNew()0FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus '10002'"
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC.ERR1 = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC,ERR1)
        CALL EB.READLIST(SEL.tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC.ERR1
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC,ERR1, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEC.ERR1)
        FORMLIST SEL.LIST
        CAISSES = CHANGE(CAISSES,@FM," ")
         ENQ.DATA<2,1> = 'TELLER.ID'
         ENQ.DATA<3,1> = 'EQ'
         ENQ.DATA<4,1> = CAISSES
         RETURN
     END
