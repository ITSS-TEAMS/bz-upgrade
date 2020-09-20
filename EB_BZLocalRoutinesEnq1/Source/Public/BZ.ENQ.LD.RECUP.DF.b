*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 10/11/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.ENQ.LD.RECUP.DF
$USING EB.API
$USING EB.SystemTables
$USING EB.Reports
$USING EB.DataAccess
$USING EB.ErrorProcessing
$USING EB.BZLocalTable1
$USING EB.BZLocalTable2
$USING EB.BZLocalTable3
*---------------------------------------------------------------------------------------
*<doc>
* @author : fjmal@itssgloabla.com / firasjmalt24@gmail.com
* @desc utilisee dans la requete LD.SUIVI.PERF pour recuperer la demande de financement
*</doc>
*---------------------------------------------------------------------------------------  	
* Modification History :
*------------------------  
**ZIT-UPG-R13-R19 : No change                     
*---------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PW.ACTIVITY.TXN
    $INSERT I_F.PW.PROCESS

    IF O.DATA NE '' THEN
* $INSERT I_COMMON - Not Used anymore;ILES
* $INSERT I_EQUATE - Not Used anymore;
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

    RETUEB.SystemTables.getVFunction()***
GET.DF:
*******

    REF.LD = O.DFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ''
    CMD.PW.ACTIVITY  = "SELECT F.PW.ACTIVFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatusSACTION.REF EQ ": REF.LD
	SEL.BI = '' ; N.BI = '' ;  E.BI = ''
    CALL EB.READLIST(CMD.PW.ACTIVITY , SEL.BI , '', N.BI , E.BI )
    IF SEL.BI NE '' THEN
	     R.PW.ACTIVITY.TXN = '' ; E.PW.ACTIVITY.TXN = ''
        CALL F.READ(FN.PW.ACTIVITY.TXN,SEL.BI<1>,R.PW.ACTIVITY.TXN,F.PW.ACTIVITY.TXN,E.PW.ACTIVITY.TXN)
        PWID = R.PW.ACTIVITY.TXN<PW.ACT.TXN.PROCESS>
		R.PPROC = '' ; E.PPROC = ''
        CALL F.READ(FN.PPROC,PWID,R.PPROC,F.PPROC,E.PPROC)
        IF R.PPROC NE '' THEN
            TXN.ID = R.PPROC<PW.PROC.ACTIVITY.TXN,1>
            IF TXN.ID NE '' THEN
			    R.TXN = ''  ;  E.TXN = ''
                CALL F.READ(FN.PW.ACTIVITY.TXN,TXN.ID,R.TXN,F.PW.ACTIVITY.TXN,E.TXN)
                O.DATA = R.TXN<PW.ACT.TXN.TRANSACTION.REF>
            END
        END
    END

    RETURN      
END
