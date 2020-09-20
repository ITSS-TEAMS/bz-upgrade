*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 05/12/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalRoutinesEnq1
    SUBROUTINE BZ.LD.ENQ.TOT.INT
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
* @author : firasjmalt24@gmail.com/fjmal@]itssglobal.com
* @desc calculer le montant total des profits
*</doc>
*---------------------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19-READNEXT TO REMOVE;INITIALISED VARIABLES.
*---------------------------------------------------------------------------------------

    $INSERT I_COMMON
    $INSERT I_EQUATE
    $INSERT I_ENQUIRY.COMMON
    $INSERT I_F.LD.LOANS.AND.DEPOSITS
    $INSERT I_F.LMM.SCHEDULES.PAST
    $INSERT I_F.STMT.ENTRY

    GOSUB OPEN.FILES
* $INSERT I_COMMON - Not Used anymore;    RETURN

**********
OPEN.FILES:
**********

    FN.LMM.PST = 'F.LMM.SCHEDULES.PAST'
    F.LMM.PST = ''
	R.LMM.PST=''
	E.LMM.PST=''
    CALL OPF(FN.LMM.PST,F.LMM.PST)

    FN.ACT.FWD = 'F.ACCT.TRANS.FWD'
    F.ACT.FWD = ''
	R.FWD.ACT=''
	E.FWD.ACT=''
    CALLEB.SystemTables.getVFunction()T.FWD,F.ACT.FWD)

    FN.SE = 'F.STMT.EFT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus ''
	R.SE=''
	E.SE=''
    CALL OPF(FN.SE,F.FT.AdhocChargeRequests.AcChargeRequest.ChgRecordStatus
*********
CALC.INT:
*********

    LD.ID = O.DATA
    O.DATA = '' ; TOT.INT = 0 ; STE.AMT = ''
	SEL.LMM='' ; NB.REC='' ; SEL.ERR=''
    LMM.SELECT = 'SELECT ' : FN.LMM.PST : ' WITH @ID LIKE ' : LD.ID  : '...'
    CALL EB.READLIST(LMM.SELECT,SEL.LMM,'',NB.REC,SEL.ERR)
    LOOP
*        READNEXT LMM.PST.ID FROM SEL.LMM ELSE BREAK
		REMOVE LMM.PST.ID FROM SEL.LMM SETTING LMM.POS
		WHILE LMM.PST.ID:LMM.POS
        CALL F.READ(FN.LMM.PST,LMM.PST.ID,R.LMM.PST,F.LMM.PST,E.LMM.PST)
        TOT.INT += ABS(R.LMM.PST<LD28.INTEREST.DUE.AMT>)
    REPEAT

	SEL.FWD='' ; NB.FWD='' ; FWD.ERR=''
    FWD.SELECT = 'SELECT ' : FN.ACT.FWD : ' WITH @ID LIKE ...' : LD.ID  : '...'
    CALL EB.READLIST(FWD.SELECT,SEL.FWD,'',NB.FWD,FWD.ERR)
    LOOPEB.DataAccess.Opf       EB.DataAccess.OpfDNEXT ACT.FWD.ID FROM SEL.FWD ELSE BREAK
		REMOVE ACT.FWD.ID FROM SEL.FWD SETTING ACT.POS
		WHILE ACT.FWD.ID:ACT.POS
        IF NOT(ACT.FWD.ID MATCH '...PD...') THEN
            CALL F.READ(FN.ACT.FWD,ACT.FWD.ID,R.FWD.ACT,F.ACT.FWD,E.ACT.FWD)
            FWD.IDEB.SystemTables.getRNew()FFT.AdhocChargeRequests.AcChargeRequest.ChgRelatedRef     LOOP
         EB.DataAccess.FRead STE.AMT = 0
*                READNEXT SE.ID FROM FWD.IDS ELSE BREAK
				 REMOVE SE.ID FROM FWD.IDS SETTING SE.POS
				 WHILE SE.ID:SE.POS
                CALL F.READ(EB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyer.SE,E.SE)
                IF R.SE<AC.STE.TRANSACTION.CODE> EQ 434 THEN
            EB.SystemTables.setE(R.SE<AC.STE.AMOUNT.LCY>)
                    TOT.INT += ABS(STE.AMT)
                ENDEB.BZLocalTable1.BzCoffreLoyer.BzCoffreLoyerRefLoyerT
        END
    EB.DataAccess.FWrite
    O.DATA = TOT.INT
    RETURN

END
