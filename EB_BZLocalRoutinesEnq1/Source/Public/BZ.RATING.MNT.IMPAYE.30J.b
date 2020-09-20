$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.RATING.MNT.IMPAYE.30J
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3

*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : VARIABLE INITIALISED
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PD.PAYMENT.DUE
*ZIT-UPG-R13-R19/E

    GOSUB INIT
    GOSUB PROCESS

    RETURN
*-------------------------------------
INIT:

    Y.LD.ID =O.DATA
    Y.PD.ID = "PD":Y.LD.ID

* $INSERT I_EQUATE - Not Used anymore;E  = "F.PD.PAYMENT.DUE$HIS"
* $INSERT I_ENQUIRY.COMMON - Not Used anymore;	F.PD.PAYMENT.REC  = ""
	F.PD.PAYMENT.ERR  = ""

    CALL OPF(FN.PD.PAYMENT.DUE ,F.PD.PAYMENT.DUE )

    Y.AMT.TO.REPAY = 0

    Y.DATA.FORM=TODAY
    CALL CDT('',Y.DATA.FORM,'-30C')

    RETURN

*-------------------------------------
PROCESS:

tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALLFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusN.PD.PAYMENT.DUE,Y.PD.ID,PD.PAYMENT.DUE.REC,F.PD.PAYMENT.DUE,PD.PAYtmp.V$FUNCTIONRR)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    IF PD.PFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusEN
        Y.NOMBRE.HIS = FIELD(Y.PD.ID,";",2)
        LOOP
            Y.PD.ID.TMP = "PD":Y.LD.ID:";":Y.NOMBRE.HIS
            CALL F.READ(FN.PD.PAYMENT.DUE,Y.PD.ID.TMP,PD.PAYMENT.DUE.REC,F.PD.PAYMENT.DUE,PD.PAYMENT.DUE.ERR)
            IF PD.PAYMENT.DUE.REC THEN

                Y.DATE.REC = PD.PAYMENT.DUE.REC<PD.DATE.TIME>
                Y.DATE.REC = "20":Y.DATE.REC[1,6]
                Y.AMT.TO.REPAY = PD.PAYMENT.DUE.REC<PD.TOTAL.AMT.TO.REPAY>
                Y.NOMBRE.HIS-=1
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
EB.DataAccess.Opf   RETEB.DataAccess.Opf

*---------------------------------------------------------------------
END.PROGRAM:
END
