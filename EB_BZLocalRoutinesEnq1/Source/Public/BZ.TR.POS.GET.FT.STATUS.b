*-----------------------------------------------------------------------------
* <Rating>0</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.TR.POS.GET.FT.STATUS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

* @desc get FT Record Status
* @author OBenhalima
* @create 22 / 07 / 2010

$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.FUNDS.TRANSFER



    FN.FT = 'F.FUNDS.TRANSFER'
    F.FT = ''
    K.FT = ''
    R.FT = ''
    E.FT = ''

* $INSERT I_EQUATE - Not Used anymore;K.FUNDS.TRANSFER$NAU'
    F.FT.NAU = ''
    K.FT.NAU = ''
    R.FT.NAU = ''
    E.FT.NAU = ''

* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;U)
    CALL OPF(FN.FT, F.FT)

    K.FT = O.DATA

    CALL F.READ(FN.FT, O.DATA, R.FT, F.FT, E.FT)
    IF E.FT THEN
        CALL F.READ(FN.FT.NAU, O.DATA, R.FT, F.FT.NAU, E.FT.NAU)
    END
    O.DATA = R.FT<FT.RECORD.STATUS>

    RETURN
