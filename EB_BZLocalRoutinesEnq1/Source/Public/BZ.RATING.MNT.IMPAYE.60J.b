*-----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19:-- converted to -= 1
*-------------------------------------   
$PACKAGE EB.BZLocalRoutinesEnq1
   SUBROUTINE BZ.RATING.MNT.IMPAYE.60J
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.PAYMENT.DUE

    GOSUB INIT
    GOSUB PROCESS

    RETURN
*-------------------------------------
INIT:

    Y.LD.ID =O.DATA
    Y.PD.ID = "PD":Y.LD.ID

    FN.PD.PAYMENT.DUE  = "F.PD.PAYMENT.DUE$HIS"
    F.PD.PAYMENT.DUE  = ""

* $INSERT I_EQUATE - Not Used anymore;AYMENT.DUE ,F.PD.PAYMENT.DUE )

    Y.AMT.TO.REPAY = 0
    Y.DATA.FORM=TODAY
    CALL CDT('',Y.DATA.FORM,'-60C')

    RETURN

*-------------------------------------
PROCESS:
    PD.PAYMENT.DUE.REC=''
	PD.PAYMENT.DUE.ERR=''
    CALL F.READ.HISTORY(FN.PD.PAYMENT.DUE,Y.PD.ID,PD.PAYMENT.DUE.REC,F.PD.PAYMENT.DUE,PD.PAYMENT.DUE.ERR)

    IF PD.PAYMENT.DUE.REC THEN
        Y.NOMBRE.HIS = FIELD(Y.PD.ID,";",2)
        EB.SystemTables.getVFunction()        Y.PD.ID.TMP = "PD":Y.LD.ID:";":Y.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC.F.PD.PAYMENT.DUE.PD.PAYMENT.DUE.ERR = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC,F.PD.PAYMENT.DUE,PD.PAYMENT.DUE.ERR)
            CALL F.READ(FN.PD.PAYMENT.DUE,Y.Ptmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC.F.PD.PAYMENT.DUE.PD.PAYMENT.DUE.ERR
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC,F.PD.PAYMENT.DUE,PD.PAYMENT.DUE.ERR, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.REC.F.PD.PAYMENT.DUE.PD.PAYMENT.DUE.ERR)
            IF PD.PAYMENT.DUE.REC THEN

                Y.DATE.REC = PD.PAYMENT.DUE.REC<PD.DATE.TIME>
                Y.DATE.REC = "20":Y.DATE.REC[1,6]
                Y.AMT.TO.REPAY = PD.PAYMENT.DUE.REC<PD.TOTAL.AMT.TO.REPAY>
 *              Y.NOMBRE.HIS--
				Y.NOMBRE.HIS -= 1
            END ELSE
                O.DATA = "ERROR"
                GOSUB END.PROGRAM
            END
        WHILE (Y.DATA.FORM LT Y.DATE.REC ) AND (Y.NOMBRE.HIS GE 1)

        REPEAT
    END ELSE
        Y.AMT.TO.REPAY = 0

    END

    IF Y.DATA.FORM GE Y.DATE.REC THEN
        O.DATA = Y.AMT.TO.REPAY
    END ELSE
        O.DATA = 0
    END

    RETURN

*------EB.DataAccess.OpfB.DataAccess.Opf----------------------------------------------------------
END.PROGRAM:
END
