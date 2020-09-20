*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FT.VIR.RESTRICT(ENQ.DATA)
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
* 12 / 01 / 2010
*-------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.USER
*-------------------------------------------------------------
    FN.FT='FUNDS.TRANSFER'
    F.FT=''
    FN.USER="F.USER"
    F.USER=""
    CALL OPF(FN.USER,F.USER)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    ENQ.DATA<2,1> = 'AGENCE.DB'
* $INSERT I_COMMON - Not Used anymore;'EQ'
* $INSERT I_EQUATE - Not Used anymore;DEPART.CODE
    RETURN
END
