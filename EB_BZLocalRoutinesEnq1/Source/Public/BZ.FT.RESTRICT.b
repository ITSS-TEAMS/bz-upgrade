*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.FT.RESTRICT(ENQ.DATA)
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
*
*
*------------------------------------------------------------------------
* 12 / 01 / 2010
*-------------------------------------------------------------
*-----------------------------------------------------------------------------
* Modification History :                                                      

*ZIT-UPG-R13-R19: NO CHANGES
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER
$INSERT I_F.USER
*ZIT-UPG-R13-R19/E
* $INSERT I_COMMON - Not Used anymore;------------------------------------------
* $INSERT I_EQUATE - Not Used anymore;NSFER'
    F.FT=''
    FN.USER="F.USER"
    F.USER=""
    CALL OPF(FN.USER,F.USER)
*POS=''
*CALL OPF(FN.FT,F.FT)
*CALL GET.LOC.REF("FUNDS.TRANSFER","REF.INTERNE",POS)

    DEPART.CODE = R.USER<EB.USE.DEPARTMENT.CODE>
    ENQ.DATA<2,1> = 'REF.INTERNE'
    ENQ.DATA<3,1> = 'EQ'
    ENQ.DATA<4,1> = DEPART.CODE
    RETURN
END
