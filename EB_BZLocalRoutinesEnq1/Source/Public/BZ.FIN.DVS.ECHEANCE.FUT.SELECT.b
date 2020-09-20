*-----------------------------------------------------------------------------
* <Rating>728</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FIN.DVS.ECHEANCE.FUT.SELECT
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Modification History :
* ZIT-UPG-R13-R19 : $INCLUDE TO $INSERT, EXECUTE,READLIST TO EB.READLIST
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.STMT.ENTRY
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.LMM.ACCOUNT.BALANCES
    $INSERT I_F.DEPT.ACCT.OFFICER
    $INSERT I_F.ACCOUNT
    $INSERT I_F.CUSTOMER
    $INSERT I_F.CATEGORY
    $INSERT I_F.POSTING.RESTRICT
    $INSERT I_F.TRANSACTION
    $INSERT I_F.SECTOR
    $INSERT I_F.IS.H.PRODUCTS

* $INSERT I_EQUATE - Not Used anymore;,F.LD,F.OUT.FILE,SEP
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;T
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;ANCES,F.LMM.ACCOUNT.BALANCES
    COMMON/CHK/FN.ACCT.TRANS.FWD,F.ACCT.TRANS.FWD
    COMMON/CHK/FN.IS.H.PRODUCTS,F.IS.H.PRODUCTS

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
*SQL.LD = "GET.LIST LIST.LD.PERSO"
*ZIT-UPG-R13-R19 S
*    EXECUTE SQL.LD
*    READLIST IDS.TO.PROCESS ELSE
*        IDS.TO.PROCESS = ''
*    END
    CALL EB.READLIST(SQL.LD,IDS.TO.PROCESS,'',NO.OF.RECS,SEL.ERR)
*ZIT-UPG-R13-R19 E
    LIST.PARAM = ''
tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLEB.SystemTables.getVFunction()LD.LIST(LIST.tmp.V$FUNCTIONTO.PROCESS)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

RETURN
END
