*----------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 13/11/2017 Globus Release R13.55
*----------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENQ.LD.RECUP.CHQ.FRS
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*----------------------------------------------------------------------------------------
*<doc>
* @author : fjmal@itssgloabla.com / firasjmalt24@gmail.com
* @desc utilisee dans la requete LD.SUIVI.PERF pour recuperer les info du payement fournisseur
*</doc>
*----------------------------------------------------------------------------------------
*Modification History:  
*ZIT-UPG-R13-R19     :  No Changes.
*----------------------------------------------------------------------------------------
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PW.ACTIVITY.TXN
    $INSERT I_F.PW.PROCESS
    $INSERT I_F.LD.LOANS.AND.DEPOSITS

    IF O.DATA NE '' THEN
        GOSUB OPEN.FILES
* $INSERT I_COMMON - Not Used anymore;Q.FRS
    END
    RETURN

***********
OPEN.FILES:
***********

    FN.PW.ACTIVITY.TXN = 'F.PW.ACTIVITY.TXN'
    F.PW.ACTIVITY.TXN = ''
    CALL OPF(FN.PW.ACTIVITY.TXN,F.PW.ACTIVITY.TXN)

    FN.PPROC = 'F.PW.PROCESS'
    F.PPROC = ''
    CALL OPF(FN.PPROC,F.PPROC)

    RETURN

************
GET.CHQ.FRS:
************

    REF.PW = FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusA = ''
tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus = EB.SystemTables.getRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus)
    CALL F.READ(FN.PPROC,REF.PW,tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
EB.SystemTables.setRNew(FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus, tmp.R.NEW.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus)
    IF R.PPROC NE '' THEN
        PW.ACT = R.PPROC<PW.PROC.ACTIVITY>
        LEN.ACT = DCOUNT(PW.ACT,@VM)
        FOR C.ACT = 1 TO LEN.ACT
            IF PW.ACT<1,C.ACT> MATCH 'SAISIE.IS.PAYFRS...' THEN
                POS.FM = C.ACT
                TXN.ID = R.PPROC<PW.PROC.ACTIVITY.TXN,POS.FM>
                CALL F.READ(FN.PW.ACTIVITY.TXN,TXN.ID,R.TXN,F.PW.ACTIVITY.TXN,E.TXN)
                O.DATA= R.TXN<PW.ACT.TXN.TRANSACTION.REF>
                BREAK
            END
        NEXT C.ACT
    END
    RETURN
END
