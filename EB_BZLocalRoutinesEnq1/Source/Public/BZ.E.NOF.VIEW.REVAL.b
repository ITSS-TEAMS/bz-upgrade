*-----------------------------------------------------------------------------
* <Rating>47</Rating>
* Modification History:
* ZIT-UPG-R13-R19 : VARIABLES INITIALIZED, CONVERTED FM,VM TO @FM,@VM, CONVERTED CONVERT TO CHANGE 
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.VIEW.REVAL(OUT.ARR)
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 11 JUN 2018
* Description : Nofile routine to display the Ijara simulation details
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.MA.REVALUATION

    GOSUB PROCESS
    RETURN

*-------
PROCESS:
*-------

    OUT.ARR = ''

* $INSERT I_F.AC.CHARGE.REQUEST - Not Used anymore;MA.REVALUATION'
    F.BZ.MA.REVALUATION = ''
    R.BZ.MA.REVALUATION = ''
    ERR.BZ.REVAL = ''
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;ON,F.BZ.MA.REVALUATION)

    LOCATE 'REVAL.ID' IN D.FIELDS<1> SETTING POS2 THEN
        REVAL.ID = D.RANGE.AND.VALUE<POS2>
    END

    CALL F.READ(FN.BZ.MA.REVALUATION,REVAL.ID,R.BZ.MA.REVALUATION,F.BZ.MA.REVALUATION,ERR.BZ.REVAL)
    REV.YRS = R.BZ.MA.REVALUATION<BZ.REV.REV.DATE>
    REV.CNT = DCOUNT(REV.YRS,@VM)
    CHANGE @VM TO @FM IN REV.YRS
    CNTREB.SystemTables.getVFunction()  LOOP
        REMOVE REV.YEAR FROM REV.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusOS
    WHILE REV.YEAR:REV.POS
        TOT.PLFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusUATION<BZ.REV.PL.AMT,CNTR>
        OUT.ARR<-1> = R.BZ.MA.REVALUATION<BZ.REV.REV.DATE,CNTR>:'*':FMT(R.BZ.MA.REVALUATION<BZ.REV.VAT.AMT,CNTR>,'R3'):'*':FMT(R.BZ.MA.REVALUATION<BZ.REV.GOOD.AMT,CNTR>,'R3'):'*':FMT(R.BZ.MA.REVALUATION<BZ.REV.PL.AMT,CNTR>,'R3')
        CNTR++
    REPEAT
    IF OUT.ARR THEN
        OUT.ARR<-1> = '***_______________'
        OUT.ARR<-1> = '**Total PL : * ':FMT(TOT.PL,'R3')
    END
    RETURN

END
