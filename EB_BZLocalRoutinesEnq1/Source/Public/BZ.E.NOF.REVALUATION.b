*-----------------------------------------------------------------------------
* <Rating>47</Rating>
*-----------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted VM to @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.REVALUATION(OUT.ARR)
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
* Date        : 09 JUN 2018
* Description : Nofile routine to display the good details for revaluation
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.LD.POST.SIMULATION

    GOSUB INITIALISE
    GOSUB PROCESS
    RETURN

*------------------
INITIALISE:
* $INSERT I_EQUATE - Not Used anymore;

    OUT.ARR = ''

    FN.BZ.LD.POST.SIMULATION = 'F.BZ.LD.POST.SIMULATION'
    F.BZ.LD.POST.SIMULATION = ''
* $INSERT I_F.BZ.COFFRE.LOYER - Not Used anymore;LATION,F.BZ.LD.POST.SIMULATION)

    LOCATE 'CUSTOMER.ID' IN D.FIELDS<1> SETTING POS1 THEN
        CUST.ID = D.RANGE.AND.VALUE<POS1>
    END

    LOCATE 'LD.ID' IN D.FIELDS<1> SETTING POS2 THEN
        LD.ID = D.RANGE.AND.VALUE<POS2>
    END

    LOCAEB.SystemTables.getVFunction()' IN D.FIELDSEB.SystemTables.getVFunction()G POS5 THEN
     FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusANGE.AND.VALUE<POS5>
    END
    RETURN

*FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus-
PROCESS:
*------------------

    IF LD.ID EQ "" THEN
        ENQ.ERROR = "LD Id mandatory"
        RETURN
    END ELSE
        GOSUB PROCESS.MA
    END
    RETURN

*------------------
PROCESS.MA:
*------------------

    R.BZ.LD.POST.SIMULATION = ''
	ERR.READ = ''
    BZ.ID = LD.ID
    CALL F.READ(FN.BZ.LD.POST.SIMULATION,BZ.ID,R.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION,ERR.READ)
    IF R.BZ.LD.POST.SIMULATION NE '' THEN
        IF NOT(Y.AGENCY) OR Y.AGENCY EQ R.BZ.LD.POST.SIMULATION<BZ.SIM.AGENCY> THEN
            OPR.CNT = DCOUNT(R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE>,@VM)
            FOR I = 1 TO OPR.CNT
         EB.DataAccess.Opf    IF R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I> EQ "MUTUAL.AGREEMENT" AND R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.STATUS,I> EQ "COMPLETED" THEN
         EB.DataAccess.Opf        OUT.ARR<-1> = BZ.ID:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.INCIDENT.DATE,I>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.AMOUNT.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.AMT,I>:'*'
                    OUT.ARR:= 'BZ.MA.REVALUATION,MA I ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                  EB.SystemTables.getRNew().FT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRefVALUATION,MA A ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                    OUT.ARR:= 'BZ.MA.REVALUATION,MA D ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
         EB.DataAccess.FRead END
            NEXT I
        END
    END ELSE
        ENQ.ERROR = "No termEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerble"
        RETURN
    END
   EB.SystemTables.setE()*-----------------------------------------------------------------------------
* <Rating>47</Rating>
*-----------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:Converted VM to @VM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.E.NOF.REVALUATION(OUT.ARR)
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
* Date        : 09 JUN 2018
* Description : Nofile routine to display the good details for revaluation
*-----------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
$INSERT I_F.BZ.LD.POST.SIMULATION

    GOSUB INITIALISE
    GOSUB PROCESS
    RETURN

*------------------
INITIALISE:
*------------------

    OUT.ARR = ''

    FN.BZ.LD.POST.SIMULATION = 'F.BZ.LD.POST.SIMULATION'
    F.BZ.LD.POST.SIMULATION = ''
    CALL OPF(FN.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION)

    LOCATE 'CUSTOMER.ID' IN D.FIELDS<1> SETTING POS1 THEN
        CUST.ID = D.RANGE.AND.VALUE<POS1>
    END

    LOCATE 'LD.ID' IN D.FIELDS<1> SETTING POS2 THEN
        LD.ID = D.RANGE.AND.VALUE<POS2>
    END

    LOCATE 'AGENCY' IN D.FIELDS<1> SETTING POS5 THEN
        Y.AGENCY = D.RANGE.AND.VALUE<POS5>
    END
    RETURN

*------------------
PROCESS:
*------------------

    IF LD.ID EQ "" THEN
        ENQ.ERROR = "LD Id mandatory"
        RETURN
    END ELSE
        GOSUB PROCESS.MA
    END
    RETURN

*------------------
PROCESS.MA:
*------------------

    R.BZ.LD.POST.SIMULATION = ''
	ERR.READ = ''
    BZ.ID = LD.ID
    CALL F.READ(FN.BZ.LD.POST.SIMULATION,BZ.ID,R.BZ.LD.POST.SIMULATION,F.BZ.LD.POST.SIMULATION,ERR.READ)
    IF R.BZ.LD.POST.SIMULATION NE '' THEN
        IF NOT(Y.AGENCY) OR Y.AGENCY EQ R.BZ.LD.POST.SIMULATION<BZ.SIM.AGENCY> THEN
            OPR.CNT = DCOUNT(R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.TYPE>,@VM)
            FOR I = 1 TO OPR.CNT
                IF R.BZ.LD.POST.SIMULATION<BZ.SIM.LOSS.REASON,I> EQ "MUTUAL.AGREEMENT" AND R.BZ.LD.POST.SIMULATION<BZ.SIM.OPERATION.STATUS,I> EQ "COMPLETED" THEN
                    OUT.ARR<-1> = BZ.ID:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.CUSTOMER.ID>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.TYPE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.PAYMENT.DATE,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.INCIDENT.DATE,I>:'*'
                    OUT.ARR:= R.BZ.LD.POST.SIMULATION<BZ.SIM.AMOUNT.PRORATA,I>:'*':R.BZ.LD.POST.SIMULATION<BZ.SIM.VAT.ADJUST.AMT,I>:'*'
                    OUT.ARR:= 'BZ.MA.REVALUATION,MA I ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                    OUT.ARR:= 'BZ.MA.REVALUATION,MA A ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                    OUT.ARR:= 'BZ.MA.REVALUATION,MA D ':BZ.ID:'-':R.BZ.LD.POST.SIMULATION<BZ.SIM.GOOD.REF,I>:'*'
                END
            NEXT I
        END
    END ELSE
        ENQ.ERROR = "No terminated good available"
        RETURN
    END
    RETURN

END
