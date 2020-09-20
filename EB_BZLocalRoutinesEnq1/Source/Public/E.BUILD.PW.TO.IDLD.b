*----------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 14/11/2017 Globus Release R13.55
*----------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE E.BUILD.PW.TO.IDLD(ENQ)
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
* @desc BUILD.RTN pour recuperer l'ID LD a partir du PW dans la requete LD.SUIVI.PERF
*</doc>
*----------------------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : READNEXT TO REMOVE INSIDE THE LOOP; VARIABLE INITIALISED;
*----------------------------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.PW.ACTIVITY.TXN
    $INSERT I_F.PW.PROCESS
*ZIT-UPG-R13-R19/E
	
	POS.ID = ''
* $INSERT I_EQUATE - Not Used anymore;ENQ<2,1> SETTING POS.ID THEN
        GOSUB OPEN.FILES
        GOSUB GET.LD
    END
    RETURN

***********
OPEN.FILES:
***********

    FN.PW.ACTIVITY.TXN = 'F.PW.ACTIVITY.TXN'
    F.PW.ACTIVITY.TXN = ''
	R.TXN = ''
	E.PW.ACTIVITY.TXN = ''
    CALL OPF(FN.PW.ACTIVITY.TXN,F.PW.ACTIVITY.TXN)

    FN.PEB.SystemTables.getVFunction()PW.PROCESS'
    F.PPROC = ''
	R.PPROC =FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus'
tmp.V$FUNCTION = EB.SystemTables.getVFunction()
    CALL OPF(FNtmp.V$FUNCTIONPROC)
EB.SystemTables.setVFunction(tmp.V$FUNCTION)

    RETURFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus.LD:
*******
    PWID = ENQ<4,POS.ID> 
        CALL F.READ(FN.PPROC,PWID,R.PPROC,F.PPROC,E.PPROC)
        TXN.IDS = R.PPROC<PW.PROC.ACTIVITY.TXN>
        CHANGE @VM TO @FM IN TXN.IDS
        LOOP
*ZIT-UPG-R13-R19/S
*            READNEXT TXN.ID FROM TXN.IDS ELSE BREAK
			REMOVE TXN.ID FROM TXN.IDS SETTING POS
			WHILE TXN.ID:POS
*ZIT-UPG-R13-R19/E
            CALL F.READ(FN.PW.ACTIVITY.TXN,TXN.ID,R.TXN,F.PW.ACTIVITY.TXN,E.PW.ACTIVITY.TXN)
            TXN.TRGT = R.TXN<PW.ACT.TXN.TARGET>
            IF TXN.TRGT MATCH "LD.LOANS.AND.DEPOSITS..." THEN
                ENQ<4,POS.ID> := " " : R.TXN<PW.ACT.TXN.TRANSACTION.REF>
            END
        REPEAT

    RETURN
END
