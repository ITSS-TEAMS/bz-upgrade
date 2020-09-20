*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE  BZ.CNP.GET.COMMISSION.REDEV
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
********************************************************
    $INSERT I_COMMON				
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.FUNDS.TRANSFER

    FN.FT.HIST="F.FUNDS.TRANSFER$HIS"
    F.FT.HIST=""
    REC.FT.HIST=''
    ERR.FT.HIST=''

    FN.FT="F.FUNDS.TRANSFER"
    F.FT=""
    REC.FT=''
    ERR.FT=''

    CALL OPF(FN.FT,F.FT)
* $INSERT I_COMMON - Not Used anymore;IST,F.FT.HIST)

    REF.FT=O.DATA
* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;FT,F.FT,ERR.FT)
    IF REC.FT NE "" THEN
        V.COMM.AMT=REC.FT<FT.COMMISSION.AMT,2>
        V.COMMISSION.AMT=V.COMM.AMT[4,8]
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;
    END ELSE
        REF.FT.HIST=O.DATA :";1"

        CALL F.READ(FN.FT.HIST,REF.FT.HIST,REC.FT.HIST,F.FT.HIST,ERR.FT.HIST)
        V.COMM.AMT=REC.FT.HIST<FT.COMMISSION.AMT,2>
        V.COMMISSION.AMT=V.COMM.AMT[4,8]
        O.DATA=V.COMMISSION.AMT
    END
    RETURN
END
