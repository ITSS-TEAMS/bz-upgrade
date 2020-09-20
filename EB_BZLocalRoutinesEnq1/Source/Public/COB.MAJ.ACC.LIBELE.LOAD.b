*-------------------------------------------------------------
*----------------------------------------------------------------------
* <Rating>0</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE COB.MAJ.ACC.LIBELE.LOAD
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
* @author azdadou@temenos.com
*------------------------------------------------------------------------
* 05 / 02 / 10  par azdadou
*-----------------------------------------------------------------------------
* Modification History :
* ZIT-UPG-R13-R19 : $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.ACCOUNT
    $INSERT I_COB.MAJ.ACC.LIBELE.COMMON
*------------------------------------------------------------------------

    FN.ACC = "F.ACCOUNT"
    F.ACC = ""
    CALL OPF(FN.ACC,F.ACC)
RETURN
END
