*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.CAISSE.RESTRICT(ENQ.DATA)
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
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.USER        
*-------------------------------------------------------------
    FN.USER="F.USER"
    F.USER=""
    CALL OPF(FN.USER,F.USER)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>    
    ENQ.DATA<2,1> = 'TELLER.OFFICE'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = DEPART.CODE
    RETURN
END
