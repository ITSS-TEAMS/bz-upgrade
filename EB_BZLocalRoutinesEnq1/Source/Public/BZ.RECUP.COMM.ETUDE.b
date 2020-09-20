*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RECUP.COMM.ETUDE
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19- NO CHANGES
********************************************************
$INSERT I_COMMON
$INSERT I_EQUATE
$INSERT I_F.ENQUIRY
$INSERT I_ENQUIRY.COMMON
$INSERT I_F.LD.LOANS.AND.DEPOSITS


    FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS'
    F.LD.LOANS.AND.DEPOSITS = ''
    K.LD.LOANS.AND.DEPOSITS = O.DATA
    R.LD.LOANS.AND.DEPOSITS = ''
    E.LD.LOANS.AND.DEPOSITS = ''

    CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

* $INSERT I_COMMON - Not Used anymore;D.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)

* $INSERT I_ENQUIRY.COMMON - Not Used anymore;TS EQ '' THEN

        FN.LD.LOANS.AND.DEPOSITS = 'F.LD.LOANS.AND.DEPOSITS$NAU'
        F.LD.LOANS.AND.DEPOSITS = ''
        K.LD.LOANS.AND.DEPOSITS = O.DATA
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore; = ''
        E.LD.LOANS.AND.DEPOSITS = ''

        CALL OPF(FN.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS)

        CALL F.READ(FN.LD.LOANS.AND.DEPOSITS,K.LD.LOANS.AND.DEPOSITS,R.LD.LOANS.AND.DEPOSITS,F.LD.LOANS.AND.DEPOSITS,E.LD.LOANS.AND.DEPOSITS)



    END
    O.DAEB.SystemTables.getVFunction()LOANS.AND.DEPEB.SystemTables.getVFunction()HRG.AMOUNT><EB.SystemTables.getRNew()
FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusND
