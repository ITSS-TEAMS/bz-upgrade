*-----------------------------------------------------------------------------
* <Rating>-20</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Included I_F.ZIT.POS.MVMT.DETAILS Insert File
*               :VM converted to @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TR.NOFILE.POS.MVMT.DETS (RESULT.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* @desc Nofile Routine sur la table ZIT.POS.MVMT.DETAILS
* @author OBenhalima
* @create 16 / 07 2010

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.ZIT.POS.MVMT.DETAILS   ;*Insert File Included

    GOSUB INITIALISE
    GOSUB PROCESS.DATA

    RETURN
*-------------------------
INITIALISE:
*---------

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ZIT.POS.MVMT.DETAILS"
    F.ZIT.POS.MVMT.DETAILS = ""
    K.ZIT.POS.MVMT.DETAILS = ""
    R.ZIT.POS.MVMT.DETAILS = ""
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;

    LOCATE "@ID" IN D.FIELDS<1> SETTING ID.POS THEN
        ID.VAL = D.RANGE.AND.VALUE<ID.POS>
    END


    CALL OPF(FN.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS)
    IF NOT(ID.VAL) THEN
        CMD = "SELECT " : FN.ZIT.POS.MVMT.DETEB.SystemTables.getVFunction()CMD=''
		N.CMD=''
		E.CMD=''
tmp.V$FUNFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusTables.getVFunction()
        CALL EB.READLIST(CMD, R.CMD, '', N.Ctmp.V$FUNCTION
EB.SystemTables.setVFunction(tmp.V$FUNCTION)
    END ELSE
  FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusID.VAL
        N.CMD = 1
    END

    RETURN
*-------------------------
PROCESS.DATA:
*------------

    FOR I = 1 TO N.CMD
        K.ZIT.POS.MVMT.DETAILS = R.CMD<I>
        CALL F.READ(FN.ZIT.POS.MVMT.DETAILS, K.ZIT.POS.MVMT.DETAILS, R.ZIT.POS.MVMT.DETAILS, F.ZIT.POS.MVMT.DETAILS, E.ZIT.POS.MVMT.DETAILS)
        NBR.REF = DCOUNT(R.ZIT.POS.MVMT.DETAILS,@VM)
        FOR J = 1 TO NBR.REF
            RESULT.DATA<-1> = R.ZIT.POS.MVMT.DETAILS<J>
        NEXT J
    NEXT I

    RETURN

*-------------------------
