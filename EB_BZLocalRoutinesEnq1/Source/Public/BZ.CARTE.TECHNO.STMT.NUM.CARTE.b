*-----------------------------------------------------------------------------
* <Rating>60</Rating>
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT GLOBUS.BP to $INCLUDE ../T24_BP
*ZIT-UPG-R13-R19     :  No Changes.
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CARTE.TECHNO.STMT.NUM.CARTE(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*ZIT-UPG-R09-R13/S
*$INSERT GLOBUS.BP I_COMMON
*$INSERT GLOBUS.BP I_EQUATE
*$INSERT GLOBUS.BP I_ENQUIRY.COMMON
*$INSERT GLOBUS.BP I_F.USER
*$INSERT GLOBUS.BP I_F.ACCOUNT

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER
    $INSERT I_F.ACCOUNT
* $INSERT I_COMMON - Not Used anymore;

MAIN:
    GOSUB INIT
    GOSUB OPENFILES
    GOSUB PROCESS
    RETURN

INIT:

    FN.AC="FBNK.ACCOUNT"
    F.AC=""


    RETURN


OPENFILES:

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FNtmp.V$FUNCTION
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    RETURN

PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSELECT.FIELD = ENQ.DATA<2>
    CHANGE @VM TO FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusIELD
    LOCATE "ACCT.ID" IN V.SELECT.FIELD  SETTING POS2 ELSE POS2=0
    V.NUM.CARTE = ENQ.DATA<4,POS2>
    V.LENGTH = LEN(V.NUM.CARTE)

    IF V.LENGTH NE 16 THEN
        V.ACCT = ""
*        E="Numero de carte errone"
*       CALL  ERR
        ENQ.DATA<2,POS2> = 'ACCT.ID'
        ENQ.DATA<3,POS2> = 'EQ'
        ENQ.DATA<4,POS2> = V.ACCT
    END ELSE
        SQL.CMD = "SELECT " : FN.AC : " WITH ACCOUNT.TITLE.2 EQ " : V.NUM.CARTE

        CALL EB.READLIST(SQL.CMD,SEL.LIST,'',NO.SEL,SEL.ERR)

        IF SEL.LIST THEN
            V.ACCT = SEL.LIST<1>
         EB.DataAccess.OpfENQ.DATA<2,POS2> = 'ACCT.ID'
         EB.DataAccess.OpfENQ.DATA<3,POS2> = 'EQ'
            ENQ.DATA<4,POS2> = V.ACCT
        END ELSE
            ENQ.DATA<2,POS2> = 'ACCT.ID'
            ENQ.DATA<3,POS2> = 'EQ'
            ENQ.DAEB.SystemTables.getRNew()PFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefAucun enregistrement"
*        EB.DataAccess.FReadL ERR
        END
    END

    RETURN

END
