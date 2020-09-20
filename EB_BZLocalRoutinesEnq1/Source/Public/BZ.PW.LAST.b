*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.PW.LAST
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*--------------------------------------------------------------------------
*--------------------------------------------------------------------------
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ENQUIRY
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.PW.TXN.REF

    FN.PW.TXN.REF = 'F.PW.TXN.REF'
    F.PW.TXN.REF = ''
    K.PW.TXN.REF = O.DATA
    R.PW.TXN.REF = ''
    E.PW.TXN.REF = ''
    CALL OPF(FN.PW.TXN.REF,F.PW.TXN.REF)
    CALL F.READ(FN.PW.TXN.REF,K.PW.TXN.REF,R.PW.TXN.REF,F.PW.TXN.REF,E.PW.TXN.REF)

    IF R.PW.TXN.REF NE '' THEN
        NB.REC = DCOUNT(R.PW.TXN.REF,@FM)
        O.DATA = R.PW.TXN.REF<NB.REC>
    END


    RETURN
