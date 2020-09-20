*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19  : NO CHANGES
*----------------------------------------------------------------------
* <Rating>0</Rating>
*----------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.MG.CAISSE.USER(ENQ.DATA)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.USER


    FN.TELLER.USER = "F.TELLER.USER"
    F.TELLER.USER = ""
    R.TELLER.USER = ""
    ERR.TELLER.USER = ""

    CALL OPF(FN.TELLER.USER,F.TELLER.USER)


    CALL F.READ(FN.TELLER.USER,OPERATOR,R.TELLER.USER,F.TELLER.USER,ERR.TELLER.USER)

* $INSERT I_EQUATE - Not Used anymore;R.TELLER.USER<1,1>


    ENQ.DATA<2,-1> = 'TELLER.ID'
    ENQ.DATA<3,-1> = 'EQ'
    ENQ.DATA<4,-1> = VALEUR.CAISSE

    RETURN
